DEFAULT REL

section .data
last_week db 0, 2, 5, 3, 7, 8, 4
days_into_current_week db 0

section .bss
current_week resb 7

section .text

global last_week_counts
last_week_counts:
    mov rax, [last_week]
    shl rax, 8
    shr rax, 8    
    ret

global current_week_counts
current_week_counts:
    mov rax, 0
    mov rdx, 0
    mov dl, byte [days_into_current_week]
    cmp rdx, 0
    je .done
    mov rax, [current_week]
    mov rcx, rdx
    sub rcx, 8
    neg rcx
    lea rcx, [8*rcx]
    shl rax, cl
    shr rax, cl
.done:
    ret

move_current_to_last:
    mov r10, [current_week]
    lea r11, [last_week]
    mov [r11], r10b
    inc r11
    shr r10, 8
    mov [r11], r10w
    shr r10, 16
    inc r11
    inc r11
    mov [r11], r10d
    ret

global save_count
save_count:
    mov rdx, 0
    mov dl, [days_into_current_week]
    cmp rdx, 7
    jne .save_into_current
    call move_current_to_last
    mov rdx, 0
    mov r11, [last_week]
.save_into_current:
    lea r8, [current_week]
    lea r8, [r8 + rdx]
    mov [r8], dil
    inc rdx
    mov [days_into_current_week], dl
    ret

global today_count
today_count:
    ; second output rdx returns value of days_into_current_week
    mov rdx, 0
    mov dl, byte [days_into_current_week]
    dec rdx
    lea r9, [current_week]
    mov rax, 0
    mov al, [r9 + rdx]
    inc rdx
    ret

global update_today_count
update_today_count:
    mov r8, 0
    mov r8b, dil
    call today_count
    add r8, rax
    lea rax, [current_week]
    lea rax, [rax + rdx - 1]
    mov [rax], r8b
    ret

global update_week_counts
update_week_counts:
    call move_current_to_last
    lea r11, [current_week]
    mov [r11], dil
    inc r11
    shr rdi, 8
    mov [r11], di
    shr rdi, 16
    inc r11
    inc r11
    mov [r11], edi
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
