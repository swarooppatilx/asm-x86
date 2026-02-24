# lesson-04 — loop

Prints `hello` three times using a register as a loop counter.
Execution begins at `_start`.

Introduces:

* using a general-purpose register as a counter
* `dec` instruction
* `jnz` (jump if not zero)
* loop structure using labels

### loop control

```asm
mov rbx, 3
```

Initializes the counter.

```asm
dec rbx
jnz .loop
```

Decrements the counter and jumps back to `.loop` while it is not zero.

### note on registers

`rbx` is used instead of `rcx` because the `syscall` instruction overwrites `rcx`.