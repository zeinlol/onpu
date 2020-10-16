extern short FirstStep;
extern short ThrdSt;
extern short ScndSt;
extern short FfthSt;
extern short FthSt;
extern short result;
inline short lab3_func(short a, short b, short p) {
    _asm {
        cmp a, 4
        jne Go/*; if No - calculating                Y = ( -2*P - D*82 ) / ( A/4 -1 )               */
        jmp miss
        Go :
        mov ax, a
            mov cx, 4
            mov dx, 0
            div cx
            mov FirstStep, ax
            /*; (A / 4 - 1)    Second Step     ScndSt*/
            mov cx, FirstStep
            sub cx, 1
            mov ScndSt, cx
            /*; -2 * P     Third step           ThrdSt*/
            mov cx, p
            imul cx, -2
            mov ThrdSt, cx
            /*; D * 82 Fourth Step            FthSt*/
            mov cx, b
            imul cx, 82
            mov FthSt, cx
            /*; (-2 * P - D * 82)   fifth Step    FfthSt*/
            mov cx, ThrdSt
            sub cx, FthSt
            mov FfthSt, cx
            /*; Result                   RES*/
            mov ax, FfthSt
            mov cx, ScndSt
            mov dx, 0
            cmp ScndSt, 0
            jne NotNullDiv1
            jmp miss
            NotNullDiv1 :
        div cx
            mov result, dx
            jmp miss
            miss :
    }
    return result;
