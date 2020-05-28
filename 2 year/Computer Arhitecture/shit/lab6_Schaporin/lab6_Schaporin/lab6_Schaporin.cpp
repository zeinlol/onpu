#include <iostream>
using namespace std;
short result = 0;
short func(short arr, short c, short d)
{

    _asm {

        mov dx, c


        mov cx, arr         //      �������� ������� ������� � cx
        cmp cx, 0           //      ��������� �� � 0
        JL miss         //      ���� �� < 0, ������ �� �����, ���� ��������� ������� �������


        mov bx, c           //      �������� � b� � 
        cmp cx, bx          //      ��������� ax c bx (�)
        JGE nextStep    //      ���� arr >= min, ��������� ������    JGE = jump greater equals cx >= bx
        JMP miss            //      ����� ���� ��������� ������� �������


        nextStep :           //      ������� "������"
        mov bx, d       //      �������� � bx d
            cmp cx, bx      //      ��������� a� � bx (d)
            JLE lastStep //      ���� arr < d, ������� �� lastStep     JLE = jump less equal cx <= bx
            jmp miss

            lastStep :           //      lastStep
        add result, 1    //      �������� � �������� 1
            JMP miss
            JMP miss                //      ������ �� ��������� ������� �������
            miss :                   //      ��������� ������� �������
    }
    return result;
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
    cout << "Result: " << result;
    return 0;
}