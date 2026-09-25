DEFAULT REL

S equ 6
M equ 8
L equ 10

%macro safe_call 1
test rsp, 8
jz %%itwasfinetobeginwith
sub rsp, 8
call %1
add rsp, 8
jmp %%end
%%itwasfinetobeginwith:
call %1
%%end:
%endmacro

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
    push r10 ; save r10
    push r9 ; save r9
    push rsi ; save rsi
    safe_call time_to_make_juice
    pop rsi ; load rsi
    pop r9 ; load r9
    pop r10 ; load r10
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
    mov rcx, rdi
    mov rdi, rsi
    mov rsi, 0
.loop:
    inc rsi
    push rdi
    push rcx
    push rsi
    safe_call time_to_prepare
    pop rsi
    pop rcx
    pop rdi
    cmp rax, rcx
    jb .loop
    mov rax, rsi
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
