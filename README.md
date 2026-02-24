# x86 linux assembly (nasm)

Small, focused programs exploring x86 assembly for linux

## lessons

- lesson-01 → hello world (`sys_write`)
- lesson-02 → read from stdin (`sys_read` + `sys_write`)

Each lesson directory contains its own source and minimal README.

## build example

```bash
cd lesson-01
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
./hello
````

---

## inspect the binaries

```bash
objdump -d <binary>
readelf -h <binary>
strace ./<binary>
```

## references

Linux syscall table
[https://filippo.io/linux-syscall-table/](https://filippo.io/linux-syscall-table/)

NASM documentation
[https://www.nasm.us/docs.php](https://www.nasm.us/docs.php)

ELF specification
[https://refspecs.linuxfoundation.org/elf/elf.pdf](https://refspecs.linuxfoundation.org/elf/elf.pdf)
