#include <iostream>
using namespace std;
short respos = 0, resneg = 0, reszero = 0;
short func(short arr, short c, short d)
{
    
    _asm {

        mov dx, c


        mov cx, arr         //      �������� ������� ������� � cx
        cmp cx, 0           //      ��������� �� � 0
            JE zeroN         //      ���� �� > 0, ������ �� �����, ���� ��������� ������� �������
			JL lowN
			JG highN

        lowN:
			mov bx, c           //      �������� � b� � 
			cmp cx, bx          //      ��������� ax c bx (�)
				JGE lowStep    //      ���� arr >= min, ��������� ������    JGE = jump greater equals cx >= bx
			JMP miss            //      ����� ���� ��������� ������� �������

		highN:
			mov bx, c           //      �������� � b� � 
			cmp cx, bx          //      ��������� ax c bx (�)
				JGE highStep    //      ���� arr >= min, ��������� ������    JGE = jump greater equals cx >= bx
			JMP miss            //      ����� ���� ��������� ������� �������
        lowStep:				//      ������� "������"
            mov bx, d			//      �������� � bx d
            cmp cx, bx			//      ��������� a� � bx (d)
                JLE lastlow		//      ���� arr < d, ������� �� lastStep     JLE = jump less equal cx <= bx
            jmp miss
		highStep:           //      ������� "������"
			mov bx, d       //      �������� � bx d
			cmp cx, bx      //      ��������� a� � bx (d)
				JLE lasthigh //      ���� arr < d, ������� �� lastStep     JLE = jump less equal cx <= bx
			jmp miss

        lastlow:           //      lastStep
            add resneg,1    //      �������� � �������� 1
            JMP miss
		lasthigh:           //      lastStep
			add respos, 1    //      �������� � �������� 1
			JMP miss
		zeroN:
			add reszero, 1    //      �������� � �������� 1
			JMP miss
    JMP miss                //      ������ �� ��������� ������� �������
    miss:                   //      ��������� ������� �������
    }
    return respos, resneg, reszero;
}

int main()
{
    short enter = 0, c = 0, d = 0;
    short mas[5];
    for (int i = 0; i < 5; ++i) {
        cout << "Enter " << i + 1 << " value: ";
        cin >> enter;
        mas[i] = enter;
    }
    cout << "Enter c: ";
    cin >> c;
    cout << "Enter d: ";
    cin >> d;
    for (int i = 0; i < 5; i++) {
        func(mas[i], c, d);
    }
    cout << "Positive numbers: " << respos << ". Negative numbers: " << resneg << ". Zero numbers: " << reszero << '.';
    return 0;
}