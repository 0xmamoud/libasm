# Basic Assembly Knowledge

My understanding of basic assembly:

- Assembly programs are organized into sections,
  mainly `.data` for data and `.text` for code.
- In the `.text` section, you define code symbols. The `_start` entry point
  is for standalone executables; libraries just expose function symbols.
- There are 16 64-bit general-purpose registers:
  `rax`, `rbx`, `rcx`, `rdx`, `rsi`, `rdi`, `rsp`, `rbp`, and `r8` to `r15`.
- For a system call, you put the syscall number in `rax` (the accumulator),
  then pass arguments in `rdi`, `rsi`, `rdx`, etc.
- `syscall` is a CPU instruction that enters the kernel; the ABI defines
  the calling convention for those system calls.
- You execute the `syscall` instruction, and the return value comes back in `rax`,
  which can indicate an error.
- `mov` is used to copy a value into a register.
