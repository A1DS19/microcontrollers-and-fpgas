# microcontrollers-and-fpgas

Hardware learning workspace, CLI-first. **Final goal: low-latency FPGA networking + design
verification** (HFT-style feed handler in hardware, cocotb-verified). Two areas:

- `stm32/` — **current focus**, bare-metal STM32 courses; CubeCLT builds, flashes and debugs, no
  IDE in the loop. In progress: `stm32/arm-gnu-assembly-programming-from-ground-up/` (ARM GNU
  Assembly course; folder only so far, board unconfirmed). Three driver courses follow it (order
  in docs/course-progression.md). Other MCU courses are **good-to-know**, not the path.
- `fpga/` — the **main path**, not started; it follows the STM32 courses. Plan, toolchain,
  resources: `fpga/README.md`. First course: Corpeño *FPGA Embedded Design* Part 1 (Verilog) +
  HDLBits — see docs/course-progression.md.

Every project directory is self-contained with its own Makefile; the root has no build plumbing.

## FPGA conventions (planned)

- One directory per course or project phase under `fpga/`, each with its own Makefile.
- Simulation first: every module gets a cocotb testbench before it goes on the board.
- Toolchain: Verilator / Icarus + GTKWave, cocotb, Vivado in batch/Tcl mode (Arty A7-100T,
  not yet bought), Yosys + nextpnr for Lattice parts.

## STM32 reference

### Stack

- Nucleo-L476RG (STM32L476RG, on-board ST-LINK V2), on the bench
- NUCLEO-F411RE (STM32F411RE, to buy) for the driver courses
- STM32CubeCLT 1.22.0 (`/opt/st/stm32cubeclt_1.22.0/`): arm-none-eabi GCC 14.3, CMake + Ninja, `STM32_Programmer_CLI`, `ST-LINK_gdbserver`
- CMSIS headers only (no HAL sources) from `~/STM32Cube/Repository/`: `STM32Cube_FW_L4_V1.18.2/` and `STM32Cube_FW_F4_V1.28.3/`
- Kingst LA2016 logic analyzer, KingstVIS in `~/Apps/KingstVIS/`

### Run & test (planned)

No project exists yet. New projects take their Makefile from the `stm32-new-project` skill's
assets — `cd` into `stm32/<project>` and:

| Command | Does |
|---|---|
| `make build` | CMake preset Debug + ninja; prints memory usage |
| `make flash` | program + verify + reset over SWD |
| `make serial` | open the VCP terminal (resolves port by USB identity — never assume ttyACM0) |
| `make gdb-server` / `make debug` | two-terminal step debugging (server carries the required `-d`) |
| `make size` / `symbols` / `disasm` | inspect the ELF |
| `make reset` / `clean` | restart board / wipe build |

F5 in VS Code = build, flash, halt at `main` (Cortex-Debug, SVD registers).

### Project conventions (planned)

- Bare-metal and register-level: no HAL, no CubeMX, no `.ioc`. Peripheral setup is hand-written,
  which is the point of these courses.
- Each lesson in its own source file under `Src/`, a thin `main` pointing at the current one, git
  history as the archive. The rest of the project shape waits until the course's chip is confirmed.
- If a project compiles hard-float, `SystemInit` must enable the FPU (CP10/CP11), or newlib printf
  hard-faults. End printf lines `\r\n`.

## Workspace

- Learning path: [docs/course-progression.md](docs/course-progression.md).
- Vocabulary in [agents/CONTEXT.md](agents/CONTEXT.md); hard decisions in [agents/decisions.md](agents/decisions.md); milestones in [agents/roadmap.md](agents/roadmap.md).
- Git: never add AI attribution to commits or PRs — no `Co-Authored-By: Claude …` trailers, no
  "Generated with Claude Code" footers. The user is the sole author in the contributor history.

## Session handoff

- At session start, read agents/handoff.md first if it exists.
- When the user ends a session with "let's continue tomorrow" (or similar), overwrite agents/handoff.md per its format: what was done, current state, plan for next session.
