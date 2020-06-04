#include <iostream>
#include <stdlib.h>
using namespace std;
short result = 0;
short mas[4][3];
short check_number(short arr, short d)
{

    _asm {

        mov cx, arr         //      загружаю элемент массива в cx
        cmp cx, d           //      сравниваю сх с d
        JE miss         //      если сх не равна d

        mov cx, arr
        sub cx, d
        and cx, 8000h/*; check if A - B > 0*/
    	
            jne AsmallerB/*; if  A - B < 0  (A < B)*/
            je BsmallerA/*; if  A - B > 0  (A > B)*/

    	BsmallerA:
			add result, 1
    		jmp miss

    	AsmallerB :
            add result, 0
            jmp miss

        miss:                   //      следующий элемент массива
    }
    return result;
}

short add_number(short mas[4][3], int a, int b, short d)
{
    mas[3][0] = mas[2][2];
    bool kek = true;
    short temp, temp_2;
	for(a; a < 3; a++)
	{
        for (b; b < 3; b++)
        {
            if (kek) {
                temp = mas[a][b];
				mas[a][b] = d;
                kek = false;
			}
        	
			if (b == 2)
			{
                temp_2 = mas[a + 1][0];
                mas[a + 1][0] = temp;
                
			} else
			{
                temp_2 = mas[a][b + 1];
                mas[a][b + 1] = temp;
			}
            temp = temp_2;
		}
        b = 0;
	}
    return 0;
}

int Printmas(short mas[4][3], short X) {
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            cout << mas[i][j] << "    ";
        }
        cout << endl;
    }
    cout << mas[3][0] << endl;
    return 0;
}
int main()
{
    short d = 0;
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            mas[i][j] = rand() % 100;
        }
    }

    for (int c = 0; c <= (3 * 3); c++)//колличество проходов
    {
        //в строках упорядочиваем
        //____________________________________________
        for (int i = 0; i < 3; i++)
        {
            for (int j = 0; j < 3 - 1; j++)
            {
                if (mas[i][j] > mas[i][j + 1])
                {
                    short temp = mas[i][j];
                    mas[i][j] = mas[i][j + 1];
                    mas[i][j + 1] = temp;
                }
            }
        }
        //в столбах упорядочиваем
        //_____________________________________________
        for ( int x = 0; x < 3; x++)
        {
            for ( int z = 0; z < 3 - 1; z++)
            {
                if (mas[z][x] > mas[z][x + 1])
                {
                    short temp = mas[z][x];
                    mas[z][x] = mas[z][x + 1];
                    mas[z][x + 1] = temp;
                }
            }
        }
    }
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            cout << mas[i][j] << "    ";
        }
        cout << endl;
    }
	
    cout << "Enter your number: ";
    cin >> d;
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            check_number(mas[i][j], d);
            if (result == 1) {
				add_number(mas, i , j, d);
                result = 2;
			}
        }
    }
    Printmas(mas, d);
    cout << "Done! ";
    return 0;
}