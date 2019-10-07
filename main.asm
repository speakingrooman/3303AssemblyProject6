; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	buffer BYTE 255 DUP(?)
	buffer2 BYTE 255 DUP(?)
	buffer3 WORD 65535 DUP(?)
	buffer4 WORD 65535 DUP(?)
	bufferS DWORD 65535 DUP(?)
	prompt BYTE "Please Enter a Sentence: ",0
	prompt2 BYTE "Please Enter a Character: ",0
	prompt3 BYTE "Please Enter the first Sentence: ",0
	prompt4 BYTE "Please Enter the second Sentence: ",0
	sizeOfBufferOne DWORD 65535
	sizeOfBufferTwo DWORD 65535
	sizeOfTotal DWORD 65535


.code

;Programming Exercise 1
Ex1 proc
	;prompt
	mov edx, offset prompt
	call WriteString
	mov edx, offset buffer
	mov ecx, sizeof buffer

	;readString
	call ReadString

	;write length
	call WriteDec
	
	;newline
	mov cl, al
	mov al, 0Ah
	call writeChar

	;write length in hex
	mov al,cl
	call WriteHex

	;newline
	mov cl, al
	mov al, 0Ah
	call writeChar

	;write string
	call WriteString
	ret
Ex1 endp


;Programming Exercise 2
Ex2 proc
	;prompt
	mov edx, offset prompt
	call WriteString
	mov edx, offset buffer2
	mov ecx, sizeof buffer2

	;readstring
	call ReadString

	;prompt
	mov edx, offset prompt2
	call WriteString

	;readchar
	call ReadChar
	mov cl, al
	mov al, 0Ah
	call writeChar
	

	;count occurence
	mov al,cl
	mov esi, offset buffer2
	mov dl,0
	myLoop:
		cmp al,[esi]
		jnz keepGoing
		inc dl
	keepGoing:
		inc esi
		loop myLoop
	mov eax,0
	mov al, dl
	call WriteDec

	ret
Ex2 endp


;Programming Exercise 3
Ex3 proc
	;prompt sentence1
     mov edx, offset prompt3
     call WriteString

	;take in input for sentence1
     mov edx, offset buffer3
     mov ecx, sizeof buffer3
     call ReadString              
     mov sizeOfBufferOne, eax

	
	;prompt sentence2
     mov edx, offset prompt4
     call WriteString

     
	;take in input for sentence2
     mov edx, offset buffer4
     mov ecx, sizeof buffer4
     call ReadString				
     mov sizeOfBufferTwo, eax	

    
	;repeat loop to copy first sentence using movsd
     cld
     mov esi, offset buffer3
     mov edi, offset bufferS
     mov ecx, sizeOfBufferOne
     REP MOVSD


	;print first part of string
     mov edx, offset bufferS
     call WriteString


	;repeat loop to copy second sentence using movsd
     cld
     mov esi, offset buffer4
     mov edi, offset bufferS
     mov ecx, sizeOfBufferOne
     REP MOVSD


	;print new concat string
     mov eax, bufferS
     call WriteString

	;newline
	mov cl, al
	mov al, 0Ah
	call writeChar
	mov al, cl

	;sentence length in decimal
	mov eax, sizeOfBufferOne
	add eax, sizeOfBufferTwo
	call WriteDec

	;newline
	mov cl, al
	mov al, 0Ah
	call writeChar
	mov al, cl

	;sentence length in hex
	call WriteHex

     ret
Ex3 endp




main proc
;ReadChar function
;call ReadChar
;mov char, al
;
;WriteChar function
;call WriteChar
;


;call Ex1
;call Ex2
;call Ex3




invoke ExitProcess,0
main endp
end main