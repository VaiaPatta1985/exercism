WEIGHT_OF_EMPTY_BOX equ 500
TRUCK_HEIGHT equ 300
PAY_PER_BOX equ 5
PAY_PER_TRUCK_TRIP equ 220

section .text

global get_box_weight
get_box_weight:
    movzx eax, dx
    movzx r8d, cx
    mul r8d
    mov r8d, eax
    movzx eax, di
    movzx ecx, si
    mul ecx
    add rax, r8
    add rax, WEIGHT_OF_EMPTY_BOX
    ret

global max_number_of_boxes
max_number_of_boxes:
    mov r8b, dil
    mov ax, TRUCK_HEIGHT
    div r8b
    mov r8b, al
    mov rax, r8
    ret

global items_to_be_moved
items_to_be_moved:
    sub edi, esi
    movsxd rax, edi
    ret

global calculate_payment
calculate_payment:
    mov r10d, edx
    mov rax, PAY_PER_TRUCK_TRIP
    mul r10
    mov r10, rax
    mov r11d, esi
    mov rax, PAY_PER_BOX
    mul r11
    add r10, rax
    sub r10, rdi
    mov r11d, ecx
    mov rax, r8
    mul r11
    ; assuming only rax is nonzero and rdx is 0
    sub rax, r10
    neg rax
    mov r10, rax
    cqo
    inc r9
    idiv r9
    mov r11, rax
    imul r9
    sub rax, r10
    neg rax
    add rax, r11
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
