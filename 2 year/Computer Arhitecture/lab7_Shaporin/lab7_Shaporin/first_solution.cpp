extern short FstSt;
extern short ScndSt;
extern short result;

inline short first_sol(short a, short b)
{

    _asm {
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