#include <iostream>
short FstSt, ScndSt, result = 0;
short lab4_func(short a, short b)
{

    _asm {
        mov ecx, a
        cmp ecx, b
        jne GoNext/*; if No - calculating*/
        mov result, -5

        /*push result*/
        /*push resStr/*; if Yes - Y = -5 and exit the programm*/
        /*call[printf]*/
        jmp exit
        GoNext:
            mov ecx, a
            sub ecx, b
            and ecx, 8000h/*; check if A - B > 0*/
            jne AsmallerB/*; if  A - B < 0  (A < B)*/
            je BsmallerA/*; if  A - B > 0  (A > B)*/

        AsmallerB:/*; A < B A   Y = (A* A - B) / B*/

            /*; A* A                 FstSt*/
            mov ecx, a
            imul ecx, a
            mov FstSt, ecx

            /*; FstSt - B             ScndSt*/
            mov ecx, FstSt
            sub ecx, b
            mov ScndSt, ecx

            /*;  ScndSt / B*/
            cmp b, 0
            jne Go1/*; if No - calculating*/
            /*push infinity/*; if Yes - exit the programm*/
            /*call[printf]*/
            jmp exit
        Go1:
            mov eax, ScndSt
            mov ecx, b

            mov edx, 0
            div ecx
            mov result, eax
                /*
            mov[ThrdSt], edx

            push result   ; output Y
            push resStr
            call[printf]
            push point
            call[printf]
            mov ebx, 0*/

            /*lp:; output ostatka
            mov eax, [ThrdSt]
            mov ecx, b
            imul eax, 10

            mov edx, 0
            div ecx
            mov[ThrdSt], edx

            push eax
            push emptyStr
            call[printf]

            add ebx, 1
            cmp ebx, 3
            jne lp*/
            jmp exit

        BsmallerA : /*; A > B  Y = B / A + 5*/

            /* B / A(FstSt)*/
            cmp a, 0
            jne Go  /*; if No - calculating*/
            /*push infinity/*; if Yes - exit the programm*/
            /*call[printf]*/
            jmp exit
        Go:
            mov eax, b
            mov ecx, a

            mov edx, 0
            div ecx
            mov FstSt, eax/*; B mod A    DO NOT TOUCH EDX  !!!*/
            mov ScndSt, edx

            /*; FrstSt + 5*/
            mov eax, FstSt
            add eax, 5
            mov result, eax

            /*push result/*; output Y
            push resStr
            call[printf]
            push point
            call[printf]
            mov ebx, 0
            lp1:
        mov eax, ScndSt
            mov ecx, a
            imul eax, 10

            mov edx, 0
            div ecx
            mov ScndSt, edx

            push eax
            push emptyStr
            call[printf]

            add ebx, 1
            cmp ebx, 3
            jne lp1*/
            jmp exit
        exit:
    }
}