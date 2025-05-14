ORG 100h           ; For .COM file

.MODEL SMALL
.STACK 200h

.DATA              ; Data Segment
myWord DW 0        ; Reserve space at label (optional)

.CODE
START:
    MOV AX, @DATA  ; Set DS correctly
    MOV DS, AX

    MOV AX, 8A53h
    MOV BX, 0200h
    MOV CX, 692Dh
    MOV DX, 0E6CBh

    MOV WORD PTR [BX], 7B8Ah  ; Safe memory write using DS:0200h

    AND AX, BX
    AND CX, WORD PTR [BX]
    OR WORD PTR [BX], CX
    OR WORD PTR [BX], 6F0Ch
    XOR AX, 94D7h
    XOR DX, 0C4D1h

    ; INT 7 is undocumented or hardware-related, avoid it
    ; You probably meant INT 20h or INT 21h to terminate the program
    ; For COM programs, INT 20h is common
    INT 20h         ; Terminate program safely

END START
