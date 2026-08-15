
# PIC32 Ethernet Starter Kit User's Guide

**Appendix A — Board Layout and Schematics (continued)**
Document: **DS61166A** | © 2010 Microchip Technology Inc.

---

## A.3 PIC32 ETHERNET STARTER KIT BOARD SCHEMATICS

This section contains the board schematics for the PIC32 Ethernet Starter Kit:

| Figure | Title                                                        | Page |
| ------ | ------------------------------------------------------------ | ---- |
| A-4    | PIC32 Ethernet Starter Kit (Ethernet)                        | 22   |
| A-5    | PIC32 Ethernet Starter Kit (PIC32 Device)                    | 23   |
| A-6    | PIC32 Ethernet Starter Kit (USB Host and OTG Power Supplies) | 24   |
| A-7    | PIC32 Ethernet Starter Kit (Debugger)                        | 25   |
| A-8    | PIC32 Ethernet Starter Kit (3.3V Power Supply)               | 26   |

Connector/jumper reference designators appearing on the board: **J1, J2, J3, J4, J5, J6, J7, J8**

---

## FIGURE A-4: PIC32 ETHERNET STARTER KIT (ETHERNET)

> *DS61166A-page 22 — PIC32 Ethernet Starter Kit User's Guide*

### Sheet Overview

This sheet contains the 10/100 Ethernet physical layer interface: the **DP83848C** PHY (U8), the
**SI-60062-F** RJ-45 MagJack (J6), the 25 MHz PHY reference oscillator (Y4), the RMII/MII
termination network, LED indicators and the PHY strapping resistors.

### Power Supply Decoupling (P32_VDD)

| Reference | Value  | Net                            |
| --------- | ------ | ------------------------------ |
| C39       | .1 µF | P32_VDD                        |
| C36       | .1 µF | P32_VDD                        |
| C37       | .1 µF | P32_VDD                        |
| C35       | .1 µF | P32_VDD                        |
| C19       | .1 µF | P32_VDD                        |
| C20       | .1 µF | P32_VDD                        |
| C21       | .1 µF | P32_VDD                        |
| C22       | .1 µF | P32_VDD                        |
| C23       | .1 µF | P32_VDD                        |
| C24       | .1 µF | P32_VDD                        |
| C31       | .1 µF | P32_VDD                        |
| C27       | .1 µF | P32_VDD                        |
| C28       | .1 µF | P32_VDD (oscillator Y4 supply) |
| C36 (PHY) | .1 µF | PFBOUT filter                  |

### Magnetics / RJ-45 Connector — J6

**Part:** `CONN_MAGJACK_SI-60062-F`

| Pin(s)     | Signal                                           |
| ---------- | ------------------------------------------------ |
| 1          | MDI_TP (via R41 49.9 Ω)                         |
| 2          | MDI_TN (via R40 49.9 Ω)                         |
| 3          | MDI_RP (via R39 49.9 Ω)                         |
| 6          | MDI_RN (via R37 49.9 Ω)                         |
| 4, 5, 7, 8 | Bob Smith termination → 1000 pF 2 kV to chassis |
| 9, 10      | LED_LINK (through R28 250 Ω from P32_VDD)       |
| 11, 12     | LED_ACT (through R44 250 Ω from P32_VDD)        |
| 13, 14     | SHIELD                                           |

**Center-tap termination resistors:** R41, R40, R39, R37 = **49.9 Ω** each
**High-voltage isolation cap:** 1000 pF, 2 kV

### Reference Clock Oscillator — Y4

| Reference | Description                                   |
| --------- | --------------------------------------------- |
| Y4        | `OSC_KC5032` — **25 MHz** oscillator |
| Pin 1     | EN                                            |
| Pin 2     | GND                                           |
| Pin 3     | OUT → R29 (33 Ω) →**EREF_CLK**       |
| Pin 4     | VCC (P32_VDD, decoupled by C28 .1 µF)        |
| R29       | 33 Ω series termination                      |

### Ethernet PHY — U8

**Part:** `DP83848C` (10/100 Mb/s Single Port PHY)

#### MAC-Side Interface (from PIC32)

| PHY Pin | Signal                                    | Series Resistor                  |
| ------- | ----------------------------------------- | -------------------------------- |
| 1       | TX_CLK                                    | —                               |
| 2       | TX_EN ←**ETXEN(2)**                | R59 = 33 Ω                      |
| 3       | TXD_0 ←**ETXD0(2)**                | R60 = 33 Ω                      |
| 4       | TXD_1 ←**ETXD1(2)**                | R61 = 33 Ω                      |
| 5       | TXD_2                                     | —                               |
| 6       | TXD_3 / SNI_MODE                          | —                               |
| 7       | PWR_DOWN / INT →**INT3/SCL1/RA14** | R56 = 1.5 kΩ pull-up to P32_VDD |
| 8–12   | RESERVED                                  | —                               |

#### Management / Status Interface

| Signal              | Detail                                                     |
| ------------------- | ---------------------------------------------------------- |
| **EMDC**      | Serial management clock                                    |
| **EMDIO**     | Serial management data — R55 = 1.5 kΩ pull-up to P32_VDD |
| **EREF_CLK**  | X1 reference clock input (from Y4 / R29)                   |
| **RESET_N**   | PHY reset                                                  |
| **25MHz_OUT** | → TP11 (test point)                                       |

#### PHY Strap / Configuration Resistors

| Reference  | Value    | Function                              |
| ---------- | -------- | ------------------------------------- |
| R16        | 2.2 kΩ  | Strap (EF_EF / mode select)           |
| R21        | 2.2 kΩ  | Strap                                 |
| R25        | 2.2 kΩ  | Strap                                 |
| R50        | 4.87 kΩ | RBIAS (bias reference resistor)       |
| Strap nets | —       | EF_D[1:0], EF_EF, ED_EN, EF_D0, EF_D1 |

#### Analog / Filter Components

| Reference | Value  | Net    |
| --------- | ------ | ------ |
| C32       | .1 µF | PFBOUT |
| C33       | .1 µF | PFBOUT |
| C34       | 10 µF | PFBOUT |
| C36       | .1 µF | PFBOUT |

#### MDI (Twisted-Pair) Pins

| PHY Pin | Signal |
| ------- | ------ |
| TD+     | MDI_TP |
| TD–    | MDI_TN |
| RD+     | MDI_RP |
| RD–    | MDI_RN |

### LED Indicators

| Net       | Pull-up                  | Notes                     |
| --------- | ------------------------ | ------------------------- |
| LED_LINK  | R33 = 2.2 kΩ to P32_VDD | PHY pin LED_LINK/AN0      |
| LED_ACT   | R57 = 2.2 kΩ to P32_VDD | PHY pin LED_ACT/COL/AN_EN |
| LED_SPEED | R51 = 2.2 kΩ to P32_VDD | PHY pin LED_SPEED/AN1     |
| D8        | R26 = 510 Ω             | Discrete status LED       |

---

## FIGURE A-5: PIC32 ETHERNET STARTER KIT (PIC32 DEVICE)

> *© 2010 Microchip Technology Inc. — DS61166A-page 23 — Board Layout and Schematics*

### Sheet Overview

This sheet shows the main application microcontroller **U2 — PIC32MX795F512L** (100-pin package),
its crystals, bypass capacitors, user LEDs and user switches.

### Main Device

| Reference | Part                      |
| --------- | ------------------------- |
| U2        | **PIC32MX795F512L** |

### Bypass Capacitors

| Reference | Value  | Net     |
| --------- | ------ | ------- |
| C1        | .1 µF | P32_VDD |
| C2        | 10 µF | P32_VDD |

### Oscillators

| Reference | Description                        | Load Caps                |
| --------- | ---------------------------------- | ------------------------ |
| Y2        | **8 MHz** primary crystal    | C5 = 20 pF, C6 = 20 pF   |
| Y3        | **32 kHz** secondary crystal | C15 = 11 pF, C16 = 11 pF |

### Reset / Programming Support

| Reference | Value   | Function                                          |
| --------- | ------- | ------------------------------------------------- |
| R10       | 4.7 kΩ | **PIC32_MCLR** pull-up to P32_VDD           |
| R12       | 1 kΩ   | Series resistor on**DBG_SDO** → PIC32_PGD2 |
| R13       | 4.7 kΩ | Pull-down on DBG_SDO node                         |

Programming/debug nets: **PIC32_PGC2**, **PIC32_PGD2**, **DBG_SDO**, **PIC32_MCLR**

### Pin Assignments (as labeled on schematic)

#### Left Side (Pins 1–25)

| Pin | Signal                        |
| --- | ----------------------------- |
| 1   | ERXERR                        |
| 3   | PMPD5/RE5                     |
| 4   | PMPD6/RE6                     |
| 5   | PMPD7/RE7                     |
| 6   | T2CLK/RC1                     |
| 7   | T3CLK/RC2                     |
| 8   | T4CLK/RC3                     |
| 9   | SDO1/T5CLK/RC4                |
| 10  | PMPA5/2C2C/CN8/RG6            |
| 11  | PMPA4/SCM2A/CN9/RG7           |
| 12  | ECRS_DV                       |
| 13  | (PIC32_MCLR, via R10 4.7 kΩ) |
| 14  | EREF_CLK                      |
| 17  | TMS/RA0                       |
| 18  | ERXD0(2)                      |
| 19  | ERXD1(2)                      |
| 21  | VBUSON/C1IN+/AN5/CN7/RB5      |
| 22  | USBOEN/C1IN–/AN4/CN6/RB4     |
| 23  | C2IN–/AN2/CN4/RB2            |
| 24  | PGC1/AN1/CN3/RB1              |
| 25  | PGD1/AN0/CN2/RB0              |

#### Top Side (Pins 76–100)

| Signal Group                                                                 |
| ---------------------------------------------------------------------------- |
| PMPD4/RE4, PMPD3/RE3, PMPD2/RE2, PMPD1/RE1, PMPD0/RE0                        |
| TRD1/RG12, TRD0/RG13, TRD2/RG14, TRD3/RA7, PMPD9/RG0, PMPD10/RG1, PMPD11/RF1 |
| PMPD15/CN12/RD7, PMPD14/CN15/RD6, PMPRD/CS0/C1TX/RD5, CN19/PMPD13/RD13       |
| CN18/PMPD12/RD12, CN/PMPD12/RD12, SCL2/RA2, SDA2/RA3                         |

#### Right Side (Pins 51–75)

| Pin | Signal                   |
| --- | ------------------------ |
| 76  | (top-right corner group) |
| 74  | SOSCO/T1CK/CN0/RC14      |
| 73  | SOSCI/CN1/RC13           |
| 72  | SDO1/INT4/SC1/RD0        |
| 71  | EMDC                     |
| 70  | SCK1/C3/PMPCS2/RD10      |
| 69  | SS1/IC2/RD9              |
| 68  | EMDIO                    |
| 67  | ETXEN(2)                 |
| 66  | INT3/SCL1/RA14           |
| 61  | TDO/RA5                  |
| 60  | TDI/RA4                  |
| 59  | SDA2/RA3                 |
| 58  | SCL2/RA2                 |
| 57  | D+/RG2                   |
| 56  | D–/RG3                  |
| 54  | P32_VBUS                 |
| 53  | SCM1B/RF8                |
| 52  | SCM1A/RF2                |
| 51  | USBID/RF3                |

#### Bottom Side (Pins 26–50)

| Signal Group                               |
| ------------------------------------------ |
| PMPA1/VREF–/RA9, PMPA0/VREF+/RA10         |
| SDO2/AN8/RB8, SDI2/AN9/RB9                 |
| PMPA13/CVREF/AN10, PMPA12/AN11/RB11        |
| SCM2D/RG12/RF12, SCM3C/RF13                |
| PMPA11/AN12/RB12, PMPA10/AN13/RB13         |
| PMPA9/AN14/RB14, PMPA8/AN15/OCFB/CN12      |
| PMPA6/SCM3A/CN17/RF4, PMPA7/SCM3B/CN18/RF5 |
| TCK/RA1, TDO/RA5                           |

### User LEDs

| LED | Resistor | Value  | Driving Pin       |
| --- | -------- | ------ | ----------------- |
| D4  | R20      | 330 Ω | SDO1/INT4/SC1/RD0 |
| D5  | R22      | 330 Ω | SC3/RD1           |
| D6  | R23      | 330 Ω | SC5/RD2           |

### User Switches

| Switch | Connected Pin    |
| ------ | ---------------- |
| SW1    | PMPD14/CN15/RD6  |
| SW2    | PMPD15/CN16/RD7  |
| SW3    | CN19/PMPD13/RD13 |

---

## FIGURE A-6: PIC32 ETHERNET STARTER KIT (USB HOST AND OTG POWER SUPPLIES)

> *DS61166A-page 24 — PIC32 Ethernet Starter Kit User's Guide*

### Sheet Overview

Two independent USB power paths are provided: a **USB HOST Power Supply** (Type-A port) and a
**USB OTG/Device Power Supply** rated at **120 mA MAX** (Micro A/B port).

---

### USB HOST Power Supply

> **Note:** *Install jumper if powering from Debugger Power Supply.*

| Reference | Part / Value       | Description                                    |
| --------- | ------------------ | ---------------------------------------------- |
| JP2       | Jumper (C2 – C1)  | Selects**+5V_DUSB** → **+5V_EXT** |
| U6        | **TPS20X1B** | Current-limited power distribution switch      |
| C26       | 100 µF            | Bulk output capacitance on VBUS                |

**U6 (TPS20X1B) Pin Connections**

| Pin | Name | Connection                            |
| --- | ---- | ------------------------------------- |
| 5   | IN   | +5V_EXT                               |
| 4   | EN   | VBUSON/C1IN+/AN5/CN7/RB5              |
| 1   | OUT  | J4 VBUS (pin 1)                       |
| 2   | GND  | GND                                   |
| 3   | OC   | C2IN+/AN3/CN5/RB3 (over-current flag) |

**J4 — HOST PORT, TYPE A**

| Pin | Signal               |
| --- | -------------------- |
| 1   | VBUS                 |
| 2   | D–/RG3              |
| 3   | D+/RG2               |
| 4   | GND                  |
| —  | Shield (chassis GND) |

---

### USB OTG / Device Power Supply (120 mA MAX)

| Reference | Part / Value           | Description                           |
| --------- | ---------------------- | ------------------------------------- |
| U4        | **MCP1253_MSOP** | Regulated charge-pump DC/DC converter |
| R24       | DNP                    | Do Not Populate (P32_VDD to PGOOD)    |
| R16       | 4.7 kΩ                | SHDN pull-down                        |
| C17       | 1 µF                  | Flying capacitor (C+ / C–)           |
| C18       | 4.7 µF                | Input capacitor (Vin / P32_VDD)       |
| C25       | 6.8 µF                | Output capacitor                      |
| R27       | 100 kΩ                | VBUS bleed resistor                   |

**U4 (MCP1253) Pin Connections**

| Pin | Name   | Connection                                           |
| --- | ------ | ---------------------------------------------------- |
| 8   | SELECT | —                                                   |
| 7   | SHDN   | VBUSON/C1IN+/AN5/CN7/RB5 (via R16 4.7 kΩ pull-down) |
| 6   | C+     | C17 (1 µF)                                          |
| 5   | C–    | C17 (1 µF)                                          |
| 1   | PGOOD  | C2IN+/AN3/CN5/RB3 (via R24, DNP)                     |
| 2   | Vout   | **P32_VBUS**                                   |
| 3   | Vin    | P32_VDD                                              |
| 4   | GND    | GND                                                  |

**J5 — DEVICE/OTG PORT, TYPE MICRO A/B**

| Pin | Signal                    |
| --- | ------------------------- |
| 1   | VBUS (**P32_VBUS**) |
| 2   | D– (**D–/RG3**)   |
| 3   | D+ (**D+/RG2**)     |
| 4   | ID (**USBID/RF3**)  |
| 5   | GND                       |
| 6   | Shield                    |

---

## FIGURE A-7: PIC32 ETHERNET STARTER KIT (DEBUGGER)

> *© 2010 Microchip Technology Inc. — DS61166A-page 25 — Board Layout and Schematics*

### Sheet Overview

**Debug32 µP** — the on-board debugger subsystem, built around a **PIC32MX440F512H** (U1),
its USB port, ICSP header and status LED.

### Debugger Microcontroller

| Reference | Part                      |
| --------- | ------------------------- |
| U1        | **PIC32MX440F512H** |

### Power / Decoupling

| Reference | Value  | Net   |
| --------- | ------ | ----- |
| C30       | .1 µF | +3.3V |
| C29       | 10 µF | +3.3V |

### Oscillator

| Reference | Description             | Load Caps              |
| --------- | ----------------------- | ---------------------- |
| Y1        | **8 MHz** crystal | C3 = 20 pF, C4 = 20 pF |

### Pull-up / Series Resistors

| Reference | Value   | Function                               |
| --------- | ------- | -------------------------------------- |
| R15       | 4.7 kΩ | Pull-up to +3.3V (JTAG/reset node)     |
| R14       | 4.7 kΩ | **DBG_MCLR** pull-up to +3.3V    |
| R4        | 1 kΩ   | Pull-up to +3.3V —**DBG_SMSCL** |
| R11       | 1 kΩ   | Pull-up to +3.3V —**DBG_SMSDA** |
| R9        | 1 kΩ   | Pull-up to +3.3V —**SYS_OC**    |

### Target Interface Signals

| Net        | Description                      |
| ---------- | -------------------------------- |
| PIC32_PGC2 | Target programming clock (pin 4) |
| DBG_SDO    | Debugger serial data out (pin 5) |
| PIC32_PGD2 | Target programming data (pin 6)  |
| DBG_MCLR   | Debugger master clear (pin 7)    |
| PIC32_MCLR | Target device reset (pin 48)     |
| CPU_ON     | Target power enable (pin 47)     |
| TDO/RA5    | JTAG TDO (pin 46)                |
| TDI/RA4    | JTAG TDI                         |
| TMS/RA0    | JTAG TMS                         |
| TCK/RA1    | JTAG TCK                         |
| DBG_SMSCL  | SMBus clock (pin 44)             |
| DBG_SMSDA  | SMBus data (pin 43)              |
| SYS_OC     | System over-current (pin 42)     |

### J1 — DEBUGGER USB PORT

| Pin  | Signal                    |
| ---- | ------------------------- |
| 1    | VBUS (**+5V_DUSB**) |
| 2    | D– (**DBG_D–**)   |
| 3    | D+ (**DBG_D+**)     |
| 4    | GND                       |
| 5, 6 | Shield                    |

### J3 — DBG ICSP HEADER

| Pin | Signal       |
| --- | ------------ |
| 1   | DBG_MCLR     |
| 2   | +3.3V        |
| 3   | GND          |
| 4   | DBG_PGD      |
| 5   | DBG_PGC      |
| 6   | (no connect) |

### Status Indicator

| Reference | Value  | Function               |
| --------- | ------ | ---------------------- |
| D1        | LED    | **DEBUG ACTIVE** |
| R5        | 330 Ω | LED current limit      |

---

## FIGURE A-8: PIC32 ETHERNET STARTER KIT (3.3V POWER SUPPLY)

> *DS61166A-page 26 — PIC32 Ethernet Starter Kit User's Guide*

### Sheet Overview — **POWER**

Generates the board's **+3.3V** rail from either the USB device VBUS (**P32_VBUS**) or the
debugger USB supply (**+5V_DUSB**), and gates the target's **P32_VDD** rail with a
current-limited switch.

### Input Power ORing

| Reference | Type       | Source Net                    |
| --------- | ---------- | ----------------------------- |
| D7        | Diode      | **P32_VBUS** → +5V_EXT |
| D2        | Diode      | **+5V_DUSB** → +5V_EXT |
| TP9       | Test point | +5V_EXT                       |

### Regulator

| Reference | Part                        | Description                                     |
| --------- | --------------------------- | ----------------------------------------------- |
| U5        | **TC1262-2.5_SOT223** | LDO regulator producing the**+3.3V** rail |

**U5 Pin Connections**

| Pin | Name | Connection |
| --- | ---- | ---------- |
| 1   | IN   | +5V_EXT    |
| 2   | COM  | GND        |
| 3   | OUT  | +3.3V      |

| Reference | Value   | Net             |
| --------- | ------- | --------------- |
| C7        | 4.7 µF | +5V_EXT (input) |
| C8        | 4.7 µF | +3.3V (output)  |

### Target Rail Switch

| Reference | Part / Value       | Description                                             |
| --------- | ------------------ | ------------------------------------------------------- |
| U3        | **TPS20X1B** | Current-limited load switch (+3.3V →**P32_VDD**) |
| R17       | 100 kΩ            | Pull-up / enable bias on**CPU_ON**                |

**U3 (TPS20X1B) Pin Connections**

| Pin | Name | Connection                         |
| --- | ---- | ---------------------------------- |
| 5   | IN   | +3.3V                              |
| 4   | EN   | **CPU_ON** (via R17 100 kΩ) |
| 1   | OUT  | **P32_VDD**                  |
| 2   | GND  | GND                                |
| 3   | OC   | **SYS_OC**                   |

### Indicators and Test Points

| Reference | Value         | Description                   |
| --------- | ------------- | ----------------------------- |
| TP10      | Test point    | P32_VDD                       |
| D3        | LED           | Power-on indicator on P32_VDD |
| R19       | 330 Ω        | LED current limit             |
| GND1      | Test point    | Ground                        |
| MH1       | Mounting hole | —                            |

### +3.3V Bulk Decoupling

| Reference | Value  | Net   |
| --------- | ------ | ----- |
| C9        | .1 µF | +3.3V |
| C10       | .1 µF | +3.3V |
| C11       | .1 µF | +3.3V |
| C12       | .1 µF | +3.3V |
| C13       | .1 µF | +3.3V |
| C14       | .1 µF | +3.3V |

---

## Consolidated Reference Designator Index

### Integrated Circuits

| Ref | Part              | Figure | Function                            |
| --- | ----------------- | ------ | ----------------------------------- |
| U1  | PIC32MX440F512H   | A-7    | On-board debugger MCU (Debug32 µP) |
| U2  | PIC32MX795F512L   | A-5    | Main application MCU                |
| U3  | TPS20X1B          | A-8    | +3.3V → P32_VDD load switch        |
| U4  | MCP1253_MSOP      | A-6    | USB OTG/Device charge pump          |
| U5  | TC1262-2.5_SOT223 | A-8    | LDO regulator (+3.3V rail)          |
| U6  | TPS20X1B          | A-6    | USB Host VBUS power switch          |
| U8  | DP83848C          | A-4    | 10/100 Ethernet PHY                 |

### Connectors

| Ref | Description                           | Figure |
| --- | ------------------------------------- | ------ |
| J1  | Debugger USB port                     | A-7    |
| J3  | DBG ICSP header                       | A-7    |
| J4  | USB Host port — Type A               | A-6    |
| J5  | USB Device/OTG port — Type Micro A/B | A-6    |
| J6  | RJ-45 MagJack, SI-60062-F             | A-4    |
| JP2 | Debugger power jumper                 | A-6    |

### Crystals / Oscillators

| Ref | Frequency           | Figure |
| --- | ------------------- | ------ |
| Y1  | 8 MHz               | A-7    |
| Y2  | 8 MHz               | A-5    |
| Y3  | 32 kHz              | A-5    |
| Y4  | 25 MHz (OSC_KC5032) | A-4    |

### LEDs

| Ref | Function           | Series R     | Figure |
| --- | ------------------ | ------------ | ------ |
| D1  | DEBUG ACTIVE       | R5 = 330 Ω  | A-7    |
| D3  | Power on (P32_VDD) | R19 = 330 Ω | A-8    |
| D4  | User LED 1         | R20 = 330 Ω | A-5    |
| D5  | User LED 2         | R22 = 330 Ω | A-5    |
| D6  | User LED 3         | R23 = 330 Ω | A-5    |
| D8  | Ethernet status    | R26 = 510 Ω | A-4    |

### Diodes

| Ref | Function             | Figure |
| --- | -------------------- | ------ |
| D2  | +5V_DUSB ORing diode | A-8    |
| D7  | P32_VBUS ORing diode | A-8    |

### Test Points / Mechanical

| Ref  | Net / Function | Figure |
| ---- | -------------- | ------ |
| TP9  | +5V_EXT        | A-8    |
| TP10 | P32_VDD        | A-8    |
| TP11 | 25MHz_OUT      | A-4    |
| GND1 | Ground         | A-8    |
| MH1  | Mounting hole  | A-8    |

### Key Power Nets

| Net      | Description                                          |
| -------- | ---------------------------------------------------- |
| +5V_DUSB | 5 V from the debugger USB port (J1)                  |
| +5V_EXT  | ORed 5 V rail feeding the LDO and USB host switch    |
| +3.3V    | Main regulated rail from U5                          |
| P32_VDD  | Switched 3.3 V rail for the PIC32 application device |
| P32_VBUS | USB OTG/Device VBUS generated by U4                  |

---


## FIGURE A-9: PIC32 ETHERNET STARTER KIT (APPLICATION BOARD CONNECTOR)

> *© 2010 Microchip Technology Inc. — DS61166A-page 27 — Board Layout and Schematics*

### Sheet Overview

This sheet documents  **J2** , the 132-pin application board expansion connector. Every peripheral
signal from the **PIC32MX795F512L** (U2) is routed to this connector, along with the board power
rails ( **P32_VDD** ,  **+5V_EXT** ) and multiple ground returns.

| Item        | Detail                                                           |
| ----------- | ---------------------------------------------------------------- |
| Reference   | **J2**                                                     |
| Type        | Application/expansion board connector                            |
| Pin count   | 132 (odd pins on the left column, even pins on the right column) |
| Power pins  | Pin 1 =**P32_VDD** , Pin 2 = **+5V_EXT**             |
| Ground pins | 11/12, 33/34, 55/56, 77/78, 99/100, 121/122                      |

---

### Functional Signal Groups Brought Out to J2

| Group Label (as printed) | Description                                   |
| ------------------------ | --------------------------------------------- |
| TRACE PORT               | EJTAG instruction trace (TRCLK, TRD0–TRD3)   |
| PMP DATA [7:0]           | Parallel Master Port low data byte            |
| PMP DATA [15:8]          | Parallel Master Port high data byte           |
| PMP CONTROL              | PMP read/write/chip-select strobes            |
| PMP ADDRESS              | Parallel Master Port address lines            |
| SECONDARY OSC            | Secondary oscillator (SOSCI/SOSCO)            |
| (5) TIMERS               | Timer external clock inputs T2CLK–T5CLK      |
| (2) OC-PWM / OC          | Output Compare / PWM channels OC1–OC5        |
| INPUT CAPTURE            | Input Capture channels IC2, IC3               |
| SPI1                     | Serial Peripheral Interface 1                 |
| SPI2                     | Serial Peripheral Interface 2                 |
| I2C1                     | Inter-Integrated Circuit port 1               |
| I2C2                     | Inter-Integrated Circuit port 2               |
| UART1                    | Universal Asynchronous Receiver/Transmitter 1 |
| UART2                    | Universal Asynchronous Receiver/Transmitter 2 |
| DEBUG SMBUS              | Debugger SMBus (DBG_SMSDA / DBG_SMSCL)        |
| COMPARATOR 1             | Analog comparator 1 inputs/output             |
| COMPARATOR 2             | Analog comparator 2 inputs/output             |
| COMPARATOR REF           | Comparator voltage reference (CVREF)          |
| (8CH) A/D                | 8-channel analog-to-digital converter inputs  |
| A/D REF                  | A/D voltage references (VREF+ / VREF–)       |
| (5) EXT_INT              | External interrupt inputs INT0–INT4          |
| JTAG/ICSP                | TCK, TMS, TDI, TDO                            |
| ICSP                     | PIC32_PGC2, PIC32_PGD2, PIC32_MCLR            |

---

### J2 Pinout — Odd Pins (Left Column)

| Pin | Signal                    | Group               |
| --- | ------------------------- | ------------------- |
| 1   | **P32_VDD**         | Power               |
| 3   | TRD2/RG14                 | TRACE PORT          |
| 5   | TRD1/RG12                 | TRACE PORT          |
| 7   | PMPD7/RE7                 | PMP DATA [7:0]      |
| 9   | PMPD6/RE6                 | PMP DATA [7:0]      |
| 11  | **GND**             | Ground              |
| 13  | PMPD5/RE5                 | PMP DATA [7:0]      |
| 15  | PMPD4/RE4                 | PMP DATA [7:0]      |
| 17  | PMPD3/RE3                 | PMP DATA [7:0]      |
| 19  | PMPD2/RE2                 | PMP DATA [7:0]      |
| 21  | PMPD1/RE1                 | PMP DATA [7:0]      |
| 23  | PMPD0/RE0                 | PMP DATA [7:0]      |
| 25  | PMPRD/CN14/RD5            | PMP CONTROL         |
| 27  | *(no connect)*          | PMP CONTROL         |
| 29  | SCK1/IC3/PMPCS2/RD10      | PMP CONTROL         |
| 31  | SOSCO/T1CK/CN0/RC14       | SECONDARY OSC       |
| 33  | **GND**             | Ground              |
| 35  | T2CLK/RC1                 | (5) TIMERS          |
| 37  | T3CLK/RC2                 | (5) TIMERS          |
| 39  | T4CLK/RC3                 | (5) TIMERS          |
| 41  | SDI1/T5CLK/RC4            | (5) TIMERS          |
| 43  | *(no connect)*          | —                  |
| 45  | PMPA5/SCM2C/CN8/RG6       | SPI2                |
| 47  | PMPA4/SCM2A/CN9/RG7       | SPI2                |
| 49  | *(no connect)*          | SPI2                |
| 51  | *(no connect)*          | SPI2                |
| 53  | *(no connect)*          | SPI2                |
| 55  | **GND**             | Ground              |
| 57  | *(no connect)*          | —                  |
| 59  | DBG_SMSDA                 | DEBUG SMBUS         |
| 61  | DBG_SMSCL                 | DEBUG SMBUS         |
| 63  | VBUSON/C1IN+/AN5/CN7/RB5  | COMPARATOR 1        |
| 65  | USBOEN/C1IN–/AN4/CN6/RB4 | COMPARATOR 1        |
| 67  | C2IN+/AN3/CN5/RB3         | COMPARATOR 2        |
| 69  | C2IN–/AN2/CN4/RB2        | COMPARATOR 2        |
| 71  | C1OUT/AN5/RB5             | COMPARATOR 1 output |
| 73  | C2OUT/AN9/RB9             | COMPARATOR 2 output |
| 75  | *(no connect)*          | —                  |
| 77  | **GND**             | Ground              |
| 79  | *(no connect)*          | (5) EXT_INT         |
| 81  | *(no connect)*          | (5) EXT_INT         |
| 83  | *(no connect)*          | (5) EXT_INT         |
| 85  | *(no connect)*          | (5) EXT_INT         |
| 87  | SDO1/INT0/OC1/RD0         | (5) EXT_INT         |
| 89  | *(no connect)*          | —                  |
| 91  | SCK1/IC3/PMPCS2/RD10      | SPI1                |
| 93  | SDI1/T5CLK/RC4            | SPI1                |
| 95  | SDO1/INT0/OC1/RD0         | SPI1                |
| 97  | C2IN–/AN2/CN4/RB2        | SPI1                |
| 99  | **GND**             | Ground              |
| 101 | PMPA13/CVREF/AN10         | PMP ADDRESS         |
| 103 | PMPA12/AN11/RB11          | PMP ADDRESS         |
| 105 | PMPA11/AN12/RB12          | PMP ADDRESS         |
| 107 | PMPA10/AN13/RB13          | PMP ADDRESS         |
| 109 | PMPA9/SCM3A/CN17/RF4      | PMP ADDRESS         |
| 111 | PMPA8/SCM3B/CN18/RF5      | PMP ADDRESS         |
| 113 | PMPA7/VREF–/RA9          | PMP ADDRESS         |
| 115 | PMPA6/VREF+/RA10          | PMP ADDRESS         |
| 117 | PMPA5/SCM2C/CN8/RG6       | PMP ADDRESS         |
| 119 | PMPA4/SCM2A/CN9/RG7       | PMP ADDRESS         |
| 121 | **GND**             | Ground              |
| 123 | *(no connect)*          | —                  |
| 125 | *(no connect)*          | —                  |
| 127 | PMPA1/AN14/RB14           | PMP ADDRESS         |
| 129 | PMPA0/AN15/OCFB/CN12      | PMP ADDRESS         |
| 131 | *(no connect)*          | —                  |

---

### J2 Pinout — Even Pins (Right Column)

| Pin | Signal                    | Group           |
| --- | ------------------------- | --------------- |
| 2   | **+5V_EXT**         | Power           |
| 4   | TRCLK/RA6                 | TRACE PORT      |
| 6   | TRD3/RA7                  | TRACE PORT      |
| 8   | TRD0/RG13                 | TRACE PORT      |
| 10  | PMPD8/RG0                 | PMP DATA [15:8] |
| 12  | **GND**             | Ground          |
| 14  | PMPD9/RG1                 | PMP DATA [15:8] |
| 16  | PMPD10/RF1                | PMP DATA [15:8] |
| 18  | PMPD11/RF0                | PMP DATA [15:8] |
| 20  | CS/PMPD12/RD12            | PMP DATA [15:8] |
| 22  | CN19/PMPD13/RD13          | PMP DATA [15:8] |
| 24  | PMPD14/CN15/RD6           | PMP DATA [15:8] |
| 26  | PMPD15/CN16/RD7           | PMP DATA [15:8] |
| 28  | PMPWR/OC5/CN13/RD4        | PMP CONTROL     |
| 30  | *(no connect)*          | —              |
| 32  | SOSCI/CN1/RC13            | SECONDARY OSC   |
| 34  | **GND**             | Ground          |
| 36  | SOSCO/T1CK/CN0/RC14       | SECONDARY OSC   |
| 38  | PMPA0/AN15/OCFB/CN12      | —              |
| 40  | PMPWR/OC5/CN13/RD4        | OC-PWM          |
| 42  | OC4/RD3                   | (2) OC-PWM      |
| 44  | OC3/RD2                   | (2) OC-PWM      |
| 46  | OC2/RD1                   | (2) OC-PWM      |
| 48  | SDO1/INT0/OC1/RD0         | OC-PWM          |
| 50  | CS/PMPD12/RD12            | INPUT CAPTURE   |
| 52  | SCK1/IC3/PMPCS2/RD10      | INPUT CAPTURE   |
| 54  | SS1/IC2/RD9               | INPUT CAPTURE   |
| 56  | **GND**             | Ground          |
| 58  | *(no connect)*          | —              |
| 60  | *(no connect)*          | —              |
| 62  | VBUSON/C1IN+/AN5/CN7/RB5  | (8CH) A/D       |
| 64  | USBOEN/C1IN–/AN4/CN6/RB4 | (8CH) A/D       |
| 66  | C2IN+/AN3/CN5/RB3         | (8CH) A/D       |
| 68  | C2IN–/AN2/CN4/RB2        | (8CH) A/D       |
| 70  | PGC1/AN1/CN3/RB1          | (8CH) A/D       |
| 72  | PGD1/AN0/CN2/RB0          | (8CH) A/D       |
| 74  | SDA2/RA3                  | I2C2            |
| 76  | SCL2/RA2                  | I2C2            |
| 78  | **GND**             | Ground          |
| 80  | *(no connect)*          | I2C1            |
| 82  | *(no connect)*          | I2C1            |
| 84  | *(no connect)*          | I2C1            |
| 86  | *(no connect)*          | I2C1            |
| 88  | SCM1A/RF2                 | UART1           |
| 90  | SCM1B/RF8                 | UART1           |
| 92  | *(no connect)*          | UART1           |
| 94  | *(no connect)*          | UART1           |
| 96  | *(no connect)*          | —              |
| 98  | *(no connect)*          | —              |
| 100 | **GND**             | Ground          |
| 102 | PMPA13/CVREF/AN10         | COMPARATOR REF  |
| 104 | *(no connect)*          | —              |
| 106 | SCM3D/RG12/RF13           | UART2           |
| 108 | SCM3C/RF12                | UART2           |
| 110 | PMPA9/SCM3A/CN17/RF4      | UART2           |
| 112 | PMPA8/SCM3B/CN18/RF5      | UART2           |
| 114 | PMPA7/VREF–/RA9          | A/D REF         |
| 116 | PMPA6/VREF+/RA10          | A/D REF         |
| 118 | TDO/RA5                   | JTAG/ICSP       |
| 120 | TDI/RA4                   | JTAG/ICSP       |
| 122 | **GND**             | Ground          |
| 124 | TCK/RA1                   | JTAG/ICSP       |
| 126 | TMS/RA0                   | JTAG/ICSP       |
| 128 | PIC32_PGC2                | ICSP            |
| 130 | PIC32_MCLR                | ICSP            |
| 132 | PIC32_PGD2                | ICSP            |

---

### Power and Ground Summary for J2

| Net               | Pin(s)                                            |
| ----------------- | ------------------------------------------------- |
| **P32_VDD** | 1                                                 |
| **+5V_EXT** | 2                                                 |
| **GND**     | 11, 12, 33, 34, 55, 56, 77, 78, 99, 100, 121, 122 |

---

### Updated Connector Index

| Ref | Description                                     | Figure        |
| --- | ----------------------------------------------- | ------------- |
| J1  | Debugger USB port                               | A-7           |
| J2  | **Application board connector (132-pin)** | **A-9** |
| J3  | DBG ICSP header                                 | A-7           |
| J4  | USB Host port — Type A                         | A-6           |
| J5  | USB Device/OTG port — Type Micro A/B           | A-6           |
| J6  | RJ-45 MagJack, SI-60062-F                       | A-4           |
| JP2 | Debugger power jumper                           | A-6           |

---

*DS61166A-page 27 — © 2010 Microchip Technology Inc.*

> **Transcription note:** This page consists of a single large schematic drawing (Figure A-9).
> The pin tables above reconstruct the net names and pin numbering as printed on the sheet.
> Pin-number-to-signal alignment and several pin-name suffixes were recovered from
> low-resolution artwork; entries marked *(no connect)* correspond to pin positions where no
> net label is legible. Verify against the original Microchip document **DS61166A** before
> designing an application board against this connector.
>

---

## Firmware Architecture

### Toolchain

- **MCU:** PIC32MX795F512L (100-pin, 512KB Flash, 128KB RAM)
- **IDE:** MPLAB X IDE
- **Compiler:** XC32 v5.10
- **Code Generator:** MCC (Microchip Code Configurator)
- **RTOS:** FreeRTOS (included, tasks defined in `src/config/default/tasks.c`)

### Clock Configuration

| Clock | Frequency | Source |
|-------|-----------|--------|
| Primary Oscillator | 8MHz crystal (Y2) | FNOSC = PRIPLL |
| PLL Multiplier | MUL_20 | FPLLMUL = MUL_20 |
| CPU Clock (SYSCLK) | 80MHz | 8MHz × 20 |
| Peripheral Clock (PBCLK) | 80MHz | 1:1 divider |

### Timer Allocation

| Timer | Vector | Purpose | Configured By |
|-------|--------|---------|---------------|
| TMR1 | 4 | FreeRTOS 1ms tick | `port.c` (on `vTaskStartScheduler()`) |
| TMR2 | 8 | SYS_TIME backend (1ms) | `initialization.c` → `sysTimePlibAPI` |
| TMR3 | 12 | LED timing / future use | `main.c` → `TMR3_Initialize_LED()` |

**Why TMR1 is not initialized by MCC:**
FreeRTOS `port.c` directly programs TMR1's hardware registers (prescaler=8, PR1 for 1ms)
when `vTaskStartScheduler()` runs. Calling `TMR1_Initialize()` from `SYS_Initialize` would
conflict with the RTOS. TMR1 is intentionally left unconfigured in `initialization.c`.

**Why TMR3 uses polling instead of interrupts:**
The MCC-generated ISR wrappers in `interrupts_a.S` use FreeRTOS `portSAVE_CONTEXT` /
`portRESTORE_CONTEXT` macros for all interrupt vectors. These macros require the FreeRTOS
scheduler to be running. Since `main()` runs a bare-metal loop without calling
`vTaskStartScheduler()`, hardware ISRs would crash. TMR3 polls the `T3IF` flag via
`EVIC_SourceStatusGet()` / `EVIC_SourceStatusClear()` instead.

### LED Implementation

The LED display uses TMR3 in polling mode for timing:

1. `TMR3_Initialize_LED()` computes the period register from `TMR3_FrequencyGet()` at
   runtime (no hardcoded clock values), sets a 500µs period, disables the interrupt, and
   starts the timer.
2. `TMR3_DelayMs()` polls the TMR3 interrupt flag. Two 500µs periods = 1ms.
3. The main loop debounces switches every 10ms and updates the LED pattern at the
   selected speed interval.

**Why 500µs and not 1ms?** TMR3 is 16-bit with a 1:1 prescaler at 80MHz. A 1ms period
would need PR=79999, which exceeds the 65535 maximum. So we use 500µs (PR=39999) and
count 2 periods per millisecond.

### Switch-Controlled LEDs (Project 2)

Three user switches control the LED display behavior:

| Switch | Pin | Function |
|--------|-----|----------|
| SW1 | RD6 | Cycle LED mode (4 modes) |
| SW2 | RD7 | Cycle speed (4 settings) |
| SW3 | RD13 | Toggle all LEDs on/off override |

**LED Modes (SW1):**

| Mode | Description |
|------|-------------|
| Running | One LED at a time: LED1 → LED2 → LED3 → repeat |
| Alternate | LED1+LED3 alternate with LED2 |
| All Blink | All 3 LEDs blink together |
| (cycles back to Running) | |

**Speed Settings (SW2):**

| Index | Delay per step |
|-------|----------------|
| 0 | 400ms (very slow) |
| 1 | 200ms (slow) |
| 2 | 100ms (normal) |
| 3 | 50ms (fast) |

**Debouncing:** Switches are sampled every 10ms. A reading must remain stable for 3
consecutive samples (30ms total) before the state change is accepted. This filters
out mechanical contact bounce (typically 5-20ms). Only press events (falling edge:
released → pressed) trigger actions — holding the button does not repeat.

### Timing Options Available

| Function | Source | Blocking | RTOS-aware | Resolution |
|----------|--------|----------|------------|------------|
| `TMR3_DelayMs()` | TMR3 polling | Yes | No | 500µs |
| `SYS_TIME_DelayMS()` | TMR2 (SYS_TIME) | No (poll) | No | 1ms |
| `vTaskDelay()` | FreeRTOS (TMR1) | Yes (yields) | Yes | 1ms |
| `xTaskDelayUntil()` | FreeRTOS (TMR1) | Yes (yields) | Yes | 1ms |

### USB CDC Console (Project 3)

A USB CDC virtual serial port console is implemented as an independent module
in `src/console.c` and `src/console.h`. It does NOT depend on the LED or switch
code — it can be used on its own or alongside other features.

**Hardware:** Connect a USB cable from **J5** (micro-AB USB Device port) to a PC.
The board enumerates as a CDC virtual COM port. Open a terminal program (TeraTerm,
PuTTY, etc.) on the COM port at any baud rate (CDC ignores baud — it's USB).

**Console API:**

| Function | Description |
|----------|-------------|
| `Console_Initialize()` | Open USB device, register event handlers |
| `Console_Tasks()` | State machine — call from main loop |
| `Console_IsConnected()` | True when USB host has configured the device |
| `Console_Print(str)` | Send a string to the host |
| `Console_Println(str)` | Send a string + CRLF |
| `Console_Read(buf, size)` | Non-blocking read of received bytes |
| `Console_HasData()` | True if RX buffer has data |
| `Console_GetChar()` | Get one byte (-1 if no data) |

**Console State Machine:**

```
INIT → OPEN_DEVICE → WAIT_CONFIG → READY
                                    ↓ (host disconnects)
                              WAIT_CONFIG
```

The console uses ring buffers (256-byte TX, 128-byte RX) and non-blocking USB
CDC transfers. The main loop calls `Console_Tasks()` every 10ms alongside the
LED/switch code. When connected, switch presses are reported to the console and
characters typed in the terminal are echoed back.

**USB Descriptors:** VID=0x04D8 (Microchip), PID=0x0000, CDC ACM class, full-speed.
Defined in `src/config/default/usb_device_init_data.c`.

### NET_PRES Layer

The Network Presentation (NET_PRES) layer requires two configuration constants in
`configuration.h`:

```c
#define NET_PRES_NUM_INSTANCE   1
#define NET_PRES_NUM_SOCKETS    (TCPIP_TCP_MAX_SOCKETS + TCPIP_UDP_MAX_SOCKETS)
```

**Note:** MCC overwrites `configuration.h` when regenerating code. These constants must be
re-added after every MCC code generation if NET_PRES is not configured through the MCC UI.

### Build

```
make -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
```

Or use MPLAB X IDE: **Clean and Build** button.

### Project Structure

```
src/
├── main.c                          # Entry point, LED timer (TMR3)
├── app.c / app.h                   # Application state machine
├── config/default/
│   ├── configuration.h             # MCC-generated config (NET_PRES constants added)
│   ├── definitions.h              # Module handles and API includes
│   ├── initialization.c           # SYS_Initialize() — all module init
│   ├── interrupts.c               # ISR handler stubs
│   ├── interrupts_a.S             # ISR vector dispatch (FreeRTOS context save/restore)
│   ├── tasks.c                    # FreeRTOS task creation + vTaskStartScheduler()
│   ├── FreeRTOSConfig.h           # FreeRTOS configuration
│   ├── peripheral/
│   │   ├── tmr1/                  # TMR1 PLIB (FreeRTOS tick — not init by MCC)
│   │   ├── tmr/                   # TMR2, TMR3 PLIB (SYS_TIME + LED)
│   │   ├── coretimer/             # Core Timer PLIB (not in build)
│   │   ├── uart/                  # UART1 PLIB
│   │   ├── evic/                  # EVIC (interrupt controller)
│   │   ├── gpio/                  # GPIO PLIB
│   │   └── ...
│   ├── system/                    # SYS_TIME, SYS_CONSOLE, SYS_FS, cache
│   ├── driver/                    # ETH MAC, ETH PHY, MIIM, USB
│   ├── library/tcpip/             # TCP/IP stack (Harmony 3)
│   ├── net_pres/                  # Network Presentation layer
│   └── bsp/                       # Board Support Package (LEDs, switches)
└── third_party/
    ├── rtos/FreeRTOS/             # FreeRTOS source
    └── wolfssl/                   # wolfSSL TLS library
```

