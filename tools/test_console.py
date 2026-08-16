#!/usr/bin/env python3
"""
USB CDC Console Test Script for PIC32 Ethernet Starter Kit

Tests the USB CDC virtual COM port implemented in src/console.c.

On Windows 10/11, the generic usbser.sys driver may not create the standard
\\.\COMx symbolic link for CDC devices. This script tries the COM port name
first, then falls back to the USB device interface path.

Usage:
    python test_console.py              # Auto-detect COM port
    python test_console.py COM9         # Specify COM port
    python test_console.py COM9 115200  # Specify port and baud (ignored by CDC)

Requirements:
    pip install pyserial
"""

import sys
import time
import ctypes
import serial
import serial.tools.list_ports as list_ports


def find_device_path(port_name):
    """Try to open a COM port. If it fails with FileNotFoundError,
    fall back to the USB device interface path by querying the registry."""

    # First, try the standard COM port path
    try:
        s = serial.Serial(port_name, 115200, timeout=2)
        return s, port_name
    except serial.SerialException as e:
        if "FileNotFoundError" not in str(e) and "Access is denied" not in str(e):
            raise

    # FileNotFoundError: Windows usbser.sys didn't create the COM symlink.
    # Find the USB device interface path from the registry.
    print(f"  Standard COM port path failed ({e})")
    print(f"  Trying USB device interface path...")

    # Find the device in the port list
    for p in list_ports.comports():
        if p.device == port_name:
            # Query the registry for the SymbolicName
            import winreg
            # Extract VID/PID/SER from hwid: "USB VID:PID=04D8:000A SER=000100000001 LOCATION=1-9"
            hwid = p.hwid
            vid = pid = ser = None
            for part in hwid.split():
                if part.startswith("VID:PID="):
                    vp = part.split("=")[1].split(":")
                    vid = vp[0]
                    pid = vp[1]
                if part.startswith("SER="):
                    ser = part.split("=")[1]

            if vid and pid:
                # Try with serial number
                if ser:
                    key_path = f"SYSTEM\\CurrentControlSet\\Enum\\USB\\VID_{vid.upper()}&PID_{pid.upper()}\\{ser}\\Device Parameters"
                else:
                    key_path = None

                sym_name = None
                if key_path:
                    try:
                        key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, key_path)
                        sym_name, _ = winreg.QueryValueEx(key, "SymbolicName")
                        winreg.CloseKey(key)
                    except (FileNotFoundError, PermissionError):
                        pass

                if sym_name:
                    # sym_name is like: \??\USB#VID_04D8&PID_000A#000100000001#{a5dcbf10-...}
                    # Convert to Win32 device path: \\?\USB#VID_04D8&PID_000A#000100000001#{a5dcbf10-...}
                    if sym_name.startswith("\\??\\"):
                        device_path = "\\\\?\\" + sym_name[4:]
                    else:
                        device_path = sym_name

                    print(f"  Device interface path: {device_path}")

                    # Open using CreateFileW directly
                    k = ctypes.windll.kernel32
                    GENERIC_READ_WRITE = 0xC0000000
                    OPEN_EXISTING = 3
                    handle = k.CreateFileW(
                        device_path,
                        GENERIC_READ_WRITE,
                        0,
                        None,
                        OPEN_EXISTING,
                        0,
                        None
                    )
                    if handle != -1 and handle != 0xFFFFFFFF:
                        # Create a pyserial Serial object from the handle
                        s = serial.Serial.__new__(serial.Serial)
                        s._handle = handle
                        s.port = device_path
                        s._port = device_path
                        s._is_open = True
                        s.timeout = 2
                        s.write_timeout = 2
                        # Set timeouts
                        timeouts = serial.win32.COMMTIMEOUTS()
                        timeouts.ReadIntervalTimeout = 2000
                        timeouts.ReadTotalTimeoutMultiplier = 0
                        timeouts.ReadTotalTimeoutConstant = 2000
                        timeouts.WriteTotalTimeoutMultiplier = 0
                        timeouts.WriteTotalTimeoutConstant = 2000
                        ctypes.windll.kernel32.SetCommTimeouts(
                            handle,
                            ctypes.byref(timeouts)
                        )
                        print(f"  Opened via device interface path!")
                        return s, device_path

    raise serial.SerialException(f"Could not open {port_name} via any method")


def main():
    port = None
    baud = 115200

    # Auto-detect if no port specified
    if len(sys.argv) < 2:
        ports = list(list_ports.comports())
        if ports:
            port = ports[0].device
            print(f"Auto-detected: {port}")
        else:
            print("No COM ports found. Specify a port: python test_console.py COM9")
            sys.exit(1)
    else:
        port = sys.argv[1]
    if len(sys.argv) >= 3:
        baud = int(sys.argv[2])

    print(f"=== PIC32 USB CDC Console Test ===")
    print(f"Port: {port}")
    print(f"Baud: {baud} (CDC ignores baud rate)")
    print()

    # Open the serial port
    try:
        ser, actual_path = find_device_path(port)
    except Exception as e:
        print(f"ERROR: Could not open {port}: {e}")
        print("\nTroubleshooting:")
        print("  1. Unplug and replug the USB cable")
        print("  2. Check Device Manager for the COM port number")
        print("  3. Make sure no other program has the port open")
        sys.exit(1)

    print(f"Opened successfully: {actual_path}")
    print()

    # Give the device a moment to settle
    time.sleep(0.5)

    # --- Test 1: Read the welcome banner ---
    print("--- Test 1: Welcome Banner ---")
    print("Waiting for welcome message...")

    welcome_data = b""
    start = time.time()
    while (time.time() - start) < 5.0:
        try:
            chunk = ser.read(256)
        except Exception:
            chunk = b""
        if chunk:
            welcome_data += chunk
            if b"Console is ready" in welcome_data:
                break

    if welcome_data:
        print(f"Received ({len(welcome_data)} bytes):")
        print(welcome_data.decode("utf-8", errors="replace"))
        if b"Console is ready" in welcome_data:
            print("[PASS] Welcome banner received.")
        else:
            print("[PARTIAL] Got data but no 'Console is ready' string.")
    else:
        print("[INFO] No welcome banner received.")
        print("  (Normal if device was already connected before opening port)")
    print()

    # --- Test 2: Echo test ---
    print("--- Test 2: Echo Test ---")
    test_string = "Hello PIC32!\r\n"
    print(f"Sending: {test_string.strip()!r}")

    try:
        bytes_written = ser.write(test_string.encode("utf-8"))
        ser.flush()
    except Exception as e:
        print(f"[FAIL] Write error: {e}")
        ser.close()
        return
    print(f"Sent {bytes_written} bytes.")

    time.sleep(0.5)
    echo_data = b""
    start = time.time()
    while (time.time() - start) < 3.0:
        try:
            chunk = ser.read(256)
        except Exception:
            chunk = b""
        if chunk:
            echo_data += chunk
        if len(echo_data) >= len(test_string):
            break

    if echo_data:
        echo_str = echo_data.decode("utf-8", errors="replace")
        print(f"Echo received ({len(echo_data)} bytes): {echo_str!r}")
        if test_string.strip() in echo_str:
            print("[PASS] Echo matches sent data.")
        else:
            print("[INFO] Echo received but doesn't exactly match.")
    else:
        print("[FAIL] No echo received within timeout.")
    print()

    # --- Test 3: Multi-character echo ---
    print("--- Test 3: Multi-character Echo ---")
    test_chars = "ABCDE12345"
    print(f"Sending: {test_chars!r}")

    ser.write(test_chars.encode("utf-8"))
    ser.flush()

    time.sleep(0.5)
    echo_data = b""
    start = time.time()
    while (time.time() - start) < 3.0:
        try:
            chunk = ser.read(256)
        except Exception:
            chunk = b""
        if chunk:
            echo_data += chunk
        if len(echo_data) >= len(test_chars):
            break

    if echo_data:
        echo_str = echo_data.decode("utf-8", errors="replace")
        print(f"Echo received: {echo_str!r}")
        if test_chars in echo_str:
            print("[PASS] All characters echoed correctly.")
        else:
            print(f"[INFO] Partial echo. Expected '{test_chars}' in '{echo_str}'")
    else:
        print("[FAIL] No echo received.")
    print()

    # --- Summary ---
    print("=== Test Complete ===")
    print("If echo tests passed, the CDC console is working correctly!")
    print("You can also use TeraTerm or PuTTY to interact with the console.")
    print()

    ser.close()
    print(f"Closed {actual_path}.")


if __name__ == "__main__":
    main()
