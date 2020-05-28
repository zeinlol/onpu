#include <iostream>
using namespace std;
short result = 0;
short func(short arr, short c, short d)
{

    _asm {

        mov dx, c


        mov cx, arr         //      загружаю элемент массива в cx
        cmp cx, 0           //      сравниваю сх с 0
        JL miss         //      если сх < 0, ничего не делаю, беру следующий элемент массива


        mov bx, c           //      загружаю в bх с 
        cmp cx, bx          //      сравниваю ax c bx (с)
        JGE nextStep    //      если arr >= min, переходим дальше    JGE = jump greater equals cx >= bx
        JMP miss            //      иначе беру следующий элемент массива


        nextStep :           //      переход "дальше"
        mov bx, d       //      загружаю в bx d
            cmp cx, bx      //      сравниваю aх с bx (d)
            JLE lastStep //      если arr < d, переход на lastStep     JLE = jump less equal cx <= bx
            jmp miss

            lastStep :           //      lastStep
        add result, 1    //      добавл€ю к счЄтчику 1
            JMP miss
            JMP miss                //      прыгаю на следующий элемент массива
            miss :                   //      следующий элемент массива
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