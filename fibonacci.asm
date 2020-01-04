section .data
SUCCESS equ 0
SYS_exit equ 60
n dd 10
fibonacci dq 0
section .text
global _start
_start:
mov rbx, 0
mov ecx, dword[n]
fibonacciloop:
mov rax, rbx
cmp rax, 1
jle knownresult
add qword[fibonacci], rax
dec rbx
loop fibonacciloop
knownresult:
mov rax, 1
add qword[fibonacci], rax
last:
mov rax, SYS_exit
mov rdi, SUCCESS
syscall
