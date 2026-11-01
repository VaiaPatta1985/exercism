; boolean
FALSE equ 0
TRUE equ 1

section .text

x_divisible_by_y:
    mov r10, TRUE
    mov rdx, 0
    mov rax, rdi
    div rsi
    mov rax, FALSE
    cmp rdx, 0
    cmove rax, r10
    ret

global leap_year
leap_year:
    push rdi
    mov rsi, 4
    call x_divisible_by_y
    pop rdi
    cmp rax, 0
    je .end
    push rdi
    mov rsi, 100
    call x_divisible_by_y
    pop rdi
    not rax
    and rax, 1
    jnz .end
    push rdi
    mov rsi, 400
    call x_divisible_by_y
    pop rdi
.end:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
