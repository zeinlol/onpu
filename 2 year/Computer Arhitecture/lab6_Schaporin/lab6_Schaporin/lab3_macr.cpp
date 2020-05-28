#include <iostream>
short FstSt, ScndSt, ThrdSt, FthSt, FfthSt, result;
short lab4_func(short a, short b, short p)
{

    _asm {
        cmp a, 4
        jne Go/*; if No - calculating*/
        /*push infinity; if Yes - exit the programm
        call[printf]*/
        jmp exit
    Go :
            mov eax, a
            mov ecx, 4

            mov edx, 0
            div ecx
            mov FstSt, eax

            /*; (A / 4 - 1)    Second Step     ScndSt*/
            mov ecx, FstSt
            sub ecx, 1
            mov ScndSt, ecx

            /*; -2 * P     Third step           ThrdSt*/
            mov ecx, p
            imul ecx, -2
            mov ThrdSt, ecx

            /*; D * 82 Fourth Step            FthSt*/
            mov ecx, b
            imul ecx, 82
            mov FthSt, ecx

            /*; (-2 * P - D * 82)   fifth Step    FfthSt*/
            mov ecx, ThrdSt
            sub ecx, FthSt
            mov FfthSt, ecx

            /*; Result                   RES*/
            mov eax, FfthSt
            mov ecx, ScndSt
            mov edx, 0

            cmp ScndSt, 0/*; D == 0 ?*/
            jne NotNullDiv1; if No - calculating
            /*push infinity; if Yes - exit the programm
            call[printf]*/
            jmp exit
    NotNullDiv1 :
            div ecx
            mov result, edx
            /*push eax
            push resStr
            call[printf]
            push point
            call[printf]

            mov ebx, 0
            lp:
        mov eax, result
            mov ecx, b
            imul eax, 10

            mov edx, 0
            div ecx
            mov result, edx

            push eax
            push emptyStr
            call[printf]

            add ebx, 1
            cmp ebx, 3
            jne lp*/
            jmp exit
    exit :
    }
}