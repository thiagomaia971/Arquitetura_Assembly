org 100h
        
mov AX, 0000h;   
mov DS, AX;
      ;Configurando a int 00h
mov [2h], 0700h;  CS do local de memoria onde o tratamento da memoria esta
mov [0h], 012Bh;  IP
  
int 00h;
      ;Configurando a int 01h
mov AX, 0000h;   
mov DS, AX;

mov [6h], 0700h;
mov [4h], 45h;
mov [5h], 01h;

int 01h
          

ret
           
int00: 
    mov DI, 0000h;
    mov AX, 0FF00h   ;Mudando o registrador DS de lugar para nao
    mov DS, AX;      ;salvar os caracteres no lugar da int 00 e int 01
    
    aqui:   
                  
        mov AH, 00h;     ;Configurando a int 16h
        int 16h;         ;Int 16 com AH = 00h, espera uma tecla; muda o AH e o AL
        
        cmp AL, 0Dh;
        jz acabou;
        
        mov [DI], AL;
        inc DI; inc = add di, 0001h 
        inc CX;
        
    loop aqui
             
    acabou:
    mov [di], '$'
    ret  

int01:

    mov DI, 0000h;
    mov AX, 0FF00h   ;Mudando o registrador DS de lugar para nao
    mov DS, AX;
    _loop:
                    
        mov AH, 02h;
        mov DL, [DI];
        
        cmp DL, '$'
        jz terminou
        
        int 21h;
        
        inc DI;
    
    loop _loop
    
    terminou:
           