%include "debug.mac"

default rel

section .rodata
align 16
passing_threshold dd 50.0, 50.0, 50.0, 50.0
last_bit_4x32 dd 1, 1, 1, 1

section .text

global flag_above_threshold
flag_above_threshold:
    movaps xmm0, [rsi]
    movaps xmm1, [rdx]
    cmpnleps xmm0, xmm1
    movaps [rdi], xmm0
    ret

global flag_perfect
flag_perfect:
    movaps xmm0, [rsi]
    movaps xmm1, [rdx]
    cmpeqps xmm0, xmm1
    movaps [rdi], xmm0
    ret

global assign_ranks
assign_ranks:
    movaps xmm1, [rsi]
    movaps xmm2, [last_bit_4x32]
    movdqa xmm3, xmm2
    push rdi
    push rsi
    push rdx
    sub rsp, 48
    movdqa [rsp], xmm1
    movdqa [rsp + 16], xmm2
    movdqa [rsp + 32], xmm3
    lea rdx, [passing_threshold]
    call flag_above_threshold
    movdqa xmm1, [rsp]
    movdqa xmm2, [rsp + 16]
    movdqa xmm3, [rsp + 32]
    add rsp, 48
    pop rdx
    pop rsi
    pop rdi
    movaps xmm0, [rdi]
    pand xmm2, xmm0
    paddd xmm3, xmm2
    push rdi
    push rsi
    push rdx
    sub rsp, 64
    movdqa [rsp], xmm1
    movdqa [rsp + 16], xmm2
    movdqa [rsp + 32], xmm3
    movdqa [rsp + 48], xmm0
    call flag_perfect
    movdqa xmm1, [rsp]
    movdqa xmm2, [rsp + 16]
    movdqa xmm3, [rsp + 32]
    movdqa xmm0, [rsp + 48]
    add rsp, 64
    pop rdx
    pop rsi
    pop rdi
    movaps xmm0, [rdi]
    pand xmm2, xmm0
    paddd xmm3, xmm2
    movaps [rdi], xmm3
    ret

global count_failures
count_failures:
    movaps xmm1, [rdx]
    mov r8, 0
    mov rax, 0
.loop:
    imul r9, r8, 16
    movaps xmm0, oword [rdi + r9]
    movdqa xmm2, xmm1
    pcmpgtd xmm1, xmm0
    movmskps r10, xmm1
    movdqa xmm1, xmm2
    popcnt r10, r10
    add rax, r10
    inc r8
    cmp r8, rsi
    jne .loop
    ret

global all_passed
all_passed:
    mov r8, 0
    mov rax, 1
    mov r10, 0
.loop:
    imul r9, r8, 16
    movaps xmm0, [rdi + r9]
    ptest xmm0, xmm0
    cmovnz rax, r10
    jnz .end
    inc r8
    cmp r8, rsi
    jne .loop
.end:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
