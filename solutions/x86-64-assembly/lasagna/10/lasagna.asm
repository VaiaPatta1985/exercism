MINUTES_IN_OVEN equ 40
PREPARATION_TIME_PER_LAYER equ 2

%define STACKPOINTER rsp

%macro safe_call 1
; DO NOT USE IF PASSING ARGUMENTS THROUGH THE STACK
; ([rsp + 8] will contain garbage)
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

%define output rax
%define input_1 rdi
%define input_2 rsi

section .text

global expected_minutes_in_oven
expected_minutes_in_oven:
    mov output, MINUTES_IN_OVEN
    ret

global remaining_minutes_in_oven
remaining_minutes_in_oven:
%define minutes_already_in_oven input_1
    call expected_minutes_in_oven
    sub output, minutes_already_in_oven
    ret
%undef minutes_already_in_oven

global preparation_time_in_minutes
preparation_time_in_minutes:
%define number_of_layers input_1
    imul output, number_of_layers, PREPARATION_TIME_PER_LAYER
    ret
%undef number_of_layers

global elapsed_time_in_minutes
elapsed_time_in_minutes:
%define minutes_already_in_oven input_1
%define number_of_layers input_2
    push number_of_layers
    push minutes_already_in_oven
    safe_call preparation_time_in_minutes
    pop minutes_already_in_oven
    pop number_of_layers
    add output, number_of_layers
    ret
%undef minutes_already_in_oven
%undef number_of_layers

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
