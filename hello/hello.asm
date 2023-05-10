section .data
    text db "Hello, world!",0x0a

section .text
    global _start

_start:
    ; sys_write
    mov rax, 1      ; syscall write
    mov rdi, 1      ; write to stdout
    mov rsi, text   ; write from mem "text"
    mov rdx, 14     ; write 14 chars
    syscall

    ; sys_exit
    mov rax, 60     ; syscall exit
    mov rdi, 0      ; error code 0
    syscall

