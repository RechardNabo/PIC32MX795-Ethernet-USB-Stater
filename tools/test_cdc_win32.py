#!/usr/bin/env python3
"""
Simple USB CDC test using Win32 API directly.
Bypasses pyserial to avoid the COM port symlink issue.
"""
import ctypes
import ctypes.wintypes as w
import time
import sys

kernel32 = ctypes.windll.kernel32

GENERIC_READ = 0x80000000
GENERIC_WRITE = 0x40000000
OPEN_EXISTING = 3
INVALID_HANDLE_VALUE = w.HANDLE(-1).value

class COMMTIMEOUTS(ctypes.Structure):
    _fields_ = [
        ("ReadIntervalTimeout", w.DWORD),
        ("ReadTotalTimeoutMultiplier", w.DWORD),
        ("ReadTotalTimeoutConstant", w.DWORD),
        ("WriteTotalTimeoutMultiplier", w.DWORD),
        ("WriteTotalTimeoutConstant", w.DWORD),
    ]

class DCB(ctypes.Structure):
    _fields_ = [
        ("DCBlength", w.DWORD),
        ("BaudRate", w.DWORD),
        ("fBinary", w.DWORD, 1),
        ("fParity", w.DWORD, 1),
        ("fOutxCtsFlow", w.DWORD, 1),
        ("fOutxDsrFlow", w.DWORD, 1),
        ("fDtrControl", w.DWORD, 2),
        ("fDsrSensitivity", w.DWORD, 1),
        ("fTXContinueOnXoff", w.DWORD, 1),
        ("fOutX", w.DWORD, 1),
        ("fInX", w.DWORD, 1),
        ("fErrorChar", w.DWORD, 1),
        ("fNull", w.DWORD, 1),
        ("fRtsControl", w.DWORD, 2),
        ("fAbortOnError", w.DWORD, 1),
        ("fDummy2", w.DWORD, 17),
        ("wReserved", w.WORD),
        ("XonLim", w.WORD),
        ("XoffLim", w.WORD),
        ("ByteSize", w.BYTE),
        ("Parity", w.BYTE),
        ("StopBits", w.BYTE),
        ("XonChar", w.BYTE),
        ("XoffChar", w.BYTE),
        ("ErrorChar", w.BYTE),
        ("EofChar", w.BYTE),
        ("EvtChar", w.BYTE),
        ("wReserved1", w.WORD),
    ]

def find_device_path():
    """Find the USB device interface path for VID_04D8&PID_000A"""
    import winreg
    base = r"SYSTEM\CurrentControlSet\Enum\USB\VID_04D8&PID_000A"
    try:
        key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, base)
        subkeys = []
        i = 0
        while True:
            try:
                subkeys.append(winreg.EnumKey(key, i))
                i += 1
            except OSError:
                break
        winreg.CloseKey(key)
    except FileNotFoundError:
        return None

    for sk in subkeys:
        dev_key_path = f"{base}\\{sk}\\Device Parameters"
        try:
            dk = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, dev_key_path)
            sym, _ = winreg.QueryValueEx(dk, "SymbolicName")
            winreg.CloseKey(dk)
            if sym.startswith("\\??\\"):
                return "\\\\?\\" + sym[4:]
            return sym
        except (FileNotFoundError, PermissionError):
            continue
    return None

def main():
    # Try COM9 first, then device interface path
    paths_to_try = [r"\\.\COM9", r"COM9:", r"COM9"]

    # Also try the device interface path
    dev_path = find_device_path()
    if dev_path:
        paths_to_try.insert(0, dev_path)
        print(f"Found device interface path: {dev_path}")
    else:
        print("No device interface path found in registry, trying COM paths only")

    handle = INVALID_HANDLE_VALUE
    opened_path = None
    for path in paths_to_try:
        print(f"Trying: {path} ... ", end="", flush=True)
        handle = kernel32.CreateFileW(
            path,
            GENERIC_READ | GENERIC_WRITE,
            0,
            None,
            OPEN_EXISTING,
            0,
            None
        )
        err = kernel32.GetLastError()
        if handle != INVALID_HANDLE_VALUE:
            print("OK!")
            opened_path = path
            break
        else:
            print(f"failed (error {err}: {ctypes.FormatError(err).strip()})")

    if handle == INVALID_HANDLE_VALUE:
        print("\nERROR: Could not open the device via any path")
        sys.exit(1)

    # Set timeouts: 2 second read timeout
    timeouts = COMMTIMEOUTS()
    timeouts.ReadIntervalTimeout = 100
    timeouts.ReadTotalTimeoutMultiplier = 0
    timeouts.ReadTotalTimeoutConstant = 2000
    timeouts.WriteTotalTimeoutMultiplier = 0
    timeouts.WriteTotalTimeoutConstant = 2000
    kernel32.SetCommTimeouts(handle, ctypes.byref(timeouts))

    # Set DCB (baud rate doesn't matter for CDC, but set it anyway)
    dcb = DCB()
    dcb.DCBlength = ctypes.sizeof(DCB)
    kernel32.GetCommState(handle, ctypes.byref(dcb))
    dcb.BaudRate = 115200
    dcb.ByteSize = 8
    dcb.Parity = 0
    dcb.StopBits = 0
    dcb.fBinary = 1
    dcb.fDtrControl = 1  # DTR on
    dcb.fRtsControl = 1  # RTS on
    kernel32.SetCommState(handle, ctypes.byref(dcb))

    print(f"\nOpened: {opened_path}")
    print()

    # Wait for welcome banner
    print("--- Test 1: Welcome Banner (5 sec timeout) ---")
    buf = ctypes.create_string_buffer(4096)
    bytes_read = w.DWORD(0)

    welcome = b""
    start = time.time()
    while (time.time() - start) < 5.0:
        ok = kernel32.ReadFile(handle, buf, 4096, ctypes.byref(bytes_read), None)
        if bytes_read.value > 0:
            welcome += buf.raw[:bytes_read.value]
            if b"Console is ready" in welcome:
                break

    if welcome:
        print(f"Received {len(welcome)} bytes:")
        print(welcome.decode("utf-8", errors="replace"))
        if b"Console is ready" in welcome:
            print("[PASS] Welcome banner received!")
        else:
            print("[PARTIAL] Got data but no 'Console is ready'")
    else:
        print("[INFO] No welcome banner (normal if already connected)")
    print()

    # Echo test
    print("--- Test 2: Echo Test ---")
    test_str = b"Hello PIC32!\r\n"
    bytes_written = w.DWORD(0)
    ok = kernel32.WriteFile(handle, test_str, len(test_str), ctypes.byref(bytes_written), None)
    err = kernel32.GetLastError()
    print(f"WriteFile: ok={ok}, bytes_written={bytes_written.value}, error={err}")
    if err:
        print(f"  Error string: {ctypes.FormatError(err).strip()}")
    print(f"Sent: {test_str.strip()!r} ({bytes_written.value} bytes)")

    time.sleep(0.5)

    echo = b""
    start = time.time()
    while (time.time() - start) < 3.0:
        ok = kernel32.ReadFile(handle, buf, 4096, ctypes.byref(bytes_read), None)
        if bytes_read.value > 0:
            echo += buf.raw[:bytes_read.value]
        if len(echo) >= len(test_str):
            break

    if echo:
        print(f"Echo: {echo!r}")
        if test_str.strip() in echo:
            print("[PASS] Echo matches!")
        else:
            print("[INFO] Echo received but doesn't exactly match")
    else:
        print("[FAIL] No echo received")
    print()

    # Multi-char test
    print("--- Test 3: Multi-char Echo ---")
    test2 = b"ABCDE12345"
    kernel32.WriteFile(handle, test2, len(test2), ctypes.byref(bytes_written), None)
    print(f"Sent: {test2!r}")

    time.sleep(0.5)
    echo2 = b""
    start = time.time()
    while (time.time() - start) < 3.0:
        kernel32.ReadFile(handle, buf, 4096, ctypes.byref(bytes_read), None)
        if bytes_read.value > 0:
            echo2 += buf.raw[:bytes_read.value]
        if len(echo2) >= len(test2):
            break

    if echo2:
        print(f"Echo: {echo2!r}")
        if test2 in echo2:
            print("[PASS] All characters echoed!")
        else:
            print(f"[INFO] Partial: expected {test2!r} in {echo2!r}")
    else:
        print("[FAIL] No echo")
    print()

    print("=== Test Complete ===")
    kernel32.CloseHandle(handle)
    print("Closed handle.")

if __name__ == "__main__":
    main()
