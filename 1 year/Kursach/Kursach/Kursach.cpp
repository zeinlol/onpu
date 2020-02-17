#include <string>
#include <iostream>
using namespace std;

struct Node
{
	string registrationDate = "RegistrationDate_No_Info";
	string date = "Date_No_Info";
	string name = "Name_No_Info";
	string specialization = "Specialization_No_Info";
	Node* next;
};

struct Queue
{
	int size;
	Node* first;
	Node* last;
};

void createQueue(Queue* queue)
{
	queue->first = new Node;
	queue->first->next = NULL;
	queue->last = queue->first;
	queue->size = 0;
}

bool checkQueue(Queue* queue)
{
	if (queue->first == queue->last) return true;
	else return false;
}

void Add(Queue* queue, string name, string date, string specialization, string registration)
{
	queue->last->next = new Node;
	queue->last = queue->last->next;
	queue->last->name = name;
	queue->last->date = date;
	queue->last->specialization = specialization;
	queue->last->registrationDate = registration;
	queue->last->next = NULL;
	queue->size++;
	cout << "Element has added\n\n";
}
void showTop(Queue* queue)
{
	cout << "\nName: " << queue->first->next->name << "\nDate: " << queue->first->next->date << "\nSpecialization: " << queue->first->next->specialization << "\nRegistration Date: " << queue->first->next->registrationDate;
}

void Delete(Queue* queue, int number)
{
	queue->first = queue->first->next;
	queue->size--;
	//name.erase(name.begin() + number);
	cout << "Ёлемент удален\n\n";
}

int getSize(Queue* queue) //размер очереди
{
	return queue->size;
}
void findEl(Queue* queue, string tempname) {
	int position = 0;
	/*int counter = getSize(*queue);
	 for (int i = 0; i < getSize(&queue); ++i)*/
	while (queue->last->next != NULL) {
		if (queue->last->name == tempname)
		{
			//position = i;
			cout << "Number: " << position << endl;
		}
		else
			queue->last = queue->last->next;
		//else cout << "Element not found\n+";
	}
}
int main()
{
	Queue queue;
	createQueue(&queue);
	int position = 0;
	char number;
	do
	{
		cout << "1. Add element" << endl;
		cout << "2. Delete element" << endl;
		cout << "3. Show top element" << endl;
		cout << "4. Show size" << endl;
		cout << "5. Find element" << endl;
		cout << "0. Exit\n\n";
		cout << "Your choose: ";
		cin >> number;
		cin.ignore();
		if (number == '1')
		{
			string name, date, specialization, registration;
			cout << "Name: ";
			cin >> name;
			cout << "Date: ";
			cin >> date;
			cout << "Specialization: ";
			cin >> specialization;
			cout << "Registration Date: ";
			cin >> registration;
			Add(&queue, name, date, specialization, registration);
		}
		else if (number == '2')
		{
			if (checkQueue(&queue)) cout << endl << "Nothing to delete!\n\n";
			else Delete(&queue, position);
		}
		else if (number == '3')
		{
			if (checkQueue(&queue)) cout << endl << "Empty!\n\n";
			else {
				cout << "\nTop Element: ";
				showTop(&queue);
				cout << "\n";
			}
		}
		else if (number == '4')
		{
			if (checkQueue(&queue)) cout << endl << "Size is 0!\n\n";
			else cout << "\nSize is: " << getSize(&queue) << "\n\n";
		}
		else if (number == '5')
		{
			string tempname;
			cout << "Enter the name: ";
			cin >> tempname;
			findEl(&queue, tempname);
		}
		else if (number == '0') exit(0);
		else cout << endl << "Command is not declared\n\n";
	} while (number != '0');
	system("pause");
	return 0;
}

