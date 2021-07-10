
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
             
pow macro X
mov tmp, 0
mov cx, X
powloop:
mov ax, cx
add ax, cx
sub ax, 1
add tmp, ax
loop powloop
mov ax, tmp    
endm     

sqrt macro
xchg bx,ax 
mov dx,8000h 
@NextBit: 
xor dl,dh 
mov al,dl 
mul al 
cmp ax,bx 
jna @DontReset 
xor dl,dh 
@DontReset:
shr dh,1 
jnz @NextBit 
xchg ax,dx  
endm   
  

 	
tmp dw ?

x1 dw ?
x2 dw ?

a dw ?   
b dw ?      
c dw ?  
         
 
mov a,1
mov b, 20
mov c, 25 
     
;Discriminant       
pow b
mov ax,4
mul a
mul c
sub tmp,ax
mov ax,tmp



cmp tmp,0
jl @2   ; D < 0
jg @1 ; D > 0
jmp @3   ; D = 0     
   
   
@3:
;get divider
mov ax,2
mul a
mov tmp,ax

mov dx, offset string1
mov	AH,	09h           
int	21h     

xor dx,dx       
mov bx,tmp
mov ax,b 
div bx
mov x1,ax

   
;view number  X1     
    xor     cx, cx
    mov     bx, 10 
oi2:
    xor     dx,dx
    div     bx
    push    dx
    inc     cx
    test    ax, ax
    jnz     oi2
    mov     ah, 02h
oi3:
    pop     dx
    add dl, '0' 

    int 21h
    loop    oi3 
    jmp exit
                                                
@2: 
jmp message
          
@1:
sqrt
mov bx,ax

;x1
add bx,b
mov x1,bx

;x2
sub b,ax
mov ax, b
mov x2,ax     


;get diver
mov ax,2
mul a
mov tmp,ax

;x1
mov dx, offset string1
mov	AH,	09h           
int	21h     

xor dx,dx       
mov bx,tmp
mov ax,x1 
div bx
mov x1,ax

   
;view number  X1      
    xor     cx, cx
    mov     bx, 10 
oi20:
    xor     dx,dx
    div     bx

    push    dx
    inc     cx
    test    ax, ax
    jnz     oi20
    mov     ah, 02h
oi30:
    pop     dx

   
add dl, '0' 
int 21h
loop    oi30 


mov dx, offset string2
call print
   
xor dx,dx
mov bx,tmp
mov ax,x2 
div bx
mov x2,ax 
    
;view number  X2        
    xor     cx, cx
    mov     bx, 10 
oi4:
    xor     dx,dx
    div     bx
    push    dx
    inc     cx
    test    ax, ax
    jnz     oi4
    mov     ah, 02h
oi5:
    pop     dx           
    add dl, '0'
    int 21h  
    loop oi5 
 

    

;-----------------------------------------------------;
exit:  
    xor   ax,ax        
    int   16h
    ret                       
         

message:
  mov dx,offset stroka1
  jmp print
  
 
print:     
    mov	AH,	09h           
    int	21h  
 ret
             
stroka1	DB	' ne suchestvuet$' 

  
string1 db "X1 = $"
string2 db ' X2 = $'

