/*Avinash Aryal 1001727418*/
.global add32
/*
.global sub64
//.global minU16
//.global minS32
//.global isLessThanU16
//.global isLessThanS16
//.global shiftLeftU16
//.global shiftS8
//.global shiftU32
//.global isEqualU32
//.global isEqualS8
//.global isStrEqual
//.global strCopy
*/


.text

add32:
  ADD R0,R0,R1
  BX LR
