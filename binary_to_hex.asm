.model
.stack
.data 

hex db "0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F";
msg db "The number is :$";

.code  

mov ax,@data;
mov ds,ax;
mov Dx,offset msg
MOV AH,09H
INT 21H

mov ah,00110000b;
mov al,ah;
shr al,4
mov bl,al
mov al,ah;
shl al,4
shr al,4
mov cl,al
mov ch,0h;
mov bh,0h;  
  
 
    
        mov si,bx;        
        mov ah, 2
	    mov dl,hex[si]
	    int 21h  
	    
	             
        mov si,cx;
        mov ah, 2
	    mov dl,hex[si]
	    int 21h

