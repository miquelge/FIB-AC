 .text
	.align 4
	.globl Intercambiar
	.type Intercambiar,@function
Intercambiar:
	movl 12(%ebp), %eax		//eax = i
	imul $12, %eax			//eax = i*12
	add 8(%ebp), %eax		//eax = &v[i]
	movl 16(%ebp), %ebx		//ebx = j
	imul $12, %ebx			//ebx = j*12
	add 8(%ebp), %ebx		//ebx = &v[b]
	
	movb (%eax), %cl
	//movb %al, -12(%ebp)	//c = v[i].c
	movb (%ebx), %dl
	movb %dl, (%ebx)		//v[i].c = v[i].c
	movb %cl, (%eax)		//v[j].c = v[i].c
	
	movl 4(%eax), %edx
	//movl %edx, -4(%ebp)	//tmp = v[i].k
	movl 4(%ebx), %ecx
	movl %ecx, 4(%ebx)		//v[i].k = v[j].k
	movl %edx, 4(%eax)		//v[j].k = v[i].k
	
	movl 4(%eax), %edx
	//movl %edx, -4(%ebp)	//aux = v[i].m
	movl 4(%ebx), %ecx
	movl %ecx, 4(%ebx)		//v[i].m = v[j].m
	movl %edx, 4(%eax)		//v[j].m = v[i].m
	
	return
	
        # Aqui viene vuestro codigo
