extern short ScndSt;
extern short result;
inline short second_sol(short a, short b)
{
	_asm{
        

        /*; FstSt - B             ScndSt*/
        mov cx, a
        sub cx, 5
        mov ScndSt, cx

        /*;  ScndSt / B*/
        cmp b, 0
        jne Go1

        jmp miss


        Go1 :
        mov ax, ScndSt
            mov cx, b

            mov dx, 0
            div cx
            mov result, ax

            jmp miss
		miss:
	}
    return result;
}