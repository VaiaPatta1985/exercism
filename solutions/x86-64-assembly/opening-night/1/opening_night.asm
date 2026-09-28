default rel

section .text

global admit_group
admit_group:
    mov rax, [rdi]
.retry:
    lea rcx, [rax + rsi]    
    lock cmpxchg [rdi], rcx
    jnz .retry
    ret

global change_reel
change_reel:
    mov rax, [rdi]
.retry:
    lock cmpxchg [rdi], rsi
    jnz .retry
    ret

global sell_ticket
sell_ticket:
    mov rax, [rdi]
.retry:
    lea rcx, [rax + 1]
    lock cmpxchg [rdi], rcx
    jnz .retry
    inc rax
    ret

global claim_seat
claim_seat:
    mov rax, [rdi]
    mov r8, 0
.retry:
    cmp rax, rsi
    cmovge rax, r8
    jge .end
    lea rcx, [rax + 1]
    lock cmpxchg [rdi], rcx
    jnz .retry
    inc rax
.end:
    ret

global visit_booth
visit_booth:
    mov rax, 1
.knock:
    xchg [rdi], rax
    cmp rax, 0
    jne .occupied
    push rdi
    call rsi
    pop rdi
    jmp .get_out
.occupied:
    pause
    jmp .knock
.get_out:
    mov rax, 0
    mov [rdi], rax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
