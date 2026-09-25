SHARED_PRIVATE_KEY equ 0b1011001100111100

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
    safe_call extract_higher_bits
    mov r8, rax
    push r8
    safe_call extract_lower_bits
    pop r8
    and rax, r8
    ret

global set_message_bits
set_message_bits:
    safe_call extract_higher_bits
    mov r9, rax
    push r9
    safe_call extract_lower_bits
    pop r9
    or rax, r9
    ret

global rotate_private_key
rotate_private_key:
    safe_call extract_redundant_bits
    popcnt rcx, rax
    mov rax, SHARED_PRIVATE_KEY
    rol ax, cl
    ret

global format_private_key
format_private_key:
    safe_call rotate_private_key
    mov rdi, rax
    safe_call extract_lower_bits
    mov r11, rax
    push r11
    safe_call extract_higher_bits
    pop r11
    mov r10, rax
    xor r11, r10
    not r11
    mov rax, r11
    ret

global decrypt_message
decrypt_message:
    push rdi
    safe_call format_private_key
    pop rdi
    mov rdx, rax
    shl rdx, 8
    push rdx
    safe_call set_message_bits
    pop rdx
    or rax, rdx
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
