%include "debug.mac"

default rel

section .rodata
align 16
conversion_factor dq 0.5, 0.5

section .text

global sum_yields
sum_yields:
    movaps xmm0, oword [rdi]
    movaps xmm1, oword [rsi]
    addps xmm0, xmm1
    movaps oword [rdx], xmm0
    ret

global scaled_deviation
scaled_deviation:
    movapd xmm0, oword [rdi]
    movupd xmm1, oword [rsi]
    subpd xmm0, xmm1
    movupd xmm1, oword [rdx]
    mulpd xmm0, xmm1
    movupd oword [rcx], xmm0
    ret

global calibrate_batch
calibrate_batch:
    movups xmm3, oword [rdi]
    cvtps2pd xmm0, xmm3
    movups xmm3, oword [rdi + 8]
    cvtps2pd xmm4, xmm3
    movapd xmm1, oword [rdx]
    subpd xmm0, xmm1
    subpd xmm4, xmm1
    movapd xmm1, oword [rsi]
    divpd xmm1, xmm0
    movapd xmm0, xmm1
    movapd xmm1, oword [rsi]
    divpd xmm1, xmm4
    movapd xmm4, xmm1
    movapd xmm2, oword [conversion_factor]
    mulpd xmm0, xmm2
    mulpd xmm4, xmm2
    movapd oword [rcx], xmm0
    movapd oword [rcx + 16], xmm4
    ret

global normalize_scores
normalize_scores:
    cmp rcx, 0
    je .end
    mov r8, 0
    movapd xmm2, oword [rdx]
.loop:
    imul r9, r8, 16
    movapd xmm0, oword [rdi + r9]
    movapd xmm1, oword [rsi + r9]
    mulpd xmm0, xmm1
    divpd xmm0, xmm2
    movapd oword [rdi + r9], xmm0
    inc r8
    cmp r8, rcx
    jne .loop
.end:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
