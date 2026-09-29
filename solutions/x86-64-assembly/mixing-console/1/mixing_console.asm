%include "debug.mac"

default rel

NEAREST equ 0
FLOOR equ 1
CEILING equ 2
TRUNCATE equ 3

section .text

global mix_tracks
mix_tracks:
    movdqa xmm0, [rsi]
    movdqa xmm1, [rdx]
    paddsw xmm0, xmm1
    movdqa [rdi], xmm0
    ret

global remove_bleed
remove_bleed:
    movdqa xmm0, [rsi]
    movdqu xmm1, [rdx]
    psubsw xmm0, xmm1
    movdqu [rdi], xmm0
    ret

global combine_meters
combine_meters:
    movdqa xmm0, [rsi]
    movdqa xmm1, [rdx]
    paddusb xmm0, xmm1
    movdqa [rdi], xmm0
    ret

global apply_fade
apply_fade:
    ; 0-check omitted (rcx guaranteed nonzero)
    mov r8, 0
.loop:
    imul r9, r8, 2
    movdqa xmm0, [rsi + r9]
    movdqa xmm1, [rdx + r9]
    pmulhw xmm0, xmm1
    movdqa [rdi + r9], xmm0
    add r8, 8
    cmp r8, rcx
    jne .loop
    ret

global attenuate_track
attenuate_track:
    ; 0-check omitted (rcx guaranteed nonzero)
    mov r8, 0
    movdqa xmm1, [rdx]
    cvtdq2ps xmm1, xmm1
.loop:
    imul r9, r8, 2
    imul r10, r8, 4
    movq xmm0, [rsi + r9]
    pmovsxwd xmm0, xmm0
    cvtdq2ps xmm0, xmm0
    divps xmm0, xmm1
    roundps xmm0, xmm0, TRUNCATE
    cvtps2dq xmm0, xmm0
    movdqa [rdi + r10], xmm0
    add r8, 4
    cmp r8, rcx
    jne .loop
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
