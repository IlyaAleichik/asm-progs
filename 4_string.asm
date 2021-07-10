
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
    
    exit macro
        xor ax,ax
        int 16h
        ret
    endm
    
    print macro
    mov si,0
    mov cx,lnt
    mov ah,02h    
    cicle1:
    mov dl,str[si]
    int 21h
    inc si
    loop cicle1
    endm
    
    desp macro
    mov cx,lnt
    mov si,0
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    cicle2:
    mov dl, str[si]
    cmp dl, " "
    je delete
    jne check
    return:
    inc si
    loop cicle2
    int 20h
    delete:
    mov bl, " "
    jmp return
    check:
    cmp bl, " "
    je true
    jne false
    returnchk:
    int 21h
    mov bl, 0
    jmp return
    true:
    mov bl, dl
    mov dl, " "
    int 21h
    mov dl, bl
    jmp returnchk
    false:
    jmp returnchk    
    endm
    
          
;//////////////////////////          

    print      
    desp               
    exit

    str db 'Hello I  Ilya  is   my   name '
    lnt=$-str


