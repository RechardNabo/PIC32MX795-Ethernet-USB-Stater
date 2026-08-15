  flash memory or eeprom

# MCC Load Guide — PIC32 Ethernet Starter Kit (No Expansion, No FreeRTOS)

**Project:** PIC32_ETH_Kit.X
**Device:** PIC32MX795F512L
**MCC:** 5.5.1 / Core 5.7.1 / Harmony V3 v1.5.5
**Compiler:** XC32 v5.10

---

## MCC UI — 4 Tabs

| Tab                         | Purpose                                                                                                                                      |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| **Device Resources**  | All available components from all installed packages (csp, core, net, usb, bsp). Organized as a tree by component path. Double-click to add. |
| **Project Resources** | Components already added to the project. Auto-loaded components appear here on MCC open. Right-click to remove user-added ones.              |
| **Project Graph**     | Visual graph of loaded components and their dependencies. Some nodes need manual linking (drag from one node to another).                    |
| **Config Options**    | Configuration settings for the component selected in Project Graph. Click a component in the graph → its settings appear here.              |

---

## What Auto-Loads When You Open MCC

When you open MCC on this project, the `.mc3` file tells MCC which components
are already in **Project Resources**. For this project, only two are
auto-loaded:

```
Project Resources
├── System                  ← CSP "core" component (id="core", path="/")
│                             Contains these configuration tabs INSIDE it:
│                             ├── Clock          (clk_pic32mx script)
│                             ├── Pin Manager    (gpio_01166 script)
│                             ├── Interrupts     (evic_01166 script)
│                             ├── DMA            (dmac_00735 script)
│                             ├── WDT            (wdt_01385 script)
│                             ├── Fuses          (from ATDF FUSECONFIG)
│                             ├── Prefetch       (from ATDF PCACHE)
│                             └── MIPS Config    (ISA mode, heap size)
│
└── Device Family Pack      ← CSP "dfp" component (id="dfp", path="/Packs/")
```

> **Why Clock/DMA/GPIO are inside System:**
> The PIC32MX family script (`csp/arch/mips/devices_pic32mx/PIC32MX.py`)
> loads `clk_pic32mx`, `gpio_01166`, `evic_01166`, `dmac_00735`, and
> `wdt_01385` **into** the System component via `execfile()`. These scripts
> call `coreComponent.createXxxSymbol()` — they add tabs/symbols to System,
> they do NOT create separate tree items.
>
> The generic peripheral loader (`peripheral.py`) explicitly **skips** these
> peripherals because they're in the `system_components` list:
> `["PORT", "DMAC", "WDT", "clk", "intc", ...]`

---

## Device Resources — Full Tree Hierarchy

All components from all installed packages appear here, organized by their
tree path. Components NOT relevant to PIC32MX795F512L are marked with ~~strikethrough~~.

```
/Board Support Packages (BSPs)/
    Custom Board (BSP)
    PIC32MX Ethernet Starter Kit II BSP          ← ADD THIS

/Drivers/                                          (from core + net packages)
    TEMP SENSOR                                    (from core — generic I2C temp sensor driver)
    PAC193X                                        (from core, bus=I2C — PAC1932/PAC1933/PAC1934 power monitor)
    MCP16502                                       (from core, bus=I2C — MCP16502 voltage regulator)
    PMU                                            (from core, bus=I2C — generic PMU driver)
    MIIM Driver                                    (from net, bus=MIIM — MDIO/MDC to PHY)
    SQI Flash/                                     (from core, display_path="SQI Flash")
        SST26                                      (bus=SPI — SST26VF series: SST26VF016B/032B/064B)
        ~~MX25L~~                                  (bus=SQI — MX25L series, needs SQI — won't appear)
        ~~W25~~                                    (bus=SQI — W25 series, needs SQI — won't appear)
    I2C EEPROM/                                    (from core, display_path="I2C EEPROM")
        AT24                                       (bus=I2C — AT24C series: AT24C01/02/04/08/16/32/64/128/256/512)
    SPI EEPROM/                                    (from core, display_path="SPI EEPROM")
        AT25                                       (bus=SPI — AT25 series: AT25010/020/040/080/160/320/640/128/256)
    SPI FLASH/                                     (from core, display_path="SPI FLASH")
        AT25DF                                     (bus=SPI — AT25DF series: AT25DF081/161/321/641/512)
    Parallel PROM/                                 (from core, display_path="Parallel PROM")
        ~~SST39~~                                  (bus=HEMC parallel — SST39VF series, needs HEMC — won't work)
        ~~SST38~~                                  (bus=HEMC parallel — SST38VF series, needs HEMC — won't work)
    SFDP Flash/                                    (from core, display_path="SFDP Flash")
        SFDP                                       (bus=SPI — any SFDP-compliant SPI flash via JEDEC SFDP)
    MAC Driver/Internal/                           (from net, path="/Drivers/MAC Driver/Internal/")
        ETHMAC                                     ← ADD THIS (PIC32MX internal ETH MAC — RMII/MII to external PHY)
        ~~GMAC0, GMAC1~~                           (SAMA7G internal GMAC — won't appear)
        ~~GMAC~~                                   (SAM internal GMAC — needs GMAC peripheral — won't appear)
        ~~EMAC0, EMAC1~~                           (SAM internal EMAC — won't appear)
        ~~PPP~~                                    (PPP over UART — PIC32MZ/SAME5 only — won't appear)
    PHY Driver                                     (from net, path="/Drivers/PHY Driver")
        DP83848                                    ← ADD THIS (TI DP83848C/I/YB — onboard PHY)
        DP83640                                    (TI DP83640 — IEEE 1588 PHY)
        VSC8540                                    (Microsemi VSC8540)
        VSC8541                                    (Microsemi VSC8541)
        KSZ8041                                   (Microchip KSZ8041NL/RNL)
        KSZ8061                                   (Microchip KSZ8061NL/RNL)
        KSZ8081                                   (Microchip KSZ8081RNA/RNL)
        KSZ8091                                   (Microchip KSZ8091RNA/RNL)
        KSZ8863                                   (Microchip KSZ8863 — 3-port switch)
        KSZ9031                                   (Microchip KSZ9031RNX)
        KSZ9131                                   (Microchip KSZ9131RNX)
        LAN8700                                    (Microchip LAN8700)
        LAN8720                                    (Microchip LAN8720A)
        LAN8740                                    (Microchip LAN8740A)
        LAN8742A                                   (Microchip LAN8742A)
        LAN9303                                    (Microchip LAN9303 — 3-port switch w/ PHY)
        LAN9354                                    (Microchip LAN9354 — 4-port switch w/ PHY)
        LAN8770                                    (Microchip LAN8770 — RGMII PHY)
        LAN8840                                    (Microchip LAN8840)
        IP101GR                                    (IC+ IP101GR)
        Dummy                                      (test/dummy PHY driver)
    External Ethernet Controller                   (from net, path="/Drivers/External Ethernet Controller")
        ENCX24J600                                 (Microchip ENCX24J600 — SPI Ethernet MAC+PHY)
        ENC28J60                                   (Microchip ENC28J60 — SPI Ethernet MAC+PHY)

    NOT in /Drivers/ tree (multi-instance generator components — auto-instantiated
    when a dependent component needs them, not shown as standalone tree items):
      USART (drv_usart)     — auto-created when UART-dependent component is added
      I2C (drv_i2c)         — auto-created when I2C-dependent component is added (e.g. AT24)
      SPI (drv_spi)         — auto-created when SPI-dependent component is added (e.g. AT25, SST26)
      MEMORY (drv_memory)   — auto-created when memory-dependent component is added
      SD Card (SPI) (drv_sdspi) — auto-created when SD card support is needed
      SDMMC (drv_sdmmc)     — auto-created when SDHC peripheral is present

/Libraries/
    I2C_BB                                         (from core package)
    ~~DVFS~~                                      (SAM-only)
    Emulated EEPROM                                (from core package)

/Peripherals/                                      (from CSP package)
    ADC/      → ADC
    CAN/      → CAN1, CAN2
    CMP/      → CMP
    CVR/      → CVR
    I2C/      → I2C1, I2C2, I2C3, I2C4, I2C5
    ICAP/     → ICAP1, ICAP2, ICAP3, ICAP4, ICAP5
    NVM/      → NVM
    OCMP/     → OCMP1, OCMP2, OCMP3, OCMP4, OCMP5
    PMP/      → PMP
    RCON/     → RCON
    RTCC/     → RTCC
    SPI/      → SPI1, SPI2, SPI3, SPI4
    TMR/      → TMR2, TMR3, TMR4, TMR5
    TMR1/     → TMR1
    UART/     → UART1, UART2, UART3, UART4, UART5, UART6

    NOT listed here (loaded into System instead):
      PORT, DMAC, WDT, INT/EVIC, OSC, PCACHE, CFG, BMX, CORE, ETH, USB
      — These are either in System tabs or handled by net/usb packages

/Packs/
    ~~Device Family Pack (DFP)~~                  (already in Project Resources)

/System Services/                                   (from core package)
    TIME
    CONSOLE
    COMMAND
    DEBUG
    FILE SYSTEM

/TCPIP/                                             (from net package)
    CORE/
        TCPIP CORE
        NETCONFIG
        TCPIP CMD
    Layer3-NETWORK/
        ARP
        ICMPv4
        IPv4
        IGMP
        ICMPv6
        NDP
    Layer4-TRANSPORT/
        TCP
        UDP
    Layer6-PRESENTATION/
        Presentation Layer
    Layer7-APPLICATION/
        DHCP CLIENT
        DHCP SERVER
        DHCP SERVER v2
        DNS CLIENT
        DNS SERVER
        HTTPNET SERVER
        HTTP SERVER v2
        ANNOUNCE
        Berkeley API
        DDNS
        FTP SERVER
        FTP CLIENT
        IPERF
        NBNS
        REBOOT
        SMTP CLIENT
        SNMP
        SNMPV3
        SNTP
        TELNET
        TFTP CLIENT
        TFTP SERVER
        ZEROCONF
        WSC
        DHCPV6 CLIENT
    Net Configurators(Obsolete)/
        TCP/IP Stack Configurator
        (various obsolete configurators)
    Third Party Libraries/wolfSSL/
        wolfMQTT Library

/Tools/
    STDIO                                           (auto-loaded into System)

/USB/                                               (from usb package)
    Drivers/
        USB Full Speed Driver                      ← ADD THIS (drv_usbfs_v1)
        ~~USB High Speed Driver~~                  (NOT for PIC32MX7 — only PIC32MZ/MK)
    Device Stack/
        USB Device Layer
        CDC Function Driver
        HID Function Driver
        MSD Function Driver
        Audio Function Driver
        Vendor Function
        Printer Function Driver
    Host Stack/
        Host Layer
        MSD Client Driver
        HID Client Driver
        CDC Client Driver
        Audio Client Driver
        Generic Client Driver
```

> **IMPORTANT — USB Full Speed, NOT High Speed:**
> The PIC32MX795F512L has a **USB 2.0 Full Speed** controller (12 Mbps).
> The MCC `usb` package creates `drv_usbfs_v1` (USB Full Speed Driver) for
> PIC32MX7. The "USB High Speed Driver" is only created for PIC32MZ/PIC32MK
> and will NOT appear in Device Resources for this device.

---

## Steps to Load Components

Open MPLAB X → open `PIC32_ETH_Kit.X` → click **MCC** button.

**System** and **DFP** auto-appear in Project Resources. Everything else
must be added from Device Resources by double-clicking.

---

### Step 1: Board Support Package (BSP)

1. In **Device Resources**, expand `/Board Support Packages (BSPs)/`
2. Double-click **PIC32MX Ethernet Starter Kit II BSP**
3. It moves to Project Resources
4. In Project Graph, click the BSP node → Config Options shows:
   - LED1 = RD0 (pin 72), LED2 = RD1 (pin 76), LED3 = RD2 (pin 77) — active high
   - SWITCH1 = RD6 (pin 83), SWITCH2 = RD7 (pin 84), SWITCH3 = RD13 (pin 80) — active low, pull-up
   - ICSP = PGx2 (CONFIG_ICESEL = ICS_PGx2)
5. These pin settings auto-configure the **System → Pin Manager** tab

---

### Step 2: Clock (inside System — already loaded)

1. In **Project Resources**, click **System**
2. In Project Graph, click the System node
3. In Config Options, select the **Clock** tab
4. Configure:
   - **POSC** (Primary Oscillator): Enabled, **8 MHz** (crystal Y2 on board)
   - **FNOSC**: **Primary Oscillator with PLL** (POSC + PLL)
   - **FPLLMUL**: M = **20** (8 MHz × 20 = 160 MHz VCO)
   - **FPLLODIV**: DIV_2 → **SYSCLK = 80 MHz**
   - **PBCLKDIV**: DIV_1 → **PBCLK = 80 MHz**
   - **SOSC**: Enabled (32.768 kHz for RTCC, if needed)
   - **Flash Wait States**: Auto-calculated (2 for 80 MHz at -40 to +105°C)

> Clock is NOT in Device Resources — it's a tab inside System.

---

### Step 3: GPIO / Pin Manager (inside System — already loaded)

1. Click **System** in Project Resources
2. In Config Options, select the **Pin Manager** tab
3. If BSP was loaded (Step 1), LED and switch pins are auto-configured. Verify:
   - RD0: LED1, Output, Digital
   - RD1: LED2, Output, Digital
   - RD2: LED3, Output, Digital
   - RD6: SWITCH1, Input, Digital, Pull-Up
   - RD7: SWITCH2, Input, Digital, Pull-Up
   - RD13: SWITCH3, Input, Digital, Pull-Up
4. USB and Ethernet pins will auto-assign when those drivers are loaded

> Pin Manager is NOT in Device Resources — it's a tab inside System.

---

### Step 4: Interrupt Controller (inside System — already loaded)

1. Click **System** in Project Resources
2. In Config Options, select the **Interrupts** tab
3. No manual config needed — interrupt vectors auto-assigned when TCP/IP
   and USB drivers are loaded

> EVIC is NOT in Device Resources — it's a tab inside System.

---

### Step 5: DMA (inside System — already loaded)

1. Click **System** in Project Resources
2. In Config Options, select the **DMA** tab
3. Configure:
   - **Number of Channels**: 8 (PIC32MX795 has 8 DMA channels)
   - Channels 0–1: Auto-assigned to Ethernet TX/RX by TCP/IP stack
   - Channel 2: Auto-assigned to USB by USB stack
   - Channels 3–7: Available for application use

> DMA is NOT in Device Resources — it's a tab inside System.

---

### Step 6: TCP/IP Network Stack (from net package — in Device Resources)

#### 6a: TCP/IP Core

1. In **Device Resources**, expand `/TCPIP/CORE/`
2. Double-click **TCPIP CORE**
3. It moves to Project Resources
4. **Auto-pulls** (required=True, auto-resolve=True):
   - **NETCONFIG** — auto-added (no manual step needed)
   - **SYS_TIME** (System Service) — auto-added
5. **Does NOT auto-pull** (required=False, auto-resolve=False):
   - **SYS_CONSOLE** — must be added manually (see Step 8)

> NETCONFIG is auto-pulled by TCPIP CORE — you do NOT need to add it separately.

#### 6b: Ethernet MAC Driver (ETHMAC)

> NETCONFIG depends on the **MAC** capability. ETHMAC provides it.
> This dependency is NOT auto-resolved — you must add ETHMAC manually.

1. In **Device Resources**, expand `/Drivers/MAC Driver/Internal/`
2. Double-click **ETHMAC**
3. In Project Graph, link ETHMAC to NETCONFIG (provides MAC capability)
   - Drag from ETHMAC node to NETCONFIG node

#### 6c: External PHY Driver (DP83848)

> ETHMAC depends on the **PHY** capability. DP83848 provides it.
> This dependency is NOT auto-resolved — you must add DP83848 manually.

1. In **Device Resources**, expand `/Drivers/PHY Driver/`
2. Double-click **DP83848**
3. In Project Graph, link DP83848 to ETHMAC (provides PHY capability)
4. DP83848 depends on **MIIM** capability (required=True, auto-resolve=True)
   - **MIIM Driver** is auto-pulled by DP83848 (no manual add needed)

#### 6d: Protocol Modules

In **Device Resources**, expand each layer folder and double-click to add:

| Path                            | Component                    | Required?             |
| ------------------------------- | ---------------------------- | --------------------- |
| `/TCPIP/Layer3-NETWORK/`      | **ARP**                | Yes                   |
| `/TCPIP/Layer3-NETWORK/`      | **ICMPv4**             | Yes (ping)            |
| `/TCPIP/Layer3-NETWORK/`      | **IPv4**               | Yes                   |
| `/TCPIP/Layer4-TRANSPORT/`    | **TCP**                | Yes                   |
| `/TCPIP/Layer4-TRANSPORT/`    | **UDP**                | Yes                   |
| `/TCPIP/Layer7-APPLICATION/`  | **DHCP CLIENT**        | Yes (auto IP)         |
| `/TCPIP/Layer7-APPLICATION/`  | **DNS CLIENT**         | Recommended           |
| `/TCPIP/Layer7-APPLICATION/`  | **ANNOUNCE**           | Optional              |
| `/TCPIP/Layer7-APPLICATION/`  | **Berkeley API**       | Optional              |
| `/TCPIP/Layer7-APPLICATION/`  | **HTTPNET SERVER**     | Optional (web server) |
| `/TCPIP/Layer6-PRESENTATION/` | **Presentation Layer** | Optional (for TLS)    |

#### 6e: Configure Network

In Project Graph, click **NETCONFIG** node → Config Options:

- **Interface**: ETH0
- **MAC Driver**: ETHMAC (PIC32MX internal MAC)
- **PHY Driver**: DP83848
- **PHY Address**: 0x01 (DP83848C default on this board)
- **DHCP**: Enabled
- **IP**: 0.0.0.0 (DHCP assigns)
- **Netmask**: 255.255.255.0
- **Gateway**: 0.0.0.0

---

### Step 7: USB Stack (from usb package — in Device Resources)

> **IMPORTANT:** PIC32MX795F512L has **USB Full Speed** (12 Mbps), NOT
> High Speed. Only "USB Full Speed Driver" appears in Device Resources.

#### 7a: USB Full Speed Driver

1. In **Device Resources**, expand `/USB/Drivers/`
2. Double-click **USB Full Speed Driver** (drv_usbfs_v1)
3. It moves to Project Resources
4. **Auto-creates** (the USB FS driver script sets these flags = True):
   - **USB Device Layer** — auto-added to Project Resources
   - **USB Host Layer** — auto-added to Project Resources
   - **CDC Function Driver** — auto-added
   - **HID Function Driver** — auto-added
   - **MSD Function Driver** — auto-added
   - **Audio Function Driver** — auto-added
   - **Vendor Function** — auto-added
   - **Printer Function Driver** — auto-added
   - **HID Client Driver** (host) — auto-added
   - **MSD Client Driver** (host) — auto-added
   - **CDC Client Driver** (host) — auto-added
   - **Audio Client Driver** (host) — auto-added
   - **Generic Client Driver** (host) — auto-added
5. USB pins auto-configure in System → Pin Manager:
   - RG2 (D+), RG3 (D-), RB5 (VBUSON), RB3 (OC)

> **You do NOT need to manually add USB Device Layer, Host Layer, or any
> function/client drivers.** They are ALL auto-created when you add the
> USB Full Speed Driver. Just select which ones to enable in their
> Config Options.

#### 7b: Configure USB Device (for Micro-AB port J5)

1. In Project Graph, click **USB Device Layer** node
2. In Config Options, enable the function drivers you need:
   - **CDC Function Driver** — virtual COM port
   - **HID Function Driver** — human interface device
   - **MSD Function Driver** — mass storage

#### 7c: Configure USB Host (for Type-A port J4)

1. In Project Graph, click **Host Layer** node
2. In Config Options, enable the client drivers you need:
   - **HID Client Driver** — keyboard/mouse
   - **MSD Client Driver** — USB flash drive
   - **CDC Client Driver** — USB serial

> **Note:** Both Host and Device layers are auto-created. The board has
> both a Type-A host port (J4) and Micro-AB OTG port (J5). Enable the
> function/client drivers you need in each layer's Config Options.

---

### Step 8: System Services

After adding TCPIP CORE (Step 6a) and USB Full Speed Driver (Step 7a):

**Auto-loaded** (already in Project Resources):
- **TIME** — auto-pulled by TCPIP CORE (required=True, auto-resolve=True)
- **TIME** — also auto-pulled by USB Host Layer (required=True, auto-resolve=True)

**Must be added manually** (TCPIP CORE has required=False, auto-resolve=False):
- **CONSOLE** — NOT auto-pulled by TCPIP CORE

1. In **Device Resources**, expand `/System Services/`
2. Double-click **CONSOLE** to add it
3. CONSOLE auto-pulls (required=True, auto-resolve=True):
   - **COMMAND** — auto-added
   - **DEBUG** — auto-added
4. In Project Graph, link CONSOLE to a communication interface:
   - **For USB CDC console**: link CONSOLE to USB Device CDC Function Driver
   - **For UART console**: add a UART from `/Peripherals/UART/` (e.g. UART2),
     then link CONSOLE to it

---

### Step 9: Verify NO FreeRTOS

1. Check **Project Resources** tree
2. Ensure **FreeRTOS** is NOT listed
3. If it got auto-loaded, right-click → **Remove**
4. In Project Graph, click **System** node → Config Options → RTOS → select **None**

---

## Summary — Final Component List

| #  | Where                                           | Component                           | Purpose                                                       |
| -- | ----------------------------------------------- | ----------------------------------- | ------------------------------------------------------------- |
| 1  | Project Resources (auto)                        | **System**                    | Contains Clock, Pin Manager, Interrupts, DMA, WDT, Fuses tabs |
| 2  | Project Resources (auto)                        | **Device Family Pack**        | Device-specific config                                        |
| 3  | Device Resources → BSPs                        | PIC32MX Ethernet Starter Kit II BSP | LEDs, switches                                                |
| 4  | System → Clock tab                             | Clock                               | 8 MHz → PLL → 80 MHz                                        |
| 5  | System → Pin Manager tab                       | GPIO                                | Pin configuration                                             |
| 6  | System → Interrupts tab                        | EVIC                                | Interrupt controller                                          |
| 7  | System → DMA tab                               | DMAC                                | DMA for ETH + USB                                             |
| 8  | Device Resources → TCPIP/CORE                  | TCPIP CORE                          | TCP/IP stack                                                  |
| 9  | Auto-pulled by TCPIP CORE                       | NETCONFIG                           | Network configuration (auto-added)                            |
| 10 | Device Resources → Drivers/MAC Driver/Internal | ETHMAC                              | PIC32MX internal Ethernet MAC (manual add)                    |
| 11 | Device Resources → Drivers/PHY Driver          | DP83848                             | DP83848C external PHY (manual add)                            |
| 12 | Auto-pulled by DP83848                          | MIIM Driver                         | MIIM bus driver (auto-added)                                  |
| 13 | Device Resources → TCPIP/Layer3                | ARP, ICMPv4, IPv4                   | Network layer                                                 |
| 14 | Device Resources → TCPIP/Layer4                | TCP, UDP                            | Transport layer                                               |
| 15 | Device Resources → TCPIP/Layer7                | DHCP CLIENT, DNS CLIENT             | Application layer                                             |
| 16 | Device Resources → USB/Drivers                 | USB Full Speed Driver               | USB FS driver (drv_usbfs_v1)                                  |
| 17 | Auto-created by USB FS Driver                  | USB Device Layer                    | USB device (J5) — auto-added                                  |
| 18 | Auto-created by USB FS Driver                  | Host Layer                          | USB host (J4) — auto-added                                    |
| 19 | Auto-created by USB FS Driver                  | CDC/HID/MSD Function Drivers        | USB device functions — auto-added                             |
| 20 | Auto-created by USB FS Driver                  | HID/MSD/CDC Client Drivers          | USB host clients — auto-added                                 |
| 21 | Auto-pulled by TCPIP CORE + USB Host           | TIME                                | System Service (auto-added)                                   |
| 22 | Device Resources → System Services             | CONSOLE                             | Console output (manual add — NOT auto-pulled)                 |
| 23 | Auto-pulled by CONSOLE                          | COMMAND, DEBUG                      | System Services (auto-added when CONSOLE is added)            |

**NOT loaded:**

- FreeRTOS (bare metal per user request)
- UART, SPI, I2C, CAN, ADC, Timer, OC, ICAP, PMP, RTCC (no expansion board)

---

## Project Graph — Dependency Chain

After loading all components, the Project Graph should show this dependency chain:

```
System ──────────────────────────────────────────── (root, auto-loaded)
  │
  ├── BSP (pic32mx_eth_sk2) ──── configures pins in System
  │
  ├── TCPIP CORE
  │   ├── auto-pulls ──── NETCONFIG
  │   ├── auto-pulls ──── TIME (System Service)
  │   ├── ARP, ICMPv4, IPv4 ──── (manual add — network layer)
  │   ├── TCP, UDP ──── (manual add — transport layer)
  │   └── DHCP CLIENT, DNS CLIENT ──── (manual add — application layer)
  │
  ├── NETCONFIG (auto-pulled by TCPIP CORE)
  │   └── needs MAC capability ──── ETHMAC (manual add + link)
  │
  ├── ETHMAC (manual add)
  │   └── needs PHY capability ──── DP83848 (manual add + link)
  │
  ├── DP83848 (manual add)
  │   └── auto-pulls ──── MIIM Driver (auto-resolved)
  │
  ├── USB Full Speed Driver (manual add)
  │   ├── auto-creates ──── USB Device Layer
  │   │   └── CDC/HID/MSD/Audio/Vendor/Printer Function Drivers (auto-created)
  │   ├── auto-creates ──── Host Layer
  │   │   └── HID/MSD/CDC/Audio/Generic Client Drivers (auto-created)
  │   └── auto-pulls ──── TIME (System Service, also pulled by TCPIP CORE)
  │
  └── CONSOLE (manual add — NOT auto-pulled by TCPIP CORE)
      ├── auto-pulls ──── COMMAND
      ├── auto-pulls ──── DEBUG
      └── link to ──── USB Device CDC  OR  UART peripheral (for console I/O)
```

> **If nodes are unlinked in Project Graph:** Drag from the dependent node
> to the provider node to create the link. For example, drag from
> NETCONFIG to ETHMAC to link the MAC capability.

---

## After Loading — Generate Code

1. Click **Generate** button in MCC toolbar
2. Verify no errors in MCC output window
3. Build project: `Ctrl+F11` (Clean and Build)

## Post-Generation Verification

- [ ] `src/config/default/peripheral/clk/plib_clk.c` shows SYSCLK = 80000000
- [ ] `src/config/default/driver/ethmac/` exists (ETHMAC driver)
- [ ] `src/config/default/driver/ethphy/` exists (DP83848 PHY driver)
- [ ] `src/config/default/driver/usb/usbfs/` exists (USB FS driver)
- [ ] `src/config/default/library/tcpip/` exists (TCP/IP stack)
- [ ] `src/config/default/net_pres/` exists (presentation layer)
- [ ] `src/config/default/system/` exists (system services)
- [ ] `src/config/default/definitions.h` exists (critical — if missing, component graph is broken)
- [ ] `src/config/default/initialization.c` exists (critical — if missing, component graph is broken)
- [ ] `main.c` calls SYS_Initialize() with TCP/IP + USB init
- [ ] No FreeRTOS references in generated code

> **If `definitions.h` or `initialization.c` are missing after generation:**
> The MCC component dependency graph is incomplete. Check Project Graph for
> unlinked nodes. The dependency chain must be:
> TCPIP CORE → NETCONFIG → ETHMAC → DP83848
> Ensure all four are loaded and linked in Project Graph.

---

## wolfSSL Update & Linker Error Resolution

After updating the wolfSSL library in `src/third_party/wolfssl/`, the build
failed at the link stage with undefined references to `NET_PRES_*` functions
and `SYS_RANDOM_CryptoBlockGet`. These symbols are provided by two source
files that were not part of the original MCC-generated build configuration.

### Root Cause

The updated wolfSSL headers now declare dependencies on the Harmony
Networking Presentation Layer (`net_pres`) and the Harmony system random
adapter (`sys_random_h2_adapter`). MCC did not generate these files into the
project because the Presentation Layer component was not added in the MCC
Project Graph, and the random adapter is a low-level system file that is
only pulled in when certain crypto features are enabled.

### Files Added to the Build

| File | Source | Destination |
|------|--------|-------------|
| `net_pres.c` | Harmony content (`~/.mcc/HarmonyContent/net/...`) | `src/config/default/net_pres/pres/src/net_pres.c` |
| `net_pres_encryptionproviderapi.h` | Harmony content | `src/config/default/net_pres/pres/net_pres_encryptionproviderapi.h` |
| `net_pres_transportapi.h` | Harmony content | `src/config/default/net_pres/pres/net_pres_transportapi.h` |
| `net_pres_certstore.h` | Harmony content | `src/config/default/net_pres/pres/net_pres_certstore.h` |
| `net_pres_local.h` | Harmony content | `src/config/default/net_pres/pres/src/net_pres_local.h` |
| `sys_random_h2_adapter.c` | Already in project tree | `src/config/default/system/sys_random_h2_adapter.c` |

### Build Configuration Changes

1. **`nbproject/configurations.xml`** — Added `net_pres.c` and
   `sys_random_h2_adapter.c` to the C source files list so MPLAB X includes
   them in the generated Makefile.

2. **`src/config/default/configuration.h`** — Added two configuration macros
   required by `net_pres.c` that are not generated by MCC when the
   Presentation Layer is added manually:

   ```c
   /*** NET_PRES Presentation Layer Configuration ***/
   #define NET_PRES_NUM_INSTANCE                      (1U)
   #define NET_PRES_NUM_SOCKETS                       (8U)
   ```

   - `NET_PRES_NUM_INSTANCE` — Number of presentation layer instances (1 for
     a single TCP/IP stack).
   - `NET_PRES_NUM_SOCKETS` — Maximum number of simultaneous presentation
     sockets. Set to 8 to match `TCPIP_TCP_MAX_SOCKETS` (10) with headroom.

### Makefile Regeneration

MPLAB X does **not** automatically regenerate the Makefile when
`configurations.xml` is edited outside the IDE. After modifying
`configurations.xml`, regenerate the Makefile with:

```powershell
& "C:\Program Files\Microchip\MPLABX\v6.20\mplab_platform\bin\prjMakefilesGenerator.bat" `
    "C:\Users\rnabo\Desktop\project\PIC32MX795-Ethernet-USB-Stater\PIC32_ETH_Kit.X"
```

This updates `nbproject/Makefile-default.mk` to include the newly added
source files in `SOURCEFILES`, `OBJECTFILES`, and the compile rules.

### Verifying the Fix

After regenerating the Makefile, build from the command line:

```powershell
cd "PIC32_ETH_Kit.X"
& "C:\Program Files\Microchip\MPLABX\v6.20\gnuBins\GnuWin32\bin\make.exe" `
    -f nbproject/Makefile-default.mk CONF=default
```

A successful build produces:
`dist/default/production/PIC32_ETH_Kit.X.production.hex`

### Key Takeaways

- When updating wolfSSL (or any third-party library that depends on Harmony
  middleware), check for new dependencies on `net_pres`, `sys_random`, and
  other system services.
- MCC only generates code for components that are in the Project Graph. If a
  library introduces a dependency on a component that was not added via MCC,
  the files must be copied manually and registered in `configurations.xml`.
- After any manual edit to `configurations.xml`, run
  `prjMakefilesGenerator.bat` to regenerate the Makefile — the IDE only
  regenerates on Clean or project reload.
- Configuration macros like `NET_PRES_NUM_INSTANCE` and
  `NET_PRES_NUM_SOCKETS` are normally defined by MCC when the Presentation
  Layer component is added through the Project Graph. When adding `net_pres`
  manually, these must be defined in `configuration.h`.
