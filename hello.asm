; hello world in assmebly x86 for linux

section .data ; intiliazed writable data
  msg db "Hello World", 10 ; msg is a pointer containing the byte 
  ; and newline character (10 ASCII)
  len equ $ - msg ; current location minus addr where 
  ; string started gives length

section .text ; executable code
  global _start ; define enrty point

_start: ; program entry point
  mov rax, 1 ; write syscall
  mov rdi, 1 ; std output
  mov rsi, msg ; addr of buffer
  mov rdx, len ; no. of bytes
  syscall ; perform write

  mov rax, 60 ; syscall no. 60 = exit
  xor rdi, rdi ; exit status 0
  syscall ; terminate process
