;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-57-14 13:57:43
;; Filename	: cores
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public get_cores

extrn printf

section '.data' writeable
	fmt db "[+] CPU Core : %d", 0xa, 0x0

section '.text' executable

get_cores:
	push rbp
	mov rbp, rsp
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	mov eax, 0x80000008
	cpuid
	and ecx, 0xFF
	add ecx, 0x1
	mov rdi, fmt
	mov esi, ecx
	xor al, al
	call printf
	leave
	ret
