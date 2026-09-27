%include "debug.mac"

default rel

NEAREST equ 0
FLOOR equ 1
CEILING equ 2
TRUNCATE equ 3


%define STACKPOINTER rsp

%macro safe_call 1
test STACKPOINTER, 8
jz %%itwasfinetobeginwith
sub STACKPOINTER, 8
call %1
add STACKPOINTER, 8
jmp %%end
%%itwasfinetobeginwith:
call %1
%%end:
%endmacro

section .rodata
currency_characters db "GBPEURJPYAUDBRLCNYCADINR"

section .text

global stringify_currency
stringify_currency:
    lea rcx, [currency_characters]
    imul rsi, 3
    lea rsi, [rsi + rcx]
    mov rcx, 3
    rep movsb
    mov [rdi], byte 0
    ret

global exchange_rate
exchange_rate:
    movsd xmm0, [rdx + 8*rdi]
    movsd xmm1, [rdx + 8*rsi]
    divsd xmm1, xmm0
    movsd xmm0, xmm1
    ret

global get_value_of_bills
get_value_of_bills:
    imul rdi, rsi
    mov rax, rdi
    ret

global get_number_of_bills
get_number_of_bills:
    roundss xmm0, xmm0, FLOOR
    cvtss2si rax, xmm0
    mov rdx, 0
    idiv rdi
    ret

global exchangeable_value
exchangeable_value:
    add rdi, 100
    cvtsi2sd xmm2, rdi
    mov rdx, 100
    cvtsi2sd xmm3, rdx
    divsd xmm2, xmm3
    mulsd xmm1, xmm2
    cvtsd2ss xmm1, xmm1
    divss xmm0, xmm1
    push rsi
    mov rdi, rsi
    call get_number_of_bills
    pop rsi
    mov rdi, rax
    safe_call get_value_of_bills
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
