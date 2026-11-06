# Where we left off
_2026-11-05 (ARM GNU Assembly course started)_

## This session
- The user chose ARM GNU Assembly Programming From Ground Up (EmbeddedExpertIO) as the first
  course: https://study.embeddedexpert.io/p/arm-gnu-assembly-programming-from-ground-up
- The user chose a clean slate: `stm32/` was deleted and the docs were rewritten around this
  course. The two finished courses aren't retaken and were removed from the docs.
- The user reports the instructor uses the STM32F411RETx, the chip on the NUCLEO-F411RE.
- The user started the course in CubeIDE: `1_using_startup` and `1_not_using_startup` are in the
  course folder, target the L476, and have been built.
- An interactive decimal, binary and hex page was published, private to the user:
  https://claude.ai/artifact/3KywKRgatCkwhvbFjX8PGh

## State
- The reset and the first lesson projects are merged to `main` and pushed. New work goes on a
  fresh feature branch.
- The reset deleted 154 tracked files, on purpose. Don't restore them unless asked. Commit
  `a713127` keeps them, including the reference PDFs: `git show a713127:stm32/docs/<file>`.
- The NUCLEO-F411RE listing the user found is the right board. Whether it's been ordered is unknown.
- Root `.vscode/` has no `tasks.json` or `launch.json` now; debugging happens in CubeIDE. Each lesson
  has an auto-generated `.vscode/` from the C/C++ Runner extension, set up for host gdb, so it can't
  debug the board.
- `STM32Cube_FW_F4_V1.28.3` and its two zips (about 970 MB) are in `~/STM32Cube/Repository/`.

## Next session
1. Continue the course from wherever the user is. Sections 1–8 can stay on the L476.
2. Move to the NUCLEO-F411RE by section 9. The L476's UART and ADC differ from the F4's.
