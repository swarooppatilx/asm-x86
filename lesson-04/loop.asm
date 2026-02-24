section .data
    msg db "hello", 10      ; message bytes + newline
    len equ $ - msg         ; string length (computed at assembly time)

section .text
    global _start           ; program entry point

_start:
    mov rbx, 3              ; loop counter = 3

.loop:
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, msg            ; address of message
    mov rdx, len            ; number of bytes
    syscall                 ; write message

    dec rbx                 ; decrement counter
    jnz .loop               ; repeat if not zero

    mov rax, 60             ; sys_exit
    xor rdi, rdi            ; exit status 0
    syscall                 ; terminate process