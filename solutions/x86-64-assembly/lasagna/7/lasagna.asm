MINUTES_IN_OVEN equ 40
PREPARATION_TIME_PER_LAYER equ 2

; not to be used for anything else
%define ALIGNMENT_HELPER r12

%macro safe_call 1
mov ALIGNMENT_HELPER, 0
; assume stack aligned
push rbp
; now unaligned
mov rbp, rsp
and rsp, 8
cmp rsp, 0
; should NOT be 0 (should be unaligned)
jne %%itwasfinetobeginwith
; needs one more push
sub rbp, 8; to account for the push that follows
push rbp
inc ALIGNMENT_HELPER
%%itwasfinetobeginwith:
; now unaligned
mov rsp, rbp
pop rbp
; now aligned
call %1
cmp ALIGNMENT_HELPER, 0
je %%noactionneeded
pop ALIGNMENT_HELPER
%%noactionneeded:
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
    mov rax, rdi
    imul rax, PREPARATION_TIME_PER_LAYER
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
