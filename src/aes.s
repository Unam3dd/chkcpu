;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-37-14 14:37:53
;; Filename	: aes
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public check_aes

extrn printf

section '.data' writeable
	fmt db "[+] AES Extension : %d", 0xa, 0x0

section '.text' executable

check_aes:
	push rbp
	mov rbp, rsp
	xor edx, edx
	xor ebx, ebx
	xor ecx, ecx
	mov eax, 0x1
	cpuid
	shr ecx, 25
	and ecx, 0x1
	mov rdi, fmt
	mov esi, ecx
	xor al, al
	call printf
	leave
	ret
