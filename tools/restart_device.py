#!/usr/bin/env python3
"""
Restart a USB device using SetupDi API (no admin needed for restart).
"""
import ctypes
from ctypes import wintypes

setupapi = ctypes.windll.setupapi

# Constants
DIGCF_PRESENT = 0x00000002
DIGCF_DEVICEINTERFACE = 0x00000010
DICS_FLAG_GLOBAL = 0x00000001
DIREG_DEV = 0x00000001

class SP_DEVINFO_DATA(ctypes.Structure):
    _fields_ = [
        ("cbSize", wintypes.DWORD),
        ("ClassGuid", ctypes.c_byte * 16),
        ("DevInst", wintypes.DWORD),
        ("Reserved", ctypes.c_void_p),
    ]

class SP_PROPCHANGE_PARAMS(ctypes.Structure):
    _fields_ = [
        ("ClassInstallHeader", ctypes.c_byte * 8),  # SP_CLASSINSTALL_HEADER
        ("StateChange", wintypes.DWORD),
        ("Scope", wintypes.DWORD),
        ("HwProfile", wintypes.DWORD),
    ]

# Get device info set for the Ports class
guid = (ctypes.c_byte * 16)()
# Ports class GUID: {4D36E978-E325-11CE-BFC1-08002BE10318}
ports_guid = bytes([0x78, 0xE9, 0x36, 0x4D, 0x25, 0xE3, 0xCE, 0x11, 0xBF, 0xC1, 0x08, 0x00, 0x2B, 0xE1, 0x03, 0x18])

hDevInfo = setupapi.SetupDiGetClassDevsW(
    ports_guid,
    None,
    None,
    DIGCF_PRESENT
)
print(f"SetupDiGetClassDevs: {hDevInfo}")

if hDevInfo != -1 and hDevInfo != 0xFFFFFFFF:
    dev_info = SP_DEVINFO_DATA()
    dev_info.cbSize = ctypes.sizeof(SP_DEVINFO_DATA)

    index = 0
    while setupapi.SetupDiEnumDeviceInfo(hDevInfo, index, ctypes.byref(dev_info)):
        # Get device instance ID
        buf = ctypes.create_unicode_buffer(2048)
        setupapi.SetupDiGetDeviceRegistryPropertyW(
            hDevInfo,
            ctypes.byref(dev_info),
            0x0000000C,  # SPDRP_HARDWAREID
            None,
            buf,
            2048,
            None
        )
        hwid = buf.value
        buf2 = ctypes.create_unicode_buffer(2048)
        setupapi.SetupDiGetDeviceRegistryPropertyW(
            hDevInfo,
            ctypes.byref(dev_info),
            0x0000000A,  # SPDRP_DEVICEDESC
            None,
            buf2,
            2048,
            None
        )
        desc = buf2.value
        print(f"  [{index}] {desc} | HWID: {hwid}")

        if "VID_04D8" in hwid and "PID_000A" in hwid:
            print(f"  -> Found our device! Attempting restart...")

            # Try to restart the device using SetupDiCallClassInstaller
            params = SP_PROPCHANGE_PARAMS()
            params.ClassInstallHeader = (ctypes.c_byte * 8)()
            params.ClassInstallHeader[0] = 0x14  # DIF_PROPERTYCHANGE
            params.ClassInstallHeader[1] = 0
            params.ClassInstallHeader[2] = 0
            params.ClassInstallHeader[3] = 0
            params.ClassInstallHeader[4] = 0x00000004  # install type
            params.StateChange = 0x00000003  # DICS_PROPCHANGE
            params.Scope = DICS_FLAG_GLOBAL
            params.HwProfile = 0

            result = setupapi.SetupDiSetClassInstallParamsW(
                hDevInfo,
                ctypes.byref(dev_info),
                ctypes.byref(params),
                ctypes.sizeof(SP_PROPCHANGE_PARAMS)
            )
            print(f"  SetupDiSetClassInstallParams: {result}, err={ctypes.windll.kernel32.GetLastError()}")

            result = setupapi.SetupDiCallClassInstaller(
                0x00000012,  # DIF_PROPERTYCHANGE
                hDevInfo,
                ctypes.byref(dev_info)
            )
            print(f"  SetupDiCallClassInstaller: {result}, err={ctypes.windll.kernel32.GetLastError()}")

        index += 1

    setupapi.SetupDiDestroyDeviceInfoList(hDevInfo)
else:
    print("Failed to get device info set")
