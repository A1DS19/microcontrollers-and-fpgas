
.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb
.section .text
.global __main
.global Reset_Handler

Reset_Handler:
	mov r1, #100
	mov r2, #200

__main:
	mov r5, #45
	mov r3, #43
	add r6, r5,r3 /* Store result from r5, r3 in r6 */


stop:
	b stop
	.align
	.end
