DEFAULT REL

MAXIMUM_DISPLAYED_SCORE equ 999999
;FIRST_SCORE_HIGHER is 1
FIRST_SCORE_LOWER equ -1
SCORES_EQUAL equ 0

section .text

global add_bonus
add_bonus:
    mov rax, rdi
    add rax, rsi
    mov rdx, MAXIMUM_DISPLAYED_SCORE
    cmp rax, rdx
    cmovg rax, rdx
    ret

global compare_scores
compare_scores:
    mov rax, SCORES_EQUAL
    cmp rdi, rsi
    setne al ; first score is higher => result is 1 (FIRST_SCORE_HIGHER)
    movzx rax, al
    mov r8, FIRST_SCORE_LOWER
    cmovl rax, r8
    ret

global validate_score
validate_score:
    mov rax, rdi
    cmp rax, rsi
    cmovl rax, rsi
    cmp rax, rdx
    cmovg rax, rdx
    ret

global top_two
top_two:
    ; Initialization
    ; Do not modify!
    xor r8d, r8d                   ; first  = 0
    xor r9d, r9d                   ; second = 0
    xor ecx, ecx                   ; index = 0
    test rdx, rdx
    jz .done

.loop:
    mov rax, qword [rsi + 8*rcx]   ; candidate
    inc rcx
;;
    mov r10, r9
    cmp rax, r9
    cmovg r9, rax                    ; second = candidate
    cmp rax, r8
    cmovg r9, r8                     ; second = first
    cmovg r8, rax                    ; first  = candidate
;;
    cmp rcx, rdx
    jb .loop                       ; go to next iteration

    ; Conclusion
    ; Do not modify!
.done:
    mov qword [rdi], r8            ; save first
    mov qword [rdi + 8], r9        ; save second
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
