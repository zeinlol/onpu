#include "pch.h"
#include <iostream>
#include "string"

using namespace std;
int main() {

	int en = 0, ru = 0, de = 0;
	char eng[] = { 'a', 'b', 'c', 'd','e','f','g', 'h', 'i', 'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', };
	char rus[] = { 'а','б','в','г','д','е','э','ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ц','ч','ш','щ','ъ','ь','ю','я' };
	char deu[] = { 'ä','ü','ö','ß' };
	string str;
	getline(cin, str);
	for (int i = 0; i < str.length(); i++) {
		for (int j = 0; j < 35; j++) {
			if (str[i] == eng[j]) {
				en++;
			}
			else if (str[i] == rus[j]) {
				ru++;
			}
			else if (str[i] == deu[j]) {
				de++;
			}
		}
	}
	cout << "Enlish-" << en << endl << "Russian-" << ru << endl << "Deutch-" << de << endl;

	return 0;
}