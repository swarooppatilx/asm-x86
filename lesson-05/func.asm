section .data
  msg db "hello"
  len equ $ - msg

section .text
  global _start

_start:
  call print_msg ; call function

  mov rax, 60 ; exit syscall
  xor rdi, rdi
  syscall

print_msg:
  mov rax, 1; sys_write
  mov rdi, 1 ; std out
  mov rsi, msg ; buff
  mov rdx, len ; msg length
  syscall
  ret ; return to caller
