#include &lt;iostream&gt;
#include &quot;first_solution.cpp&quot;
#include &quot;second_solution.cpp&quot;
using namespace std;
short FstSt, ScndSt;
short result;
short a = 0;
short b = 0;
short p = 0;
int enter = 0;
short check(short a, short b)
{
	_asm {
		mov cx, a
		cmp cx, b
		jne GoNext/*; if No - calculating*/
		mov result, -5
		jmp miss
		GoNext :
		mov cx, a
			sub cx, b
			and cx, 8000h/*; check if A - B &gt; 0*/
			jne AsmallerB/*; if A - B &lt; 0 (A &lt; B)*/
			je BsmallerA
			AsmallerB :
		mov result, 2
			jmp miss
			BsmallerA :
		mov result, 1
			miss :
	}
	return result;
}
int main()
{
	cout& lt; &lt; &quot; Enter a : &quot;;
	cin& gt; &gt; a;
	cout& lt; &lt; &quot; Enter b : &quot;;
	cin& gt; &gt; b;
	check(a, b);
	if (result == 1) {
		first_sol(a, b); //a&lt;b
	}
	else if (result == 2) {
		second_sol(a, b); //b&lt;a
	}

	cout& lt; &lt; &quot; Result: &quot; &lt; &lt; result;
	return 0;
}