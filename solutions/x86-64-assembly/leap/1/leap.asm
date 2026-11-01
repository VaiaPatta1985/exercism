section .text
global leap_year
leap_year:
%define FALSE r10
%define TRUE r11
    mov FALSE, 0
    mov TRUE, 1
    mov r8, FALSE
    mov r9, 4
    mov rdx, 0
    mov rax, rdi
    div r9
    cmp rdx, 0
    cmove r8, TRUE
    mov r9, 100
    mov rdx, 0
    mov rax, rdi
    div r9
    cmp rdx, 0
    cmove r8, FALSE
    mov r9, 400
    mov rdx, 0
    mov rax, rdi
    div r9
    cmp rdx, 0
    cmove r8, TRUE
    mov rax, r8
%undef r10
%undef r11
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
