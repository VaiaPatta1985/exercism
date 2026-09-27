%include "debug.mac"

default rel

REJECT equ 0

section .bss
remembered_function resq 1

section .text

global remember_transaction
remember_transaction:
    mov [remembered_function], rdi
    ret

global apply_remembered
apply_remembered:
    jmp [remembered_function]

global register_transaction
register_transaction:
    mov [rdi + 8*rsi], rdx
    ret

global select_transaction
select_transaction:
    mov rcx, rdi
    mov rdi, rdx
    jmp [rcx + 8*rsi]

global process_statement
process_statement:
    cmp rdx, 0
    cmove rax, rdi
    je .end
    mov rcx, 0
.loop:
    push rsi
    push rdx
    push rcx
    call [rsi + 8*rcx]
    pop rcx
    pop rdx
    pop rsi
    inc rcx
    mov rdi, rax
    cmp rcx, rdx
    jne .loop
.end:
    ret

global process_with_guard
process_with_guard:
    mov r8, 0
    cmp rdx, 0
    cmove rax, rdi
    je .end
    mov r9, 0
.loop:
    sub rsp, 8
    push rsi
    push r8
    push rdx
    push r9
    push rdi
    push rcx
    call [rsi + 8*r9]
    pop rcx
    pop rdi
    push rdi
    mov rdi, rax
    push rdi
    push rcx
    sub rsp, 8
    call rcx
    add rsp, 8
    pop rcx
    pop rdi
    cmp rax, REJECT
    je .keep_old_value
    pop r10
    jmp .continue
.keep_old_value:
    pop rdi
.continue:    
    pop r9
    pop rdx
    pop r8
    pop rsi
    add rsp, 8
    cmp rax, REJECT
    je .doesntcount
    inc r8
.doesntcount:
    inc r9
    cmp r9, rdx
    jne .loop
.end:
    mov rdx, r8
    mov rax, rdi
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
