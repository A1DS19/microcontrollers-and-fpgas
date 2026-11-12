# c-c++

Embedded C and C++ practice, worked alongside the STM32 courses. Three C courses, then a C++
book: the language under the firmware, how to structure it, how to test it on the host, then the
move to modern C++. Status and project directories are tracked in
[docs/course-progression.md](../docs/course-progression.md).

## Path

1. **[Embedded C: Learn As You Go](https://www.udemy.com/course/embedded-c-learn-as-you-go/)**,
   6h. Memory, binary and hex, pointers, bit manipulation, arrays, structs and unions with their
   memory layout, `volatile`, the preprocessor, and the compile, assemble and link pipeline. Every
   example runs on plain gcc.
2. **[Embedded C Programming Design Patterns](https://www.udemy.com/course/embedded-c-programming-design-patterns/)**,
   6h. Object, opaque, singleton and factory patterns; callbacks, inheritance, virtual APIs and
   bridge in C; a return-value convention; spinlock, semaphore, mutex and condition-variable
   patterns on an RTOS.
3. **[Embedded C: Reusable Modules & Unit Testing](https://www.udemy.com/course/embedded-c-reusable-modules-unit-testing/)**,
   2.5h. Statically allocated bit helpers, ring buffer, queue, event dispatcher and table-driven
   state machine, each unit-tested on the host with Unity and Ceedling, then joined into one
   event-driven system. The course says it isn't a type-along.
4. **C++ in Embedded Systems: A Practical Transition from C to Modern C++** (book, Amar
   Mahmutbegović, Packt), 18 chapters. Classes, error handling, templates, strong types, lambdas
   and compile-time computation, then a C++ HAL, wrapping C libraries, a sequencer for the super
   loop, and finite state machines. Code:
   [PacktPublishing/Cpp-in-Embedded-Systems](https://github.com/PacktPublishing/Cpp-in-Embedded-Systems).

**Optional reference, probably skipped:**
[C for Embedded Systems](https://www.udemy.com/course/c-for-embedded-systems/) (Udemy). Most of
it is covered by course 1, the assembly course and the driver courses. Single lectures are worth
it for what nothing else covers: memory alignment, bitfields, scope and lifetime, type casting,
`#`/`##` macros, MISRA, and gcc/gdb on the command line.

When each step happens: [docs/course-progression.md](../docs/course-progression.md).

## Reference books (owned)

Read when the path reaches them, not cover to cover up front.

- ***Modern CMake for C++*** (Rafał Świdziński). None of the courses teach CMake, but the
  driver-course projects are planned as CMake builds and the C++ book's examples use it. Read the
  basics before the first driver-course project.
- ***C++ Memory Management*** (Patrice Roy). Object lifetime, RAII, smart pointers and custom
  allocation such as arenas: the techniques embedded C++ uses to avoid the general heap. After
  the C++ book.
- ***C++ High Performance*** (Björn Andrist, Viktor Sehr). Move semantics, containers and
  algorithms, cache-friendly data, measuring performance: the general C++ the embedded book gives
  less room to. After the C++ book, before the FPGA path, where Verilator harnesses are C++.
- ***Asynchronous Programming with C++*** (Javier Reguera-Salgado). Threads, futures, coroutines
  and Boost.Asio on a PC. Not for microcontrollers; last, for PC-side tools that talk to the FPGA
  over the network.

Gbati's *Bare-Metal Embedded C Programming* is the driver courses' companion, so it's listed with
the STM32 courses, not here.

## Layout

One directory per course or book, named after its URL slug (the book's after its code repo:
`cpp-in-embedded-systems`), each self-contained with its own build, like `stm32/` and `fpga/`. How
lessons are laid out inside one is decided when it starts.

## Building

- **Host:** exercises that don't touch hardware build and run on the Mac. `gcc` and `g++` there
  are Apple clang; Homebrew's `gcc-15` is real GCC, closer to the board's `arm-none-eabi-gcc`.
- **Board:** exercises that touch registers follow the `stm32/` conventions: bare-metal, CMSIS
  headers only, no HAL.
- **Course 3:** needs Ceedling, which isn't installed. It's a Ruby gem, and the Mac's built-in
  Ruby is 2.6, too old for current Ceedling: install Ruby from Homebrew first.
- **Book:** examples target an STM32F072 and run in the Renode emulator, no board needed. The
  author's Docker image (`mahmutbegovic/cpp_in_embedded_systems`) has CMake, arm-none-eabi-gcc
  13.2 and Renode 1.15; its Dockerfile is in the repo's `Chapter04/`. Docker is installed here.
  The image installs x86_64 tools, so on this Apple Silicon Mac it runs under emulation.
