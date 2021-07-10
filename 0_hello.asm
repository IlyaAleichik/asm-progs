
EXTERN _printf

SECTION .data
    msg db "Hello World", 0Dh, 0Ah
SECTION .text    

GLOBAL _main

_main:
    push ebp
    mov ebp,esp

    push msg
    call _printf
    add esp, 4

    mov esp, ebp
    pop ebp
