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
        add counter, 1
        //mov ecx, 3
        mov si, [mass1]    //      загрузка элемента массива 1 в si
        mov di, [mass2]    //      загрузка элемента массива 2 в di
        cmp si, di         //      сравнение si с di
        JE miss            //      если si не равна di
        add result, 1      //      добавление 1 к сумарной разнице

        miss:              //      следующий элемент массива
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
    // таблица 1
    string mass1[5][4] = { "qwe", "wer", "ert", "rty", "tyu" , "yui", "uio" , "iop", "op[" , "p[]", "asd", "sdf", "dfg", "fgh", "ghj", "hjk", "jkl", "kl;", "zxc", "xcv" };
    // таблица 2
    string mass2[5][4] = { "qwe", "wer", "ert", "rty", "tyu" , "yui", "uio" , "iop", "op[" , "p[]", "aVd", "sdf", "dfg", "fgh", "Ahj", "hjk", "jkl", "kl;", "zxc", "xcv" };
    cout << "Table 1: " << endl;
    cout_mass(mass1);                           // вывод таблицы 1
    cout << "Table 2: " << endl;
    cout_mass(mass2);                           // вывод таблицы 2
    cout << "Looking for diff... " << endl;
    string diff_name = "Tables are same";
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 4; ++j) {            
            string s1 = mass1[i][j];
            string s2 = mass2[i][j];
            char mas1[3];
            char mas2[3];
            int m1 = 0;
            int m2 = 0;
            s1.copy(mas1, s1.size() + 1);
            s2.copy(mas2, s2.size() + 1);
            for (int a = 0; a < 3; a++)
            {
                m1 += mas1[a];                 // перевод слова 1ой таблицы в сумму значеий символов
                m2 += mas2[a];                 // перевод слова 2ой таблицы в сумму значеий символов
            }
            if (func(m1, m2) >= 1) {           // сравнение полученных чисел. В случае, если разные - выход из цикла и запоминание изм. имени 
                diff_name = mass1[i][j] + " " + mass2[i][j];
                break;
            }
            
        }
        if (diff_name != "Tables are same")    // если есть изменения - окончательный выход из цикла
            break;
    }
    cout << "Diff position: " << counter <<  "  Diff word: " << diff_name << endl; // вывод результата
    cout << "Done! ";
    return 0;
}
