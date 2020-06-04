#include <iostream>
#include <stdlib.h>
using namespace std;
short result = 0;
short func(short arr, short d)
{

    _asm {

        mov cx, arr         //      загружаю элемент массива в cx
        cmp cx, d           //      сравниваю сх с d
        JE miss         //      если сх не равна d
        add result, 1

        miss:                   //      следующий элемент массива
    }
    return result;
}
int Printmas(short mass[4][3], short X) {
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            cout << mass[i][j] << "    ";
        }
        cout << endl;
    }
    if (result = 0) {
        mass[4][1] = X;
        cout << mass[4][1] << endl;
    }
    return 0;
}
int main()
{
    short d = 0;
    short mas[4][3];
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            mas[i][j] = rand() % 100;
            cout << mas[i][j] << "    ";
        }
        cout << endl;
    }
    cout << "Enter your number: ";
    cin >> d;
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            func(mas[i][j], d);
        }
    }
    Printmas(mas, d);
    cout << "Done! " << result;
    return 0;
}