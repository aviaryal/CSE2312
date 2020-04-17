.global diffF32
.global prodF32_64
.global dotpF32
.global minF64

.text


diffF32:
	PUSH {R4}
	MOV R4,#0
calculate_diff:
	CMP R3,#0
	BEQ diff32_end
	VLDR S1,[R1]
	VLDR S2,[R2]
	VSUB.F32 S0,S1,S2
	VSTR S0,[R0]
	ADD R4,R4,#4
	ADD R1,R1,#4
	ADD R2,R2,#4	
	ADD R0,R0,#4	
	SUB R3,R3,#1
	B calculate_diff
diff32_end:
	POP {R4}
	BX LR
	
/*
	
prodF32_64:
	CMP R1,#0
	MOVEQ R0,#0 
	BEQ prodF32_64_end
prodF32_64_loop:
	CMP R1,#0
	BEQ prodF32_64_end
	VLDR S4,[R0]
	ADD R0,R0,#4
	VCVT.F64.s32 D1,S4
	VMUL.F64 D4,D1,D0
	VMOV.F64 D0,D4
	SUB R1,R1,#1
	B prodF32_64_loop
	
prodF32_64_end:
	VMOV R0,R1,D0
	BX LR
*/



dotpF32:
	MOV R3,#0
	VMOV S0,R3
dotpF32_loop:
	CMP R2,#0
	BEQ dotpF32_end
	VLDR S4,[R0]
	VLDR S1,[R1]
	ADD R0,R0,#4
	ADD R1,R1,#4
	VMUL.F32 S3,S4,S1
	VADD.F32 S0,S0,S3
	SUB R2,R2,#1
	B dotpF32_loop
dotpF32_end:
	VMOV R0,S0
	BX LR
	
	
minF64:
load_first:
	CMP R1,#0
	BEQ minF64_end
	VLDR D0,[R0]
	ADD R0,R0,#8
	SUB R1,R1,#1
find_min_loop:
	CMP R1,#0
	BEQ minF64_end
	VLDR D1,[R0]
	ADD R0,R0,#8
	VCMP.F64 D0,D1
	
	VMOVGT.F64 D0,D1
	SUB R1,R1,#1
	B find_min_loop
minF64_end:
	VMOV R0,R1,D0
	BX LR
	
	

	

	
	
	
	
	
