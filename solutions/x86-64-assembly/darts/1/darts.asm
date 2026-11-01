; round
NEAREST equ 0
FLOOR equ 1
CEILING equ 2
TRUNCATE equ 3

OFF_TARGET_POINTS equ 0
OUTER_CIRCLE_POINTS equ 1
MIDDLE_CIRCLE_POINTS equ 5
INNER_CIRCLE_POINTS equ 10

OUTER_CIRCLE_RADIUS equ 10
MIDDLE_CIRCLE_RADIUS equ 5
INNER_CIRCLE_RADIUS equ 1

section .text

distance:
    mulsd xmm0, xmm0
    mulsd xmm1, xmm1
    addsd xmm0, xmm1
    sqrtsd xmm0, xmm0
    ret

global score
score:
    sub rsp, 8
    call distance
    add rsp, 8
    roundsd xmm0, xmm0, CEILING
    cvttsd2si r9, xmm0
    mov rax, OFF_TARGET_POINTS
    cmp r9, OUTER_CIRCLE_RADIUS
    jg .end
    mov rax, OUTER_CIRCLE_POINTS
    cmp r9, MIDDLE_CIRCLE_RADIUS
    jg .end
    mov rax, MIDDLE_CIRCLE_POINTS
    cmp r9, INNER_CIRCLE_RADIUS
    jg .end
    mov rax, INNER_CIRCLE_POINTS
.end:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
