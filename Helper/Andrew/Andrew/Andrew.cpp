#include "math.h"
#include "pch.h"
#include <iostream>
using namespace std;

int fun(int, int, int, int);


int main()
{
	int g1, g2, m1 = 1, m2, d2, i, d, d1 = 1, d0, g, dm = 0;
	cout << "Enter the date: year month day" << endl;
	cin >> g2 >> m2 >> d2;
	g1 = g2;
	g = g2 - g1;
	d0 = (g / 4);
	d = g * 365;
	d += d0;
	dm = fun(m1, dm, d1, g1);
	d -= dm;
	dm = 0;
	dm = fun(m2, dm, d2, g2);
	d += dm;
	cout << d;
	cin >> i;

	return 0;
}

int fun(int m1, int dm, int d1, int g)
{
	switch (m1)
	{
	case 1:
		dm = 0 + d1;
		break;
	case 2:
		dm = 31 + d1;
		break;
	case 3:
		if (g - (g / 4) * 4 == 0)dm = d1 + 60;
		else dm = 59 + d1;
		break;
	case 4:
		if (g - (g / 4) * 4 == 0)dm = 91 + d1;
		else dm = 90 + d1;
		break;
	case 5:
		if (g - (g / 4) * 4 == 0) dm = 121 + d1;
		else dm = 120 + d1;
		break;
	case 6:
		if (g - (g / 4) * 4 == 0) dm = 152 + d1;
		else dm = 151 + d1;
		break;
	case 7:
		if (g - (g / 4) * 4 == 0) dm = 182 + d1;
		else dm = 181 + d1;
		break;
	case 8:
		if (g - (g / 4) * 4 == 0) dm = 213 + d1;
		else dm = 212 + d1;
		break;
	case 9:
		if (g - (g / 4) * 4 == 0) dm = 244 + d1;
		else dm = 243 + d1;
		break;
	case 10:
		if (g - (g / 4) * 4 == 0) dm = 274 + d1;
		else dm = 273 + d1;
		break;
	case 11:
		if (g - (g / 4) * 4 == 0) dm = 305 + d1;
		else dm = 304 + d1;
		break;
	case 12:
		if (g - (g / 4) * 4 == 0) dm = 335 + d1;
		else dm = 334 + d1;
		break;
	}
	return dm;
}