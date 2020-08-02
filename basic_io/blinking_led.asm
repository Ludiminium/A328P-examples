.ORG   0x0000                   ; Next instruction to be written at 0x0000 
RJMP   main                     ; Reset vector

main:
	LDI r16, 0xFF				; Fill register 16 with bits
	OUT DDRB, r16				; Set Data Direction Register B to output for all pins

loop:
	SBI PortB, 5				; Set bit on pin 13
	RCALL delay					; Relative call to delay of half a second
	CBI PortB, 5				; Clear bit on pin 13
	RCALL delay
	RJMP loop					; Relative jump to loop

delay:
	LDI r16, 31					; Load r1 with 31

outer_loop:						; Store 1021 = 0b1111111101 in two registers r24:r25
	LDI r24, low(1021)			; Load the lower bit series into r24 = 11101
	LDI r25, high(1021)			; Load the upper bit series into r25 = 11111

delay_loop:
	ADIW r24:r25, 1				; Increase r24:r25 with 1
	BRNE delay_loop				; If r24:r25 is not 0 (overflow), goto delay_loop
	DEC r16						; Decrement r16 with 1
	BRNE outer_loop				; If r16 is not 0, goto outer_loop
	RET							; Returns to relative call