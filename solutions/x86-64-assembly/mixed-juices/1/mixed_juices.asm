DEFAULT REL

S equ 6
M equ 8
L equ 10

section .rodata
juice_times db 1, 3, 3, 4, 5, 4, 7, 10

section .data
temp dq 0

section .text

global time_to_make_juice
time_to_make_juice:
    lea r8, [juice_times]
    dec rdi
    mov rax, 0
    mov al, byte [r8 + rdi]
    ret

global time_to_prepare
time_to_prepare:
    mov rax, 0
    cmp rsi, 0
    je .done
    mov r10, 0
    mov r9, rdi
.loop:
    mov rdi, [r9]
    shl rdi, 32
    shr rdi, 32
    call time_to_make_juice
    add r10, rax
    add r9, 4
    dec rsi
    cmp rsi, 0
    jne .loop
    mov rax, r10    
.done:
    ret

global limes_to_cut
limes_to_cut:
    mov r9, 0
    cmp rdi, 0
    je .done
    cmp rdx, 0
    je .done
    mov rax, 0
.loop:
    mov r11, 0
    mov r11b, byte [rsi + r9]
    cmp r11, 'S'
    je .small
    cmp r11, 'M'
    je .medium
    ; large (r11 = 'L')
    add rax, L
    jmp .continue
.small:
    add rax, S
    jmp .continue
.medium:
    add rax, M
.continue:
    inc r9
    cmp rax, rdi
    jae .done
    cmp r9, rdx
    jne .loop
.done:
    mov rax, r9
    ret

global remaining_orders
remaining_orders:
    mov r11, 0
    mov rcx, rdi
    mov [temp], rsi
.loop:
    inc r11
    mov rdi, [temp]
    mov rsi, r11
    call time_to_prepare
    cmp rax, rcx
    jb .loop
    mov rax, r11
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
