section .text
global square_of_sum
square_of_sum:
    mov rax, 0
.loop:
    add rax, rdi
    dec rdi
    jnz .loop
    imul rax, rax
    ret

global sum_of_squares
sum_of_squares:
    mov rax, 0
.loop:
    mov r8, rdi
    imul r8, r8
    add rax, r8
    dec rdi
    jnz .loop
    ret

global difference_of_squares
difference_of_squares:
    push rdi
    call sum_of_squares
    pop rdi
    push rax
    call square_of_sum
    pop r9
    sub rax, r9
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
