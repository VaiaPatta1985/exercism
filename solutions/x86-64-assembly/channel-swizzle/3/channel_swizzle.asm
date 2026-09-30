%include "debug.mac"

default rel

XYXY2XXYY equ 0b11_01_10_00
%define ABCD2AAAA byte 0

%define R_B_switch_w_offset(x) x + 2, x + 1, x, x + 3

section .rodata
align 16
RGBA_to_BGRA_block db R_B_switch_w_offset(0), R_B_switch_w_offset(4), R_B_switch_w_offset(8), R_B_switch_w_offset(12)

section .text

global to_display_order
to_display_order:
    mov r8, 0
    movaps xmm1, oword [RGBA_to_BGRA_block]
.loop:
    imul r9, r8, 16
    movaps xmm0, [rsi + r9]
    pshufb xmm0, xmm1
    movaps [rdi + r9], xmm0
    inc r8
    cmp r8, rdx
    jne .loop
    ret

global fill_region
fill_region:
    mov eax, dword [rsi]
    mov r8, 0
.loop:
    imul r9, r8, 16
    pinsrd dword xmm0, eax, 0
    pshufd xmm0, xmm0, ABCD2AAAA
    movaps [rdi + r9], xmm0
    inc r8
    cmp r8, rdx
    jne .loop
    ret

global weave_scanlines
weave_scanlines:
    movaps xmm0, oword [rsi]
    movdqa xmm2, xmm0
    movaps xmm1, oword [rdx]
    punpcklbw xmm0, xmm1
    punpckhbw xmm2, xmm1
    movaps oword [rdi], xmm0
    movaps oword [rdi + 16], xmm2
    ret

global pack_samples
pack_samples:
    movaps xmm0, oword [rsi]
    movdqa xmm2, xmm0
    movaps xmm1, oword [rdx]
    packuswb xmm0, xmm1
    movaps oword [rdi], xmm0
    ret

global split_coordinates
split_coordinates:
    movaps xmm0, oword [rdx]
    shufps xmm0, xmm0, XYXY2XXYY
    movdqa xmm2, xmm0
    movaps xmm1, oword [rcx]
    shufps xmm1, xmm1, XYXY2XXYY
    unpcklps xmm0, xmm1
    shufps xmm0, xmm0, XYXY2XXYY
    unpckhps xmm2, xmm1
    shufps xmm2, xmm2, XYXY2XXYY
    movaps [rdi], xmm0
    movaps [rsi], xmm2
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
