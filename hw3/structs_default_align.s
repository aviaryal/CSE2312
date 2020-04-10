.global getName
.global getZip

.text

/* R0 = &business[0].taxId, R1 = index -> R0 = char* to name */
getName:
    ADD R0, R0, #4 /* adjust pointer to business[0].name */
    MOV R2, #120 /* R2 = sizeof(business) with default align */
    MUL R3, R1, R2 /* R3 = offset to business[index] record */
    ADD R0, R0, R3 /* adjust pointer to business[index].name */
    BX LR

/* R0 = &business[0].taxId, R1 = index -> R0 = zip code */
getZip:
    ADD R0, R0, #116 /* adjust pointer to business[0].zipCode */
    MOV R2, #120 /* R2 = sizeof(business) with default align */
    MUL R3, R1, R2 /* R3 = offset to business[index] record */
    LDR R0, [R0, R3] /* R0 = zip code */
    BX LR
