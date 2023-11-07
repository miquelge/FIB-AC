.text
	.align 4
	.globl procesar
	.type	procesar, @function
procesar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi

	movl +16(%ebp), %eax //n
	imull %eax, %eax //n*n
	movl $0, %esi //it
	movl +8(%ebp), %ecx //&mata
	movl +12(%ebp), %edx //&matb
loop:
	cmpl %eax, %esi
	jge fi_loop

	movdqu (%ecx, %esi), %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	movdqu %xmm0, (%edx, %esi)

	addl $16, %esi //it+=16
	jump loop
fi_loop:

	emms	# Instruccion necesaria si os equivocais y usais MMX
	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
