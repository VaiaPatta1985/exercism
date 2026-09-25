C2 equ 2
C3 equ 3
C4 equ 4
C5 equ 5
C6 equ 6
C7 equ 7
C8 equ 8
C9 equ 9
C10 equ 10
CJ equ 11
CQ equ 12
CK equ 13
CA equ 14

TRUE equ 1
FALSE equ 0

VALUE_OF_FACE equ 10
LOW_ACE equ 1
HIGH_ACE equ 11

DOUBLEDOWN_MIN equ 9
DOUBLEDOWN_MAX equ 11

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

global value_of_card
value_of_card:
    mov rax, rdi
    cmp rdi, CJ
    jl .done
    mov rax, VALUE_OF_FACE
    cmp rdi, CA
    jne .done
    mov rax, LOW_ACE
.done:
    ret

global higher_card
higher_card:
    push rdi ; save rdi
    push rsi ; save rsi
    safe_call value_of_card
    mov r8, rax
    pop rsi ; load rsi
    mov rdi, rsi
    push r8 ; save r8
    push rsi ; save rsi
    safe_call value_of_card
    mov rdx, 0
    mov r9, rax
    pop rsi ; load rsi
    pop r8 ; load r8
    pop rdi ; load rdi
    mov rax, rsi
    cmp r8, r9
    jb .done
    jne .first_was_larger
    mov rdx, rax
.first_was_larger:
    mov rax, rdi
.done:
    ret

global value_of_ace
value_of_ace:
    mov rax, 1
    cmp rdi, CA
    je .done
    cmp rsi, CA
    je .done
    push rsi ; save rsi
    safe_call value_of_card
    pop rsi ; load rsi
    mov r8, rax
    mov rdi, rsi
    push r8 ; save r8
    safe_call value_of_card
    pop r8; load r8
    add r8, rax
    mov rax, 1
    cmp r8, 10
    ja .done
    mov rax, HIGH_ACE
.done:
    ret

global is_blackjack
is_blackjack:
    cmp rdi, CA
    je .check_second_ten
    cmp rsi, CA
    je .check_first_ten
    jmp .return_false
.check_second_ten:
    mov rdi, rsi
.check_first_ten:
    safe_call value_of_card
    cmp rax, 10
    jne .return_false
    ; otherwise return true
    mov rax, TRUE
    jmp .done
.return_false:
    mov rax, FALSE
.done:
    ret

global can_split_pairs
can_split_pairs:
    push rsi ; save rsi
    safe_call value_of_card
    pop rsi ; load rsi
    mov r8, rax
    mov rdi, rsi
    push r8 ; save r8
    safe_call value_of_card
    pop r8 ; load r8
    mov r9, rax
    mov rax, FALSE
    cmp r8, r9
    jne .done
    mov rax, TRUE
.done:
    ret

global can_double_down
can_double_down:
    safe_call value_of_card
    mov r8, rax
    mov rdi, rsi
    push r8 ; save r8
    safe_call value_of_card
    pop r8 ; load r8
    add r8, rax
    mov rax, FALSE
    cmp r8, DOUBLEDOWN_MIN
    jb .done
    cmp r8, DOUBLEDOWN_MAX
    ja .done
    mov rax, TRUE
.done:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
