format PE console

entry Start

include 'INCLUDE\win32a.inc'

section '.data' data readable writable

        strA db 'Enter A: ', 0
        strB db 'Enter B: ', 0
        resStr db 'Y = %d', 0   ; output with C libraries
        emptyStr db '%d',0 ;empty Str for numbers
        spaceStr db ' %d', 0 ;just space
        infinity db 'infinity', 0 ; when /0
        point db ',', 0

        A dd ?
        B dd ?
        RES dd ?
        FstSt dd ?
        ScndSt dd ?
        ThrdSt dd ?

        NULL = 0

section '.code' readable executable

        Start:
                push strA           ; entering text for A
                call [printf]

                push A              ;entering A
                push spaceStr
                call [scanf]


                push strB           ; entering text B
                call [printf]

                push B              ;entering B
                push spaceStr
                call [scanf]

                ;calculating                        V.3   A> B  Y = B / A + 5  | a=b Y = -5 | A<B A   Y = ( A * A - B) / B

                 ; if (A == B)
                 mov ecx, [A]
                 cmp ecx, [B]
                 jne GoNext     ;if No - calculating
                     mov [RES], -5
                     push [RES]
                     push  resStr        ; if Yes - Y = -5 and exit the programm
                     call [printf]
                     jmp exit
                 GoNext:
                     mov ecx, [A]
                     sub ecx, [B]
                     and ecx, 8000h           ;check if A-B > 0
                         jne AsmallerB        ;if  A-B < 0  (A < B)
                         je BsmallerA         ;if  A-B > 0  (A > B)

                AsmallerB:                    ;A<B A   Y = ( A * A - B) / B

                     ; A * A                 FstSt
                     mov ecx, [A]
                     imul ecx, [A]
                     mov [FstSt], ecx

                     ; FstSt - B             ScndSt
                     mov ecx, [FstSt]
                     sub ecx, [B]
                     mov [ScndSt], ecx

                     ;  ScndSt / B
                     cmp [B], 0
                     jne Go1     ;if No - calculating
                         push infinity  ; if Yes - exit the programm
                         call [printf]
                         jmp exit
                     Go1:
                         mov eax, [ScndSt]
                         mov ecx, [B]

                         mov edx, 0
                         div ecx
                         mov [RES], eax
                         mov [ThrdSt], edx

                     push [RES]       ;output Y
                     push resStr
                     call [printf]
                     push point
                     call [printf]
                     mov ebx, 0
                     lp:              ; output ostatka
                        mov eax, [ThrdSt]
                        mov ecx, [B]
                        imul eax, 10

                        mov edx, 0
                        div ecx
                        mov [ThrdSt], edx

                        push eax
                        push emptyStr
                        call [printf]

                        add ebx, 1
                        cmp ebx, 3
                        jne lp
                        jmp exit

                BsmallerA:                    ;A> B  Y = B / A + 5

                    ;B / A    (FstSt)
                    cmp [A], 0
                    jne Go     ;if No - calculating
                        push infinity  ; if Yes - exit the programm
                        call [printf]
                        jmp exit
                    Go:
                        mov eax, [B]
                        mov ecx, [A]

                        mov edx, 0
                        div ecx
                        mov [FstSt], eax    ;B mod A    DO NOT TOUCH EDX  !!!
                        mov [ScndSt], edx

                     ; FrstSt + 5
                     mov eax, [FstSt]
                     add eax, 5
                     mov [RES], eax

                     push [RES]       ;output Y
                     push resStr
                     call [printf]
                     push point
                     call [printf]
                     mov ebx, 0
                     lp1:
                        mov eax, [ScndSt]
                        mov ecx, [A]
                        imul eax, 10

                        mov edx, 0
                        div ecx
                        mov [ScndSt], edx

                        push eax
                        push emptyStr
                        call [printf]

                        add ebx, 1
                        cmp ebx, 3
                        jne lp1
                        jmp exit

                     jmp exit

                jmp exit

exit:

        call [getch]
        push NULL
        call [ExitProcess]

section '.idata' import data readable

        library kernel, 'kernel32.dll',\
                msvcrt, 'msvcrt.dll'
        import kernel,\                       ; metki for comfortable usage
               ExitProcess, 'ExitProcess'

        import msvcrt,\
               printf, 'printf',\
               scanf, 'scanf', \
