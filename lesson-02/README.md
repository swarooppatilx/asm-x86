# lesson-02 — read from stdin

Reads up to 64 bytes from standard input and writes them back to standard output.
Execution begins at `_start`.

### sections

* `.bss` → uninitialized writable memory
* `.text` → executable instructions

`.bss` is used to reserve memory without storing initialized data in the binary.

---

### reserving memory

```asm
buffer resb 64
```

`resb` reserves 64 bytes for input storage.

---

### sys_read

```asm
mov rax, 0
mov rdi, 0
mov rsi, buffer
mov rdx, 64
syscall
```

* `rax = 0` → `read`
* `rdi = 0` → stdin
* `rsi` → buffer address
* `rdx = 64` → max bytes

Number of bytes read is returned in `rax`.