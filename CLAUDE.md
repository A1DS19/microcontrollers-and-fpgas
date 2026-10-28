# microcontrollers-and-fpgas

Hardware learning workspace, CLI-first. **Final goal: low-latency FPGA networking + design
verification** (HFT-style feed handler in hardware, cocotb-verified). Two areas:

- `fpga/` — the **main path**, not started. Plan, toolchain, resources: `fpga/README.md`.
  Next: Corpeño *FPGA Embedded Design* Part 1 (Verilog) + HDLBits — see docs/course-progression.md.
- `stm32/` — STM32 Nucleo-L476RG bare-metal work; CubeCLT builds, flashes, and debugs, no IDE
  in the loop. Completed: `stm32/microcontroller-embedded-c-programming/` (Embedded C course)
  and `stm32/embedded-system-programming-on-arm-cortex-m3m4/` (the Cortex-M4 processor course —
  modes, stack, NVIC, faults, scheduler capstone, own startup/linker script; map in its
  `SYLLABUS.md`). Remaining MCU courses are **good-to-know**, not the path. Both projects are
  bare-metal (no HAL) register-level: each lesson in its own `Src/<lesson>.c` (+ `Inc/`
  header), `main.c` is a thin dispatcher pointing at the current one, git history is the archive.

Every project directory is self-contained with its own Makefile; the root has no build plumbing.

## FPGA conventions (planned)

- One directory per course or project phase under `fpga/`, each with its own Makefile.
- Simulation first: every module gets a cocotb testbench before it goes on the board.
- Toolchain: Verilator / Icarus + GTKWave, cocotb, Vivado in batch/Tcl mode (Arty A7-100T,
  not yet bought), Yosys + nextpnr for Lattice parts.

## STM32 reference

### Stack

- STM32L476RG (Nucleo-64 board, on-board ST-LINK V2)
- STM32CubeCLT 1.22.0 (`/opt/st/stm32cubeclt_1.22.0/`): arm-none-eabi GCC 14.3, CMake + Ninja, `STM32_Programmer_CLI`, `ST-LINK_gdbserver`
- CMSIS headers only (no HAL sources) from `~/STM32Cube/Repository/STM32Cube_FW_L4_V1.18.2/`, wired as include paths in the project's `CMakeLists.txt`
- Kingst LA2016 logic analyzer, KingstVIS in `~/Apps/KingstVIS/`

### Run & test

Each project carries its own Makefile — `cd` into `stm32/<project>` and:

| Command | Does |
|---|---|
| `make build` | CMake preset Debug + ninja; prints memory usage |
| `make flash` | program + verify + reset over SWD |
| `make serial` | open the VCP terminal (resolves port by USB identity — never assume ttyACM0) |
| `make gdb-server` / `make debug` | two-terminal step debugging (server carries the required `-d`) |
| `make size` / `symbols` / `disasm` | inspect the ELF |
| `make reset` / `clean` | restart board / wipe build |

F5 in VS Code = build, flash, halt at `main` (Cortex-Debug, SVD registers).

`stm32/embedded-system-programming-on-arm-cortex-m3m4/gnu-build/` (sections 11–12) has its own hand
Makefile, no CMake: `make`, `make stages`, `make analyze`, `make flash`, the course's OpenOCD
path `make openocd` + `make load`, the library variants `make nano` / `gc` / `semi` / `compare`,
and the scripted OpenOCD runs `make inspect` / `make run-semi` (OpenOCD comes bundled with
CubeIDE 2.0).

### Project layout & conventions

- Empty-project shape (seeded from the ST VS Code extension): `Src/` (`main.c`,
  `startup_stm32l476xx.S`, `syscall.c`, `sysmem.c`, `system.c`, `uart2.c`), `Inc/`,
  `stm32l476xg_flash.ld`, modular `cmake/`.
- `cmake/*.cmake` and the non-user sections of `CMakeLists.txt` are managed-file style —
  add sources/includes/defines only in the marked "User defined" sections of `CMakeLists.txt`.
- `Src/system.c` owns `SystemInit`: it enables the FPU (CP10/CP11). Do not remove — the
  project compiles hard-float and newlib printf hard-faults without it.
- `Src/uart2.c` is printf's backend (USART2 PA2/PA3, 115200 8N1, register-level via
  `__io_putchar`). Lessons call `uart2_init()` first if they print. End printf lines `\r\n`.
- No CubeMX, no `.ioc` — peripheral setup is hand-written register code, that's the point
  of the course. (Headless-CubeMX recipe for future HAL projects: [stm32/docs/cli-workflow.md](stm32/docs/cli-workflow.md).)

## Workspace

- Learning path: [docs/course-progression.md](docs/course-progression.md).
- Vocabulary in [agents/CONTEXT.md](agents/CONTEXT.md); hard decisions in [agents/decisions.md](agents/decisions.md); milestones in [agents/roadmap.md](agents/roadmap.md).
- Git: never add AI attribution to commits or PRs — no `Co-Authored-By: Claude …` trailers, no
  "Generated with Claude Code" footers. The user is the sole author in the contributor history.

## Session handoff

- At session start, read agents/handoff.md first if it exists.
- When the user ends a session with "let's continue tomorrow" (or similar), overwrite agents/handoff.md per its format: what was done, current state, plan for next session.
