# Course progression

Learning path toward the final goal: **low-latency FPGA networking and design verification**
(an HFT-style feed handler in hardware, verified with cocotb; remote FPGA/verification roles
from Costa Rica, local semiconductor verification as the fallback). One workspace project
directory per course (per-project Makefile). Update the status column as courses advance;
move finished ones to the log at the bottom.

## Main path — FPGA (in order)

| # | Course / phase | Status | Project dir |
|---|--------|--------|-------------|
| 1 | FPGA Embedded Design, Part 1 — Verilog (Eduardo Corpeño, Udemy) + HDLBits alongside | **next up** | — |
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
blocks the FPGA path. The first two FastBit steps are done (see Completed).

| Course | Status | Relevance to the FPGA goal |
|--------|--------|-------------|
| Mastering Microcontroller and Embedded Driver Development — MCU1 (FastBit) | 1% | Highest of this list: drivers for your own FPGA peripheral on Zynq/soft CPU |
| Mastering Microcontroller: Timers, PWM, CAN, Low Power — MCU2 (FastBit) | 1% | Low |
| ARM Cortex M Microcontroller DMA Programming Demystified (FastBit) | 1% | Medium: DMA between CPU and fabric on SoC FPGAs |
| Mastering RTOS: Hands on FreeRTOS and STM32Fx with Debugging (FastBit) | 2% | Low |
| STM32Fx Microcontroller Custom Bootloader Development (FastBit) | 1% | Low |

Original order, if this track is resumed: MCU1 → MCU2 → DMA → RTOS → bootloader (RTOS and
bootloader can swap). Reference alongside MCU1: Communication Protocols: UART, USART, I2C,
I3C, SPI, GPIO (Protocol Pro).

### Applied projects (after MCU1)

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

- Bench board: Nucleo-L476RG. FastBit videos use STM32F407 Discovery / Nucleo-F446 — same
  Cortex-M4 core, slightly different peripheral versions; adapt via RM0351 instead of
  copy-typing. That adaptation is a feature, not a bug.

## Completed

| Course | Finished | Notes |
|--------|----------|-------|
| Embedded Systems Programming on ARM Cortex-M3/M4 Processor (FastBit) | 2026-08-30 | One week on the bench. 16 lessons in `stm32/embedded-system-programming-on-arm-cortex-m3m4/` (LESSONS.md is the map): modes, core registers, inline asm, reset, memory map, bit-banding, MSP/PSP, NVIC (+CMSIS), faults, SVC, a from-scratch round-robin scheduler, then `gnu-build/` — own startup file, linker script and Makefile, OpenOCD/GDB, newlib vs nano, semihosting. Every lesson hardware-verified; slide errors caught and documented (VECTPENDING, SVCALLPENDED, EXC_RETURN in the frame's lr slot, tick before PSP). Bonus: 7-segment + SSD1306 side demos, a GDB fault autopsy, and the ST-LINK firmware outage diagnosed with OpenOCD |
| Microcontroller Embedded C Programming: Absolute Beginners (FastBit) | 2026-08-22 | Register-level on the Nucleo-L476RG, no HAL; one lesson per file in `stm32/microcontroller-embedded-c-programming/` (main.c points at the current one, git is the archive). Bonus beyond the course: 4x4 keypad integration + MCU-as-continuity-tester (keydiag.c) |
| Curso diseño PCB: Controlador de vuelo para drones Arduino | 2026 (before 2026-08-17) | Fed the drone-flight-controller project; groundwork for the own-FPGA-board track |
