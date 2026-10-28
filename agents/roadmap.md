# Roadmap

## Goal

Low-latency FPGA networking + design verification: an HFT-style feed handler built in
hardware and verified with cocotb, as the portfolio for remote FPGA / verification roles.
Same bench discipline as the STM32 era — CLI-first, every design proven (simulation first,
then hardware). Path: docs/course-progression.md; phases: `fpga/README.md`.

## Milestones — FPGA era (main path)

- [x] Workspace renamed `stm32-projects` → `microcontrollers-and-fpgas`; STM32 work moved to
  `stm32/`, `fpga/` created; docs realigned to the FPGA goal (2026-10-28)
- [ ] Board bought (Arty A7-100T) + toolchain installed (Verilator, Icarus, GTKWave, cocotb, Vivado)
- [ ] Corpeño Part 1 (Verilog) + HDLBits
- [ ] Corpeño Parts 2–3 (Basic FPGA, EDA Tools)
- [ ] cocotb tutorial; first module with a passing testbench
- [ ] Corpeño Part 4 (Microprocessor Design)
- [ ] Verification course (SystemVerilog / UVM)
- [ ] Phase 1 — UART, FIFOs, AXI-Stream on the board
- [ ] Phase 2 — Ethernet → IP → UDP parsed in hardware
- [ ] Phase 3 — ITCH feed handler + order book, latency in cycles
- [ ] Phase 4 — replay testbench vs Python model, public write-up
- [ ] Bridge: SPI register file in the FPGA driven from the Nucleo (optional)

## Milestones — STM32 era (complete; further MCU courses are good-to-know)

### Cortex-M processor course

- [x] Course project scaffolded (cloned from the Embedded C project shape) + 375-slide
  deck distilled into `SYLLABUS.md`; banner/LED scaffold verified on hardware (2026-08-23)
- [x] Sections 1–6: modes, inline assembly, reset sequence, memory map, bit-banding, stack
  (2026-08-24; +side demos: 3461AS 7-segment, SSD1306 OLED over register-level I2C3)
- [x] Sections 7–9: NVIC (+SHPR addendum, CMSIS companion), faults (+GDB autopsy), SVC —
  all hardware-verified (2026-08-25/26)
- [x] Capstone: round-robin task scheduler — PendSV switch with per-task EXC_RETURN + FPU
  half, blocking vs spin measured live; 4-LED substitute = PA5/PA6/PA7/PA9 (2026-08-30)
- [x] Sections 11–12: `gnu-build/` — own startup file + linker script + hand Makefile, OpenOCD
  (bundled) + GDB load, newlib vs nano vs gc vs semihosting measured, scripted OpenOCD (2026-08-30)
- [x] **COURSE COMPLETE** — "Embedded System Programming on ARM Cortex-M3/M4" (FastBit), every
  section register-level and verified on the Nucleo-L476RG (2026-08-30); finish ritual run

### Embedded C course

- [x] Workspace reset: old lesson projects deleted, single bare-metal project seeded from
  the empty-project shape, Makefile + VS Code debug wired (2026-08-17)
- [x] Lesson zero verified on hardware: LD2 blink via RCC/GPIOA registers + printf over
  USART2 registers on the VCP; FPU-enable gotcha found and fixed (2026-08-17)
- [x] volatile: optimizer deletes a non-volatile register poll, proven at -O2 (2026-08-22)
- [x] Interrupts: EXTI + SysTick ISRs, shared-data volatile, SWIER1-injected presses (2026-08-22)
- [x] Structs/unions/bit-fields arc: padding, hand-rolled register map vs CMSIS, tagged
  unions, IEEE-754 keyhole, bit-field LED toggle capstone with _Static_assert (2026-08-22)
- [x] UART receive + interactive packet decode (shift+mask vs bit-field, typed over VCP) (2026-08-22)
- [x] First external hardware: 4x4 keypad — matrix scan, real debounce, and the
  keydiag.c MCU-as-continuity-tester that debugged the wiring (2026-08-22)
- [x] Preprocessor finale: macros, # ##, defined(), conditional compilation (2026-08-22)
- [x] **COURSE COMPLETE** — "Microcontroller Embedded C Programming" (Udemy), every
  lesson register-level and verified on the Nucleo-L476RG (2026-08-22)
- [ ] printf decoded in KingstVIS off PA2 (Morpho tap) — carried over from bring-up era

### Bring-up era (pre-2026-08-17, projects since deleted; history in git)

- [x] CubeCLT + SWD, headless CubeMX CMake generation, blink/UART/EXTI lessons, CLI and
  VS Code debug, `stm32-new-project` skill, CubeMX2 CLI probe (L4 incompatible by design)

## Later / maybe (STM32)

- I²C/SPI sensor on the breadboard with protocol decode
- A HAL2-era board lesson via CubeMX2's real CLI
