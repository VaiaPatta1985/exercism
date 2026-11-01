ERROR_VALUE equ -1

section .text
global steps
steps:
    mov r8, rdi
    sal r8, 32
    jz .error
    sar r8, 32
    js .error
    mov r9, 0
.divide_by_two:
    test r8, 1
    jnz .odd
    inc r9
    shr r8, 1
    jmp .divide_by_two
.odd:
    cmp r8, 1
    je .end
    inc r9
    mov rax, 3
    mul r8
    inc rax
    mov r8, rax
    jmp .divide_by_two
.error:
    mov r9, ERROR_VALUE
.end:
    mov rax, r9
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
