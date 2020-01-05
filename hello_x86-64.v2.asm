;;;  nasm -f elf64 -o hello_x86-64.v2.o hello_x86-64.v2.asm
;;;  ld -o hello_x86-64.v2 hello_x86-64.v2.o --pic-executable  --dynamic-linker=/lib64/ld-linux-x86-64.so.2
section .rodata
  msg: db "Hello world!", 10
  msglen: equ $ - msg

section .data
garbage: db "Nothing to see here.", 0h

section .text
global nothing:function (nothing.end - nothing)
global _start
_start:
subroutineWrite:
  mov rax, 1        ;	system call number for write
  mov rdi, 1        ;   first parama: STDOUT
  mov rsi, msg      ;	second param
  mov rdx, msglen   ;   third param
  syscall           ;
  call nothing
  jmp subroutineExit
.localNop:
  nop
  nop
  nop
  jmp subroutineExit
subroutineExit:
  mov rax, 60       ;	system call number for exit
  mov rdi, 0        ;   exit(0)
  syscall           ;

nothing:
  nop
  nop
  nop
  ret
nothing.end:
