%include "debug.mac"

default rel

ENTRY_SIZE equ 120

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

section .text

global create_item_entry
create_item_entry:
    mov [rdi], rsi
    add rdi, 8
    mov [rdi], rdx
    add rdi, 8
    mov [rdi], rcx
    add rdi, 8
    mov [rdi], r8
    add rdi, 8
    mov [rdi], r9
    add rdi, 8
    mov r11, 0
.categories:
    cmp r9, r11
    je .done
    inc r11
    mov rdx, [rsp + 8*r11]
    mov [rdi], rdx
    add rdi, 8
    jmp .categories
.done:
    ret

global create_monthly_list
create_monthly_list:
    push rdi ; save rdi
    safe_call rsi
    pop rcx ; load rdi into rcx
    push rax
    mov rdi, rax
    mov rax, 0
    rep stosb
    pop rax
    ret

global insert_found_item
insert_found_item:
    debugu64 [rdx]
    mov r8, rdx
    imul rsi, ENTRY_SIZE
    add rdi, rsi
    mov rsi, r8
    mov rcx, ENTRY_SIZE
    rep movsb
    ret

global print_item
print_item:
    push r13
    mov r13, rsp
    mov r10, rdx
    mov r11, rdx
    imul r11, ENTRY_SIZE
    add rsi, r11
    mov r11, rcx
    mov rdx, [rsi]
    mov rcx, [rsi + 8]
    mov r8, [rsi + 16]
    mov r9, [rsi + 24]
    lea rax, [rsi + 40]
    push rax
    mov rax, [rsi + 32]
    push rax
    mov rsi, r10
    mov rdi, 0
    ; safe_call r11 not used because stack has parameters
    ; also not needed as rsp hex ends in 0 as it should
    ; otherwise rsp manipulation would take place before parameter passing
    call r11
    mov rsp, r13
    pop r13
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
