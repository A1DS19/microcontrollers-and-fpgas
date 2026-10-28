# fpga

The main path of this workspace: Verilog/SystemVerilog, simulation-driven verification,
and an HFT-style market-data feed handler built in hardware. Not started yet.

Same habits as `stm32/`: CLI-first, one self-contained directory per course or phase with
its own Makefile, every design proven — in simulation with a testbench first, then on the board.

## Phases

| Phase | Months | Builds | Done when |
|---|---|---|---|
| 1. Foundations | 1–2 | Verilog basics; UART, FIFOs, a simple AXI-Stream pipeline | Every module passes its own cocotb testbench and runs on the board |
| 2. Network stack | 3–5 | Ethernet MAC integration; Ethernet → IP → UDP header parsing in hardware; echo/filter with no CPU | Packets from the PC are parsed and echoed by the FPGA alone |
| 3. Feed handler | 6–8 | NASDAQ ITCH parser; order book in hardware (top of book or a few levels) | Latency measured in clock cycles, first byte → book update |
| 4. Make it professional | 9 | cocotb testbench replaying real ITCH captures against a Python reference model; timing, resource and latency report | Public repo + write-up |

After Phase 4 (optional): HLS / C++ on FPGAs (Vitis HLS), Zynq hardware/software co-design.
Parallel (optional): own FPGA board — iCE40 QFN-48 2-layer first, then an ECP5 BGA board with
an Ethernet PHY to host the feed handler (KiCad; builds on the drone flight-controller PCB course).

## Planned toolchain

- **Simulation:** Verilator, Icarus Verilog, GTKWave
- **Testbenches:** cocotb (Python)
- **Synthesis:** Vivado in batch/Tcl mode for Xilinx boards; Yosys + nextpnr for iCE40/ECP5
- **Board (to buy):** Digilent Arty A7-100T — 100 Mb Ethernet, enough for Phases 1–3

## Bridges to the STM32 bench

- **SPI register file:** the FPGA exposes control/status registers over SPI; the Nucleo
  drives them with a register-level driver — both sides of a memory-mapped interface, plus
  synchronizing external signals into the FPGA clock domain.
- **Stimulus:** the Nucleo generates UART/SPI traffic to exercise Verilog designs on hardware;
  the LA2016 watches both sides.

## Resources

**Courses (Udemy), in order:** *FPGA Embedded Design* Parts 1–4 (Eduardo Corpeño) — Verilog,
Basic FPGA, EDA Tools, Microprocessor Design. Then a SystemVerilog-for-verification / UVM
course, timing constraints / STA, and clock domain crossing.

**Free:** HDLBits (alongside Part 1), Nandland, ZipCPU blog, Verification Academy, cocotb
docs, Alex Forencich's `verilog-ethernet` (the Phase 2 reference), Clifford Cummings' CDC
and async-FIFO papers.

**Books:**

| Book | Phase |
|---|---|
| Harris & Harris — *Digital Design and Computer Architecture, RISC-V Edition* (the one to own) | 1 |
| Pong P. Chu — *FPGA Prototyping by SystemVerilog Examples* | 1–2 |
| W. Richard Stevens — *TCP/IP Illustrated, Vol. 1* | 2 |
| Stuart Sutherland — *RTL Modeling with SystemVerilog for Simulation and Synthesis* | 2–3 |
| Steve Kilts — *Advanced FPGA Design* | 3 |
| Chris Spear & Greg Tumbush — *SystemVerilog for Verification* | 4 |
| Kastner et al. — *Parallel Programming for FPGAs* (free) | After 4 |

**Suggested order:** Corpeño Part 1 + HDLBits → Parts 2–3 → cocotb tutorial → Part 4 →
a verification course → Phase 2.
