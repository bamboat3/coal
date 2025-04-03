
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 200
.DATA
    Array1 DB 0,1,2,3,4,5,6,7,8,9
    Array2 DB 10 DUP(0)
    Array3 DB 11,12,13,21,22,23,31,32,33
    RowSize EQU 3      
    Msg DB 'Values: $'         ; Message to print
    NewLine DB 13,10,'$'       ; Newline for formatting
    
.CODE
.STARTUP
    MOV AX,@DATA
    MOV DS,AX
    
    ;Print Message
    MOV DX, OFFSET Msg
    MOV AH, 09H
    INT 21H
    
    ; New Line
    MOV DX, OFFSET NewLine
    MOV AH, 09H
    INT 21H
    
    ; Load Array1 Address Based Addressing Mode
 ;   MOV BX, OFFSET Array1 
    
    ; Print First Element
    ;MOV AL, [BX+5]       ; Load fifth element (1)
   ; CALL PrintNum 
    
    
      ; Load Array2 Address Indexed Addressing Mode
    
   ; MOV DI, OFFSET Array2
   ; MOV [DI+6], AL
   ; MOV SI,3
   ; MOV Array2[SI],AL 
   ; CALL PrintNum     ; Print Element
    
    
    MOV BX, OFFSET Array3 ; Address of Array3
    MOV SI, 1*RowSize     ; Beginning of 2nd row 
    MOV DI, 2*RowSize     ; Beginning of 3rd row
    MOV AL, [BX+SI+1]     ; Access 2nd element of 2nd row (22)
    MOV [BX+DI+2], AL     ; Overwrite 3rd element of 3rd row (33) with 22
    CALL PrintNum2         ; Print the value in AL (22)  
    
    ; Exit Program
    MOV AH, 4CH
    INT 21H
    
    
    ; Subroutine to Print Number
PrintNum PROC
    AAM          ; Convert AL (binary) to ASCII
    ADD AX, 3030H  ; Convert to ASCII character codes
    MOV DX, AX
    MOV AH, 02H   ; DOS Print Character Function
    INT 21H
    RET
PrintNum ENDP 

; Subroutine to Print Number
PrintNum2 PROC
    ; Extract each digit of the number in AL and print it
    MOV AH, 0       ; Clear AH for proper conversion
    ADD AL, '0'     ; Convert AL to ASCII
    MOV DL, AL      ; Move the ASCII value to DL for printing
    MOV AH, 02H     ; DOS print character function
    INT 21H         ; Print character
    RET
PrintNum2 ENDP

ret




