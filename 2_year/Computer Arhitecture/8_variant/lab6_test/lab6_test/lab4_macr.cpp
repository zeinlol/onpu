extern short FstSt;
extern short ScndSt;
extern short result;
inline short lab4_func(short a, short b)
{
    _asm {
        mov cx, a
        cmp cx, b
        jne GoNext/*; if No - calculating*/
        mov result, -10
        jmp miss
        GoNext :
        mov cx, a
            sub cx, b
            and cx, 8000h/*; check if A - B > 0*/
            jne AsmallerB/*; if  A - B < 0  (A < B)*/
            je BsmallerA/*; if  A - B > 0  (A > B)*/
            AsmallerB :/*; A < B A   Y = (A* A - B) / B    Y = (A - 5) / B*/
                /*; A* A                 FstSt*/
				mov cx, a
				sub cx, 5
				mov FstSt, cx
				/*;  FstSt / B*/
				cmp b, 0
					jne Go1
					jmp miss
            Go1 :
				mov ax, FstSt
				mov cx, b
				mov dx, 0
				div cx
				mov result, ax
				jmp miss
            BsmallerA: /*; A > B  Y = B / A + 5   Y = 1 - B/A  */
                /* B / A(FstSt)*/
			cmp a, 0
            jne Go  /*; if No - calculating*/
            jmp miss
            Go:
				mov ax, b
				mov cx, a
				mov dx, 0
				div cx
				mov FstSt, ax/*; B mod A    DO NOT TOUCH DX  !!!*/
				mov ScndSt, dx
				/*; 1-FstSt*/
				mov ax, 1
				sub ax, FstSt
				mov result, ax
				jmp miss
            miss:
    }
    return result;
}
