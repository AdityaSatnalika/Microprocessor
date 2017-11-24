.model small
.stack 100h
.data

buff        db  26        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
            db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
            db  26 dup(0) ;CHARACTERS ENTERED BY USER.
MSG  DB     0AH,0DH,"You Are Authorized To Proceed $";  
MSG1 DB     0AH,0DH,"aditya $";
MSG2 DB     0AH,0DH,"Enter the Password $"; 
msg3 db     0AH,0DH,"Sorry You Are 'NOT' Authorized To Proceed $";
t1   db     "aditya$";

.CODE 
            
            mov ax, @data
            mov ds, ax
            
            mov     ds, ax
            mov     es, ax  


            lea Dx,msg2
            MOV AH,09H
            INT 21H;   
                                             
            mov ah, 0Ah ;SERVICE TO CAPTURE STRING FROM KEYBOARD.
            mov dx, offset buff
            int 21h 
            
           
            
            mov si, offset buff + 1 ;NUMBER OF CHARACTERS ENTERED.
            mov cl, [ si ] ;MOVE LENGTH TO CL.
            mov ch, 0      ;CLEAR CH TO USE CX. 
            inc cx ;TO REACH CHR(13).
            add si, cx ;NOW SI POINTS TO CHR(13).
            mov al, '$'
            mov [ si ], al ; 
            
            lea     si, buff + 2
            lea     di, t1 ;
            mov cx,07h;
            
            repe    cmpsb
            jnz     not_equal

; "yes" - equal!
        mov     ah,09h;
        mov     dx,offset msg;
        int     21h;

        jmp     exit_here

not_equal:

; "no" - not equal!
        mov     ah,09h;
        mov     dx,offset msg3;
        int     21h;


exit_here:

	; wait for any key press:
	mov ah, 0
	int 16h

        ret 

            
              
         



