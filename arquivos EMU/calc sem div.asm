.model small
.data     
    msg1 db "primeiro numero: $"    
    msg2 db "segundo numero: $"   
    msg3 db "O que voce quer fazer: $"
    msg4 db "A soma eh: $"
    msg5 db "A subtracao eh: $"
    msg6 db "A multiplicacao eh: $"
    msg7 db "A divisao eh: $"


.code
              
       ;Inicio dos macros;
       
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
          
          ;Fim dos macros;
        
         
    mov ax, @data
    mov ds, ax
    
    printf msg1
    newLine
    scan
    mov bh, al
    
    newLine
    printf msg2
    newLine
    scan
    mov bl, al
    
    newLine
    printf msg3
    newLine
    scan
    
    cmp al,2bh
    je soma
    
    cmp al, 2dh
    je subtracao
           
    cmp al,2ah
    je multiplicacao 

    soma:
        newLine
        sub bh, 30h             
        add bh, bl
        printf msg4
        mov dl, bh
        mov ah, 02h
        int 21h
        jmp final
    
    subtracao:
        newLine
        add bh, 30h            
        sub bh, bl
        printf msg5
        mov dl, bh
        mov ah, 02h
        int 21h
        jmp final
    
    multiplicacao:
        newLine
        sub bh, 30h
        sub bl, 30h
        mov al, bh
        mul bl
        mov bl, al 
        add bl, 30h
        printf msg6
        mov dl, bl
        mov ah, 02h
        int 21h
        jmp final
   

    final:
        mov ah, 4ch
        int 21h
end

