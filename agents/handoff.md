# Where we left off
_2026-10-28 (workspace pivot — FPGA is now the main path)_

## This session (2026-10-28)
- Repo renamed `stm32-projects` → `microcontrollers-and-fpgas` (local directory only; the
  GitHub remote is still `A1DS19/stm32-projects`).
- Split: both course projects + STM32 reference docs moved to `stm32/` (git mv, history
  kept); `fpga/` created with its README (phases, toolchain, board, resources).
- Docs realigned: root README, CLAUDE.md, docs/course-progression.md (FPGA main path +
  STM32 good-to-know track), agents/CONTEXT.md, roadmap.md, decisions.md (2026-10-28 entry).
- Path fixes: root `.vscode/` launch/tasks → `${workspaceFolder}/stm32/<project>`;
  `settings.json` cmake.sourceDirectory, `stm32/docs/cli-workflow.md` example path and
  the SYLLABUS docs reference updated.

## State
- Changes are staged/working-tree only — not committed (user decides; no AI attribution).
- The Linux bench clone (`/home/dev/projects/stm32-projects`) still has the old name and
  layout until it pulls and is renamed to `/home/dev/projects/microcontrollers-and-fpgas`;
  its `build/` dirs must be wiped after the move (CMake caches hold absolute paths).
- STM32 projects unchanged otherwise; relative paths (`../Src`, `../Inc` in gnu-build) still hold.

## Next session
1. Commit the pivot; optionally rename the GitHub repo (`gh repo rename microcontrollers-and-fpgas`)
   and update the Linux clone.
2. Buy the Arty A7-100T; install Verilator, Icarus, GTKWave, cocotb, Vivado.
3. Start Corpeño *FPGA Embedded Design* Part 1 + HDLBits — first course dir under `fpga/`.
