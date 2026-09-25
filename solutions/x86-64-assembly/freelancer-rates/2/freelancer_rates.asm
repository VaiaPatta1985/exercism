DEFAULT REL

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
workhours_per_day db 8
workdays_per_month db 22

section .text

global daily_rate
daily_rate:
    mov rax, 0
    mov al, [workhours_per_day]
    cvtsi2sd xmm3, rax
    mulsd xmm0, xmm3
    ret

global apply_discount
apply_discount:
    mov rax, 100
    cvtsi2sd xmm3, rax
    subsd xmm3, xmm1
    mulsd xmm0, xmm3
    cvtsi2sd xmm3, rax
    divsd xmm0, xmm3
    ret

global monthly_rate
monthly_rate:
    safe_call daily_rate
    mov rax, 0
    mov al, [workdays_per_month]
    cvtsi2sd xmm3, rax
    mulsd xmm0, xmm3
    safe_call apply_discount
    roundsd xmm0, xmm0, 2
    cvtsd2si rax, xmm0
    ret

global days_in_budget
days_in_budget:
    push rdi ; save rdi
    safe_call daily_rate
    safe_call apply_discount
    pop rdi ; load rdi
    cvtsi2sd xmm4, rdi
    divsd xmm4, xmm0
    roundsd xmm4, xmm4, 1
    mov rax, 0
    cvtsd2si eax, xmm4
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
