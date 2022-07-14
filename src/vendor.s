;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-13-14 13:13:15
;; Filename	: vendor
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public vendor

extrn printf

section '.data' writeable
	fmt db "CPUID (Code : %X) Manufacturer ID string : %s", 0xa, 0x0

section '.text' executable

vendor:
	push rbp
	mov rbp, rsp
	sub rsp, 0x10

	xor eax, eax	; EAX = 0 Highest function parameter and manufacturer ID
	xor ebx, ebx
	xor edx, edx
	xor ecx, ecx

	cpuid			; Get CPU manufacturer ID string

	mov dword [rsp + 0xc], eax

	mov rdi, rsp
	mov eax, ebx
	stosd			; store dword in eax to edi

	mov eax, edx
	stosd

	mov eax, ecx
	stosd

	mov rdi, fmt	; fmt
	mov esi, dword [rsp + 0xc] ; CPUID code vendor
	mov rdx, rsp	; Manufacturer ID string
	xor al, al		; not use vector register
	call printf

	add rsp, 0x10
	leave 
	ret
