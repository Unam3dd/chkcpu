;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-11-14 14:11:59
;; Filename	: hyperthread
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public hyperthread

extrn printf

section '.data' writeable
	fmt db "[+] Hyperthread : %d", 0xa, 0x0

section '.text' executable

hyperthread:
	push rbp
	mov rbp, rsp
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	mov eax, 0x80000001
	cpuid
	and ecx, 2
	mov rdi, fmt
	mov esi, ecx
	xor al, al
	call printf
	leave
	ret
