
# PIC32 I/O Expansion Board

**Schematic (Sheet 1 of 1)**
Document: **DS51950B** | Board that the **PIC32 Ethernet Starter Kit** plugs into via the application board connector

---

## Sheet Overview

The expansion board is a passive break-out/carrier board. It accepts the PIC32 Ethernet Starter Kit
through a 132‑pin **Starter Kit Connector (J1)** and fans every processor signal out to:

* three **PICtail™ Plus** style daughter-card connectors (**J4**, **J2**, **J3**),
* two **test point header** banks (**J10**, **J11**),
* a **TRACE header** (**J8**),
* an **ICD connector** (**JP1**) and a **JTAG connector**,
* and an on-board **power supply** generating **+3.3 V** and **+5 V** (with a **+9 V** input rail
  distributed to the PICtail connectors).

### Block Index

| Block                 | Reference(s)                 | Description                                                                 |
| --------------------- | ---------------------------- | --------------------------------------------------------------------------- |
| Starter Kit Connector | **J1**                 | 132-pin connector mating with**J2** of the PIC32 Ethernet Starter Kit |
| PICtail Connector 1   | **J4**                 | Expansion daughter-card connector                                           |
| PICtail Connector 2   | **J2**                 | Expansion daughter-card connector                                           |
| CAN-ISO Connector     | **J3**                 | Expansion / isolated CAN daughter-card connector                            |
| Test Point Headers    | **J10**, **J11** | Full signal break-out test headers                                          |
| TRACE Header          | **J8**                 | EJTAG instruction trace port (series-terminated)                            |
| ICD Connector         | **JP1**                | In-circuit debug/programming header                                         |
| JTAG Connector        | **J9** *(as drawn)*  | 2×7 JTAG header with MCLR conditioning                                     |
| Power Supply          | **U1**, **U2**   | +5 V boost and +3.3 V LDO                                                   |
| Power Indicators      | **D1**, **D2**   | +3.3 V (orange) and +5 V (red) LEDs                                         |
| Mounting Holes        | **MH1–MH4**           | Mechanical                                                                  |

---

## Starter Kit Connector — J1

**Part:** `CONN_CL172-0900` (132-pin, 2 × 66)
**Mates with:** PIC32 Ethernet Starter Kit **J2** (Figure A-9 of DS61166A)

Because J1 is the mirror of the starter kit's J2, the pin assignments are identical — see the
J2 pinout tables in the starter kit section. The board power rails arrive on the first two pins:

| Pin                                               | Net                                                 |
| ------------------------------------------------- | --------------------------------------------------- |
| 1                                                 | **P32_VDD** (+3.3 V from the expansion board) |
| 2                                                 | **+5V** / **+5V_EXT**                   |
| 11, 12, 33, 34, 55, 56, 77, 78, 99, 100, 121, 122 | **GND**                                       |

### Functional Groups Broken Out at J1 (as labeled on the sheet)

| Left-Column Label | Right-Column Label                        |
| ----------------- | ----------------------------------------- |
| PMP DATA [7:0]    | TRACE/GPIO                                |
| PMP CONTROL       | PMP DATA [15:8]                           |
| (5) TIMERS        | SECONDARY OSC                             |
| SPI2              | (5) OC-PWM                                |
| COMPARATOR 1      | (5) INPUT CAPTURE                         |
| COMPARATOR 2      | (8CH) A/D                                 |
| (5) EXT_INT       | I2C2                                      |
| SPI1              | I2C1                                      |
| PMP ADDRESS       | UART1                                     |
| —                | UART2                                     |
| —                | COMPARATOR REF                            |
| —                | A/D REF                                   |
| —                | JTAG/GPIO                                 |
| —                | ICSP (PIC32_PGC2, PIC32_MCLR, PIC32_PGD2) |

### Representative Signal List at J1

| Group             | Signals                                                                                                          |
| ----------------- | ---------------------------------------------------------------------------------------------------------------- |
| TRACE/GPIO        | TRCLK/RA6, TRD0/RG13, TRD1/RG12, TRD2/RG14, TRD3/RA7                                                             |
| PMP DATA [7:0]    | PMPD0/RE0 … PMPD7/RE7                                                                                           |
| PMP DATA [15:8]   | PMPD8/RG0, PMPD9/RG1, PMPD10/RF1, PMPD11/RF0, CS/PMPD12/RD12, CN19/PMPD13/RD13, PMPD14/CN15/RD6, PMPD15/CN16/RD7 |
| PMP CONTROL       | PMPRD/CN14/RD5, PMPWR/OC5/CN13/RD4, SCK1/IC3/PMPCS2/RD10                                                         |
| PMP ADDRESS       | PMPA0/AN15/OCFB/CN12 … PMPA13/CVREF/AN10                                                                        |
| SECONDARY OSC     | SOSCI/CN1/RC13, SOSCO/T1CK/CN0/RC14                                                                              |
| (5) TIMERS        | T2CLK/RC1, T3CLK/RC2, T4CLK/RC3, SDI1/T5CLK/RC4                                                                  |
| (5) OC-PWM        | OC1/RD0, OC2/RD1, OC3/RD2, OC4/RD3, OC5/RD4                                                                      |
| (5) INPUT CAPTURE | IC1–IC5 (SS1/IC2/RD9, SCK1/IC3/PMPCS2/RD10, …)                                                                 |
| (8CH) A/D         | AN0/RB0 … AN9/RB9                                                                                               |
| COMPARATOR 1      | C1IN+/AN5/RB5, C1IN–/AN4/RB4, C1OUT                                                                             |
| COMPARATOR 2      | C2IN+/AN3/RB3, C2IN–/AN2/RB2, C2OUT                                                                             |
| COMPARATOR REF    | CVREF                                                                                                            |
| A/D REF           | VREF+/RA10, VREF–/RA9                                                                                           |
| I2C1              | SCL1, SDA1                                                                                                       |
| I2C2              | SCL2/RA2, SDA2/RA3                                                                                               |
| UART1             | U1TX, U1RX, U1CTS, U1RTS (SCM1A/RF2, SCM1B/RF8)                                                                  |
| UART2             | U2TX, U2RX, U2CTS, U2RTS (SCM3C/RF12, SCM3D/RF13)                                                                |
| SPI1              | SCK1, SDI1, SDO1, SS1                                                                                            |
| SPI2              | SCK2, SDI2, SDO2, SS2                                                                                            |
| (5) EXT_INT       | INT0/RD0, INT1, INT2, INT3, INT4                                                                                 |
| JTAG/GPIO         | TCK/RA1, TMS/RA0, TDI/RA4, TDO/RA5                                                                               |
| ICSP              | PIC32_PGC2, PIC32_PGD2, PIC32_MCLR                                                                               |

---

## PICtail™ Daughter-Card Connectors — J4, J2 and J3

Three identically-wired expansion connectors are provided so that up to three daughter cards can
be attached simultaneously. Each carries the full peripheral set plus the three supply rails.

| Connector    | Sheet Label         |
| ------------ | ------------------- |
| **J4** | PICTAIL CONNECTOR 1 |
| **J2** | PICTAIL CONNECTOR 2 |
| **J3** | CAN-ISO CONNECTOR   |

### Signal Group Layout (identical on J4, J2 and J3)

| Left Column Group                | Right Column Group                    |
| -------------------------------- | ------------------------------------- |
| SPI1 (SCK1, SDI1, SDO1, SS1)     | UART1 (U1TX, U1RX, U1CTS, U1RTS)      |
| A/D (AN0–AN3)                   | I2C1 (SCL1, SDA1)                     |
| INT & I/O                        | A/D (AN4–AN7)                        |
| USB (D+, D–, VBUS, ID)          | INT & I/O                             |
| SPI2 (SCK2, SDI2, SDO2, SS2)     | CAN1 (C1TX, C1RX)                     |
| A/D (C1OUT/AN8, C2OUT/AN9)       | UART2 (U2TX, U2RX, U2CTS, U2RTS)      |
| INT & I/O                        | I2C2 (SCL2, SDA2)                     |
| DCI (BCLK, SCK, SDI, SDO, FSYNC) | A/D (PMPA13/CVREF/AN10, PMPA7/VREF–) |
| PMP DATA / ADDRESS               | INT & I/O                             |
| SPARE_xx                         | CAN2 (C2TX, C2RX)                     |
| —                               | DCI                                   |
| —                               | PMP DATA / ADDRESS                    |
| —                               | SPARE_81 … SPARE_118                 |

### Power Rails Present on Each PICtail Connector

| Rail             | Notes                                                |
| ---------------- | ---------------------------------------------------- |
| **+3.3 V** | Generated on-board by U2                             |
| **+5 V**   | Generated on-board by U1                             |
| **+9 V**   | External barrel-jack input rail                      |
| **GND**    | Multiple ground pins distributed along the connector |

> Spare/unassigned positions are labelled **SPARE_81** through **SPARE_118** on the schematic
> and are available for user-defined signals.

---

## Test Point Headers — J10 and J11

Two large break-out headers expose every processor signal for probing.

### J10 — Signal Groups

| Group              | Signals                                              |
| ------------------ | ---------------------------------------------------- |
| TRACE/GPIO         | TRCLK/RA6, TRD0/RG13, TRD1/RG12, TRD2/RG14, TRD3/RA7 |
| PMP DATA [7:0]     | PMPD0/RE0 … PMPD7/RE7                               |
| PMP DATA [15:8]    | PMPD8/RG0 … PMPD15/CN16/RD7                         |
| (5) TIMERS         | T1CK, T2CLK/RC1, T3CLK/RC2, T4CLK/RC3, T5CLK/RC4     |
| SPI2               | SCK2, SDI2, SDO2, SS2                                |
| COMPARATOR 1       | C1IN+, C1IN–, C1OUT                                 |
| COMPARATOR 2       | C2IN+, C2IN–, C2OUT                                 |
| (5) EXT_INT        | INT0 … INT4                                         |
| PMP ADDRESS [13:0] | PMPA0 … PMPA13                                      |

### J11 — Signal Groups

| Group             | Signals                             |
| ----------------- | ----------------------------------- |
| TRACE/GPIO        | TRCLK/RA6, TRD0–TRD3               |
| PMP DATA [15:8]   | PMPD8 … PMPD15                     |
| SECONDARY OSC     | SOSCI/CN1/RC13, SOSCO/T1CK/CN0/RC14 |
| (5) OC-PWM        | OC1/RD0 … OC5/RD4                  |
| (5) INPUT CAPTURE | IC1 … IC5                          |
| (8CH) A/D         | AN0/RB0 … AN7/RB7                  |
| I2C1 / I2C2       | SCL1, SDA1, SCL2/RA2, SDA2/RA3      |
| UART1 / UART2     | U1TX, U1RX, U2TX, U2RX              |
| A/D REF           | VREF+/RA10, VREF–/RA9              |
| COMPARATOR REF    | CVREF                               |
| JTAG/GPIO         | TCK/RA1, TMS/RA0, TDI/RA4, TDO/RA5  |
| ICSP              | PIC32_PGC2, PIC32_MCLR, PIC32_PGD2  |
| Power             | +3.3 V, +5 V, GND                   |

---

## TRACE Header — J8

Series-terminated EJTAG trace port break-out.

| Trace Signal | Series Resistor | Value |
| ------------ | --------------- | ----- |
| TRCLK/RA6    | R3              | 22 Ω |
| TRD0/RG13    | R4              | 22 Ω |
| TRD1/RG12    | R5              | 22 Ω |
| TRD2/RG14    | R6              | 22 Ω |
| TRD3/RA7     | R7              | 22 Ω |

---

## ICD Connector — JP1

| Pin | Signal               |
| --- | -------------------- |
| 1   | **PIC32_MCLR** |
| 2   | **+3.3 V**     |
| 3   | **GND**        |
| 4   | **PIC32_PGD2** |
| 5   | **PIC32_PGC2** |
| 6   | *(no connect)*     |

### ICSP Series Options

| Reference | Value           | Net                    |
| --------- | --------------- | ---------------------- |
| R9        | NL (not loaded) | PIC32_PGC2 path        |
| R18       | NL (not loaded) | PIC32_PGD2 path        |
| R??       | 0 Ω option     | Alternate ICSP routing |

---

## JTAG Connector

| Reference | Value / Part       | Function                                                                           |
| --------- | ------------------ | ---------------------------------------------------------------------------------- |
| D3        | **SS110-TP** | Schottky diode on the MCLR path                                                    |
| R8        | 100 Ω             | Series resistor to**PIC32_MCLR**                                             |
| R14       | 4.7 kΩ            | Pull-up to**+3.3 V**                                                         |
| —        | —                 | JTAG signals:**TCK/RA1, TMS/RA0, TDI/RA4, TDO/RA5, PIC32_MCLR, +3.3 V, GND** |

---

## Power Supply (+5 V, +3.3 V)

### Input

| Reference | Part               | Description                                  |
| --------- | ------------------ | -------------------------------------------- |
| J?        | **DJ005B**   | DC barrel jack —**+9 V** input        |
| D4        | **SS110-TP** | Reverse-polarity / input protection Schottky |
| C3        | 10 µF             | Input bulk capacitor                         |
| C4        | 10 µF             | Input/converter capacitor                    |

### U1 — +5 V Switching Regulator

**Part:** `MCP16321` (synchronous step-down converter)

| Pin | Name | Connection                                                                           |
| --- | ---- | ------------------------------------------------------------------------------------ |
| 1   | SW   | L1 (4.7 µH) →**VOUT = +5 V**                                                 |
| 2   | VIN  | +9 V input                                                                           |
| 3   | VIN  | +9 V input                                                                           |
| 4   | SGND | GND                                                                                  |
| 5   | FB   | Feedback divider (**R11 = 0 Ω**, **R12 = DNP**, **R13 = 10 kΩ**) |
| 6   | NC2  | No connect                                                                           |
| 7   | NC   | No connect                                                                           |
| 8   | PG   | Power Good                                                                           |

| Reference | Value   | Function                           |
| --------- | ------- | ---------------------------------- |
| L1        | 4.7 µH | Output inductor                    |
| C5        | 22 nF   | Bootstrap / compensation capacitor |
| C6        | 470 pF  | Feed-forward capacitor             |
| C7        | 470 pF  | Feedback filter capacitor          |
| R11       | 0 Ω    | Feedback network                   |
| R12       | DNP     | Feedback network (not populated)   |
| R13       | 10 kΩ  | Feedback lower divider resistor    |

### U2 — +3.3 V Linear Regulator

**Part:** `MCP1825-3302E/DB` (500 mA LDO)

| Pin | Name | Connection       |
| --- | ---- | ---------------- |
| IN  | VIN  | **+5 V**   |
| GND | GND  | GND              |
| OUT | VOUT | **+3.3 V** |

| Reference | Value  | Net             |
| --------- | ------ | --------------- |
| C1        | 10 µF | +5 V (input)    |
| C2        | 10 µF | +3.3 V (output) |

### Power Rail Summary

| Rail             | Source                | Distributed To                                                    |
| ---------------- | --------------------- | ----------------------------------------------------------------- |
| **+9 V**   | DJ005B barrel jack    | U1 input, PICtail connectors                                      |
| **+5 V**   | U1 (MCP16321)         | U2 input, PICtail connectors, J1 pin 2                            |
| **+3.3 V** | U2 (MCP1825-3302E/DB) | Starter kit connector, PICtail connectors, test headers, ICD/JTAG |

---

## Power Indicators

| Reference | Colour | Series Resistor | Rail                             |
| --------- | ------ | --------------- | -------------------------------- |
| D1        | Orange | R1 = 470 Ω     | **+3.3 V Power Indicator** |
| D2        | Red    | R2 = 470 Ω     | **+5 V Power Indicator**   |

---

## Mechanical

| Reference | Description   |
| --------- | ------------- |
| MH1       | Mounting hole |
| MH2       | Mounting hole |
| MH3       | Mounting hole |
| MH4       | Mounting hole |

---

## Consolidated Reference Designator Index — Expansion Board

### Integrated Circuits

| Ref | Part                       | Function                                   |
| --- | -------------------------- | ------------------------------------------ |
| U1  | **MCP16321**         | +9 V → +5 V step-down switching regulator |
| U2  | **MCP1825-3302E/DB** | +5 V → +3.3 V LDO regulator               |

### Connectors and Headers

| Ref | Description                                         |
| --- | --------------------------------------------------- |
| J1  | Starter Kit Connector (132-pin,`CONN_CL172-0900`) |
| J2  | PICtail Connector 2                                 |
| J3  | CAN-ISO Connector                                   |
| J4  | PICtail Connector 1                                 |
| J8  | TRACE header                                        |
| J9  | JTAG connector                                      |
| J10 | Test point header (bank 1)                          |
| J11 | Test point header (bank 2)                          |
| JP1 | ICD connector                                       |
| —  | DJ005B DC power jack (+9 V input)                   |

### Passive Components

| Ref    | Value   | Function                            |
| ------ | ------- | ----------------------------------- |
| L1     | 4.7 µH | U1 output inductor                  |
| C1     | 10 µF  | +5 V bulk                           |
| C2     | 10 µF  | +3.3 V bulk                         |
| C3     | 10 µF  | +9 V input bulk                     |
| C4     | 10 µF  | Converter input                     |
| C5     | 22 nF   | U1 bootstrap/compensation           |
| C6     | 470 pF  | Feed-forward                        |
| C7     | 470 pF  | Feedback filter                     |
| R1     | 470 Ω  | +3.3 V LED current limit            |
| R2     | 470 Ω  | +5 V LED current limit              |
| R3–R7 | 22 Ω   | TRACE series termination            |
| R8     | 100 Ω  | JTAG MCLR series                    |
| R9     | NL      | ICSP option (not loaded)            |
| R11    | 0 Ω    | U1 feedback network                 |
| R12    | DNP     | U1 feedback network (not populated) |
| R13    | 10 kΩ  | U1 feedback divider                 |
| R14    | 4.7 kΩ | MCLR pull-up                        |
| R18    | NL      | ICSP option (not loaded)            |

### Diodes and LEDs

| Ref | Part         | Function               |
| --- | ------------ | ---------------------- |
| D1  | LED (orange) | +3.3 V power indicator |
| D2  | LED (red)    | +5 V power indicator   |
| D3  | SS110-TP     | JTAG MCLR protection   |
| D4  | SS110-TP     | Input power protection |

---

## Starter Kit ↔ Expansion Board Interface

| Starter Kit (DS61166A)                              | Expansion Board (DS51950B)                    | Notes                                           |
| --------------------------------------------------- | --------------------------------------------- | ----------------------------------------------- |
| **J2** — 132-pin application board connector | **J1** — 132-pin starter kit connector | Direct mate; identical signal ordering          |
| J2 pin 1 —**P32_VDD**                        | J1 pin 1 —**+3.3 V**                   | Expansion board can supply the starter kit rail |
| J2 pin 2 —**+5V_EXT**                        | J1 pin 2 —**+5 V**                     | Expansion board +5 V rail                       |
| J2 GND pins (11/12 … 121/122)                      | J1 GND pins (same positions)                  | Common ground plane                             |
| PIC32_PGC2 / PIC32_PGD2 / PIC32_MCLR                | JP1 (ICD) and JTAG connector                  | Programming/debug pass-through                  |
| TRCLK / TRD0–TRD3                                  | J8 TRACE header (22 Ω series)                | Instruction trace capture                       |

---

*DS51950B — PIC32 I/O Expansion Board, Schematic (Sheet 1 of 1)*

> **Transcription note:** This page is a single, very dense schematic sheet. The tables above
> reconstruct the block structure, connector groupings, net names and component values as
> printed. Explicitly legible values from the source text include **L1 = 4.7 µH**,
> **R13 = 10 kΩ**, **C4 = 10 µF**, **D4 = SS110-TP**, **R12 = DNP**, **C5 = 22 nF**,
> **R11 = 0 Ω**, **U1** (pins NC2/VIN/FB/SW/SGND/VIN/NC/PG) and **U2**. Individual pin-number
> assignments on the PICtail and test-point headers, and some reference designators, were
> recovered from low-resolution artwork and should be verified against the original Microchip
> document **DS51950B** before use in a design.
