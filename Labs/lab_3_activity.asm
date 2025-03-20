
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here

.MODEL SMALL

.STACK 200

.DATA
    MESSAGE  DB 'This is the message to be displayed:$'
    MESSAGE2 DB 'The message you just entered:;', '$' ; Added newline for clarity

    BUF DB 10  ; Maximum number of characters to be read
        DB ?   ; Stores actual number of characters entered
        DB 10 DUP(?) ; Reserve 10 bytes for input
  

.CODE

    MOV AX,@DATA
    MOV DS,AX

    ; Display the first message
    LEA DX, MESSAGE
    MOV AH, 09H
    INT 21H

    ; Take user input
    MOV AH, 0AH
    MOV DX, OFFSET BUF
    INT 21H

    ; Display second message
    LEA DX,MESSAGE2
    MOV AH,09H
    INT 21H   
    
    ; Exit program    
    MOV AX,4C00H
    INT 21H
    
  END




