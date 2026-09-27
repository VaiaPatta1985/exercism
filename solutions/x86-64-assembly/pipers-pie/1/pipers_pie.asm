%include "debug.mac"

default rel

section .text

; This function is already pre-defined and matches the example in the concept
factorial:
    mov rax, 1
factorial_helper:
    cmp rdi, 1
    jle .base_case

    imul rax, rdi
    dec rdi
    jmp factorial_helper
.base_case:
    ret

global largest_portion
largest_portion:
    mov rdx, 0
    cmp rdi, rsi
    cmovae rax, rdi
    cmovae rcx, rsi
    cmovb rax, rsi
    cmovb rcx, rdi
    cmp rcx, 0
    je .base_case
    mov rdi, rcx
    idiv rcx
    mov rsi, rdx
    jmp largest_portion
.base_case:
    ret


global double_factorial
double_factorial:
    mov rax, 1
double_factorial_helper:
    cmp rdi, 1
    jle .base_case
    imul rax, rdi
    dec rdi
    dec rdi
    jmp double_factorial_helper
.base_case:
    ret

global pipers_pi
pipers_pi:
    mov rax, 0
    cvtsi2sd xmm0, rax
    movsd xmm2, xmm0
pipers_pi_helper:
    movq r8, xmm2
    push r8
    sub rsp, 8
    push rdi
    call factorial
    pop rsi
    add rsp, 8
    push rax
    push rsi
    imul rdi, rsi, 2
    inc rdi
    call double_factorial
    pop rsi
    pop rdx
    cvtsi2sd xmm0, rax
    cvtsi2sd xmm1, rdx
    divsd xmm1, xmm0
    pop r8
    movq xmm2, r8
    addsd xmm2, xmm1
    cmp rsi, 0
    je .base_case
    mov rdi, rsi
    dec rdi
    jmp pipers_pi_helper
.base_case:
    mov r8, 2
    cvtsi2sd xmm0, r8
    mulsd xmm0, xmm2
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
