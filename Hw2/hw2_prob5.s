/*Avinash Aryal 1001727418*/
.global add32
.global sub64S
.global minU16
.global minS32
.global isLessThanU16
/*

//
//
//
//.global isLessThanS16
//.global shiftLeftU16
//.global shiftS8
//.global shiftU32
//.global isEqualU32
//.global isEqualS8
//.global isStrEqual
//.global strCopy
*/

//disassemble

.text

add32:
  ADDS R0,R0,R1
  MOV R1,#0
  ADC R1,R1,#0    
  BX LR

sub64S:
	SUBS R0,R0,R2
	SBC R1,R1,R3
	BX LR

minU16:
	SUBS R2,R0,R1
	MOVGT R0,R1   //condition Greater than (GT) Z clear, N=V (N and V set or N and V clear)
	MOVLE R0,R0   //condition less than or equal (LE) Z set or N<>V (N set and V clear) or (N clear and V set)
	BX LR
minS32:
	SUBS R2,R0,R1
	MOVGT R0,R1   //condition Greater than (GT) Z clear, N=V (N and V set or N and V clear)
	MOVLE R0,R0   //condition less than or equal (LE) Z set or N<>V (N set and V clear) or (N clear and V set)
	BX LR
isLessThanU16:
	SUBS R2,R0,R1
	MOVLT R0,#1
	MOVGT R0,#0
	BX LR

	


