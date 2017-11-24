.model small
.stack 100h
.data

buff        db  26        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
            db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
            db  26 dup(0) ;CHARACTERS ENTERED BY USER.
MSG  DB     0AH,0DH,"The input String is :$";  
MSG1 DB     0AH,0DH,"aditya $";
MSG2 DB     0AH,0DH,"Enter the Password $";
           

            .code
main:
            mov ax, @data
            mov ds, ax              

;CAPTURE STRING FROM KEYBOARD.
            lea Dx,msg2
            MOV AH,09H
            INT 21H;                                    
            mov ah, 0Ah ;SERVICE TO CAPTURE STRING FROM KEYBOARD.
            mov dx, offset buff
            int 21h   
            lea di, buff              

;CHANGE CHR(13) BY '$'.
            mov si, offset buff + 1 ;NUMBER OF CHARACTERS ENTERED.
            mov cl, [ si ] ;MOVE LENGTH TO CL.
            mov ch, 0      ;CLEAR CH TO USE CX. 
            inc cx ;TO REACH CHR(13).
            add si, cx ;NOW SI POINTS TO CHR(13).
            mov al, '$'
            mov [ si ], al ;REPLACE CHR(13) BY '$'.            

;DISPLAY STRING.   
            lea Dx,msg
            MOV AH,09H
            INT 21H  
                          
            mov ah, 9 ;SERVICE TO DISPLAY STRING.
            mov dx, offset buff + 2 ;MUST END WITH '$'.
            int 21h

            mov ah, 4ch
            int 21h;
            
            ;cmp buff,msg1;

            end main 
            