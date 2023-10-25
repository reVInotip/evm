	.file	"lab2.c"
	.text
	.globl	MonteKarlo
	.type	MonteKarlo, @function
MonteKarlo:
.LFB6:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	xorl	%edi, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
.L2:
	cmpl	%ebx, %r12d
	jge	.L9
	call	rand@PLT
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC0(%rip), %xmm0
	subsd	.LC1(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	rand@PLT
	movsd	8(%rsp), %xmm0
	movsd	.LC1(%rip), %xmm2
	cvtsi2sdl	%eax, %xmm1
	divsd	.LC0(%rip), %xmm1
	subsd	.LC1(%rip), %xmm1
	mulsd	%xmm0, %xmm0
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	comisd	%xmm0, %xmm2
	sbbl	$-1, %ebp
	incl	%r12d
	jmp	.L2
.L9:
	cvtsi2sdl	%ebp, %xmm0
	mulsd	.LC2(%rip), %xmm0
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	cvtsi2sdl	%ebx, %xmm1
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	divsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE6:
	.size	MonteKarlo, .-MonteKarlo
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%lf\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$536870911, %edi
	call	MonteKarlo
	leaq	.LC3(%rip), %rdi
	movb	$1, %al
	call	printf@PLT
	xorl	%eax, %eax
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7:
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
