#include <iostream>
using namespace std;
short respos = 0, resneg = 0, reszero = 0;
short func(short arr, short c, short d)
{
    
    _asm {

        mov dx, c


        mov cx, arr         //      загружаю элемент массива в cx
        cmp cx, 0           //      сравниваю сх с 0
            JE zeroN         //      если сх > 0, ничего не делаю, беру следующий элемент массива
			JL lowN
			JG highN

        lowN:
			mov bx, c           //      загружаю в bх с 
			cmp cx, bx          //      сравниваю ax c bx (с)
				JGE lowStep    //      если arr >= min, переходим дальше    JGE = jump greater equals cx >= bx
			JMP miss            //      иначе беру следующий элемент массива

		highN:
			mov bx, c           //      загружаю в bх с 
			cmp cx, bx          //      сравниваю ax c bx (с)
				JGE highStep    //      если arr >= min, переходим дальше    JGE = jump greater equals cx >= bx
			JMP miss            //      иначе беру следующий элемент массива
        lowStep:				//      переход "дальше"
            mov bx, d			//      загружаю в bx d
            cmp cx, bx			//      сравниваю aх с bx (d)
                JLE lastlow		//      если arr < d, переход на lastStep     JLE = jump less equal cx <= bx
            jmp miss
		highStep:           //      переход "дальше"
			mov bx, d       //      загружаю в bx d
			cmp cx, bx      //      сравниваю aх с bx (d)
				JLE lasthigh //      если arr < d, переход на lastStep     JLE = jump less equal cx <= bx
			jmp miss

        lastlow:           //      lastStep
            add resneg,1    //      добавл€ю к счЄтчику 1
            JMP miss
		lasthigh:           //      lastStep
			add respos, 1    //      добавл€ю к счЄтчику 1
			JMP miss
		zeroN:
			add reszero, 1    //      добавл€ю к счЄтчику 1
			JMP miss
    JMP miss                //      прыгаю на следующий элемент массива
    miss:                   //      следующий элемент массива
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