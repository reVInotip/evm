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
	subl	$56, %esp
	.cfi_def_cfa_offset 76
	movl	76(%esp), %edi
	pushl	$0
	.cfi_def_cfa_offset 80
	call	time@PLT
	movl	%eax, (%esp)
	call	srand@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	testl	%edi, %edi
	jle	.L6
	xorl	%ebp, %ebp
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L5:
	call	rand@PLT
	movl	%eax, (%esp)
	fildl	(%esp)
	fldl	.LC1@GOTOFF(%ebx)
	fstl	(%esp)
	fdivrp	%st, %st(1)
	fld1
	fsubr	%st, %st(1)
	fstpl	24(%esp)
	fstpl	16(%esp)
	call	rand@PLT
	movl	%eax, 12(%esp)
	fildl	12(%esp)
	fdivl	(%esp)
	fldl	24(%esp)
	fsubr	%st, %st(1)
	fldl	16(%esp)
	fmul	%st(0), %st
	fxch	%st(2)
	fmul	%st(0), %st
	faddp	%st, %st(2)
	fcomip	%st(1), %st
	fstp	%st(0)
	sbbl	$-1, %esi
	addl	$1, %ebp
	cmpl	%ebp, %edi
	jne	.L5
	movl	%esi, (%esp)
	fildl	(%esp)
	movl	%edi, (%esp)
	fmuls	.LC3@GOTOFF(%ebx)
	fildl	(%esp)
	addl	$44, %esp
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
	fdivrp	%st, %st(1)
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	movl	%edi, (%esp)
	fldz
	fildl	(%esp)
	addl	$44, %esp
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
	fdivrp	%st, %st(1)
	ret
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-4194304
	.long	1104150527
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC3:
	.long	1082130432
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
