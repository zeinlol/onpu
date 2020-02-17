#include "pch.h"
#include <iostream>
#include <string>
#include <sstream>
#include <stdlib.h> 


using namespace std;

int i;

class StudentsList
{
public:
	StudentsList();
	~StudentsList();

	void push_back(string name, string group, int age); //добавление данных в конец
	void push_front(string name, string group, int age); //добавление данных в начало
	void insert(string name, string group, int age, int index); //добавление элемента в определённое место
	int GetSize() { return Size; } //узнать размер списка
	void show(string name, string group, int age); //вывод списка

private:
	class Student
	{
	public:
		Student* pNext;
		string name;
		string group;
		int age;

		Student(string name, string group, int age, Student* pNext = nullptr)
		{
			this->name = name;
			this->group = group;
			this->age = age;
			this->pNext = pNext;
		}
	};

	int Size;
	Student *head;

};

StudentsList::StudentsList()
{
	Size = 0;
	head = nullptr;
}

StudentsList::~StudentsList()
{
}

/*void StudentsList::pop_front()
{
	Student* temp = head;
	head = head->pNext;
	delete temp;
	Size--;

}

void StudentsList::clear()
{
	while (Size)
	{

		pop_front();
	}
}*/

void StudentsList::push_back(string name, string group, int age)
{

	if (head == nullptr)
	{
		head = new Student(name, group, age);
	}
	else
	{
		Student* current = this->head;
		while (current->pNext != nullptr)
		{
			current = current->pNext;
		}
		current->pNext = new Student(name, group, age);
	}
	Size++;
}

void StudentsList::push_front(string name, string group, int age)
{
	head = new Student(name, group, age, head);
	Size++;
}

void StudentsList::insert(string name, string group, int age, int index)
{
	if (index == 0)
	{
		push_front(name, group, age);
	}
	else if (index >= Size)
		push_back(name, group, age);
	else {
		Student* previous = this->head;
		for (int i = 0; i < index - 1; i++)
		{
			previous = previous->pNext;
		}
		previous->pNext = new Student(name, group, age, previous->pNext);
		Size++;
	}
}

void StudentsList::show(string name, string group, int age)
{
	Student* temp = head;
	while (head)
	{

		cout << "Name: " << head->name << " Group: " << head->group << " Age: " << head->age << endl; // Вывод текущего элемента
		head = head->pNext;         // Переход к следующему
	}
	head = temp;
	delete temp;
	return;
}

void AddElement(StudentsList);

int main() {
	StudentsList stlst;
	string name, group, ages;
	int age, count, command = 1;
	cout << "Enter numbers of students: ";
	cin >> count;
	for (int i = 0; i < count; i++)
	{
		cout << "Enter student's name: ";
		getline(cin, name);
		getline(cin, name);
		cout << "Enter group: ";
		getline(cin, group);
		cout << "Enter student's age: ";
		getline(cin, ages);
		stringstream(ages) >> age;
		stlst.push_back(name, group, age);
	}
	while (command != 0) {
		cout << "Enter command (1 - Add element, 2 - view list, 3 - delete and exit): ";
		cin >> command;
		switch (command)
		{
		case 1: {
			AddElement(stlst);
			break;
		}
		case 2: {
			stlst.show(name, group, age);
			break;
		}
		case 3: {
			command = 0;
			break;
		}
				break;
		}

	}
	return 0;
}
void AddElement(StudentsList stlst) {
	string name, group, ages, number;
	int age, index;
	cout << "Enter student's name: ";
	getline(cin, name);
	getline(cin, name);
	cout << "Enter group: ";
	getline(cin, group);
	cout << "Enter student's age: ";
	getline(cin, ages);
	stringstream(ages) >> age;
	cout << "Enter student's number: ";
	getline(cin, number);
	stringstream(number) >> index;
	stlst.insert(name, group, age, index);
}
