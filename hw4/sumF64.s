.global sumF64

.text

/* R0 = &x[0], R1 = count -> R1:R0 = sum */
sumF64:
    MOV R2, #0
    VMOV D0, R2, R2 /* D0 = sum */
sumF64_loop:
    CMP R1, #0 /* check for zero count */
    BEQ sumF64_end /* end if zero */
    VLDR D1, [R0] /* D1 = &x[0, 1, ..., count-1] */
    ADD R0, R0, #8 /* inc by sizeof(double) */
    VADD.F64 D0, D0, D1 /* running sum in D0*/
    SUB R1, R1, #1 /* dec count */
    B sumF64_loop /* get next element of the array */
sumF64_end:
    VMOV R0, R1, D0 /* store sum in D0 into R1:R0 pair */
    BX LR
