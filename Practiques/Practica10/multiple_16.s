
mult_16:
	andl $0x000F, %eax
	cmpl %eax, $0
	jne No_Multiple_16

Multiple_16:
	-
	-
	jump end
No_Multiple_16:
	-
	-
end:
