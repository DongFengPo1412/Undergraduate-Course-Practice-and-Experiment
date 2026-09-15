    .syntax unified
    .cpu cortex-m7
    .thumb
    .section .text.strcopy
    .global strcopy
    .type strcopy, %function

/*
 * void strcopy(char *d, const char *s)
 * Copy string from s (r1) to d (r0)
 */
strcopy:
    ldrb r2, [r1], #1   @ Load byte from src and post-increment src pointer (r1)
    strb r2, [r0], #1   @ Store byte to dest and post-increment dest pointer (r0)
    cmp r2, #0          @ Check if we copied the null terminator (0)
    bne strcopy         @ If r2 != 0, continue copying
    bx lr               @ Return to caller
