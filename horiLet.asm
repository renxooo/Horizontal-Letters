.MODEL SMALL
.STACK 100h

.DATA
    letters DB 41h    ;initialize letters starting with A

.CODE
main PROC
    mov ax, @data       ;load the address of data into ax
    mov ds, ax          ;move data address into ds
    mov cl, 26          ;set counter to 26

printLetters:
    mov ah, 02h         ;DOS interrupt for output
    mov dl, letters     ;mov current letter to dl
    int 21h             ;call DOS interrrupt
    add dl, 32          ;convert current letter to lower case
    int 21h             ;print lowercase
    mov dl, 20h
    int 21h             ;print space
    sub dl, 32          ;convert back to uppercase
    inc letters         ;next letter
    loop printLetters   ;repeat until z

    mov ax, 4C00h       ;terminate program
    int 21h

main ENDP
END main