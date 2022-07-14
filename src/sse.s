;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-43-14 15:43:04
;; Filename	: sse
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public sse

extrn printf

section '.data' writeable
	fmt db "[+] SSE : %d", 0xa, 0x0

section '.text' executable

sse:
	push rbp
	mov rbp, rsp
	xor ebx, ebx
	xor edx, edx
	xor ecx, ecx
	mov eax, 0x1
	cpuid
	shr edx, 25
	and edx, 0x1
	mov rdi, fmt
	mov esi, edx
	xor al, al
	call printf
	leave
	ret
