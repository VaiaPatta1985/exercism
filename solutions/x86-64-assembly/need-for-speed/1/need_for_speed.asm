%include "debug.mac"

default rel

INITIAL_BATTERY_VALUE equ 100
TRUE equ 1
FALSE equ 0

section .text

global new_car
new_car:
    lodsq
    mov rdx, [rsi]
    and rdx, 0xFFFF
    shl rdi, 16
    or rdx, rdi
    mov rcx, INITIAL_BATTERY_VALUE
    cvtsi2ss xmm0, rcx
    movd ecx, xmm0
    shl rcx, 32
    or rdx, rcx
    ret

global new_track
new_track:
    mov rax, rdi
    mov rdx, rsi
    ret

global new_race
new_race:
    mov [rdi], rsi
    mov [rdi + 8], rdx
    mov [rdi + 16], ecx
    ;mov [rdi + 20], 0
    mov r8, 0
    mov [rdi + 116], r8b
    mov rax, rdi
    ret

global add_participant
add_participant:
    mov rax, FALSE
    mov rcx, 0
    mov cl, byte [rdi + 116]
    cmp rcx, 6
    je .done
    lea r8, [rdi + 20]
    imul rax, rcx, 16
    mov [r8 + rax], rsi
    mov [r8 + rax + 8], rdx
    inc rcx
    mov [rdi + 116], cl
    mov rax, TRUE
.done:
    ret

global add_race
add_race:
    mov rax, rdi[2400]
    imul r8, rax, 120
    ;assume the whole struct is on the stack?
    lea r9, [rsp + 8]
    mov r10, 0
    add r8, rdi
.loop:
    mov r11, [r9 + r10]
    mov [r8 + r10], r11
    add r10, 8
    cmp r10, 120
    jl .loop
    inc rax
    mov rdi[2400], rax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
