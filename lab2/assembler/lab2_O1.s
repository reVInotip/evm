	.file	"lab2.c"
	.text
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
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, %r12d
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	testl	%r12d, %r12d
	jle	.L6
	movl	$0, %ebx
	movl	$0, %ebp
.L5:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC0(%rip), %xmm0
	subsd	.LC1(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	rand@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC0(%rip), %xmm0
	subsd	.LC1(%rip), %xmm0
	movsd	8(%rsp), %xmm1
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm2
	comisd	%xmm0, %xmm2
	sbbl	$-1, %ebp
	addl	$1, %ebx
	cmpl	%ebx, %r12d
	jne	.L5
.L2:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebp, %xmm0
	mulsd	.LC2(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%r12d, %xmm1
	divsd	%xmm1, %xmm0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	movl	$0, %ebp
	jmp	.L2
	.cfi_endproc
.LFE22:
	.size	MonteKarlo, .-MonteKarlo
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$536870911, %edi
	call	MonteKarlo
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-4194304
	.long	1104150527
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
