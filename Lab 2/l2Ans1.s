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
	LDR R3, =SRC
	MOV R4, #10
	LDR R5, =DST
LOOP
	LDR R1, [R3], #4
	ADDS R0, R1
	SUBS R4, #1
	BNE LOOP
	STR R0, [R5], #4
	STR R2, [R5]
	
STOP
	B STOP
	
SRC DCD 0x12, 0X13, 0X15, 0X7, 0X8, 0x97, 0X170, 0X198, 0X31, 0X99
	AREA mycode, DATA, READWRITE
DST DCD 0, 0,0,0,0,0,0,0,0,0
	END
	