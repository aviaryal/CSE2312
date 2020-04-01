.global isStrEqual
.text

isStrEqual:
	PUSH {R4,R5,R6}
	MOV R2,R0
	MOV R0,#1
	MOV R5,#0
	MOV R6, #0
length_st1:
	LDRSB R3,[R1],#1 
	CMP R3,#0
	ADDNE R5,R5,#1
	BNE length_st1
	SUB R1,R1,R5
length_st2:
	LDRSB R4,[R2],#1 
	CMP R4,#0
	ADDNE R6,R6,#1
	BNE length_st2
	SUB R2,R2,R6
	CMP R5,R6
	BNE not_equal
isStrEqual_loop:
	LDRSB R3,[R1],#1 // READ CHAR FROM R1 TO R3 AND INCREASE THE POINTER BY 1
	LDRSB R4,[R2],#1 //READ CHAR FROM R2 TO R1 AND INCREASE THE POINTER BY 1
	CMP R3,R4
	BNE not_equal
	SUBS R5,R5,#1
	BEQ end
	B isStrEqual_loop
not_equal:
	MOV R0,#0
	B end
end:
	POP {R4,R5,R6}
	BX LR
	
	
