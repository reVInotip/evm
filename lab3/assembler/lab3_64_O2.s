	.file	"lab3.c"
	.text
	.p2align 4
	.globl	MonteKarlo
	.type	MonteKarlo, @function
MonteKarlo:
.LFB22:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%edi, %ebp
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	testl	%ebp, %ebp
	jle	.L6
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L5:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC1(%rip), %xmm0
	subsd	.LC2(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	rand@PLT
	pxor	%xmm1, %xmm1
	movsd	8(%rsp), %xmm0
	movsd	.LC2(%rip), %xmm2
	cvtsi2sdl	%eax, %xmm1
	divsd	.LC1(%rip), %xmm1
	subsd	.LC2(%rip), %xmm1
	mulsd	%xmm0, %xmm0
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	comisd	%xmm0, %xmm2
	sbbl	$-1, %ebx
	addl	$1, %r12d
	cmpl	%r12d, %ebp
	jne	.L5
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
	mulsd	.LC3(%rip), %xmm0
.L2:
	pxor	%xmm1, %xmm1
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	cvtsi2sdl	%ebp, %xmm1
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-4194304
	.long	1104150527
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1074790400
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
