;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-22-14 16:22:07
;; Filename	: avx
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public avx

extrn printf

section '.data' writeable
	fmt db "[+] AVX : %d", 0xa, 0x0

section '.text' executable

avx:
	push rbp
	mov rbp, rsp
	xor ecx, ecx
	xor edx, edx
	xor ebx, ebx
	mov eax, 0x1
	cpuid
	shr ecx, 28
	and ecx, 0x1
	mov rdi, fmt
	mov esi, ecx
	xor al, al
	call printf
	leave
	ret
