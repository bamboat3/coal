
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h       
.MODEL SMALL
.STACK 100h

.DATA
    promptMessage DB 'Enter your password (3 characters): $'
    password DB 3, 0, 3 DUP('$')    ; Allocate space for 3 characters + 2 bytes for the length
    nameMessage DB 'Name: Mustafa Ali Bamboat', 0DH, 0AH, '$'
    idMessage DB 'ID: 12345', 0DH, 0AH, '$'

.CODE
main:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    MOV AH, 09H
    MOV DX, OFFSET promptMessage
    INT 21H

    ; Read password (3 characters), without echo
    MOV CX, 3                ; Set counter for 3 characters
    MOV AH, 08H              ; DOS function to read a single character without echo
read_password:
    INT 21H                  ; Read character into AL
    MOV [password+2], AL     ; Store character at password+2 offset
    INC password+1           ; Increase the character count
    LOOP read_password       ; Repeat until 3 characters are entered

    ; Display name message
    MOV AH, 09H
    MOV DX, OFFSET nameMessage
    INT 21H

    ; Display ID message
    MOV AH, 09H
    MOV DX, OFFSET idMessage
    INT 21H

    ; Exit program
    MOV AH, 4Ch
    INT 21H

END main

ret




