#include <stdio.h>
#include <string>
#include <sstream>
#include <iostream>
#include <conio.h>

using namespace std;

int Size = 0;

struct Stroke {
	
	Stroke* pNext = nullptr;
	string name;
	string data;
};
class Line {
	Stroke* head;
	
	public:
		Line() { head = nullptr; }
		~Line();
		friend void deleteElement();
		void createMass();
		void createFriendlyClass();
		void write(string name, string data);
		void writeAt();
		void show();
		void showOnly(int num);
		void clean();
		void showEl(int num);
		
};

Line::~Line()
{
	clean();
}

void Line::write(string name, string data) {

	Stroke* temp = new Stroke;

	temp->name = name;
	temp->data = data;
	temp->pNext = head;
	head = temp;
	Size++;
}
void Line::createMass() {}
void Line::createFriendlyClass() {}
void Line::writeAt() {}
void Line::show() {
	int counter = 1;
	if (Size == 0)
		cout << "Empty!" << endl;
	else {
		Stroke* temp = head;

		while (temp != nullptr)
		{
			cout << counter << ") " << "Name: " << temp->name << " " << "Data: " << temp->data << endl;
			temp = temp->pNext;
			counter++;
		}
	}
}

void Line::showOnly(int num){
	if (Size == 0)
		cout << "Empty list!";
	else if (num <= 1) {
		num = 1;
		showEl(num);
	}
	else if (num >= Size) {
		num = Size;
		showEl(num);
	} else 
		showEl(num);

}

void Line::showEl(int num) {
	int counter = 1;
	Stroke* temp = head->pNext;
	while (counter != num)
	{
		Stroke* temp1 = head->pNext;
		delete head;
		head = temp1;
		counter++;
		temp = temp1;
	}
	cout << counter << ") " << "Name: " << temp->name << " " << "Data: " << temp->data << endl;
}


void Line::clean() {
	while (head != nullptr) {
		Stroke* temp = head->pNext;
		delete head;
		head = temp;
		Size--;
	}
	cout << "Cleaned! " << endl;
}



void deleteElement() {

}

int main() {
	Line stroke;
	int choose = 1;
	string name, data;
	while (choose) {
		cout << "1 - write information" << endl << "2 - show only..." << endl;
		cout << "3 - create friendly elem." << endl << "4 - show" << endl << "5 - clean" << endl;
		cout << "6 - create Mass" << endl << "7 - delete element" << endl << "0 - exit" << endl;

		cin >> choose;

		switch (choose) {
		case 1: {
			cout << "Name: ";
			cin >> name;
			cout << "Data: ";
			cin >> data;
			stroke.write(name, data);
			break;
		}
		case 2: {
			int Num;
			cout << "Enter the number: ";
			cin >> Num;
			stroke.showOnly(Num);
			break;
		}
		case 3: {
			break;
		}
		case 4: {
			stroke.show();
			break;
		}
		case 5: {
			stroke.clean();
			break;
		}
		case 6: {
			break;
		}
		case 7: {
			cout << Size << endl;
			break;
		}
		case 0: {
			choose = 0;
			break;
		}
		default: {break; }
		}
	}
	return 0;
}

