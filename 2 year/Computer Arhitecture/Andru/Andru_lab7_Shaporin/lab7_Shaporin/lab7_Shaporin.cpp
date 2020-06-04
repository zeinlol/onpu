#include <iostream>
#include "first_solution.cpp"
#include "second_solution.cpp"
using namespace std;
short FstSt, ScndSt;
short result;
short a = 0;
short b = 0;
short p = 0;
int enter = 0;

short check(short a, short b)
{
	_asm{
        mov cx, a
        cmp cx, b
        jne GoNext/*; if No - calculating*/
        mov result, -125

        jmp miss

        GoNext :
        mov cx, a
            sub cx, b
            and cx, 8000h/*; check if A - B > 0*/

            jne AsmallerB/*; if  A - B < 0  (A < B)*/
            je BsmallerA

        AsmallerB:
			mov result, 2
			jmp miss
        BsmallerA:
            mov result, 1
		miss:
		
	}
    return result;
}

int main()

{

   
     cout << "Enter a: ";
     cin >> a;
     cout << "Enter b: ";
     cin >> b;
     check(a, b);
	
     if (result == 1) {
         first_sol(a, b);  //a<b
     }
     else if (result == 2) {
         second_sol(a, b); //b<a
     }
	
    cout << "Result: " << result << ",5";  //          << ",5"   for drobnoe znach
    return 0;
}
