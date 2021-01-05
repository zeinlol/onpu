extern short FstSt;
extern short ScndSt;
extern short ThrdSt;
extern short FthSt;
extern short FfthSt;
extern short result;
inline short lab3_func(short A, short D, short C)
{
	_asm {
		mov cx, A
		imul cx, 2
		imul cx, A
		mov FstSt, cx
		/* (2 * a*a - 1)    Second Step     ScndSt*/
		mov cx, FstSt
		sub cx, 1
		mov ScndSt, cx
		/* 2 + C*/
		mov ax, C
		add ax, 2
		mov ThrdSt, ax
		/* D * 23 Fourth Step            FthSt*/
		mov cx, D
		imul cx, 23
		mov FthSt, cx
		/*; (2 + C - D * 23)   fifth Step    FfthSt*/
		mov cx, ThrdSt
		sub cx, FthSt
		mov FfthSt, cx
		/*; Result                   RES*/
		mov ax, FfthSt
		mov cx, ScndSt
		mov dx, 0
		cmp ScndSt , 0/*; D == 0 ?*/
		jne NotNullDiv1/*; if No - calculating*/
		jmp miss
		NotNullDiv1:
			div cx
			mov result, ax
			jmp miss
		miss:
	}
	return result;
}
