# microcontrollers-and-fpgas — Context

Hardware learning workspace, driven entirely from the CLI. Renamed from `stm32-projects`
and split on 2026-10-28: `fpga/` is the main path (final goal: low-latency FPGA networking +
design verification), `stm32/` holds the STM32 Nucleo-L476RG firmware work. One directory per
online-course project, each self-contained with its own Makefile (no workspace-level build
plumbing).

**Main path**:
The FPGA track in `fpga/` and docs/course-progression.md — Corpeño's Verilog series, cocotb,
verification, then the four-phase feed-handler project.
_Avoid_: calling the STM32 FastBit courses "the path" — they are good-to-know now

**Good-to-know track**:
The remaining STM32/firmware courses (MCU1, MCU2, DMA, RTOS, bootloader, Zephyr, Embedded
Linux, Rust…). Owned, optional, picked up by interest or project need.

**Feed handler**:
The portfolio project: NASDAQ ITCH parsed in hardware into an order book, with latency in
clock cycles and a cocotb replay testbench. Phases 1–4 in `fpga/README.md`.
_Avoid_: "the HFT project" without saying it targets FPGA networking roles generally

**cocotb**:
Python coroutine testbenches for Verilog/SystemVerilog simulators — the verification tool of
the FPGA path.

**embedded-system-programming-on-arm-cortex-m3m4**:
In `stm32/`. The second course project (2026-08-23 → 2026-08-30, complete) — FastBit's Cortex-M3/M4 *processor*
course: operation modes, stack (MSP/PSP), NVIC/faults, SVC/PendSV, a from-scratch task
scheduler, then startup files and linker scripts. Same bare-metal shape as the sibling;
course map + F407→L476RG adaptation notes in its `SYLLABUS.md`.
_Avoid_: "the Cortex course" in docs without naming the directory once first

**microcontroller-embedded-c-programming**:
In `stm32/`. The first course project (complete 2026-08-22) — bare-metal (no HAL) register-level, for the "Microcontroller
Embedded C Programming" curriculum. Single `Src/main.c` overwritten per lesson; old
lessons live in git history.
_Avoid_: "the course project" in docs without naming it once first

**Empty-project shape**:
The ST VS Code extension's no-HAL project layout this project was seeded from: flat
`Src/`+`Inc/`, `startup_stm32l476xx.S`, `syscall.c`, `sysmem.c`, own linker script,
modular `cmake/` includes, user-editable sections in `CMakeLists.txt`.
_Avoid_: "CubeMX project" — no `.ioc`, CubeMX is not in the loop

**CubeCLT**:
ST's official command-line toolset (compiler, programmer CLI, GDB server, CMake/Ninja) — the build/flash/debug backbone of `stm32/`.
_Avoid_: "the toolchain", "CubeIDE tools"

**Headless CubeMX**:
Standalone STM32CubeMX driven by a `-q <script>` command file. Not used by the current
project; kept documented (stm32/docs/cli-workflow.md) for future HAL projects.
_Avoid_: "CubeMX CLI mode", "quiet mode"

**Firmware pack**:
An STM32Cube HAL/CMSIS bundle in `~/STM32Cube/Repository/` (here `STM32Cube_FW_L4_V1.18.2`).
The current project uses only its CMSIS headers (`stm32l476xx.h`, `core_cm4.h`) via include
paths in `CMakeLists.txt` — no HAL sources compiled.
_Avoid_: "SDK", "HAL download"

**LA2016**:
The Kingst 16-channel logic analyzer on this bench (KingstVIS software); validates firmware behavior independently of the code.

**B1**:
The Nucleo's blue user push-button on PC13. Pressing pulls the line **low** (active-low).
Note it has a 100nF cap — visible bounce is largely filtered.
_Avoid_: "the button" without naming which, "PC13 switch"; confusing it with the black RESET button
