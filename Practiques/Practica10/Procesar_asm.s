¡.text
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

	movl -16(%ebp), %eax //n
	imull %eax, %eax //n*n
	movl $0, %esi //it
	movl -8(%ebp), %ecx //&mata
	movl -12(%ebp), %edx //&matb
loop:
	cmpl %eax, %esi
	jge fi_loop

	imulb $16, (%ecx, %esi), %edi //mata[i*n+j]*16
	movb %edi, (%edx, %esi) //matb[i*n+j] = mata[i*n+j]*16

	inc %esi //it++
	jump loop
fi_loop:

	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
