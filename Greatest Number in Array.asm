.model small
.stack
.data
arr db 01h,02h,03h,0ah,05h,06h,07h,08h
len db 07h  
MSG  DB 10,13,' The greatest Number Is  :  $'

.code
mov ax,@data
mov ds,ax 
mov ax,0h;       
mov cx,0h;

mov cl,len;
mov si,01h;
mov al,arr[0]

jmp again;

greater:
    
    mov al,arr[si]; 
    jmp next;  


again:
cmp arr[si],al;
jg greater ; 

next: inc si;
loop again   

mov bl,al; 
mov bh,0h;
        
                     
          lea Dx,msg
         
          MOV AH,09H
          INT 21H   
          
        mov  al, bl
        aam
        add  ax, "00"
        xchg al, ah
        mov  dx, ax
        mov  ah, 02h
        int  21h
        mov  dl, dh
        int  21h
          
        


hlt;



