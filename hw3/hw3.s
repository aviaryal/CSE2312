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
.global hexStringToUint16
.global uint8ToBinaryString
.global findStreet
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
	PUSH {R4,R5,R6,R7,R8,R9}
	MOV R1,R0
	MOV R2,#0
	MOV R0,#0
	MOV R4,#10
	MOV R6,#1
	MOV R7,#0
find_length_u8:
	LDRB R3,[R1,R2]
	CMP R3,#0
	ADDNE R2,R2,#1
	BNE find_length_u8
	SUB R2,R2,#1
	MOV R5,R2
	MOV R8,R2
get_multiplicity:
	CMP R2,#0
	BLT decimal_u8_end
	CMP R5,R2
	MULNE R9,R6,R4
	MOVNE R6,R9
	SUBNE R5,R5,#1
	BNE get_multiplicity
	LDRB R3,[R1,R2]
	SUB R3,R3,#48
	MUL R7,R6,R3
	ADD R0,R0,R7
	SUB R2,R2,#1
	MOV R5,R8
	MOV R6,#1
	B get_multiplicity
decimal_u8_end:
	POP {R4,R5,R6,R7,R8,R9}
	CMP R0,#255
	MOVGT R0,#0
	BX LR
	

	
	

uint8ToBinaryString:
	MOV R2,#0x80
utb_loop:
	TST R1,R2
	MOVNE R3,#49
	MOVEQ R3,#48
	STRB R3,[R0],#1
	MOVS R2,R2,LSR #1
	BNE utb_loop
	MOV R3,#0
	STRB R3,[R0]
	BX LR




/*
hexStringToUint16:
	PUSH {R4,R5,R6,R7,R8}
	MOV R1,R0
	MOV R0,#0
	MOV R2,#3
	MOV R4,#3
	MOV R8,#0
find_size_hex:
	LDRSB R3,[R1],#1 
	CMP R3,#0
	ADDNE R8,R8,#1
	BNE find_size_hex
	SUB R1,R1,R8
	SUB R1,R1,#1
	CMP R8,#4
	BGT hex_end
load_hex:
	CMP R2,#0
	BLT hex_end
	LDRB R3,[R1,R2]
	CMP R3,#0
	SUB R2,R2,#1
	BEQ load_hex
	CMP R3,#48
	MOVLT R0,#0
	BLT hex_end
	CMP R3,#57
	MOVGT R0,#0
	BGT hex_end
one_hex:
	 CMP R4,#4
	 BNE two_hex
	 SUB R4,R4,#1
	 SUB R3,R3,#48
	 ADDEQ R0,R0,R3
	 
	 B load_hex
two_hex:
	CMP R4,#3
	BNE three_hex
	SUB R4,R4,#1
	SUB R3,R3,#48
	MUL R3,R3,R6
	ADD R0,R0,R3
	B load_hex
three_hex:
	CMP R4,#2
	BNE four_hex
	SUB R3,R3,#48
	SUB R4,R4,#1
	MUL R3,R3,R7
	ADD R0,R0,R3
	B load_hex
four_hex:
	
	
check:
	CMP R0,#255
	MOVGT R0,#0
hex_end:
	POP {R4,R5,R6}
	BX LR

*/	

hexStringToUint16:
	PUSH {R4,R5,R6,R7,R8}
	MOV R1,R0
	MOV R0,#0
	MOV R2,#3
	MOV R4,#3
	MOV R8,#0 
	MOV R7,#2  	//to_find_length
find_size_hex:
	LDRSB R3,[R1],#1 
	CMP R3,#0
	ADDNE R8,R8,#1
	BNE find_size_hex
	SUB R1,R1,R8
	SUB R1,R1,#1
	CMP R8,#4
	BGT hex_end
load_hex:
	CMP R2,#0
	BLT hex_end
	LDRB R3,[R1,R2]
	CMP R3,#0                   //check null
	SUB R2,R2,#1
	BEQ load_hex
	CMP R3,#48             			//compare with zero
	MOVLT R0,#0									//IF LESS THAN ZERO STORE ZERO IN THE REGISTER
	BLT hex_end									//If less than zero end
	CMP R3,#57
	CMPGT R3,#65								//If greater than nine then compare with A 
	CMPGT R3,#70								//If greater than A compare with 'F'
	BGT hex_end									//If greater than F end
	CMP R3,#57									//compare with nine
	BLE	deci_hex								//if less than and equal branch
	SUB R3,R3,#55
	B one_hex
deci_hex:
	SUB R3,R3,#48
one_hex:
	 CMP R4,#3
	 BNE two_hex
	 SUB R4,R4,#1
	 ADD R0,R0,R3
	 B load_hex
two_hex:
	 CMP R4,#2
	 BNE three_hex
	 SUB R4,R4,#1
	 MOV R5,#16
	 MUL R6,R5,R3
	 ADD R0,R0,R6
	 B load_hex
three_hex:
	CMP R4,#1
	BNE four_hex
	SUB R4,R4,#1
	MOV R5,#256
	MUL R6,R5,R3
	ADD R0,R0,R6
	B load_hex
four_hex:
	CMP R4,#0
	SUB R4,R4,#1
	MOV R5,#4096
	MUL R6,R5,R3
	MUL R6,R5,R3
	ADD R0,R0,R6
	B load_hex
	
hex_end:
	POP {R4,R5,R6}
	BX LR
	


	
findStreet:
	MOV R3,R0 
	PUSH {R4,R5,R6,R7,R8,R9}
	MOV R4,#108
	MOV R5,#0  //COUNTER FOR THE INDEX
	MOV R0,#-1
find_street:
	CMP R5,R2
	MOVGT R0,#-1
	BGT find_street_end
	MUL R7,R5,R4    //GET ADDRESS
	ADD R7,R7,#26
	ADD R5,R5,#1 		//ADD 1 TO THE ARRAY INDEX
	MOV R6,#0				//COUNTER FOR STREET ADDRESS 
match_check:
	LDRB R8,[R1,R7]  //
	LDRB R9,[R3,R6]
	ADD R6,R6,#1
	ADD R7,R7,#1
	CMP R8,#0
	CMPEQ R8,R9
	BEQ equal_string
	CMP R9,#0
	CMPEQ R9,R8
	BEQ equal_string
	CMP R9,R8
	BEQ match_check
	//ADD R1,R1,
	BNE find_street
equal_string:
	SUBS R5,R5,#1
	MUL R7,R5,R4
	MOV R5,R1
	ADD R5,R5,R7
	MOV R0,R5
find_street_end:
	POP {R4,R5,R6,R7,R8,R9}
	BX LR
	
	
	
	
