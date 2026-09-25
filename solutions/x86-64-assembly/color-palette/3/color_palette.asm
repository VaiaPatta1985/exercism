default rel

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
global RED
RED dd 0xFF000000
global GREEN
GREEN dd 0x00FF0000
global BLUE
BLUE dd 0x0000FF00

section .data
global base_color
base_color dd 0xFFFFFF00
temp dq 0

section .text

global get_color_value
get_color_value:
    mov rax, [rdi]
    ret

global add_base_color
add_base_color:
    mov rax, [rdi]
    mov [base_color], rax
    ret

extern combining_function

global make_color_combination
make_color_combination:
    push rdi ; save rdi
    mov edi, [base_color]
    mov eax, [rsi]
    mov esi, eax
    safe_call combining_function
    pop rdi ; load rdi
    mov [rdi], eax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
