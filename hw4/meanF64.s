.global meanF64

.text

/* R0 = &x[0], R1 = count -> R1:R0 = mean */
meanF64:
    MOV R2, #0
    VMOV D0, R2, R2 /* D0 = sum */
    VMOV S4, R1 /* S2 = count, S0-1 overlap with D0, S2-3 overlap with D1 */
meanF64_loop:
    CMP R1, #0 /* check for zero count */
    BEQ meanF64_end /* end if zero */
    VLDR D1, [R0] /* D1 = &x[0, 1, ..., count-1] */
    ADD R0, R0, #8 /* inc by sizeof(double) */
    VADD.F64 D0, D0, D1 /* running sum in D0*/
    SUB R1, R1, #1 /* dec count */
    B meanF64_loop /* get next element of the array */
meanF64_end:
    VCVT.F64.U32 D1, S4 /* D1 = S4 = count */
    VDIV.F64 D0, D0, D1 /* D0 = sum / count; needs D64 num and den */
    VMOV R0, R1, D0 /* store mean in D0 into R1:R0 pair */
    BX LR
