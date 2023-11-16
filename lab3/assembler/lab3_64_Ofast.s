	.file	"lab3.c"
	.text
	.p2align 4
	.globl	MonteKarlo
	.type	MonteKarlo, @function
MonteKarlo:
.LFB22:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r13d
	xorl	%edi, %edi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	testl	%r13d, %r13d
	jle	.L6
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L5:
	call	rand@PLT
	movl	%eax, %ebx
	call	rand@PLT
	movd	%ebx, %xmm0
	movsd	.LC5(%rip), %xmm3
	movd	%eax, %xmm2
	punpckldq	%xmm2, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	mulpd	.LC1(%rip), %xmm0
	addpd	.LC3(%rip), %xmm0
	mulpd	%xmm0, %xmm0
	movapd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm1
	addpd	%xmm1, %xmm0
	comisd	%xmm0, %xmm3
	sbbl	$-1, %r12d
	addl	$1, %ebp
	cmpl	%ebp, %r13d
	jne	.L5
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%r12d, %xmm0
	mulsd	.LC6(%rip), %xmm0
.L2:
	pxor	%xmm1, %xmm1
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	cvtsi2sdl	%r13d, %xmm1
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	divsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	pxor	%xmm0, %xmm0
	jmp	.L2
	.cfi_endproc
.LFE22:
	.size	MonteKarlo, .-MonteKarlo
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$2147483647, %edi
	call	MonteKarlo
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	2097152
	.long	1041235968
	.long	2097152
	.long	1041235968
	.align 16
.LC3:
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1072693248
	.align 8
.LC6:
	.long	0
	.long	1074790400
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
