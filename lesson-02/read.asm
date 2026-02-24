; reading from stdin

section .bss ; unitiliazed writable data section
  buffer resb 64 ; recieve 64 bytes input buffer

section .text ; executable section
  global _start ; define entry

_start: ; program entry point
  mov rax, 0 ; read syscall
  mov rdi, 0 ; fd of std input
  mov rsi, buffer ; addr of buffer
  mov rdx, 64 ; len of buffer
  syscall

  mov rax, 1 ; write syscall
  mov rdi, 1 ; fd of std output
  mov rsi, buffer ; addr of buffer
  mov rdx, 64 ; len of buffer
  syscall

  mov rax, 60 ; syscall exit
  mov rdi, 0 ; exit status
  syscall

