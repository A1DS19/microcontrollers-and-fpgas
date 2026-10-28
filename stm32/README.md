# stm32

Bare-metal firmware for the **STM32 Nucleo-L476RG**, driven entirely from the CLI — no IDE
in the loop. One directory per course, each self-contained with its own Makefile.

Role in the workspace: the CPU half of FPGA work. The register-level, startup-file and
exception-model knowledge here is what a Zynq ARM core or a soft CPU needs; the board also
serves as a bench tool for FPGA projects (SPI/UART stimulus, register-file host). New MCU
courses are good-to-know — see [../docs/course-progression.md](../docs/course-progression.md).

## Projects

- [`embedded-system-programming-on-arm-cortex-m3m4/`](embedded-system-programming-on-arm-cortex-m3m4/)
  — the Cortex-M4 *processor* course, completed 2026-08-30: one lesson per `Src/<lesson>.c`
  (its `LESSONS.md` is the map), plus `gnu-build/` — the same board built with a hand Makefile,
  our own startup file and linker script, OpenOCD/GDB, newlib variants and semihosting.
- [`microcontroller-embedded-c-programming/`](microcontroller-embedded-c-programming/) — the
  *Embedded C* course, completed 2026-08-22; single `Src/main.c` overwritten per lesson.

Both bare-metal (no HAL), register-level; git history is the lesson archive.

## Hardware & toolchain

- STM32L476RG on a Nucleo-64 board (on-board ST-LINK V2, USB VCP)
- [STM32CubeCLT](https://www.st.com/en/development-tools/stm32cubeclt.html) 1.22.0 — arm-none-eabi GCC, CMake + Ninja, `STM32_Programmer_CLI`, `ST-LINK_gdbserver`
- CMSIS headers only (no HAL sources), from the STM32Cube L4 firmware pack

## Usage

From a project directory:

| Command | Does |
|---|---|
| `make build` | configure (CMake preset) + build, prints memory usage |
| `make flash` | program + verify + reset over SWD |
| `make serial` | open the ST-LINK VCP terminal (port resolved by USB identity) |
| `make gdb-server` / `make debug` | two-terminal step debugging |
| `make size` / `symbols` / `disasm` | inspect the ELF |
| `make reset` / `clean` | reset the board / wipe the build |

VS Code (workspace root opened): F5 builds, flashes, and halts at `main` (Cortex-Debug with SVD register view).

## Reference docs

- [docs/pinout/](docs/pinout/) — verified per-peripheral Nucleo-L476RG pinout diagrams
- `docs/RM0351_stm32l476_reference_manual.pdf` — the register bible (1,906 pages)
- `docs/UM1724_nucleo64_user_manual.pdf` — Nucleo board wiring, solder bridges, headers
- `docs/arm_cortexm4_processor.pdf`, `docs/Arm-Cortex-M4-Processor-Datasheet.pdf` — the core itself
- [docs/cli-workflow.md](docs/cli-workflow.md) — headless-CubeMX recipe for future HAL projects
