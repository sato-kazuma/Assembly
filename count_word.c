#include<stdio.h>
#include<stdlib.h>
int main(void) {
	char s[] = " fetfwesf egerg 324 6 yhredgr. .";
	int num = 0;
	char * p;
	p = &s[0];
	__asm {
		mov eax,p
		mov esi, 0
		mov ecx,0
		
		ciclo:
			mov bl ,byte ptr[eax+esi]
			cmp	bl,0
			je fine
				spazio:
			cmp bl,0
			je fine
			cmp bl,' '
			je parola
			inc ecx
			jmp trovato

		parola:
			cmp bl, 0
			je fine
			inc esi
			mov bl, byte ptr[eax + esi]
			cmp bl,0
			je fine
			jmp spazio
		
		trovato:
			inc esi
			mov bl, byte ptr[eax + esi]
			cmp bl,0
			je fine
			cmp bl,' '
			jne trovato
			jmp ciclo

		fine:
			mov num,ecx
	}
	printf("Il numero di parole e': %d", num);
	getchar();
	return 0;

}
