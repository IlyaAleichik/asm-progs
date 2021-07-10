
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

var1 dw ?

mov ax,5   ;5
mov bx,3   ;a
mul bx     ;ax <- 5 * a
mov var1,ax  ;var1 <- ax          
          
mov ax,12  ;12
mov bx,3   ;b
mul bx     ;ax <- 12 * b

add ax,var1  ;ax <- ax + var1
mov var1,ax    ;var1 <- ax
 
mov ax,8   ;8
mov bx,3   ;d
mul bx     ;ax <- 8 * d 
                 
mov bx,ax
mov ax, var1 
div bx  

ret




