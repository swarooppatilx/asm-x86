# lesson-05 — functions

Moves the printing logic into a separate function and calls it from `_start`.

Introduces:

* `call` instruction
* `ret` instruction
* basic function structure

---

### call

```asm
call print_msg
```

Pushes the return address onto the stack and jumps to `print_msg`.

---

### ret

```asm
ret
```

Pops the return address from the stack and returns execution to the caller.

`call` and `ret` use the stack implicitly.

