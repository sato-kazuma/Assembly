.586
.model flat
.code

_palindromo proc
push ebp
mov ebp, esp
push ebx
push esi
push edi

mov ebx, dword ptr[ebp + 8]
call dimensione

mov ecx, 0

ciclo_pal:
cmp byte ptr[ebx + ecx], 0
je agg1
mov dl, byte ptr[ebx + esi]
cmp byte ptr[ebx + ecx], dl
jne controlmin
aggcic:
inc ecx
dec esi
jmp ciclo_pal

controlmin:
add dl, 32
cmp byte ptr[ebx + ecx], dl
je aggcic
sub dl, 32

controlmax:
sub dl, 32
cmp byte ptr[ebx + ecx], dl
je aggcic
add dl, 32

agg0:
mov eax, 0
jmp fine

agg1:
mov eax, 1
fine:
pop edi 
pop esi
pop ebx
mov esp, ebp
pop ebp
ret
_palindromo endp

; dimensione controlla la dimensione del vettore
; il risultato � in esi

dimensione proc
mov esi, 0
ciclo_dim:
cmp byte ptr [ebx + esi], 0
je fine_dim
inc esi
jmp ciclo_dim

fine_dim:
dec esi
ret
dimensione endp

end

//main
#include<stdlib.h>
#include<stdio.h>
int palindromo(char* v);
int main(void) {
	char v[] = "i topi non avevano nipoti";
	printf("La stringa � palindroma se esce 1: /n", palindromo(v));

}
