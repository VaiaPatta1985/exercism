%include "debug.mac"

default rel

%ifndef MAGAZINE_LAYOUT_ASM
%define MAGAZINE_LAYOUT_ASM

COLUMN_COUNT equ 4
COLUMN_STRIDE equ 18
SPACE equ ' '
RULE equ '='
RULE_WIDTH equ 4
PLAIN equ '.'
RULED equ '-'
BOXED equ '#'

%define COUNTER rcx

%macro fill_run 3
mov COUNTER, %2
cmp COUNTER, 0
je %%end
mov COUNTER, %1
%%loop:
mov [COUNTER], byte %3
inc COUNTER
sub COUNTER, %1
cmp COUNTER, %2
je %%end
add COUNTER, %1
jmp %%loop
%%end:
%endmacro

%macro lay_columns 2
%rep COLUMN_COUNT
mov [%1], %2
add %1, 8
add %2, COLUMN_STRIDE
%endrep
%endmacro

%macro set_header 2
%if %2 == 0
%define style PLAIN
%elif %2 == 1
%define style RULED
%else ; %2 == 2
%define style BOXED
%endif
mov [%1], byte style
%endmacro

%endif

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
