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
	MOV R0, #68
	MOV R1, #24
	
LOOP
	CMP R0, R1
	BHI BIG
	BLO SMOL
	BEQ DONE
BIG
	SUB R0, R0, R1
	B LOOP
SMOL
	SUB R1, R1, R0
	B LOOP
DONE
	MOV R5, R1
	
STOP
	B STOP
	
	END

	