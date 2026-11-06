# Decisions

## 2026-08-15 — CLI-first toolchain over CubeIDE

All new work uses CubeCLT + headless CubeMX from the terminal; CubeIDE 2.0 stays installed but
only as a fallback GUI. Chosen for scriptability and because CubeIDE 2.0 dropped its embedded
scriptable CubeMX engine, making standalone CubeMX necessary anyway.

## 2026-08-15 — CMake as the generated toolchain

New projects generate with `project toolchain CMake` (presets Debug/Release, Ninja), not
Eclipse-managed builds or bare Makefiles. This is what CubeCLT and ST's VS Code flow target,
and it keeps projects buildable with nothing but the CLI. Legacy Eclipse projects are left
untouched rather than migrated wholesale.

## 2026-08-17 — Workspace reset to a single bare-metal course project

All lesson projects (`cli-test`, `hello-world`, `button-exti`, legacy Eclipse
`testing-target`/`testing-host`) deleted in favor of one project,
`microcontroller-embedded-c-programming`, for the register-level embedded C course.
Rationale: the CubeMX/HAL bring-up era served its purpose (toolchain proven, skill
extracted); the course teaches direct register access, which HAL actively obscures.
History stays in git.

Sub-decisions:
- **Bare-metal, no HAL** — seeded from the ST-extension empty-project shape (`test-ext`)
  rather than regenerated; CMSIS headers come from the installed L4 pack via include paths.
- **Single `main.c`, overwritten per lesson** — chosen over one-file-per-lesson with a
  build selector; git history is the lesson archive.
- **printf over USART2 registers, not ITM/SWO** — the course uses ITM, but UART keeps
  `make serial` and the existing VCP flow working with zero extra tooling. `uart2.c`
  provides `__io_putchar`; `syscall.c` stays stock.
- **`SystemInit` must enable the FPU** — the empty-project startup calls a weak empty
  `SystemInit`, while the ST cmake flags compile hard-float; newlib's `vfprintf` pushes
  FPU registers and hard-faults without CP10/CP11 access. `Src/system.c` owns this.
  (Found on hardware: banner printed — GCC folds no-arg printf to puts — but the first
  `%lu` printf died in the default handler.)

## 2026-08-23 — Cortex-M course project cloned from the sibling, not regenerated

`embedded-system-programming-on-arm-cortex-m3m4` was created by copying the proven
scaffold of `microcontroller-embedded-c-programming` (startup, syscall/sysmem, system.c
FPU enable, uart2 printf, linker script, cmake/, Makefile, .clangd, project .vscode)
with only name changes, rather than generating a fresh empty project via the ST
extension or CubeMX. Rationale: the sibling shape already encodes every hard-won fix
(FPU/printf, serial-by-USB-identity, gdbserver `-d`), the course is the same bare-metal
register-level style, and regeneration would reintroduce the weak-`SystemInit` trap.
Sub-decisions:
- **Course slides stay out of git** — `slides.pdf` is copied into the project for bench
  reference but gitignored (paid FastBit material; the repo may be pushed).
- **Course map lives in the project** (`SYLLABUS.md`), not in workspace `docs/` — it is
  course-scoped, like the lesson code.

## 2026-08-17 — Makefiles are per-project, no root forwarding

The workspace will hold multiple online-course projects over time, so each project dir
carries its own Makefile and the root stays free of build plumbing. The initial root
forwarding Makefile (hardcoded to one project) was removed the same day it was added.

## 2026-10-28 — FPGA becomes the main path; workspace renamed and split

The repo is renamed `stm32-projects` → `microcontrollers-and-fpgas` and split into `stm32/`
(both completed course projects + their reference docs) and `fpga/` (new main path). The final
goal is low-latency FPGA networking + design verification, chosen because it is specialized,
remote-friendly from Costa Rica, and has a local fallback (semiconductor verification).
Defense/space were ruled out (ITAR / citizenship).

Sub-decisions:
- **The remaining FastBit MCU courses become good-to-know**, not deleted from the plan —
  MCU1 ranks highest among them (drivers for one's own FPGA peripheral on Zynq/soft CPUs).
- **The STM32 work counts as the CPU half** of FPGA SoC work (AMBA buses, startup/linker,
  exceptions) and the Nucleo stays on the bench as a stimulus/host tool for FPGA projects.
- **Workspace docs (`docs/course-progression.md`) stay at the root**; STM32-only references
  (pinout, RM0351, UM1724, Cortex-M4 PDFs, cli-workflow.md) moved to `stm32/docs/`.
- **Root `.vscode/` stays** at the workspace root, paths now `${workspaceFolder}/stm32/<project>`.

## 2026-11-04 — STM32 driver courses come before FPGA, on a board that matches the videos

FastBit's concept-first lectures didn't fit a learner who works through code-alongs and
projects, and translating F407 videos to the L476 gets in the way of typing along. The new
order is Gbati's Ground Up → Advanced → HAL APIs, then the FPGA path. The final goal is unchanged.

Sub-decisions:
- **NUCLEO-F411RE is the board for these courses.** The instructor's book uses it and the course
  listing says "STM32F4-NUCLEO", but no source we could read names the course's exact model.
  The Nucleo-L476RG stays for the finished projects.
- **The STM32F3 course was dropped:** it repeats Ground Up's drivers on a third chip.
- **Starting with the STM32L4 course was rejected:** it needs no new board, but Advanced requires
  Ground Up, so the basics would be repeated.
- **CAN is deferred and I2S moves to an ESP32 side project;** neither is a basic.
- **A data-logger project threads the courses,** because they teach one peripheral at a time.

## 2026-11-05 — ARM GNU Assembly course comes first, ahead of the driver courses

The user chose EmbeddedExpertIO's ARM GNU Assembly Programming From Ground Up as the first
course of the restart. It's a code-along of about 15.5 hours (sum of the listed lecture times),
and its instruction-set sections can start on the Nucleo-L476RG already on the bench. It isn't a
prerequisite for anything on the path. By its lecture titles it has no interrupts, I2C, SPI or
DMA, so it goes in front of the driver courses and doesn't replace them.

Sub-decisions:
- **The board stays open.** The course page names no board or IDE. Lecture titles use `ODR` and
  `BSRR`, which points to an STM32 and away from the earlier TI guess, but the chip is unconfirmed.
  Sections 1–8 run on the L476; a matching board is only worth buying at section 9.
- **Only the first course was chosen.** Ground Up → Advanced → HAL APIs carries over from
  2026-11-04 as the order after it, not reconfirmed.

## 2026-11-05 — Clean slate: `stm32/` stays deleted and the plan starts at the assembly course

The user chose to drop everything under `stm32/` and rebuild the workspace docs around the ARM GNU
Assembly course. The two finished courses are not retaken and are removed from the docs, so the
plan reads as starting at the assembly course. Git history is untouched, so the old code and
reference PDFs stay recoverable from commit `a713127`.

Sub-decisions:
- **Larger resets were rejected:** deleting `fpga/` and `agents/` as well, or rewriting git history.
- **This log and `fpga/README.md` were left as they are,** so earlier entries here still mention
  the finished courses as history.
