.model small
 
.data
    array db 5,1,6,4,8,3
    temp db ?
    
.code

    mov ax, @data
    mov ds, ax
    
    mov si, offset array
    ;mov ah, 02h
    
    cmp [si+1], [si]
    jl trocaPosicao

end