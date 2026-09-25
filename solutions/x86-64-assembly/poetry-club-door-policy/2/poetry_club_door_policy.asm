DEFAULT REL

UPPER_TO_LOWER equ 32

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
say_please db ", please.", 0
length_of_please dq $ - say_please

section .text

global front_door_response
front_door_response:
    mov rax, 0
    mov al, byte [rdi]
    ret

global front_door_password
front_door_password:
    mov rax, 0
    mov al, [rdi]
    cmp rax, 0
    je .done
    lea r8, [rax - UPPER_TO_LOWER]
    cmp rax, 'a'
    cmovge rax, r8
    mov [rdi], al
    mov r9, 1
.loop:
    mov al, [rdi + r9]
    cmp rax, 0
    je .done
    lea r8, [rax + UPPER_TO_LOWER]
    cmp rax, 'a'
    cmovl rax, r8
    mov [rdi + r9], al
    inc r9
    jmp .loop
.done:
    ret

global back_door_response
back_door_response:
    mov rax, 0
    mov r8, 0
.loopgotoend:
    mov al, [rdi + r8]
    inc r8
    cmp rax, 0
    jne .loopgotoend
    dec r8
.loop:
    dec r8
    mov al, [rdi + r8]
    cmp rax, 'A'
    jl .loop
    cmp rax, 'z'
    jg .loop
    cmp rax, 'Z'
    jle .done
    cmp rax, 'a'
    jl .loop
.done:
    ret

global back_door_password
back_door_password:
    push rdi
    push rsi
    mov rdi, rsi
    safe_call front_door_password
    pop rsi
    pop rdi
    mov rax, 0
    mov rcx, 0
.loop:
    mov al, [rsi + rcx]
    inc rcx
    cmp rax, 0
    jne .loop
    dec rcx
    rep movsb
    lea rsi, [say_please]
    mov rcx, [length_of_please]
    rep movsb
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
