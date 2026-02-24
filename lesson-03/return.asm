section .bss
    buffer resb 64

section .text
    global _start

_start:
    mov rax, 0          ; sys_read
    mov rdi, 0          ; stdin
    mov rsi, buffer
    mov rdx, 64
    syscall             ; rax = bytes read

    test rax, rax       ; set flags based on rax
    jle .exit           ; if rax <= 0, jump to exit

    mov rdx, rax        ; write only bytes actually read
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, buffer
    syscall

.exit:
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit status 0
    syscall