	.file	"lab3.c"
	.text
	.p2align 4
	.globl	MonteKarlo
	.type	MonteKarlo, @function
MonteKarlo:
.LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$72, %esp
	.cfi_def_cfa_offset 92
	pushl	$0
	.cfi_def_cfa_offset 96
	call	time@PLT
	movl	%eax, (%esp)
	call	srand@PLT
	movl	96(%esp), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	testl	%eax, %eax
	jle	.L6
	movapd	.LC1@GOTOFF(%ebx), %xmm5
	movapd	.LC2@GOTOFF(%ebx), %xmm6
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	movsd	.LC3@GOTOFF(%ebx), %xmm7
	movaps	%xmm5, (%esp)
	movaps	%xmm6, 16(%esp)
	movsd	%xmm7, 40(%esp)
	.p2align 4,,10
	.p2align 3
.L5:
	call	rand@PLT
	movl	%eax, %esi
	call	rand@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movsd	40(%esp), %xmm4
	cvtsi2sdl	%eax, %xmm1
	cvtsi2sdl	%esi, %xmm0
	unpcklpd	%xmm1, %xmm0
	mulpd	(%esp), %xmm0
	addpd	16(%esp), %xmm0
	mulpd	%xmm0, %xmm0
	movapd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm1
	addpd	%xmm1, %xmm0
	comisd	%xmm0, %xmm4
	sbbl	$-1, %edi
	addl	$1, %ebp
	cmpl	%ebp, 80(%esp)
	jne	.L5
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edi, %xmm0
	mulsd	.LC4@GOTOFF(%ebx), %xmm0
.L2:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	80(%esp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%esp)
	fldl	(%esp)
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
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
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$16, %esp
	pushl	$2147483647
	call	MonteKarlo
	fstp	%st(0)
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	addl	$16, %esp
	xorl	%eax, %eax
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
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
.LC2:
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1074790400
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB24:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE24:
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
