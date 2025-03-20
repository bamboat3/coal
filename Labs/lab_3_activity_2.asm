
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; This program displays a message and reads a new message from the keyboard

.MODEL SMALL

.STACK 200

.DATA
    CRLF    DB 0DH,0AH,'$'
    PROMPT DB 'Enter a name of max. length 30 char.:',0DH,0AH,'$'
    STRING1 DB  'Mr.','$'
    STRING2 DB 'studies 8086 program.,','$' 
    BUFFER  DB 30
            DB 30 DUP(?)
    
    
    ;Allocate 32 bytes for BUFFER, and put the value 31 in the second byte.
    
.CODE
.STARTUP    
    
    LEA DX, PROMPT    ;Loads the address of PROMPT into DX
    MOV AH,09H
    INT 21H           ;Calls DOS interrupt INT 21H (Function 09H) to display the prompt.
    
    ;Read User Input
    MOV AH,0AH         ;Uses DOS function 0AH (Buffered Input).
    LEA DX, BUFFER     ;Reads input from the keyboard and stores it in BUFFER.
    INT 21H            
    
    ;Print a New Line
    LEA DX,CRLF         
    MOV AH,09H        ;Prints a carriage return (CR) and line feed (LF) to move to a new line.
    INT 21H    
    
    ;now display the buffer i.e. what has been read
    
    MOV AH,09H
    MOV BH,00H
    
    MOV BL,BUFFER[1]        ;Load the length of input into BL.
    MOV BUFFER[BX+2],'$'    ;Add $ at the end of the input to mark it as a string.
    LEA DX,BUFFER[2]        ;Load the actual input text into DX.
    INT 21H
            
    ;Print a New Line
    LEA DX, CRLF
    MOV AH,09H              ;Call DOS print string function to display input.
    INT 21H  
    
    ;Print the Length of Input
        
    MOV AH,02H
    MOV DL,BUFFER[1]        ; Load the length of the input into DL.
    ADD DL,30H              ; Convert it to ASCII (e.g., 1 ? '1', 9 ? '9').
    INT 21H                 ; Prints the ASCII character.
    
    ;Exit the Program                
    MOV AX,4C00H
    INT 21H
    

   

ret




