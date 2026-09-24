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
    mov r10, rdi
    mov r11, rsi
    mov rdx, 0
    call value_of_card
    mov r8, rax
    mov rdi, rsi
    call value_of_card
    mov r9, rax
    mov rax, r11
    cmp r8, r9
    jb .done
    jne .first_was_larger
    mov rdx, rax
.first_was_larger:
    mov rax, r10
.done:
    ret

global value_of_ace
value_of_ace:
    mov rax, 1
    cmp rdi, CA
    je .done
    cmp rsi, CA
    je .done
    call value_of_card
    mov r8, rax
    mov rdi, rsi
    call value_of_card
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
    call value_of_card
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
    call value_of_card
    mov r8, rax
    mov rdi, rsi
    call value_of_card
    mov r9, rax
    mov rax, FALSE
    cmp r8, r9
    jne .done
    mov rax, TRUE
.done:
    ret

global can_double_down
can_double_down:
    call value_of_card
    mov r8, rax
    mov rdi, rsi
    call value_of_card
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
