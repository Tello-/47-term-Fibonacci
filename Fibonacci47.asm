;TITLE  Chapter 5, Problem 10 (File_of_Fibonacci_Numbers)

; Program:     Chapter 4, Problem 5
; Description: Writes the first 47 Fibonacci Numbers to a .bin
; Student:     Josh Lollis
; Date:        02/29/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

; Note, I notice that my code is formated nicely on my Visual Studio but it may be 
; indented differently in different text editors.

INCLUDE Irvine32.inc

FIB_COUNT = 47	; number of values to generate

.data
fileHandle DWORD ?
filename BYTE "fibonacci.bin",0
array DWORD FIB_COUNT DUP(?)

.code
main PROC
		
		mov			esi, OFFSET array
		mov			ecx, FIB_COUNT					; Prepare for call to generate_fibonacci		
		call		generate_fibonacci
		
		mov			edx, OFFSET filename			; Prepare for call to OpenInputFile
		call		CreateOutputFile
		mov			fileHandle, eax

		mov			edx, OFFSET array				
		mov			ecx, SIZEOF array
		call		WriteToFile

		mov			eax, fileHandle
		call		CloseFile

	exit
main ENDP


;------------------------------------------------------------
generate_fibonacci PROC USES eax ebx ecx edx
;
; Generates fibonacci values and stores in an array.
; Receives: ESI points to the array, 
;           ECX = count
; Returns: nothing
;------------------------------------------------------------
		mov			eax, 1
		mov			ebx, 0
		L1:	
			call WriteDec
			call CrLf
			mov			[esi], eax
			mov			edx, eax	
			add			eax, ebx
			mov			ebx, edx
			add			esi, TYPE esi
		loop L1
		ret
generate_fibonacci ENDP

END main