#include "pch.h"
#include <iostream>
#include <math.h>
using namespace std;
int main()
{	
	int x;
	std::cout << "Enter the number!\n";
	cin >> x;

	if (x > 0) {
		cout << x << " Above zero" << endl;
		system("pause");
	}
	else {
		if (x < 0) {
			cout << x << " less than zero" << endl;
			system("pause");
		}
		else {
			cout << x << " is zero" << endl;
			system("pause");
		}

	}
}
