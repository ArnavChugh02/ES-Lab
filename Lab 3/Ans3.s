	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
 
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	MOV R0, #14
	MOV R1, #21
	MOV R2, #1
LOOP
	MUL R3, R0, R2
	B MOD
MODC
	CMP R5, #0
	BEQ DONE
	BNE INC
INC
	ADD R2, #1
	B LOOP
MOD
LOO
	CMP R3, R1
	BLO LO
	SUB R3, R1
	B LOO
LO
	MOV R5, R3
	B MODC
DONE
	MUL R6, R2, R0
	
STOP
	B STOP
	
	END