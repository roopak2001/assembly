.section .data
.section .text
.globl _start
_start:
pushl $0
call factorial
popl %ebx

movl %eax, %ebx
movl $1, %eax
int $0x80
.type factorial,@function
factorial:
pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax
cmpl $0,%eax
je end_factorial_0

cmpl $1,%eax
je end_factorial
decl %eax
pushl %eax
call factorial
popl %ebx
incl %ebx
imul %ebx, %eax
end_factorial:

movl %ebp, %esp
popl %ebp
ret
end_factorial_0:
movl $1, %eax
movl %ebp, %esp
popl %ebp
ret


