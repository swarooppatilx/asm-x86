# lesson-03 — use return value

Reads input and writes back exactly the number of bytes returned by `read`.

* syscall return values
* conditional jump (`jle`)
* labels
* `xor` for zeroing a register

### return value of `read`

After `sys_read`, the kernel returns:

* `rax > 0` → number of bytes read
* `rax = 0` → EOF
* `rax < 0` → error

```asm
test rax, rax
jle .exit
```

`test rax, rax` updates CPU flags without changing `rax`.
`jle` jumps if the value is less than or equal to zero.

### labels

```asm
.exit:
```

A label marks a location in code.
`jle .exit` transfers control to that location.

Labels are resolved by the assembler into instruction addresses.

---

### zeroing a register

```asm
xor rdi, rdi
```

Sets `rdi` to 0.

This is preferred over `mov rdi, 0` because it is shorter and idiomatic in assembly.
