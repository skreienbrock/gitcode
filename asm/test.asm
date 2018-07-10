; include file
%include "macros.inc"

section .data
	text db "Assembler Test mit Include File",10

section .text
	global _start
_start:
	print text
	exit

