.model small
 
.data
    array db 5,1,6,4,8,3
    
.code

    mov ax, @data
    mov ds, ax    
    
    mov cl, 6
    

    mov si, offset array
    mov ah, 02h
    
    lerArray:
        mov dl, [si]
        add dl, 30h
        int 21h
        inc si
        
    loop lerArray        
       
end