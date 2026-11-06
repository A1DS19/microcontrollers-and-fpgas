# Roadmap

## Goal

Low-latency FPGA networking + design verification: an HFT-style feed handler built in
hardware and verified with cocotb, as the portfolio for remote FPGA / verification roles.
CLI-first, every design proven (simulation first, then hardware). Path: docs/course-progression.md; phases: `fpga/README.md`.

## Milestones — STM32 courses (current focus, before FPGA)

- [x] Decision: ARM GNU Assembly course first, then the driver courses, then FPGA (2026-11-05)
- [x] `stm32/arm-gnu-assembly-programming-from-ground-up/` created (2026-11-05)
- [x] Course chip confirmed: STM32F411RETx (2026-11-05)
- [x] First lesson projects created and built in CubeIDE, targeting the L476 (2026-11-05)
- [ ] NUCLEO-F411RE bought
- [ ] Assembly sections 1–8: instruction set
- [ ] Assembly sections 9–13: GPIO, ADC, UART, SysTick and timer drivers
- [ ] Assembly sections 14–15: FIFO and Moore state machine
- [ ] Ground Up course
- [ ] Advanced Bare-Metal course
- [ ] HAL APIs course
- [ ] Data logger project (stages in docs/course-progression.md)

## Milestones — FPGA era (main path, after the driver courses)

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

## Later / maybe (STM32)

- I²C/SPI sensor on the breadboard with protocol decode
- A HAL2-era board lesson via CubeMX2's real CLI
