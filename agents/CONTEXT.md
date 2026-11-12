# microcontrollers-and-fpgas — Context

Hardware learning workspace, driven entirely from the CLI. `stm32/` holds the current STM32
courses; `c-c++/` holds embedded C and C++ practice alongside them; `fpga/` is the main path that
follows them (final goal: low-latency FPGA networking + design verification). One directory per
course project or exercise set, each self-contained with its own build (no workspace-level build
plumbing).

**Main path**:
The FPGA track in `fpga/` and docs/course-progression.md — Corpeño's Verilog series, cocotb,
verification, then the four-phase feed-handler project.
_Avoid_: calling the STM32 FastBit courses "the path" — they are good-to-know

**ARM GNU Assembly course**:
EmbeddedExpertIO's ARM GNU Assembly Programming From Ground Up, the current course and the first
on the path. Project directory: `stm32/arm-gnu-assembly-programming-from-ground-up/`, with one
CubeIDE project per lesson, on the Nucleo-L476RG for now. The instructor uses the STM32F411RETx,
the chip on the NUCLEO-F411RE.

**Driver courses**:
Israel Gbati's Ground Up, Advanced and HAL APIs courses, in that order. They follow the ARM GNU
Assembly course and come before the main path. Companion: his book *Bare-Metal Embedded C
Programming*.

**Data logger**:
The project that threads the driver courses: one firmware that grows a peripheral at a time.
Stages in docs/course-progression.md.

**C/C++ path**:
The embedded C and C++ work in `c-c++/`, alongside the STM32 courses: three Udemy courses
(Embedded C Learn As You Go → Embedded C Programming Design Patterns → Reusable Modules & Unit
Testing), then the book *C++ in Embedded Systems* by Amar Mahmutbegović. One self-contained
directory per course or book. Four owned C++ books (CMake, memory management, performance,
async) are references, read when the path reaches them.
_Avoid_: putting them under `stm32/`, which holds the STM32 course projects

**Renode**:
Antmicro's open-source emulator for microcontroller boards. Runs the C++ book's STM32F072
examples without hardware, inside the author's Docker image.

**Ceedling**:
Ruby-based build and test runner around the Unity C test framework. Course 3's tool for running
unit tests on the host, without the board.

**Good-to-know track**:
The other STM32/firmware courses (MCU1, MCU2, DMA, RTOS, bootloader, Zephyr, Embedded Linux,
Rust…). Owned, optional, picked up by interest or project need.

**Feed handler**:
The portfolio project: NASDAQ ITCH parsed in hardware into an order book, with latency in
clock cycles and a cocotb replay testbench. Phases 1–4 in `fpga/README.md`.
_Avoid_: "the HFT project" without saying it targets FPGA networking roles generally

**cocotb**:
Python coroutine testbenches for Verilog/SystemVerilog simulators — the verification tool of
the FPGA path.

**CubeCLT**:
ST's official command-line toolset (compiler, programmer CLI, GDB server, CMake/Ninja) — the build/flash/debug backbone of `stm32/`.
_Avoid_: "the toolchain", "CubeIDE tools"

**Firmware pack**:
An STM32Cube HAL/CMSIS bundle in `~/STM32Cube/Repository/` (here `STM32Cube_FW_L4_V1.18.2` and `STM32Cube_FW_F4_V1.28.3`).
Bare-metal projects use only its CMSIS headers (`stm32l476xx.h`, `stm32f411xe.h`, `core_cm4.h`) — no HAL sources compiled.
_Avoid_: "SDK", "HAL download"

**LA2016**:
The Kingst 16-channel logic analyzer on this bench (KingstVIS software); validates firmware behavior independently of the code.

**B1**:
The Nucleo's blue user push-button on PC13. Pressing pulls the line **low** (active-low).
Note it has a 100nF cap — visible bounce is largely filtered.
_Avoid_: "the button" without naming which, "PC13 switch"; confusing it with the black RESET button
