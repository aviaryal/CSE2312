.global isStrEqual
.global strCopy
.global sumS16
.global sumU16
.global countZeros
.global rightStringFull
.global rightStringTrunc
.global sortAscendingInPlace
.global countMatches
.global find2ndMatch
.global decimalToUint8

.global decimalToInt8
//.global hexStringToUint16
//.global uint8ToBinaryString
//.global findStreet
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
	SUB R1,R1,#1
length_st2:
	LDRSB R4,[R2],#1 
	CMP R4,#0
	ADDNE R6,R6,#1
	BNE length_st2
	SUB R2,R2,R6
	SUB R2,R2,#1
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
	
	
	
strCopy:
	LDRB R2,[R1],#1
	STRB R2,[R0],#1
	CMP R2,#0
	BNE strCopy
	BX LR
	
	
sumS16:
	MOV R2,R0
	MOV R0,#0
	CMN R1,#0
	NEGMI R1,R1
sumS_loop:
	LDRSH R3,[R2],#2
	ADD R0,R0,R3
	SUBS R1,R1,#1
	BNE sumS_loop
	BX LR 	
	
	
sumU16:
	MOV R2,R0
	MOV R0,#0
sumU_loop:
	LDRH R3,[R2],#2
	ADD R0,R0,R3
	SUBS R1,R1,#1
	BNE sumU_loop
	BX LR 	
	
countZeros:
	MOV R2,R0
	MOV R0,#0
count_zero_loop:
	LDR R3,[R2],#4
	CMP R3,#0
	ADDEQ R0,R0,#1
	SUBS R1,R1,#1
	BNE count_zero_loop
	BX LR 	
	
	
rightStringFull:
	//MOV R0,#0
	PUSH {R4}
	MOV R4,#0
	CMP R2,#0
	MOVEQ R0,#0
	BEQ end_rightStringFuLL
find_length:
	LDRSB R3,[R1],#1
	CMP R3,#0
	ADDNE R4,R4,#1
	BNE find_length
	CMP R4,R2
	MOVMI R0,#0
	BMI end_rightStringFuLL
	SUB R1,R1,R2
	SUB R1,R1,#1
copy_right_string:
	LDRSB R3,[R1],#1
	STRB R3,[R0],#1
	SUBS R2,R2,#1
	BNE copy_right_string
end_rightStringFuLL:
	POP {R4}
	BX LR
	
	
	
rightStringTrunc:
	PUSH {R4}
	MOV R4,#0
	CMP R2,#0
	MOVEQ R0,#0
	BEQ end_turnc
find_length_Trunc:
	LDRSB R3,[R1],#1
	CMP R3,#0
	ADDNE R4,R4,#1
	BNE find_length_Trunc
	CMP R4,R2
	BMI Trunc_all_string
	SUB R1,R1,R2
	SUB R1,R1,#1
	B copy_right_string_turnc
Trunc_all_string:
	SUB R1,R1,#1
	SUB R1,R1,R4
	B end_turnc
copy_right_string_turnc:
	LDRSB R3,[R1],#1
	STRB R3,[R0],#1
	SUBS R2,R2,#1
	BNE copy_right_string
end_turnc:
	POP {R4}
	BX LR
	

sortAscendingInPlace:
    PUSH {R4,R5,R6}
    CMP R1,#1
    BLE ascending_sort_end          
getnext:                     
    MOV R2,#0               
    MOV R6,#0              
ascending_loop:                     
    ADD R3,R2,#1            
    CMP R3,R1               
    BGE ascending_check         
    LDR R4,[R0,R2,LSL #2]   
    LDR R5,[R0,R3,LSL #2]   
    CMP R4,R5               
    STRGT R5,[R0,R2,LSL #2]   
    STRGT R4,[R0,R3,LSL #2]   
    ADDGT R6,R6,#1            
    MOV R2,R3               
    B ascending_loop         
ascending_check:                    
    CMP R6,#0               
    SUBGT R1,R1,#1            
    BGT getnext         
ascending_sort_end:                    
    POP {R4,R5,R6}
    BX LR         
	
	

	
countMatches:
	MOV R2,R0
	MOV R0,#0
	PUSH {R4,R5,R6,R7}
	MOV R6,#0
	MOV R3,#0
load_match_check:
	LDRB R4,[R1,R3]
	CMP R4,#0
	ADDEQ R0,R0,#1
	MOVEQ R3,#0
	BEQ load_match_check
check_match:
	LDRB R5,[R2,R6]
	CMP R5,#0
	BEQ end_match
	ADD R6,R6,#1
	CMPNE R5,R4
	MOVNE R3,#0
	BNE load_match_check
	MOVEQ R7,R6
	ADD R3,R3, #1
load_second:
	LDRB R4,[R1,R3]
	CMP R4,#0
	BEQ load_match_check
check_inner:
	LDRB R5,[R2,R7]
	CMP R5,#0
	BEQ check_match
	ADD R7,R7,#1
	CMP R5,R4
	ADDEQ R3,R3,#1
	MOVNE R3,#0
	BEQ load_second
	B load_match_check
end_match:
	POP {R4,R5,R6,R7}
	BX LR





find2ndMatch:
	//MOV R2,R0
	MOV R2,#0
	PUSH {R4,R5,R6,R7}
	MOV R6,#0
	MOV R3,#0
load_2match_check:
	LDRB R4,[R1,R3]
	CMP R4,#0
	ADDEQ R2,R2,#1
	CMP R2,#2
	ADDEQ R0,R0,R3
	ADDEQ R0,R0,#1
	BEQ end_2match
	MOV R3,#0
	BEQ load_2match_check
check_2match:
	LDRB R5,[R0,R6]
	CMP R5,#0
	BEQ end_2match
	ADD R6,R6,#1
	CMPNE R5,R4
	MOVNE R3,#0
	BNE load_2match_check
	MOVEQ R7,R6
	ADD R3,R3, #1
load_2second:
	LDRB R4,[R1,R3]
	CMP R4,#0
	BEQ load_2match_check
check_2inner:
	LDRB R5,[R0,R7]
	CMP R5,#0
	BEQ check_2match
	ADD R7,R7,#1
	CMP R5,R4
	ADDEQ R3,R3,#1
	MOVNE R3,#0
	BEQ load_2second
	B load_2match_check
end_2match:
	POP {R4,R5,R6,R7}
	BX LR
	
	
	
	
decimalToUint8:
	PUSH {R4,R5,R6,R7,R8}
	MOV R1,R0
	MOV R0,#0
	MOV R2,#2
	MOV R6,#10
	MOV R7,#100
	MOV R4,#2
	MOV R8,#0
find_size:
	LDRSB R3,[R1],#1 
	CMP R3,#0
	ADDNE R8,R8,#1
	BNE find_size
	SUB R1,R1,R8
	SUB R1,R1,#1
	CMP R8,#3
	BGT decimal_end
load_dec:
	CMP R2,#0
	BLT decimal_end
	LDRB R3,[R1,R2]
	CMP R3,#0
	SUB R2,R2,#1
	BEQ load_dec
	CMP R3,#48
	MOVLT R0,#0
	BLT decimal_end
	CMP R3,#57
	MOVGT R0,#0
	BGT decimal_end
one_decimal:
	 CMP R4,#2
	 BNE two_decimal
	 SUB R4,R4,#1
	 SUB R3,R3,#48
	 ADD R0,R0,R3
	 B load_dec
two_decimal:
	CMP R4,#1
	BNE three_decimal
	SUB R4,R4,#1
	SUB R3,R3,#48
	MUL R3,R3,R6
	ADD R0,R0,R3
	B load_dec
three_decimal:
	CMP R4,#0
	SUB R3,R3,#48
	SUB R4,R4,#1
	MUL R3,R3,R7
	ADD R0,R0,R3
check:
	CMP R0,#255
	MOVGT R0,#0
decimal_end:
	POP {R4,R5,R6}
	BX LR
	
	
	
	
	
decimalToInt8:
	PUSH {R4,R5,R6,R7,R8}
	MOV R1,R0
	MOV R0,#0
	MOV R2,#2
	MOV R6,#10
	MOV R7,#100
	MOV R4,#2
	MOV R8,#0
find_si_size:
	LDRSB R3,[R1],#1 
	CMP R3,#0
	ADDNE R8,R8,#1
	BNE find_si_size
	SUB R1,R1,R8
	SUB R1,R1,#1
	CMP R8,#4
	BGT decimal_si_end
find_sign:
	LDRB R3,[R1]
	CMP R3, #45
	MOVEQ R2,#3
	MOVEQ R4,#3
	BEQ load_ni_dec
	BNE decimal_si_end
load_pi_dec:
	CMP R8,#4
	BEQ decimal_si_end
	CMP R2,#0
	BLT decimal_si_end
	LDRB R3,[R1,R2]
	CMP R3,#0
	SUB R2,R2,#1
	BEQ load_pi_dec
	CMP R3,#48
	MOVLT R0,#0
	BLT decimal_si_end
	CMP R3,#57
	MOVGT R0,#0
	BGT decimal_si_end
one_pi_decimal:
	 CMP R4,#2
	 BNE two_pi_decimal
	 SUB R4,R4,#1
	 SUB R3,R3,#48
	 ADD R0,R0,R3
	 B load_pi_dec
two_pi_decimal:
	CMP R4,#1
	BNE three_pi_decimal
	SUB R4,R4,#1
	SUB R3,R3,#48
	MUL R3,R3,R6
	ADD R0,R0,R3
	B load_pi_dec
three_pi_decimal:
	CMP R4,#0
	SUB R3,R3,#48
	SUB R4,R4,#1
	MUL R3,R3,R7
	ADD R0,R0,R3
check_pi:
	CMP R0,#127
	MOVGT R0,#0
	B decimal_si_end
load_ni_dec:
	CMP R2,#1
	BLT check_ni
	LDRB R3,[R1,R2]
	CMP R3,#0
	SUB R2,R2,#1
	BEQ load_ni_dec
	CMP R3,#48
	MOVLT R0,#0
	BLT decimal_si_end
	CMP R3,#57
	MOVGT R0,#0
	BGT decimal_si_end
one_ni_decimal:
	 CMP R4,#3
	 BNE two_ni_decimal
	 SUB R4,R4,#1
	 SUB R3,R3,#48
	 ADD R0,R0,R3
	 B load_ni_dec
two_ni_decimal:
	CMP R4,#2
	BNE three_ni_decimal
	SUB R4,R4,#1
	SUB R3,R3,#48
	MUL R3,R3,R6
	ADD R0,R0,R3
	B load_ni_dec
three_ni_decimal:
	CMP R4,#1
	SUB R3,R3,#48
	SUB R4,R4,#1
	MUL R3,R3,R7
	ADD R0,R0,R3
check_ni:
	
	CMP R0,#128
	MOVGT R0,#0
	NEG R0,R0
decimal_si_end:
	POP {R4,R5,R6}
	BX LR
	
