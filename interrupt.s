	.file	"interrupt.c"
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	__vector_4
	.type	__vector_4, @function
__vector_4:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r24
	push r25
	push r30
	push r31
	push r28
	push r29
	in r28,__SP_L__
	clr r29
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 11 */
.L__stack_usage = 11
	ldi r24,lo8(56)
	ldi r25,0
	movw r30,r24
	ld r19,Z
	ldi r24,lo8(56)
	ldi r25,0
	ldi r18,lo8(8)
	eor r18,r19
	movw r30,r24
	st Z,r18
	nop
/* epilogue start */
	pop r29
	pop r28
	pop r31
	pop r30
	pop r25
	pop r24
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.size	__vector_4, .-__vector_4
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	clr r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	ldi r24,lo8(55)
	ldi r25,0
	ldi r18,lo8(8)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(74)
	ldi r25,0
	ldi r18,lo8(-123)
	ldi r19,lo8(30)
	movw r30,r24
	std Z+1,r19
	st Z,r18
	ldi r24,lo8(79)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	ldi r24,lo8(78)
	ldi r25,0
	ldi r18,lo8(13)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(89)
	ldi r25,0
	ldi r18,lo8(64)
	movw r30,r24
	st Z,r18
/* #APP */
 ;  19 "interrupt.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L3:
	rjmp .L3
	.size	main, .-main
	.ident	"GCC: (Homebrew AVR GCC 9.3.0) 9.3.0"
