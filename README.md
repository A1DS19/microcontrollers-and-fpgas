# microcontrollers-and-fpgas

Hardware learning workspace, driven from the CLI. **Final goal: low-latency FPGA networking
and design verification** — an HFT-style market-data feed handler built in hardware and
verified with cocotb, as the portfolio for remote FPGA / verification roles from Costa Rica.

The path starts on STM32: an ARM assembly course, then three driver courses, then FPGA.
Register-level Cortex-M firmware is the CPU side of every FPGA SoC (AXI is the same AMBA family
as AHB/APB; Zynq and soft CPUs boot through the same startup file + linker script).

## Layout

| Directory | What | Status |
|---|---|---|
| [`stm32/`](stm32/) | Bare-metal STM32 course projects, register-level, no HAL | **Current focus** — ARM GNU Assembly course, then driver courses |
| [`fpga/`](fpga/) | Verilog/SystemVerilog courses and the feed-handler project, one directory per course or phase | **Main path** — not started, follows the STM32 courses |
| [`docs/course-progression.md`](docs/course-progression.md) | The whole learning path: STM32 courses + FPGA main path + good-to-know track + completion log | Living document |
| `agents/` | Workspace vocabulary, decisions, roadmap, session handoff | |

Each project directory is self-contained with its own Makefile; the root has no build plumbing.

## Where to start

- Current course and the full path: [docs/course-progression.md](docs/course-progression.md)
- FPGA plan, toolchain, board and resources: [fpga/README.md](fpga/README.md)
