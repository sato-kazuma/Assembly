.586
.model flat
.code

_primo proc

push ebp
mov ebp,esp
push ebx
push esi
push edi

mov ecx, dword ptr [ebp+8]
mov edx, dword ptr [ebp+12]
mov edi,0
mov esi,0

ciclo_vettore:

cmp esi, dword ptr [ebp+16]

je fine_ciclo_vettore

mov ebx, dword ptr [ecx+esi*4]

call primizia

mov dword ptr [edx+esi*4],eax
cmp eax,0
je non_inc

inc edi

non_inc:
inc esi
jmp ciclo_vettore

fine_ciclo_vettore:

mov eax,edi

pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret

_primo endp

primizia proc
push ecx
push edx

mov ecx,2

ciclo_div:
cmp ecx,ebx
je ferma

mov eax,ebx

cdq
idiv ecx

cmp edx,0
je non_primo

inc ecx
jmp ciclo_div

ferma:
mov eax,1

jmp termina

non_primo:
mov eax,0

termina:

pop edx
pop ecx
ret

primizia endp

end


//main
#include<stdio.h>

int primo(int* a, int* b, int lunghezza);

int main() {
	int a[10] = { 3,4,5,6,7,8,9,10,11,12 };
	int b[10] = { 0,0,0,0,0,0,0,0,0,0 };

	printf("%d", primo(a, b, 10));
}
