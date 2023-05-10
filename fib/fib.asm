section .bss
    x resb 8
    y resb 8
    z resb 8

section .text
    global _start

_start:
    mov [x], 0
    mov [y], 1

_loop:
    call _printX
    
    ; z = x + y
    mov rax, [x]
    add rax, [y]
    mov [z], rax

    ; x = y, y = z
    mov [x], y
    mov [y], z
    cmp [x], 255
    jl _loop
    jmp _start
    

_printX:
    ; sys_write
    mov rax, 0x1    ; syscall write
    mov rdi, 0x1    ; write to stdout
    mov rsi, x      ; write x
    mov rdx, 0x0e   ; write 14 chars
    syscall
    ret
