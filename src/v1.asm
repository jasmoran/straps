section .bss
	current_char:	resb	1

section .text
global main
main:
	; Read byte from stdin
	mov rax, 0
	mov rdi, 0
	mov rsi, current_char
	mov rdx, 1
	syscall
	
	; Check for EOF
	cmp rax, 0
	je .exit
	
	; Check for NASM section
	cmp BYTE[current_char], 0x7E ; tilde
	je .nasm_sect
	
	jmp main
	
	; No man's land
	
.nasm_sect:
	; Read byte from stdin
	mov rax, 0
	mov rdi, 0
	mov rsi, current_char
	mov rdx, 1
	syscall
	
	; Check for EOF
	cmp rax, 0
	je .exit
	
	; Check for end NASM section
	cmp BYTE[current_char], 0x7E ; tilde
	je main
	
	; Write byte to stdout
	mov rax, 1
	mov rdi, 1
	mov rsi, current_char
	mov rdx, 1
	syscall
	
	jmp .nasm_sect
	
	; No man's land
	
.exit:

