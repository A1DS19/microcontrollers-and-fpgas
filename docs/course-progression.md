# Course progression

Learning path toward the final goal: **low-latency FPGA networking and design verification**
(an HFT-style feed handler in hardware, verified with cocotb; remote FPGA/verification roles
from Costa Rica, local semiconductor verification as the fallback). One workspace project
directory per course (per-project Makefile). Update the status column as courses advance;
move finished ones to the log at the bottom.

## Current focus — STM32 courses (in order)

These come before the FPGA path (decided 2026-11-04): code-along courses on a board chosen to
match the videos. The assembly course comes first (decided 2026-11-05), and one project ties
the driver courses together.

| # | Course | Status | Project dir |
|---|--------|--------|-------------|
| 1 | [ARM GNU Assembly Programming From Ground Up](https://study.embeddedexpert.io/p/arm-gnu-assembly-programming-from-ground-up) (EmbeddedExpertIO) | **in progress** | [`stm32/arm-gnu-assembly-programming-from-ground-up/`](../stm32/arm-gnu-assembly-programming-from-ground-up/) |
| 2 | [Embedded Systems Bare-Metal Programming Ground Up (STM32)](https://www.udemy.com/course/embedded-systems-bare-metal-programming/) (Israel Gbati) | — | — |
| 3 | [Advanced Embedded Systems Bare-Metal Programming Ground Up](https://www.udemy.com/course/embedded-systems-advance-bare-metal-programming/) | — | — |
| 4 | [Embedded Systems STM32 HAL APIs Driver Development](https://www.udemy.com/course/embedded-systems-stm32-hal-apis-driver-development/) | — | — |

Bench board for all four courses: NUCLEO-F411RE (to buy). The assembly course's instructor uses
the STM32F411RETx, the chip on that board. The assembly course's projects are in CubeIDE and
target the Nucleo-L476RG for now: sections 1–8 are instruction set only, so they run on it with
its own startup and linker files.

### ARM GNU Assembly course map

About 15.5 hours (sum of the listed lecture times), including 1h47m of optional C lectures in
sections 14–15.

| Sections | Covers | Length |
|---|---|---|
| 1–8 | Setup, architecture, directives, load/store, constants, arithmetic, branches, stack | 4h40m |
| 9 | GPIO driver | 1h43m |
| 10 | ADC driver | 1h26m |
| 11 | UART driver, printf retargeting | 1h45m |
| 12 | SysTick driver | 51m |
| 13 | General-purpose timer driver | 48m |
| 14 | FIFO | 1h33m |
| 15 | Moore state machine (traffic light) | 2h41m |

### Project: data logger

One firmware that grows a stage at a time, ending as a logger that shows live readings and
keeps them after a power cycle. Follow the course section each stage needs, and write each
driver by hand.

| Stage | Learn | Visible result |
|---|---|---|
| 1 | GPIO | A button toggles an LED |
| 2 | Interrupts (EXTI) | The same button works without polling |
| 3 | UART | Live logs on the terminal |
| 4 | Timers and PWM | A steady heartbeat LED and a dimmable LED |
| 5 | ADC | A potentiometer or temperature reading in the logs |
| 6 | I2C | Readings on the SSD1306 |
| 7 | SPI | Readings saved to SPI flash, then read back after a reset |
| 8 | DMA | Logging keeps running without blocking the CPU |
| 9 | C++ | The C drivers rewritten as classes |

Later: I2S as a short ESP32 side project (the L476 only has it through SAI), and CAN when a
project needs it (MCU2 covers it).

## Main path — FPGA (in order, after the driver courses)

| # | Course / phase | Status | Project dir |
|---|--------|--------|-------------|
| 1 | FPGA Embedded Design, Part 1 — Verilog (Eduardo Corpeño, Udemy) + HDLBits alongside | after the driver courses | — |
| 2 | FPGA Embedded Design, Part 2 — Basic FPGA Training | — | — |
| 3 | FPGA Embedded Design, Part 3 — EDA Tools | — | — |
| 4 | cocotb tutorial (Python testbenches) | — | — |
| 5 | FPGA Embedded Design, Part 4 — Microprocessor Design | — | — |
| 6 | SystemVerilog for verification / UVM course | — | — |
| 7 | Project Phase 1 — UART, FIFOs, AXI-Stream, each with a cocotb testbench | — | — |
| 8 | Project Phase 2 — Ethernet → IP → UDP parsing in hardware | — | — |
| 9 | Project Phase 3 — NASDAQ ITCH feed handler + hardware order book | — | — |
| 10 | Project Phase 4 — replay testbench vs Python model, timing/latency write-up | — | — |

Why this order: language and simulation first (Verilog, HDLBits), then the board and tools,
then verification habits before the project grows — the testbench is what makes the
portfolio credible. Phase details, toolchain and books: [../fpga/README.md](../fpga/README.md).

Bench board for the FPGA path: Digilent Arty A7-100T (to buy; 100 Mb Ethernet covers Phases 1–3).

### After the main path (optional)

- **HLS / C++ on FPGAs** — Vitis HLS; accelerator and DSP roles.
- **Zynq hardware/software co-design** — ARM + fabric over AXI; where the STM32 skills plug back in.
- **Own FPGA board** — iCE40 QFN-48 2-layer, then ECP5 BGA with an Ethernet PHY (KiCad).
- **Timing constraints / STA** and **clock domain crossing** courses — whenever Phase 2–3 needs them.

## Good to know — STM32 / firmware (not on the main path)

Owned courses kept for breadth. Pick one up when a project needs it or for interest; none
blocks the FPGA path.

| Course | Status | Relevance to the FPGA goal |
|--------|--------|-------------|
| Mastering Microcontroller and Embedded Driver Development — MCU1 (FastBit) | Parked 2026-11-04, replaced by the driver courses | Highest of this list: drivers for your own FPGA peripheral on Zynq/soft CPU |
| Mastering Microcontroller: Timers, PWM, CAN, Low Power — MCU2 (FastBit) | 1% | Low |
| ARM Cortex M Microcontroller DMA Programming Demystified (FastBit) | 1% | Medium: DMA between CPU and fabric on SoC FPGAs |
| Mastering RTOS: Hands on FreeRTOS and STM32Fx with Debugging (FastBit) | 2% | Low |
| STM32Fx Microcontroller Custom Bootloader Development (FastBit) | 1% | Low |

Original order, if this track is resumed: MCU2 → DMA → RTOS → bootloader (RTOS and
bootloader can swap). Reference alongside the driver courses: Communication Protocols: UART, USART, I2C,
I3C, SPI, GPIO (Protocol Pro).

### Applied projects (after the driver courses)

- **Embedded Ethernet on STM32 Using W5500** — external SPI TCP/IP chip; runs on the L476RG
  + a cheap W5500 module. Note: the chip hides the stack, which the FPGA Phase 2 builds by hand.
- **Bluetooth Low Energy (BLE) From Ground Up** — needs the course's BLE module (the L476
  has no radio), driven over UART/SPI.

### Other owned tracks

- **Zephyr RTOS w/ DeviceTree and Board Bring Up** (in cart) — after FreeRTOS.
- **Embedded Linux**: Embedded Linux Step by Step (BeagleBone Black, 1%) → Linux Device
  Driver Programming LDD1 (1%). Becomes relevant again for Zynq/PetaLinux.
- **Mastering Embedded Rust** (FastBit) — same concepts, new language.
- **Advanced Embedded Software with STM32, FreeRTOS & Modbus** — after FreeRTOS.
- **MCU3** (LTDC/LCD-TFT/LVGL, 3%) — needs an F429/F7 Discovery board; parked.
- **PCB/hardware**: KiCad Advanced smart USB thumb drive (4%), electronics design courses —
  feeds the optional own-FPGA-board track.

### Hardware notes (STM32)

- Assembly and driver courses: NUCLEO-F411RE, chosen so the videos can be typed along with directly.
- FastBit courses: Nucleo-L476RG. FastBit videos use STM32F407 Discovery / Nucleo-F446 — same
  Cortex-M4 core, slightly different peripheral versions; adapt via RM0351.

## Completed

| Course | Finished | Notes |
|--------|----------|-------|
| Curso diseño PCB: Controlador de vuelo para drones Arduino | 2026 (before 2026-08-17) | Fed the drone-flight-controller project; groundwork for the own-FPGA-board track |
