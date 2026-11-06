# Where we left off
_2026-11-05 (STM32 clean slate — starting the ARM GNU Assembly course)_

## This session
- The user chose ARM GNU Assembly Programming From Ground Up (EmbeddedExpertIO) as the first
  course: https://study.embeddedexpert.io/p/arm-gnu-assembly-programming-from-ground-up
- Its page was read: about 15.5 hours (sum of the listed lecture times), $28.04, 30-day refund.
  Section map in `docs/course-progression.md`. No interrupts, I2C, SPI or DMA by the lecture titles.
- The user then chose a clean slate: `stm32/` stays deleted and the docs were rewritten around
  this course. The two finished courses aren't retaken and were removed from the docs.
- Rewritten: `CLAUDE.md`, `README.md`, `agents/CONTEXT.md`, `agents/roadmap.md`,
  `docs/course-progression.md`, `.vscode/`. Left as they were: `fpga/README.md` and the earlier
  entries in `agents/decisions.md`.

## State
- This reset is committed and pushed on `feat/stm32-bare-metal-restart`. `main` is untouched, so
  it keeps the old files until the branch is merged.
- `stm32/` holds only the empty `arm-gnu-assembly-programming-from-ground-up/`, which git won't
  track until it has a file.
- The branch deletes 154 tracked files, on purpose. Don't restore them unless asked. Commit
  `a713127` keeps them, including the reference PDFs: `git show a713127:stm32/docs/<file>`.
- The course's board and IDE are unconfirmed; the page names neither. Lecture titles use `ODR` and
  `BSRR`, so it's probably an STM32, not TI as first guessed (inference only).
- `.vscode/` points at the new folder and assumes the L476 and `build/Debug/<name>.elf`. There's
  nothing to build yet, so adjust it when the project is set up.
- `STM32Cube_FW_F4_V1.28.3` and its two zips (about 970 MB) are in `~/STM32Cube/Repository/`.

## Next session
1. Once enrolled, confirm the chip and IDE from the first programming lecture or "Getting the
   right Documentation", and record them in `docs/course-progression.md`.
2. Set up the project in the course folder to match, using the `stm32-new-project` assets and the
   CubeCLT toolchain.
3. Work through sections 1–8 on the Nucleo-L476RG. Don't push a board purchase before section 9.
