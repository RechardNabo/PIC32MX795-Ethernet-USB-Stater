# MCC Content Installation Guide — PIC32 Ethernet Starter Kit

**Target device:** PIC32MX795F512L (100-pin LQFP, 512KB flash, 128KB RAM, MIPS M4K core)
**Board:** PIC32 Ethernet Starter Kit (DS61166A) + I/O Expansion Board (DS51950B)
**MCC version:** 5.5.1 | MCC core: 5.7.1 | Harmony V3 library: 1.5.5
**Compiler:** XC32 v5.10
**DFP:** PIC32MX_DFP v1.7.380

---

## Currently Installed (in `~/.mcc/HarmonyContent/`)

| Package | Type | Status |
|---------|------|--------|
| csp | API | Installed (v3.26.0) |
| csp_apps_pic32mx | Application | Installed |
| CMSIS_5 | Tool | Installed |
| harmony-services | Tool | Installed |
| dev_packs (PIC32MX_DFP) | Pack | Installed (v1.7.380) |
| **bsp** | API | **Installed** — contains `pic32mx_eth_sk2` board (LEDs RD0/RD1/RD2, SW1 RD6, SW2 RD7, SW3 RD13) |
| **core** | API | **Installed** — system services (DMA, FS, memory, time, console) |
| **net** | API | **Installed** — TCP/IP stack + `ethmac` driver + `ethphy` driver |
| **usb** | API | **Installed** — USB Host + Device + OTG (`usbhs`, `usbfs` drivers) |
| FreeRTOS-Kernel | RTOS | Installed (optional) |
| net_apps_pic32mx | Application | Installed (optional) |
| core_apps_pic32mx | Application | Installed (optional) |
| usb_apps_dual_role | Application | Installed (optional — for OTG) |
| reference_apps_pic32m | Application | Installed (optional) |
| quick_docs | Documentation | Installed (optional) |
| mplab_event_recorder | Tool | Installed (optional) |
| mplab_dvrt | Tool | Installed (optional) |

### Compiler & IDE

| Tool | Status |
|------|--------|
| MPLAB X IDE | Installed (`C:\Program Files\Microchip\MPLABX`) |
| XC32 Compiler | Installed — v4.50, v4.60, **v5.10** (use v5.10) |

---

## Starter Kit Hardware — Complete Feature Inventory

### On-Board ICs

| Ref | Part | Function | MCC Package Needed |
|-----|------|----------|-------------------|
| U2 | PIC32MX795F512L | Main application MCU | csp (installed) + dfp (installed) |
| U8 | DP83848C | 10/100 Ethernet PHY | **net** (download) — provides ETHMAC driver + TCP/IP stack |
| U6 | TPS20X1B | USB Host VBUS power switch | **usb** (download) — USB Host stack |
| U4 | MCP1253_MSOP | USB OTG/Device charge pump | **usb** (download) — USB Device/OTG stack |
| U1 | PIC32MX440F512H | On-board debugger MCU (Debug32) | No MCC package — runs debugger firmware |
| U3 | TPS20X1B | +3.3V to P32_VDD load switch | No MCC package — hardware only |
| U5 | TC1262-2.5_SOT223 | LDO regulator (+3.3V rail) | No MCC package — hardware only |

### On-Board Peripherals

| Feature | Hardware | MCU Pins | MCC Package / CSP Driver |
|---------|----------|----------|--------------------------|
| Ethernet MAC | DP83848C PHY via RMII | ETXEN, ETXD0/1, ERXD0/1, ECRS_DV, ERXERR, EMDC, EMDIO, EREF_CLK | **net** (download) — ETHMAC driver is inside net, NOT in csp |
| USB Host | Type-A port (J4), TPS20X1B switch | D+/RG2, D-/RG3, VBUSON/RB5, OC/RB3 | **usb** (download) — USB driver is inside usb, NOT in csp |
| USB OTG/Device | Micro-A/B port (J5), MCP1253 | D+/RG2, D-/RG3, USBID/RF3, VBUSON/RB5 | **usb** (download) — usb_apps_dual_role for OTG |
| User LED D4 | RD0 (via R20 330 ohm) | RD0 | **bsp** (download) + csp gpio_01166 |
| User LED D5 | RD1 (via R22 330 ohm) | RD1 | **bsp** + csp gpio_01166 |
| User LED D6 | RD2 (via R23 330 ohm) | RD2 | **bsp** + csp gpio_01166 |
| User Switch SW1 | RD6 (active low) | RD6 | **bsp** + csp gpio_01166 |
| User Switch SW2 | RD7 (active low) | RD7 | **bsp** + csp gpio_01166 |
| User Switch SW3 | RD13 (active low) | RD13 | **bsp** + csp gpio_01166 |
| Ethernet LED D8 | Status LED (via R26 510 ohm) | PHY pin | **net** (PHY-managed, no GPIO driver needed) |
| Power LED D3 | P32_VDD indicator | — | No driver — hardware only |
| Debug LED D1 | Debugger active | — | No driver — debugger MCU |
| Primary crystal Y2 | 8 MHz | OSC1/OSC2 | csp clk_pic32mx (installed) |
| Secondary crystal Y3 | 32.768 kHz | SOSCI/SOSCO | csp clk_pic32mx (installed) |
| PHY oscillator Y4 | 25 MHz | EREF_CLK | No driver — hardware oscillator |
| Debug ICSP | PGC2, PGD2, MCLR | Via J3 header | No MCC package — hardware debugger |
| JTAG | TCK/RA1, TMS/RA0, TDI/RA4, TDO/RA5 | Via expansion J9 | No MCC package — debug only |

### On-Board Power Supply

| Net | Source | No MCC package needed — hardware only |
|-----|--------|---------------------------------------|
| +5V_DUSB | Debugger USB port (J1) | |
| +5V_EXT | ORed from +5V_DUSB or P32_VBUS | |
| +3.3V | U5 (TC1262-2.5 LDO) | |
| P32_VDD | U3 (TPS20X1B switch from +3.3V) | |
| P32_VBUS | U4 (MCP1253 charge pump) | |

---

## Expansion Board Hardware — Complete Feature Inventory

### On-Board ICs (Expansion Board)

| Ref | Part | Function | MCC Package Needed |
|-----|------|----------|-------------------|
| U1 | MCP16321 | +9V to +5V step-down switching regulator | No MCC package — hardware only |
| U2 | MCP1825-3302E/DB | +5V to +3.3V LDO regulator | No MCC package — hardware only |

### Connectors and What They Expose

| Connector | Type | Signals Exposed | MCC Package / CSP Driver |
|-----------|------|----------------|--------------------------|
| J1 | 132-pin Starter Kit connector (mates with J2) | All MCU signals + power | — (passive) |
| J4 | PICtail Plus Connector 1 | UART1/2, SPI1/2, I2C1/2, CAN1/2, ADC, PMP, DCI, USB, GPIO | csp drivers (see below) |
| J2 | PICtail Plus Connector 2 | Same as J4 | csp drivers |
| J3 | CAN-ISO Connector | CAN1 (C1TX/C1RX), CAN2 (C2TX/C2RX) | csp can_01152 |
| J10 | Test point header bank 1 | PMP, Timers, SPI2, Comparators, Ext Int, PMP Address | — (probe points) |
| J11 | Test point header bank 2 | PMP, Sec OSC, OC-PWM, Input Capture, ADC, I2C, UART, A/D ref, JTAG, ICSP | — (probe points) |
| J8 | TRACE header | TRCLK/RA6, TRD0/RG13, TRD1/RG12, TRD2/RG14, TRD3/RA7 | No driver — EJTAG trace |
| JP1 | ICD connector | PGC2, PGD2, MCLR, +3.3V, GND | No driver — programming |
| J9 | JTAG connector | TCK, TMS, TDI, TDO, MCLR | No driver — debug |

### Expansion Board Power Supply

| Rail | Source | No MCC package needed — hardware only |
|------|--------|---------------------------------------|
| +9V | DJ005B barrel jack | |
| +5V | U1 (MCP16321) | |
| +3.3V | U2 (MCP1825 LDO) | |

### Power Indicators

| Ref | Color | Rail | No driver — hardware only |
|-----|-------|------|---------------------------|
| D1 | Orange | +3.3V | |
| D2 | Red | +5V | |

---

## PIC32MX795F512L On-Chip Peripherals — Complete List vs MCC Coverage

### Peripherals with CSP Drivers (already installed — enable in CSP configurator)

| Peripheral | CSP Driver Folder | Available on Board/Expansion | Notes |
|-----------|-------------------|------------------------------|-------|
| GPIO | `gpio_01166` | LEDs, switches, all connectors | |
| UART1 | `uart_00734` | Expansion PICtail J4/J2, test header J11 | U1TX/RF2, U1RX/RF8 |
| UART2 | `uart_00734` | Expansion PICtail J4/J2, test header J11 | U2TX/RF13, U2RX/RF12 |
| SPI1 | `spi_00753` | Expansion PICtail J4/J2 | SCK1/RD10, SDI1/RC4, SDO1/RD0, SS1/RD9 |
| SPI2 | `spi_00753` | Expansion PICtail J4/J2 | SCK2, SDI2/RB9, SDO2/RB8 |
| I2C1 | `i2c_00774` | Expansion PICtail J4/J2, test header J11 | SCL1, SDA1 |
| I2C2 | `i2c_00774` | Expansion PICtail J4/J2, test header J11 | SCL2/RA2, SDA2/RA3 |
| CAN1 | `can_01152` | Expansion PICtail J4/J2, CAN-ISO J3 | C1TX/RD5, C1RX |
| CAN2 | `can_01152` | Expansion PICtail J4/J2, CAN-ISO J3 | C2TX, C2RX |
| ADC | `adc_00755` | Expansion PICtail J4/J2, test header J11 | AN0–AN15 (16 channels) |
| Timer1 | `tmr1_00687` | Test header J10 (T1CK) | |
| Timer2–5 | `tmr_00745` | Test header J10 (T2CLK–T5CLK) | T2CLK/RC1, T3CLK/RC2, T4CLK/RC3, T5CLK/RC4 |
| OC1–OC5 (PWM) | `ocmp_00749` | Test header J11 | OC1/RD0, OC2/RD1, OC3/RD2, OC4/RD3, OC5/RD4 |
| Input Capture | `icap_00740` | Test header J11 | IC2/RD9, IC3/RD10 |
| PMP (16-bit) | `pmp_00751` | Expansion PICtail J4/J2, test headers | PMPD0–15, PMPA0–13, PMPRD, PMPWR |
| Comparator 1 | `cmp_00866` | Test header J10 | C1IN+/RB5, C1IN-/RB4, C1OUT |
| Comparator 2 | `cmp_00866` | Test header J10 | C2IN+/RB3, C2IN-/RB2, C2OUT |
| CVR (Comparator Vref) | `cvr_00800` | Test header J10 (CVREF) | |
| RTCC | `rtcc_00748` | Via 32kHz SOSC | Real-Time Clock Calendar |
| DMA | `dma_85` | Internal | 8 channels |
| EVIC | `evic_01166` | Internal | Interrupt controller |
| WDT | `wdt_00781` | Internal | Watchdog timer |
| DMT | `dmt_01520` | Internal | Deadman timer |
| RCON | `rcon_01342` | Internal | Reset control |
| Clock | `clk_pic32mx` | 8MHz POSC, 32kHz SOSC | Clock configuration |

### Peripherals requiring MCC Content Manager download (NOT in CSP)

| Peripheral | Where to Get It | Board Use |
|-----------|----------------|-----------|
| Ethernet MAC (EMAC) | **net** package | DP83848C PHY — board's primary feature |
| USB (Host + Device + OTG) | **usb** package | Type-A host port + Micro-AB OTG port |

### Peripherals with NO MCC driver (gap)

| Peripheral | Status | Board Use |
|-----------|--------|-----------|
| DCI (Digital Audio Interface) | No driver in CSP or any MCC package | Expansion PICtail J4/J2 (BCLK, SCK, SDI, SDO, FSYNC for I2S audio) — use direct register access or SPI in I2S mode if needed |

---

## Install from MCC Content Manager — Required

| # | Package | Category | Type | PIC32MX Support | Covers |
|---|---------|----------|------|----------------|--------|
| 1 | **bsp** | Foundations | API | Yes (contains PIC32 Ethernet Starter Kit board definition) | LEDs D4/D5/D6, switches SW1/SW2/SW3, pin mapping, board config |
| 2 | **core** | Foundations | API | Yes (has `core_apps_pic32mx`) | System services — DMA manager, memory, file system (FatFS/exFAT), time system service, console |
| 3 | **net** | Network | API | Yes (has `net_apps_pic32mx`) | TCP/IP stack — ETHMAC driver, HTTP, DHCP, DNS, SNMP, TCP, UDP, IGMP, Announce (for DP83848C PHY) |
| 4 | **usb** | USB | API | Yes (generic API supports PIC32MX) | USB Host stack (Type-A), USB Device stack (Micro-AB), USB OTG/dual-role |

## Install from MCC Content Manager — Optional

| # | Package | Category | Type | PIC32MX Support | Covers |
|---|---------|----------|------|----------------|--------|
| 5 | **FreeRTOS-Kernel** | RTOS | External | Yes (generic) | Multitasking RTOS kernel |
| 6 | **net_apps_pic32mx** | Network | Application | Yes (PIC32MX-specific) | Ready-made networking example apps for PIC32MX |
| 7 | **core_apps_pic32mx** | Foundations | Application | Yes (PIC32MX-specific) | Ready-made core service example apps |
| 8 | **csp_apps_pic32mx** | Foundations | Application | Yes (already installed) | CSP peripheral example apps |
| 9 | **usb_apps_host** | USB | Application | Generic | USB host example apps |
| 10 | **usb_apps_device** | USB | Application | Generic | USB device example apps |
| 11 | **usb_apps_dual_role** | USB | Application | Generic | USB OTG example apps (board has OTG port) |
| 12 | **reference_apps_pic32m** | Reference Apps | Application | Yes (covers PIC32M family including MX) | Reference applications for PIC32M MCUs |
| 13 | **quick_docs** | Reference Apps | Documentation | Yes | Quick documentation |
| 14 | **mplab_event_recorder** | Tools | Tool | Generic | Event recorder for debugging |
| 15 | **mplab_dvrt** | Tools | Tool | Generic | Data Visualizer Run Time for debugging |

## NOT Applicable — No PIC32MX Support in Catalog

| Package | Reason |
|---------|--------|
| crypto / crypto_v4 | No PIC32MX entries in catalog |
| mbedtls | No PIC32MX entries in catalog |
| wolfssl | No PIC32MX entries in catalog |
| graphics | No PIC32MX entries in catalog |
| touch | No PIC32MX entries in catalog |
| wireless | No PIC32MX entries in catalog |
| motorcontrol | No PIC32MX entries in catalog |
| audio | No PIC32MX entries in catalog |
| vision | No PIC32MX entries in catalog |
| openthread | No PIC32MX entries in catalog |
| bootloader | No PIC32MX entries in catalog |
| littlefs | No PIC32MX entries in catalog |
| aws / aws_iot | No PIC32MX entries in catalog |
| aerospace / classb | No PIC32MX entries in catalog |
| smart_energy | No PIC32MX entries in catalog |
| ethercat | No PIC32MX entries in catalog |
| net_10base_t1s | No PIC32MX entries in catalog |
| spi_uhf_transceiver | No PIC32MX entries in catalog |
| shd | No PIC32MX entries in catalog |
| eclipse_threadx | No PIC32MX entries in catalog |
| azure_rtos | No PIC32MX entries in catalog |
| cryptoauthlib | No PIC32MX entries in catalog |
| zlib | No PIC32MX entries in catalog |
| helix_mp3 | No PIC32MX entries in catalog |
| xiph_flac | No PIC32MX entries in catalog |

---

## Summary — What to Install

### Step 1: Install from MCC Content Manager (4 required packages)

1. **bsp** — Board Support Package (LEDs, switches, board pin mapping)
2. **core** — Harmony Core system services (DMA, file system, memory, console, time)
3. **net** — TCP/IP networking stack (Ethernet MAC driver + HTTP/DHCP/DNS/SNMP)
4. **usb** — USB Host + Device + OTG stack

### Step 2: Install optional packages if needed

5. **FreeRTOS-Kernel** — if RTOS needed
6. **net_apps_pic32mx** — for PIC32MX networking example projects
7. **usb_apps_dual_role** — for USB OTG example (board has OTG port)
8. **reference_apps_pic32m** — for PIC32M family reference applications

### Step 3: Enable CSP drivers (already installed — no download)

Enable these inside the CSP configurator after loading the project:

| Driver | For |
|--------|-----|
| clk_pic32mx | Clock config (8MHz POSC, 32kHz SOSC) |
| gpio_01166 | LEDs, switches |
| uart_00734 | UART1, UART2 |
| spi_00753 | SPI1, SPI2 |
| i2c_00774 | I2C1, I2C2 |
| can_01152 | CAN1, CAN2 |
| adc_00755 | ADC AN0–AN15 |
| tmr_00745 / tmr1_00687 | Timers 1–5 |
| ocmp_00749 | Output Compare / PWM OC1–OC5 |
| icap_00740 | Input Capture IC2, IC3 |
| pmp_00751 | Parallel Master Port (16-bit) |
| cmp_00866 | Comparators 1, 2 |
| cvr_00800 | Comparator voltage reference |
| rtcc_00748 | Real-Time Clock Calendar |
| dma_85 | DMA controller |
| evic_01166 | Interrupt controller |
| wdt_00781 | Watchdog timer |
| dmt_01520 | Deadman timer |
| rcon_01342 | Reset control |

### Not covered by any MCC package

| Feature | Workaround |
|---------|-----------|
| DCI (Digital Audio Interface) | No driver — use direct register access or SPI in I2S mode if adding audio PICtail card |

---

## Suggested Learning Projects

A progressive path from basics to a full web server, each building on the previous:

| # | Project | Skills Learned |
|---|---------|----------------|
| 1 | **LED Blinker** | GPIO output, clock config, basic build/flash cycle |
| 2 | **Switch-Controlled LEDs** | GPIO input, debouncing, interrupt handling |
| 3 | **UART Console over USB CDC** | USB device stack, CDC function driver, console I/O |
| 4 | **Network Ping (ICMP Echo)** | ETHMAC driver, DP83848 PHY, TCP/IP stack init, DHCP, ICMP |
| 5 | **HTTP Web Server with wolfSSL TLS** | HTTP NET server, dynamic variables, wolfSSL TLS, presentation layer |

---

## Verification Checklist

- [x] bsp installed — `pic32mx_eth_sk2` board definition present (LEDs RD0/RD1/RD2, SW1 RD6, SW2 RD7, SW3 RD13)
- [x] core installed — system services available
- [x] net installed — `ethmac` driver + TCP/IP stack available
- [x] usb installed — USB Host + Device + OTG drivers available (`usbhs`, `usbfs`)
- [x] XC32 v5.10 installed
- [x] MPLAB X IDE installed
- [x] clk_pic32mx enabled — 8MHz POSC configured, PLL for 80 MHz system clock
- [x] gpio enabled — LEDs on RD0/RD1/RD2, switches on RD6/RD7/RD13
- [x] TCP/IP stack enabled — ETHMAC + DP83848 PHY + ARP/ICMPv4/IPv4/TCP/UDP/DHCP/DNS
- [x] USB Full Speed driver enabled — CDC function driver for USB device
- [x] wolfSSL updated — `src/third_party/wolfssl/` updated to latest version
- [x] net_pres source + headers added — `net_pres.c` and supporting headers copied from Harmony content
- [x] sys_random_h2_adapter.c added to build — resolves `SYS_RANDOM_CryptoBlockGet` linker error
- [x] NET_PRES config macros defined — `NET_PRES_NUM_INSTANCE` (1) and `NET_PRES_NUM_SOCKETS` (8) in `configuration.h`
- [x] Makefile regenerated — `prjMakefilesGenerator.bat` run after `configurations.xml` edit
- [x] Build succeeds — `PIC32_ETH_Kit.X.production.hex` generated successfully
- [ ] UART enabled — UART1 for console/debug, UART2 for expansion
- [ ] SPI enabled — if using SPI peripherals on PICtail
- [ ] I2C enabled — if using I2C peripherals on PICtail
- [ ] CAN enabled — if using CAN-ISO connector J3
- [ ] ADC enabled — if using analog inputs
- [ ] Timer enabled — Timer2/3 for TCP/IP tick, others for application
- [ ] OC/PWM enabled — if using PWM output
- [ ] PMP enabled — if using parallel LCD or PMP peripheral
- [ ] RTCC enabled — if using real-time clock
- [ ] DMA enabled — if using DMA transfers
