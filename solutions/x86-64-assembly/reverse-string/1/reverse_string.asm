section .text
global reverse
reverse:
    mov rax, 0
    mov rcx, -1
.loop_calculate_length:
    inc rcx
    mov al, byte [rdi + rcx]
    cmp rax, 0
    jne .loop_calculate_length
    dec rcx
    mov r9, 0
.loop_reverse:
    cmp rcx, r9
    jl .end
    mov al, byte [rdi + rcx]
    mov dl, byte [rdi + r9]
    mov byte [rdi + r9], al
    mov byte [rdi + rcx], dl
    inc r9
    dec rcx
    jmp .loop_reverse
.end:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
