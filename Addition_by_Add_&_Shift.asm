.model small  
.data  
a db 11H  
b db 10H  
.code 

mov ax, @data     
mov ds, ax  
mov al, a         
mov bl, b        
mov ah, 0       
mov dl, 04h  


ad:
add ax, ax                  
rcl bl, 01  
jnc skip  
add ax, bx   


skip:
dec dl      
jnz ad                 
mov ch, 04h          
mov cl, 04h 
mov bx, ax 

l2:
rol bx, cl 
mov dl, bl     
and dl, 0fH      
cmp dl, 09  
jbe l4  
add dl, 07
 
l4:     
add dl, 30H  
mov ah, 02
int 21H  
dec ch        
jnz l2  
hlt
