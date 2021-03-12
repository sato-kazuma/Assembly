#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	char str[255] ="Bella frate";
	int num = 0;
	char *p;
	p =&str[0];

	__asm 
 	{
		mov eax, p
		mov esi,0

ciclo:
		mov bl,byte ptr[eax+esi]
		cmp bl,0
		je fine

		inc esi
		jmp ciclo

	fine:
		mov num,esi
	}
	printf("la frase e' lunga: %d", num);
	getchar();

}
