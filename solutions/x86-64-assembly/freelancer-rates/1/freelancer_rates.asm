DEFAULT REL

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
    call daily_rate
    mov rax, 0
    mov al, [workdays_per_month]
    cvtsi2sd xmm3, rax
    mulsd xmm0, xmm3
    call apply_discount
    roundsd xmm0, xmm0, 2
    cvtsd2si rax, xmm0
    ret

global days_in_budget
days_in_budget:
    cvtsi2sd xmm4, rdi
    call daily_rate
    call apply_discount
    divsd xmm4, xmm0
    roundsd xmm4, xmm4, 1
    mov rax, 0
    cvtsd2si eax, xmm4
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
