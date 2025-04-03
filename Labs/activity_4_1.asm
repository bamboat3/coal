
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; This program reads two numbers from the keyboard and
; gives their sum. This program uses internal registers
; to store the variables.
.MODEL SMALL
.STACK 200
.DATA
 CRLF DB 0DH,0AH,'$'
 PROMPT1 DB 'Enter the first positive integer: ','$'
 PROMPT2 DB 'Enter the second positive integer: ','$'
 PROMPT3 DB 'The sum of the two numbers is: ','$'
.CODE
.STARTUP
LEA DX,PROMPT1 ;DISPLAY PROMPT1
 MOV AH,09H
 INT 21H
 MOV AH,01H ;READ FIRST NUMBER
 INT 21H
 SUB AL,30H ;Convert character to number
 MOV CL,AL  ;SAVE THE NUMBER IN CL
MOV AH,01H ;READ SECOND NUMBER
 INT 21H
 SUB AL,30H ;Convert character to number
 ADD AL,CL ;PERFORM ADDITION AND SAVE RESULT IN CL
 MOV CL,AL
 ADD CL,30H ;CONVERT DIGIT TO CHARACTER
 LEA DX,CRLF ;MOVE CURSOR TO NEXT LINE
 MOV AH,09H
 INT 21H
 LEA DX,PROMPT3 ;DISPLAY PROMPT3
 MOV AH,09H
 INT 21H
 MOV DL,CL
 MOV AH,02H
 INT 21H
.EXIT
END

ret




