.global diffF32


.text


diffF32:
	PUSH {R4}
	MOV R4,#0
calculate_diff:
	CMP R3,#0
	BEQ diff32_end
	VLDR S1,[R1,R4]
	VLDR S2,[R2,R4]
	VSUB.F32 S0,S1,S2
	VSTR S0,[R0,R4]
	ADD R4,R4,#4
	/*	
	ADD R1,R1,#4
	ADD R2,R2,#4	
	ADD R0,R0,#4
	*/
	
	SUB R3,R3,#1
	B calculate_diff
diff32_end:
	POP {R4}
	BX LR
	
	
	






