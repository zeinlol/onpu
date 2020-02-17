#include <string>
#include <iostream>
#include <sstream>


using namespace std;

struct Student
{
	string name;
	string group;
	string paycompany;
	int    contract;
	int    budget;
	int    stipendia;
	int    rating;
	int    arrears;
};

//void deletestudent(Student student, int kill);
void info(Student student);
void whatToDo(Student student, int r);

int i = 1;
Student* students = new Student[i];

int main()
{

	string choosestr;
	int    contract, budget, choose, jopa;

	cout << "Enter numbers of students: ";
	cin  >> i;
	students = new Student[i];

	for (int m = 0; m < i; m++)
	{
		cout << "Enter student's name: ";
		cin  >> students[m].name;
		cout << "Enter group: ";
		cin  >> students[m].group;
		cout << "Enter student's rating: ";
		cin  >> students[m].rating;
		cout << "Enter numbers of student's arrears: ";
		cin  >> students[m].arrears;
		cout << "Student has contract? (yes-1, no-0): ";
		cin  >> contract;

		if (contract) {
			students[m].contract  = 1;
			students[m].budget    = 0;
			students[m].stipendia = 0;
			cout << "Enter pay organisation: ";
			cin  >> students[m].paycompany;

		}
		else {
			students[m].contract = 0;
			students[m].budget   = 1;

			cout << "Has student stipendia? (yes-1, no-0): ";
			cin  >> budget;
			
			if (budget) {
				cout << "How much? ";
				cin  >> students[m].stipendia;
			}
			else
				students[m].stipendia = 0;
		}
	}
	do {
		cout << "1 - show students na contracte, 2 - na budgete, 3 - so stipendiey, 9 - all students, 0 - exit" << endl;
		cin >> choose;
		if (choose == 4) {
			cout << "Enter amount of arrears: ";
			cin  >> jopa;
			for (int n = 0; n < i; n++) {
				deletestudent(students[n], jopa);
			}
		}
		else {
			for (int n = 0; n < i; n++) {
				whatToDo(students[n], choose);
			}
		}
	} while (choose);
	return 0;
}

void whatToDo(Student student, int r) {

	int one = 1, jopa;
	
	switch (r) {
	case 1: {
		if (student.contract == one) {
			info(student);
			cout << "Pay company: " << student.paycompany << "; " << endl;
		} break;
	}
	case 2: {
		if (student.budget == one && student.stipendia != one) {
			info(student);
			cout << "Budget: "    << student.budget    << "; ";
			cout << "Stipendia: " << student.stipendia << "; " << endl;
		} break;
	}
	case 3: {
		if (student.budget == one && student.stipendia) {
			info(student);
			cout << "Budget: "    << student.budget    << "; ";
			cout << "Stipendia: " << student.stipendia << "; " << endl;
		} break;
	}
	case 9: {
		info(student);
		cout << "Pay company: " << student.paycompany << "; ";
		cout << "Contract: "    << student.contract   << "; ";
		cout << "Budget: "      << student.budget     << "; ";
		cout << "Stipendia: "   << student.stipendia  << "; " << endl;
		break;
	}
	default:
		break;
	}
}
void info(Student student) {
	cout << "Name: "    << student.name    << "; ";
	cout << "Group: "   << student.group   << "; ";
	cout << "Rating: "  << student.rating  << "; ";
	cout << "Arrears: " << student.arrears << "; ";
}

/*void deletestudent(Student student, int kill) {
	if (student.arrears >= kill ) {
		student.name       =   "-";
		student.group      =   "-";
		student.paycompany =   "-";
		student.rating     =     0;
		student.contract   =     0;
		student.budget     =     0;
		student.stipendia  =     0;
		student.arrears    =     0;
	}
}*/