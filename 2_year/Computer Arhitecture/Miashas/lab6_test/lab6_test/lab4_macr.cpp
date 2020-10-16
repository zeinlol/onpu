extern short FstSt;
extern short ScndSt;
extern short result;
inline short lab4_func(short a, short b)
{
    _asm {
        mov cx, a
        cmp cx, b
        jne GoNext/*; if No - calculating*/
        mov result, -5
        jmp miss
        GoNext :
        mov cx, a
            sub cx, b
            and cx, 8000h/*; check if A - B > 0*/
            jne AsmallerB/*; if  A - B < 0  (A < B)*/
            je BsmallerA/*; if  A - B > 0  (A > B)*/
            AsmallerB :/*; A < B A   Y = (A* A - B) / B*/
                /*; A* A                 FstSt*/
        mov cx, a
            imul cx, a
            mov FstSt, cx
            /*; FstSt - B             ScndSt*/
            mov cx, FstSt
            sub cx, b
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
            BsmallerA : /*; A > B  Y = B / A + 5*/
                /* B / A(FstSt)*/
        cmp a, 0
            jne Go  /*; if No - calculating*/
            jmp miss
            Go :
        mov ax, b
            mov cx, a
            mov dx, 0
            div cx
            mov FstSt, ax/*; B mod A    DO NOT TOUCH EDX  !!!*/
            mov ScndSt, dx
            /*; FrstSt + 5*/
            mov ax, FstSt
            add ax, 5
            mov result, ax
            jmp miss
            miss :
    }
    return result;
}
