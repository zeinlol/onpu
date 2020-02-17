#include <iostream>
#include <string>
#include <sstream>

using namespace std;

struct Student
{
	string name;
	string group;
	int rating;
	int arrears;
};

void printstudents(Student student);

int main()
{

	string rating, arrears;
	int n, i;
	
	cout << "Enter numbers of students: ";
	cin << i;

	Student* students = new Student[i];

	for (n = 0; n < i; n++)
	{
		cout << "Enter student's name: ";
		getline(cin, students[n].name);
		cout << "Enter group: ";
		getline(cin, students[n].group);
		cout << "Enter student's rating: ";
		getline(cin, rating);
		stringstream(rating) >> students[n].rating;
		cout << "Enter numbers of student's arrears: ";
		getline(cin, arrears);
		stringstream(arrears) >> students[n].arrears;
	}
	cout << "\nYou have entered these movies:\n";
	for (n = 0; n < i; n++)
		printstudents(students[n]);
	delete[]students;
	return 0;
}
void printstudents(Student student) {
	cout << "Name: " << student.name << "; ";
	cout << "Group: " << student.group << "; ";
	cout << "Rating: " << student.rating << "; ";
	cout << "Arrears: " << student.arrears << "; " << endl;
}