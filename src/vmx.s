;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-45-14 14:45:25
;; Filename	: vmx
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public vmx

extrn printf

section '.data' writeable
	fmt db "[+] VMX : %d", 0xa, 0x0

section '.text' executable

vmx:
	push rbp
	mov rbp, rsp
	xor edx, edx
	xor ecx, ecx
	mov eax, 0x1
	cpuid
	shr ecx, 0x5
	and ecx, 0x1
	mov rdi, fmt
	mov esi, ecx
	xor al, al
	call printf
	leave
	ret
