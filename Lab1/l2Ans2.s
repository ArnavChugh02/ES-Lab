	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
 
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0, =SRC1
	LDR R1, =SRC2
	LDR R6, =DST
	MOV R5, #4
LOOP
	LDR R2, [R0], #4
	LDR R3, [R1], #4
	ADCS R4, R2, R3
	STR R4, [R6]
	SUB R5, #1
	TEQ R5, #0
	BNE LOOP
	ADC R7, #0
	STR R7, [R6]
	
STOP
	B STOP

SRC1 DCD 0X11, 0X12, 0X13, 0X31
SRC2 DCD  0X11, 0X12, 0X13, 0X31
	AREA mycode, DATA, READWRITE
DST DCD 0, 0, 0, 0, 0
	END
	
	