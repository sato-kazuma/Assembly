.586
.model flat
.code


_cerca_combinazioni_numero proc
push ebp
mov ebp, esp
push ebx
push edi
push esi

mov ebx, dword ptr[ebp + 8] ; la nostra frase
mov esi,0
mov edx,dword ptr[ebp+16];
mov dword ptr[edx],0
mov dword ptr[edx+4],0
mov dword ptr[edx+8],0
mov eax,dword ptr[ebp+12]
add eax, '\0'

ciclo:
mov cl,byte ptr[ebx+esi]
cmp cl,0
je fine
cmp cl,al; se è uguale al numero
je primo
inc esi
jmp ciclo

primo:
inc esi
mov cl,byte ptr[ebx + esi]
cmp cl,al
je doppia
inc dword ptr[edx]
jmp ciclo

doppia:
inc esi
mov cl,byte ptr[ebx + esi]
cmp cl,al
je tripla
inc dword ptr[edx+4]
jmp ciclo

tripla:
inc esi
inc dword ptr[edx+8]
jmp ciclo

fine:
mov eax,0
pop esi
pop edi
pop ebx
mov esp, ebp
pop ebp
ret
_cerca_combinazioni_numero endp


end
