# lesson-06 — function parameters

Passes a value to a function through a register.

Introduces:

* argument passing with `rdi`
* modifying values inside a function
* `call` and `ret`

---

### passing the argument

```asm
mov rdi, 5
call increment
```

Passes the value `5` to the function using `rdi`.

---

### incrementing the value

```asm
increment:
    inc rdi
    ret
```

`inc` adds 1 to the value stored in `rdi`.

After returning from the function, `rdi = 6`.

---

This lesson introduces register-based parameter passing in x86-64.
