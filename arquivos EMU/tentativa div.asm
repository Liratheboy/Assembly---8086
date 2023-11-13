.model small
.data
    int1 db ?
    int2 db ?     
    msg1 db "primeiro numero: $"    
    msg2 db "segundo numero: $"   
    msg3 db "O que voce quer fazer: $"
    msg4 db "O resultado eh: $"


    cmp al,2fh
    je divisao

.code
     
    mov ax, @data
    mov ds, ax
        
   ;Inicio dos Macros;
        
    newLine macro 
        mov dl, 0ah
        mov ah, 02h
        int 21h
        
        mov dl, 0dh
        mov ah, 02h
        int 21h
    endm
            
    printf macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
    endm
    
    scan macro
        mov ah, 01h
        int 21h
    endm
    
   ;Fim dos macros
 
 
        
    mov ax, @data
    mov ds, ax
    
    printf msg1
    newLine
    scan
    mov int1, al
    
    newLine
    printf msg2
    newLine
    scan
    mov int2, al
    
    newLine
    printf msg3
    newLine
    scan

    cmp al,2fh
    je divisao


divisao:
        newLine
        sub int1, 30h
        sub int2, 30h
        mov bl, int1
        mov al, int2
        div bl
        mov bl, al
        add bl, 30h
        printf msg4
        mov dl, bl
        mov ah, 02h
        int 21h
        jmp final
           

    final:
        mov ah, 4ch
        int 21h
end