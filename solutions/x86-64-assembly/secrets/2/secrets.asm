SHARED_PRIVATE_KEY equ 0b1011001100111100

section .text

global extract_higher_bits
extract_higher_bits:
    mov rax, rdi
    shr rax, 8
    ret

global extract_lower_bits
extract_lower_bits:
    mov rax, rdi
    and rax, 0xFF
    ret

global extract_redundant_bits
extract_redundant_bits:
    call extract_higher_bits
    mov r8, rax
    call extract_lower_bits
    and rax, r8
    ret

global set_message_bits
set_message_bits:
    call extract_higher_bits
    mov r9, rax
    call extract_lower_bits
    or rax, r9
    ret

global rotate_private_key
rotate_private_key:
    call extract_redundant_bits
    popcnt rcx, rax
    mov rax, SHARED_PRIVATE_KEY
    rol ax, cl
    ret

global format_private_key
format_private_key:
    call rotate_private_key
    mov rdi, rax
    call extract_lower_bits
    mov r11, rax
    call extract_higher_bits
    mov r10, rax
    xor r11, r10
    not r11
    mov rax, r11
    ret

global decrypt_message
decrypt_message:
    mov rdx, rdi
    call format_private_key
    mov rdi, rdx
    mov rdx, rax
    shl rdx, 8
    call set_message_bits
    or rax, rdx
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
