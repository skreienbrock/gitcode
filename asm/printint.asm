section .bss
	digitSpace 	resb 	100	; reserved for a number
	digitSpacePos	resb	8	; big enough to hold a register

section .text
	global _start

_start:
	mov rax, 123			; number
	call _printRAX

; RAX / RBX =  RAX   RDX
; 123 / 10  =  12  R 3   (store remainder)
;  12 / 10  =   1  R 2 	 (store remainder)
;   1 / 10  =   0  R 1 	 (store remainder)
; reverse read remainders: 123 !

	mov rax, 60
	mov rdi, 0
	syscall

_printRAX:
	mov rcx, digitSpace
	mov rbx, 10
	mov [rcx], rbx			; *rcx = rbx
	inc rcx
	mov [digitSpacePos],rcx		; *digitSpacePos = rcx
	
_printRAXLoop:
	mov rdx, 0			; set RDX = 0
	mov rbx, 10			; set RBX = 10
	div rbx				; here: RAX/RBX
	push rax			; store RAX
	add rdx, 48			; ASCII Number Characters 48 = "0"
	mov rcx,[digitSpacePos]		; rcx = *digitSpacePos
	mov [rcx], dl			; *rcx = dl
	inc rcx				; rcx++
	mov [digitSpacePos],rcx		; *digitSpacePos = rcx
	pop rax				; get RAX from Stack
	cmp rax,0			; compare if RAX is zero
	jne _printRAXLoop		; if not, rerun Loop

_printRAXLoop2:
	mov rcx,[digitSpacePos]
	
	mov rax,1
	mov rdi,1
	mov rsi,rcx
	mov rdx,1
	syscall
	
	mov rcx,[digitSpacePos]
	dec rcx
	mov [digitSpacePos],rcx
	
	cmp rcx,digitSpace
	jge _printRAXLoop2

	ret


