#include <iostream>
#include <stdlib.h>
#include <string>
#include <array>
using namespace std;
short result = 0;
short counter = 0;
short func(short mass1, short mass2)
{
    _asm {
        mov result, 0
        //mov ecx, 3
        mov si, [mass1]    //      �������� �������� ������� 1 � si
        mov di, [mass2]    //      �������� �������� ������� 2 � di
        cmp si, di         //      ��������� si � di
        JNE miss            //      ���� si �� ����� di
        add result, 1
        jmp miss
        miss:              //      ��������� ������� �������
    }
    return result;
}
int cout_mass(string mass[5][4]) {
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 4; ++j) {
            cout << mass[i][j] << "    ";
        }
        cout << endl;
    }
    return 0;
}
int main()
{
    string word1, word2;
    // ������� 1
    string mass1[5][4] = { "qwe", "wer", "ert", "rty", "tyu" , "yui", "uio" , "iop", "op[" , "p[]", "asd", "sdf", "dfg", "fgh", "ghj", "hjk", "jkl", "kl;", "zxc", "xcv" };
    // ������� 2
    string mass2[5][4] = { "qwe", "wer", "ert", "rty", "tyu" , "yui", "uio" , "iop", "op[" , "p[]", "asd", "sdf", "dfg", "fgh", "ghj", "hjk", "jkl", "kl;", "zxc", "xcv" };
    cout << "Table 1: " << endl;
    cout_mass(mass1);                           // ����� ������� 1
    cout << "Enter target word: ";
    cin >> word1;
    cout << "Enter new word: ";
    cin >> word2;
    cout << "Looking for diff... " << endl;
    string diff_name = "Tables are same";
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 4; ++j) {
            string s1 = mass1[i][j];
            string s2 = word1;
            char mas1[3];
            char mas2[3];
            int m1 = 0;
            int m2 = 0;
            s1.copy(mas1, s1.size() + 1);
            s2.copy(mas2, s2.size() + 1);
            for (int a = 0; a < 3; a++)
            {
                m1 += mas1[a];                 // ������� ����� 1�� ������� � ����� ������� ��������
                m2 += mas2[a];
            }
            mass2[i][j] = s1;
            if (func(m1, m2))
                mass2[i][j] = word2;           // ��������� ���������� �����. � ������, ���� ������ - ����� �� ����� � ����������� ���. ����� 
        }
    }
    
    cout << "Done! ";
    cout << "New array: " << endl; // ����� ����������
    cout_mass(mass2);
    cout << "Bye!";
    return 0;
}
