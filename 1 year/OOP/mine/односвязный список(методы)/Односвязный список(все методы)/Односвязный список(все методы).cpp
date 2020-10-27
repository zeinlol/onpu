#include <iostream>
#include <string>
#include <sstream>

using namespace std;

int i;

template<typename T>
class StudentsList
{
public:
	StudentsList();
	~StudentsList();

	void pop_front(); //удаление первого эдемента
	void removeAt(int index); //удаление определлённого элемента
	void pop_back();//удаление последнего списка
	void clear(); //удаление всех эдементов
	void push_back(T data); //добавление данных в конец
	void push_front(T data); //добавление данных в начало
	void insert(T value, int index); //добавление элемента в определённое место
	int GetSize() { return Size; } //узнать размер списка
	T& operator[](const int index); //вывод элемента списка

private:
	template<typename T>
	class Student
	{
	public:
		Student* pNext;
		T data;
		Student(T data, Student* pNext = nullptr)
		{
			this->data = data;
			this->pNext = pNext;
		}
	};

	int Size;
	Student<T>* head;

};

template<typename T>
StudentsList<T>::StudentsList()
{
	Size = 0;
	head = nullptr;
}

template<typename T>
StudentsList<T>::~StudentsList()
{
	clear();
}

template<typename T>
void StudentsList<T>::pop_front()
{
	Student<T>* temp = head;
	head = head->pNext;
	delete temp;
	Size--;
}

template<typename T>
void StudentsList<T>::removeAt(int index)
{
	if (index == 0)
	{
		pop_front();
	}
	else
	{
		Student<T>* previous = this->head;
		for (int i = 0; i < index - 1; i++)
		{
			previous = previous->pNext;
		}
		Student<T>* ToDelete = previous->pNext;
		previous->pNext = ToDelete->pNext;
		delete ToDelete;
		Size--;
	}
}

template<typename T>
void StudentsList<T>::pop_back()
{
	removeAt(Size - 1);
}

template<typename T>
void StudentsList<T>::clear()
{
	while (Size)
	{
		pop_front();
	}
}

template<typename T>
void StudentsList<T>::push_back(T data)
{
	if (head == nullptr)
	{
		head = new Student<T>(data);
	}
	else
	{
		Student<T>* current = this->head;
		while (current->pNext != nullptr)
		{
			current = current->pNext;
		}
		current->pNext = new Student<T>(data);
	}
	Size++;
}

template<typename T>
void StudentsList<T>::push_front(T data)
{
	head = new Student<T>(data, head);
	Size++;
}

template<typename T>
void StudentsList<T>::insert(T value, int index)
{
	if (index == 0)
	{
		push_front(value);
	}
	else {
		Student<T>* previous = this->head;
		for (int i = 0; i < index - 1; i++)
		{
			previous = previous->pNext;
		}
		previous->pNext = new Student<T>(value, previous->pNext);
		Size++;
	}
}

template<typename T>
T& StudentsList<T>::operator[](const int index)
{
	int counter = 0;
	Student<T>* current = this->head;
	while (current != nullptr)
	{
		if (counter == index)
		{
			return current->data;
		}
		current = current->pNext;
		counter++;
	}
}