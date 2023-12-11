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
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$12, %esp
	pushl	$0
	call	time@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	srand@PLT
	addl	$16, %esp
	movl	$0, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	.L2
.L5:
	call	rand@PLT
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	.LC0@GOTOFF(%ebx)
	fdivrp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	fstpl	-24(%ebp)
	call	rand@PLT
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	.LC0@GOTOFF(%ebx)
	fdivrp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	fstpl	-16(%ebp)
	fldl	-24(%ebp)
	fld	%st(0)
	fmulp	%st, %st(1)
	fldl	-16(%ebp)
	fmul	%st(0), %st
	faddp	%st, %st(1)
	fld1
	fcomip	%st(1), %st
	fstp	%st(0)
	jb	.L3
	addl	$1, -32(%ebp)
.L3:
	addl	$1, -28(%ebp)
.L2:
	movl	-28(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	.L5
	fildl	-32(%ebp)
	fldl	.LC2@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	MonteKarlo, .-MonteKarlo
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
	subl	$20, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$2147483647, -20(%ebp)
	subl	$12, %esp
	pushl	-20(%ebp)
	call	MonteKarlo
	addl	$16, %esp
	fstpl	-16(%ebp)
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0: 
	.long	-4194304
	.long	1104150527
	.align 8
.LC2: # 
#		
#    The first bit is the sign bit: 0 for positive and 1 for negative.
#
#    The next 7 bits are the exponent: -64 to +63, stored as 0 to 127. To get the actual exponent, subtract 64 from the stored value.
#    This corrresponds to exponents approximately -79 to +75 in base 10.
#
#    The next 56 bits are the fraction. 
	.long	0
	.long	1074790400
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB8:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE8:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB9:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE9:
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
