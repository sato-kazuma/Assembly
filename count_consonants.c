#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	char str[255] = "Ci=ao f!r a";
	int num = 0;
	char* p;
	p = &str[0];

	__asm
	{
		mov eax, p
		mov esi, 0
		mov ecx, 0 //vocali
		mov edx, 0 //spazzatura

		ciclo:
			mov bl, byte ptr[eax + esi]
			cmp bl, 0
			je fine
			//minuscole
			cmp bl, 'a'
			jge controlla
			jmp controlla_maiusc


	controlla :
			cmp bl, 'z'
			jle qui
			jmp controlla_maiusc

	controlla_maiusc :
			cmp bl, 'A'
			jge maiusc
			inc esi
			jmp ciclo

	maiusc :
			cmp bl, 'Z'
			jle qua
			inc esi
			jmp ciclo

	qua :
			cmp bl, 'A'
			je voc
			cmp bl, 'E'
			je voc
			cmp bl, 'I'
			je voc
			cmp bl, 'O'
			je voc
			cmp bl, 'U'
			inc esi
			inc edx
			jmp ciclo

	voc :
			inc ecx //hai una vocale
			inc esi //vai avanti
			jmp ciclo //continua


	qui :
		cmp bl, 'a'
			je voc
			cmp bl, 'e'
			je voc
			cmp bl, 'i'
			je voc
			cmp bl, 'o'
			je voc
			cmp bl, 'u'
			je voc
			inc esi 
			inc edx
			jmp controlla_maiusc

			fine :
			mov num, edx
	}
	printf("le consonanti sono : %d", num);
	getchar();


}
