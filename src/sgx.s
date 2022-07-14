;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-24-14 14:24:04
;; Filename	: sgx
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public sgx

extrn printf

section '.data' writeable
	fmt db "[+] SGX : %d", 0xa, 0x0

section '.text' executable

sgx:
	push rbp
	mov rbp, rsp
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	mov eax, 0x7
	cpuid
	and ebx, 0x4
	shr ebx, 0x2
	mov rdi, fmt
	mov esi, ebx
	xor al, al
	call printf
	leave
	ret	
