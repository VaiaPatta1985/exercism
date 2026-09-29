default rel

EXP_BIAS_SINGLE equ 127
FRACTIONAL_BITS_SINGLE equ 23

section .rodata
align 16
clear_signbit_4x32 dd 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF
get_exponent_4x32 dd 0x7F800000, 0x7F800000, 0x7F800000, 0x7F800000
bias_4x32 dd EXP_BIAS_SINGLE, EXP_BIAS_SINGLE, EXP_BIAS_SINGLE, EXP_BIAS_SINGLE

section .text

global rectify_trace
rectify_trace:
    movaps xmm0, [rsi]
    pand xmm0, oword [clear_signbit_4x32]
    movaps [rdi], xmm0
    ret

global reading_scale
reading_scale:
    movaps xmm0, [rsi]
    pand xmm0, oword [get_exponent_4x32]
    psrld xmm0, FRACTIONAL_BITS_SINGLE
    psubd xmm0, [bias_4x32]
    movaps [rdi], xmm0
    ret

global coarsen_displacements
coarsen_displacements:
    movaps xmm0, [rsi]
    movq xmm1, rdx
    psrad xmm0, xmm1
    movaps [rdi], xmm0
    ret

global gate_channels
gate_channels:
    movaps xmm0, [rsi]
    movaps xmm1, [rdx]
    por xmm0, xmm1
    movaps xmm1, [rcx]
    pandn xmm1, xmm0
    movaps [rdi], xmm1
    ret

global toggle_calibration
toggle_calibration:
    movaps xmm0, [rsi]
    movaps xmm1, [rdx]
    movaps xmm2, [rcx]
    pandn xmm2, xmm1
    pxor xmm0, xmm2
    movaps [rdi], xmm0
    ret

global amplify_trace
amplify_trace:
    movaps xmm0, [rsi]
    movaps xmm1, [rdx]
    pslld xmm1, FRACTIONAL_BITS_SINGLE
    paddd xmm0, xmm1
    movaps [rdi], xmm0
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
