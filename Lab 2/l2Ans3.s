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
	LDR R6, =DST
	LDR R3, =SRC1
	LDR R4, =SRC2
	MOV R5, #4
	LDR R0,=0X20000000
	MSR xPSR, R0
BACK 
	LDR R0,[R3],#4
	LDR R1,[R4],#4
	SBCS R2,R0,R1
	STR R2,[R6],#4
	SUBS R5,#1
	TEQ R5,#0; updates only N & Z flags
	BNE BACK
	SBC R7,#0
	STR R7,[R6]
	
STOP B STOP

SRC1 DCD 0X21, 0X32, 0X41, 0X51
SRC2 DCD 0X12, 0X64, 0X17, 0X19
	AREA mycodedata, DATA, READWRITE
DST DCD 0, 0,0,0,0
	END