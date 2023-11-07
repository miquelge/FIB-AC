void procesar(unsigned char *mata, unsigned char *matb, int n) {
  int i, j; 
  
  for (i=0; i<n; i++) {
    for (j=0; j<n; j++) {
      matb[i*n+j]=(mata[i*n+j]*16);
    }
  }
}


procesar:
	push %ebp
	movl %esp, %ebp
	push %esi
	push %edi
	
	movl -16(%ebp), %eax //eax = n
	imull %eax, %eax //eax = n*n
	movl $0, %esi //esi = it
	movl -8(%ebp), %ecx //&mata
	movl -12(%ebp), %edx //&matb
	
loop:
	cmpl %eax, %esi
	jge fi_loop
	
	imulb $16, (%ecx, %esi), %edi //edi = mata[i*n+j]*16
	movb %edi, (%edx, %esi) //matb[i*n+j] = mata[i*n+j]*16
	
	inc %esi //it++
	jump loop
	
fi_loop:
	pop %edi
	pop %esi
	movl %ebp, %esp
	pop %ebp
