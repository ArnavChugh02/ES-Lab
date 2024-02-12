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
	MOV R0, #10         ; Set the value of 'n' (number of natural numbers)
    MOV R1, #0          ; Initialize sum to zero
    MOV R2, #1   		; Initialize the first natural number
	MOV R3, #1			
    
SumLoop
    MLA R1, R2, R3, R1  ; R1 += R2 * R3(1) (accumulate R2 to the sum)
    ADD R2, R2, #1      ; Increment the natural number for the next iteration
    SUBS R0, R0, #1     ; Decrement the count 'n'
    BNE SumLoop
	
STOP 
	B STOP
	END
	