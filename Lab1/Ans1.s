	AREA RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
	DCD  0x10001000     ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
  
    ALIGN

	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
	
Reset_Handler
	LDR R1,=SRC
	LDR R2,=DST
	MOV R4,#10
	
LOOP
	LDR R3,[R1],#4
	STR R3,[R2],#4
	SUBS R4,#1
	BNE LOOP

STOP
	B STOP
	
SRC DCD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
DST DCD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	END