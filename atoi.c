#include<stdio.h>
#include<stdlib.h>

__declspec(naked) unsigned int atoi(unsigned char *v)
{
	__asm {
		push ebp
		mov ebp, esp

		 push edi
		 push esi
		 push ebx

		mov dl,0
		mov edi,10
		mov eax,0
		mov esi,0
		mov bl,10
		mov ecx,dword ptr[ebp+8]

		ciclo:
		mov dl, byte ptr[ecx + esi]
			cmp dl, 0
			je fine

			mov ebx,0
			mov bl,dl

			mul edi
			sub ebx, '0'
			add eax, ebx
			inc esi

			jmp ciclo


			fine:

			pop ebx
			pop esi
			pop edi
			mov ebp, esp
			pop ebp

			ret
	}
}
int main() {
	unsigned char v[255]="o09";
	printf("Il suo valore intero e': %d ", atoi(v));
	getchar();
	return 0;
}
