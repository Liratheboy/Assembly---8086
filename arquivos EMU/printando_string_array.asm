.model small
 
.data
    msg1 db "ola$"
    
.code

    printf macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
    endm
    
    mov si, 00h
    
    printf msg1[SI] 
        
    mov ah, 4ch
    int 21h