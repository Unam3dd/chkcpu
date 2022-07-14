;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-45-14 13:45:31
;; Filename	: logical
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public logical

extrn printf

section '.data' writeable
	fmt db "[+] Logical CPUs : %d", 0xa, 0x0

section '.text' executable

logical:
	push rbp
	mov rbp, rsp
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	mov eax, 0x1
	cpuid
	shr ebx, 0x10
	and ebx, 0xFF
	mov rdi, fmt
	mov esi, ebx
	xor al, al
	call printf
	leave
	ret
