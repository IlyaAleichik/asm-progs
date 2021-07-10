
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



mov ax,6  ; delimoe
mov bx,2  ; delitel
call mdiv ; result in AX <- AX/BX
call mmul ; result in  DX <-AX*BX


mmul:
xor dx,dx
mov cx, ax
@l:
add dx, bx
loop @l
ret


mdiv proc
xor cx,cx 
cicle:
sub ax, bx
inc cx
cmp ax,0
jl iszero1
jz iszero2
jmp cicle

iszero1:
sub cx, 1

iszero2:
mov ax,cx
 ret
endp


