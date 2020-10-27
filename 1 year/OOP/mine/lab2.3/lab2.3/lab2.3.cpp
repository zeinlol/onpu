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

	void pop_front(); //удаление первого эдемента
	/*void removeAt(int index); //удаление определлённого элемента
	void pop_back(); //удаление последнего из списка*/
	void clear(); //удаление всех эдементов
	void push_back(string name, string group, int age); //добавление данных в конец
	void push_front(string name, string group, int age); //добавление данных в начало
	void insert(string name, string group, int age, int index); //добавление элемента в определённое место
	void show(); //вывод списка

private:
	class Student
	{
	public:
		Student* pNext;
		string   name;
		string   group;
		int      age;

		Student(string name, string group, int age, Student* pNext = nullptr)
		{
			this->name  =  name;
			this->group =  group;
			this->age   =  age;
			this->pNext =  pNext;
		}
	};

	int      Size;
	Student *head;

};

StudentsList::StudentsList()
{
	Size = 0;
	head = nullptr;
}

StudentsList::~StudentsList()
{
	clear();
}

void StudentsList::pop_front()
{
	if (head != nullptr) {
		Student* temp = head;
		head   = head->pNext;
		delete temp;
		Size--;
	}
}

void StudentsList::clear()
{
	while (Size)
		pop_front();
}

void StudentsList::push_back(string name, string group, int age)
{

	if (head == nullptr) {
		head = new Student(name, group, age);
	} else {
		Student* current = this->head;
		while (current->pNext != nullptr) {
			current = current->pNext;
		}
		current->pNext = new Student(name, group, age);
	}
	Size++;
}

void StudentsList::push_front(string name, string group, int age)
{
	Student* temp1 = head;
	temp1  = new Student(name, group, age);
	temp1 -> pNext = head;
	head   = temp1;
	Size++;
}

void StudentsList::insert(string name, string group, int age, int index)
{
	if (index == 0) {
		push_front(name, group, age);
	}
	else if (index >= Size)
		push_back(name, group, age) ;
	else {
		Student* previous = this->head;
		for (int i = 0; i < index - 1; i++) {
			previous = previous->pNext;
		}
		previous->pNext = new Student(name, group, age, previous->pNext);
		Size++;
	}
}

void StudentsList::show() {
	Student* temp = head;
	while (temp) {
		cout << "Name: " << temp->name << " Group: " << temp->group << " Age: " << temp->age << endl; // Вывод текущего элемента
		temp = temp->pNext;         // Переход к следующему
	}
	delete temp;
}

void AddElement(StudentsList);

int main() {
	StudentsList stlst;
	string name, group;
	int    age , count, command = 1;
	cout << "Enter numbers of students: ";
	cin  >> count;
	for (int i = 0; i < count; i++)
	{
		cout << "Enter student's name: ";
		cin  >> name;
		cout << "Enter group: ";
		cin  >> group;
		cout << "Enter student's age: ";
		cin  >> age;
		stlst.push_back(name, group, age);
	}
	while (command !=0) {
		cout << "Enter command (1 - Add element, 2 - view list, 3 - delete, 0 - exit): ";
		cin  >> command;
		switch (command)
		{
		case 1: {
			AddElement(stlst);
			break;
		}
		case 2: {
			stlst.show();
			break;
		}
		case 3: {
			stlst.clear();
			break;
		}
		case 0: {
			command = 0;
			break;
		}
			break;
		}
		
	}
	return 0;
}
void AddElement(StudentsList stlst) {
	string Name, Group;
	int    Age , index;
	cout << "Enter student's name: ";
	cin  >> Name;
	cout << "Enter group: ";
	cin  >> Group;
	cout << "Enter student's age: ";
	cin  >> Age;
	cout << "Enter student's number: ";
	cin  >> index;
	index--;
	stlst.insert(Name, Group, Age, index);
}
