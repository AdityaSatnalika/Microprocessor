.model small
.stack
.data
arr db 01h,00h,-03h,00h,-05h,06h,07h,08h
len db 07h  
                MSG  DB  0DH,0AH, ' GREATER  $'
                MSG1 DB  0DH,0AH, ' LESSER  $'   
                MSG2 DB  0DH,0AH, ' ZERO  $'


.code   
 


mov ax,@data
mov ds,ax 
mov ax,0h;       
mov cx,0h;
mov cl,len;
mov si,0h;



jmp again;

greater:

   		  LEA DX,MSG
          MOV AH,09H
          INT 21H
 
		

jmp next;  

lesser:

   		LEA DX,MSG1
          MOV AH,09H
          INT 21H


jmp next;

zero:

   		mov dx, offset msg2
		mov ah, 9
		int 21h 
		;msg2 db "zero $"

jmp next;
		
		



again: 
mov bl,arr[si]
cmp arr[si],0h;
jg greater ;
jl lesser;
jz zero;
next: 
inc si;
loop again 


hlt; 


