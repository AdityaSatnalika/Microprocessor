.model small
.stack
.data
arr db 01h,02h,03h,04h,05h,06h,07h,08h
len db 07h
key db 07h

.code
mov ax,@data
mov ds,ax

mov ch, len
mov cl,00h


l1:
cmp ch,cl
jl notfound

mov ax,0000h
add al,ch
add al,cl
sar al,1

mov si,ax

mov bh, [si]
mov bl,key

cmp bh,bl

je found
jg lesser
jl bigger

bigger:
mov cl,al
jmp l1

lesser:
mov ch,al
jmp l1

found:
mov ax,si
hlt

notfound:   
mov ax, 0F0Fh
hlt
