# microcontrollers-and-fpgas

Hardware learning workspace, driven from the CLI. **Final goal: low-latency FPGA networking
and design verification** — an HFT-style market-data feed handler built in hardware and
verified with cocotb, as the portfolio for remote FPGA / verification roles from Costa Rica.

The STM32 work came first and stays: register-level Cortex-M firmware is the CPU side of
every FPGA SoC (AXI is the same AMBA family as AHB/APB; Zynq and soft CPUs boot through the
same startup file + linker script). Further MCU courses are good-to-know, not the main path.

## Layout

| Directory | What | Status |
|---|---|---|
| [`fpga/`](fpga/) | Verilog/SystemVerilog courses and the feed-handler project, one directory per course or phase | **Main path** — not started |
| [`stm32/`](stm32/) | Bare-metal STM32 (Nucleo-L476RG) course projects, register-level, no HAL | Two courses complete; the rest is good-to-know |
| [`docs/course-progression.md`](docs/course-progression.md) | The whole learning path: FPGA main path + STM32 good-to-know track + completion log | Living document |
| `agents/` | Workspace vocabulary, decisions, roadmap, session handoff | |

Each project directory is self-contained with its own Makefile; the root has no build plumbing.

## Where to start

- FPGA plan, toolchain, board and resources: [fpga/README.md](fpga/README.md)
- STM32 board, toolchain and commands: [stm32/README.md](stm32/README.md)
