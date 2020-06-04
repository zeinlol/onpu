#include <iostream>
#include "macros_3lab.cpp"
/*#include "macros_4lab.cpp"*/
using namespace std;
short FstSt, FirstStep, ThrdSt, ScndSt, FfthSt, FthSt;
short result = 0;
short a = 0;
short b = 0;
short p = 0;
int enter = 0;

int main()

{

    cout << "Enter 1 for using 3 lab, 2 for 4 lab, any other key - exit. Your choose: ";
    cin >> enter;

    if (enter == 1) {
        cout << "Enter a: ";
        cin >> a;
        cout << "Enter b: ";
        cin >> b;
        cout << "Enter D: ";
        cin >> p;
        lab3_func(a, b, p);
    }
    else if (enter == 2) {
        cout << "Enter a: ";
        cin >> a;
        cout << "Enter b: ";
        cin >> b;
     //   lab4_func(a, b);
    }
    cout << "Result: " << result;
    return 0;
}
