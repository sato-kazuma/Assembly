.586
.model flat
.code
_conta_occorrenze proc
push ebp
mov ebp,esp
push ebx
push esi
push edi
mov ebx, dword ptr[ebp+8]
mov ecx, dword ptr[ebp+12]
mov edi,0
mov esi,0
mov eax,0
ciclo:

mov dh,byte ptr[ebx+esi]
cmp dh,0
je fine
cmp dh,byte ptr[ecx+edi]
je check
inc esi
jmp ciclo

check:
mov dh,byte ptr[ebx+(esi-1)]
cmp dh,32
je confronta
inc esi
jmp wrong

confronta:
inc edi
cmp byte ptr[ecx+edi],0
je found
inc esi
mov dh,byte ptr[ebx+esi]
cmp dh,byte ptr[ecx+edi]
jne wrong
jmp confronta
wrong:
mov edi,0
jmp ciclo
found:
inc esi
mov dh,byte ptr[ebx+esi]
cmp dh,32
jne wrong
inc eax
mov edi,0
jmp ciclo

fine:
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret

_conta_occorrenze endp
end

//main
#include<stdlib.h>
#include<stdio.h>
int conta_occorrenze(char* v,char parola);
int main(void) {
	char v[256] = "mammma ";
	char parola[256] = "mamma";
	printf("Ci sono %d occorrenze", conta_occorrenze(v,parola));

}
