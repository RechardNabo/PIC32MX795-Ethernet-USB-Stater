
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

*DS61166A-page 22–26 — © 2010 Microchip Technology Inc.*

> **Transcription note:** These pages consist almost entirely of schematic drawings. The tables
> above reconstruct the nets, reference designators and component values as printed on the
> schematic sheets. Some pin labels are rendered from low-resolution artwork and should be
> verified against the original Microchip document **DS61166A** before use in a design.
