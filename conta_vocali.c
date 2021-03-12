#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	char str[255] = "Ciao bElla";
	int num = 0;
	char *p;
	p = &str[0];

	__asm
	{
		mov eax, p
		mov esi, 0
		mov ecx,0
		
		ciclo:
		mov bl, byte ptr[eax + esi]
		cmp bl,'a'
		je incrementa
		cmp bl, 'e'
		je incrementa
		cmp bl, 'i'
		je incrementa
		cmp bl, 'o'
		je incrementa
		cmp bl, 'u'
		je incrementa
		cmp bl, 'A'
		je incrementa
		cmp bl, 'E'
		je incrementa
		cmp bl, 'I'
		je incrementa
		cmp bl, 'O'
		je incrementa
		cmp bl, 'U'
		je incrementa
		cmp bl,0
		je fine
		inc esi
		jmp ciclo
		incrementa :
		inc ecx
		inc esi
		jmp ciclo
		


	fine:
		mov num, ecx
	}
	printf("Le vocali sono : %d", num);
	getchar();


}
