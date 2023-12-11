	.file	"lab3.c"
	.text
	.globl	MonteKarlo
	.type	MonteKarlo, @function
MonteKarlo:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	.cfi_offset 7, -12
	xorl	%edi, %edi
	pushl	%esi
	.cfi_offset 6, -16
	xorl	%esi, %esi
	pushl	%ebx
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$56, %esp
	pushl	$0
	call	time@PLT
	movl	%eax, (%esp)
	call	srand@PLT
	addl	$16, %esp
.L2:
	cmpl	8(%ebp), %edi
	jge	.L9
	call	rand@PLT
	fldl	.LC0@GOTOFF(%ebx)
	movl	%eax, -40(%ebp)
	fstl	-32(%ebp)
	fidivrl	-40(%ebp)
	fld1
	fsubr	%st, %st(1)
	fstpl	-48(%ebp)
	fstpl	-40(%ebp)
	call	rand@PLT
	fldl	-32(%ebp)
	movl	%eax, -32(%ebp)
	fidivrl	-32(%ebp)
	fldl	-48(%ebp)
	fsubr	%st, %st(1)
	fldl	-40(%ebp)
	fmul	%st(0), %st
	fxch	%st(2)
	fmul	%st(0), %st
	faddp	%st, %st(2)
	fcomip	%st(1), %st
	fstp	%st(0)
	sbbl	$-1, %esi
	incl	%edi
	jmp	.L2
.L9:
	movl	%esi, -32(%ebp)
	flds	.LC2@GOTOFF(%ebx)
	fimull	-32(%ebp)
	fidivl	8(%ebp)
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	MonteKarlo, .-MonteKarlo
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB7:
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
	xorl	%eax, %eax
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-4194304
	.long	1104150527
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1082130432
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB8:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE8:
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
