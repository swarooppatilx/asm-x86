# lesson-01 — hello world

Prints `Hello World` using a direct Linux syscall and exits.
Execution begins at `_start`.

### sections

* `.data` → initialized writable memory
* `.text` → executable instructions
* `_start` → real entry point (not `main`)

The linker sets `_start` as the entry address in the ELF header.

### defining bytes

```asm
msg db "Hello World", 10
```

`db` defines raw bytes in memory.
`10` is the ASCII newline character.

### assembly-time constant

```asm
len equ $ - msg
```

`$` is the current location counter.
The assembler computes the string length at build time.

### linux x86-64 syscall convention

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

---

### sys_write

```asm
mov rax, 1
mov rdi, 1
mov rsi, buffer
mov rdx, 64
syscall
```

* `rax = 1` → `write`
* `rdi = 1` → stdout

---

### sys_exit

```asm
mov rax, 60
mov rdi, 0
syscall
```

* `rax = 60` → `exit`
* `rdi = 0` → status code


This lesson uses:

* `write` → syscall 1
* `exit` → syscall 60

---

The `syscall` instruction switches from user mode to kernel mode and performs the requested operation.