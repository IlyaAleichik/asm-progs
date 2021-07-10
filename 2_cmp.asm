
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
             
   
  	
    a dw ?
    b dw ?
    c dw ?    
            
    mov a, 3  ;A[HL] <- 5
    mov b, 4  ;B[HL] <- 5
    mov c, 5  ;C[HL] <- 5    

@available_triangl:         
    mov ax,a
    add ax,b
    cmp ax,c
    jbe message   
    
    mov ax,c
    add ax,b
    cmp ax,a
    jbe message
    
    mov ax,c
    add ax,a
    cmp ax,b
    jbe message 
     
    mov dx,offset mes1 
    mov	AH,	09h           
    int	21h
    
    
@type_tryangle:
    mov dx,offset stroka2
    mov ax,a
    cmp ax,b  
    jnz @1  
    
    mov ax,b
    cmp ax,c
    jnz @1
 
    mov ax,c
    cmp ax,a
    jnz @1
             
    jmp print
    
    
 @1:
    mov dx,offset stroka1   
    mov ax,a
    cmp ax,b  
    jz @2
    
    mov ax,b
    cmp ax,c
    jz @2
 
    mov ax,c
    cmp ax,a    
    jz @2
    
    jmp print  
                   
  
 @2:
    mov dx,offset stroka3   
    jmp print
        
    

    
    
message:
  mov dx,offset mes2
  jmp print   
  
print:     
    mov	AH,	09h           
    int	21h  
     
;-----------------------------------------------------;
exit:  
    xor   ax,ax        
    int   16h        
    ret                

  
stroka1	DB	' raznostorony$' 
stroka2	DB	' ravnostoronyi$'
stroka3	DB	' ravnobedreny$'
mes1 DB 'sushestvuet$' 
mes2 DB 'ne sushestvuet$'

   
   
