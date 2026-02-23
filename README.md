This is a minimal x86-64 Linux program written in NASM.

It prints `Hello World` by invoking Linux system calls directly.
No libc. No runtime.

## build and run

```bash
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
./hello
```

### 1. elf structure

* `.data` → initialized writable memory
* `.text` → executable instructions
* `_start` → real entry point (not `main`)

The linker sets `_start` as the ELF entry address.


### 2. linux x86-64 syscall convention

Registers used for syscalls:

| register | purpose        |
| -------- | -------------- |
| rax      | syscall number |
| rdi      | arg1           |
| rsi      | arg2           |
| rdx      | arg3           |
| r10      | arg4           |
| r8       | arg5           |
| r9       | arg6           |

`write` = 1
`exit` = 60

`syscall` switches the CPU from user mode (ring 3) to kernel mode (ring 0).


### 3. assembly-time constant

```asm
len equ $ - msg
```

`$` is the current location counter.
The assembler computes the string length at build time.
No runtime calculation occurs.

## references

Linux syscall table
[https://filippo.io/linux-syscall-table/](https://filippo.io/linux-syscall-table/)

NASM documentation
[https://www.nasm.us/docs.php](https://www.nasm.us/docs.php)

ELF specification
[https://refspecs.linuxfoundation.org/elf/elf.pdf](https://refspecs.linuxfoundation.org/elf/elf.pdf)
