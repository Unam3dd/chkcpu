;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author 	: stales
;; Date   	: 2022-06-14 13:06:15
;; Filename	: main
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

format ELF64

public _start

extrn vendor
extrn logical
extrn get_cores
extrn hyperthread
extrn sgx
extrn check_aes
extrn vmx

section '.text' executable

main:
	push rbp
	mov rbp, rsp
	call vendor
	call logical
	call get_cores
	call hyperthread
	call sgx
	call check_aes
	call vmx
	leave
	ret

_start:
	call main
	jmp _exit

_exit:
	mov rax, 0x3c
	xor rdi, rdi
	syscall
