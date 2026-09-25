MINUTES_IN_OVEN equ 40
PREPARATION_TIME_PER_LAYER equ 2

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

global expected_minutes_in_oven
expected_minutes_in_oven:
    mov rax, MINUTES_IN_OVEN
    ret

global remaining_minutes_in_oven
remaining_minutes_in_oven:
    call expected_minutes_in_oven
    sub rax, rdi
    ret

global preparation_time_in_minutes
preparation_time_in_minutes:
    imul rax, rdi, PREPARATION_TIME_PER_LAYER
    ret

global elapsed_time_in_minutes
elapsed_time_in_minutes:
    push rsi ; save rsi
    safe_call preparation_time_in_minutes
    pop rsi ; load rsi
    add rax, rsi
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
