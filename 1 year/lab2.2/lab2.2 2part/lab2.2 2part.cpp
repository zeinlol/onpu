#include <iostream>
#include <math.h>
#include <stdio.h>

using namespace std;

int main()
{
	double x, y, n;
	x = -41.56789;
	y = modf(x, &n);
	printf("modf(%f)=fractional %f and integer : %f",
		x, y, n);
	
}