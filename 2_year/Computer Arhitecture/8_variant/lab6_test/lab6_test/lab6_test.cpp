#include <iostream>
#include "lab3_macr.cpp"
#include "lab4_macr.cpp"
using namespace std;
short FstSt, FirstStep, ThrdSt, ScndSt, FfthSt, FthSt;
short result;
short a = 0;
short b = 0;
short p = 0;
int enter = 0;
int main() {
    cout << "3 lab - 1\n4 lab - 2\nany other key - exit.\nYour choose: ";
    cin >> enter;
    if (enter == 1) {
        cout << "Enter a: ";
        cin >> a;
        cout << "Enter d: ";
        cin >> b;
        cout << "Enter c: ";
        cin >> p;
        lab3_func(a, b, p);
    }
    else if (enter == 2) {
        cout << "Enter a: ";
        cin >> a;
        cout << "Enter b: ";
        cin >> b;
        lab4_func(a, b);
    }
    cout << "Result: " << result;
    return result;
}
