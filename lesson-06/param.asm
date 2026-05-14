section .text
  global _start

_start:
  mov rdi, 0; counter = 0

  call increment;
  call increment;
  call increment;

  mov rax, 60; sys_exit
  xor rdi, rdi
  syscall

increment:
  inc rdi
  ret
