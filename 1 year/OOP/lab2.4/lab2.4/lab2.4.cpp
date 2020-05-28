#include <iostream>
#include <algorithm>
#include <string>
#include <fstream>
#include <iterator>
#include "cmath"
using namespace std;

const char* FileName = "notCodet.txt";
int length;

void encode(const std::string& src_file, const std::string& dest_file, unsigned short num);
void decode(const std::string& src_file, const std::string& dest_file, unsigned short num);
void CreateFile();
//void ReadFile();
int main()
{
	CreateFile();
	//ReadFile();
	unsigned short number;
	cout << "Number: ", cin >> number;
	encode("notCodet.txt","Codet.txt", number);
	decode("Codet.txt", "Decodet.txt", number);
	cin.ignore().get();
}
/*void ReadFile() {
	char* data = new char[length];
	ifstream in(FileName, ios::binary);
	in.read(data, sizeof(data));
	in.close();
	cout << data;
	delete[]data;
}*/
void CreateFile() {
	string str;
	cout << "Hello, first of all, enter data please: ";
	getline(cin, str);
	length = str.length();
	ofstream out(FileName, ios::binary);
	out << str;
	out.close();
}

void encode(const std::string& src_file, const std::string& dest_file, unsigned short num)
{
	ifstream in_file(src_file, ios::binary);
	ofstream out_file(dest_file, ios::binary);
	transform(istreambuf_iterator<char>(in_file), istreambuf_iterator<char>(), ostreambuf_iterator<char>(out_file), [num](char c) { return c ^ num; });
	in_file.close();
	out_file.close();
	cout << "File encoded (Codet.txt)"<<endl;
}
void decode(const std::string& src_file, const std::string& dest_file, unsigned short num)
{
	ifstream in_file(src_file, ios::binary);
	ofstream out_file(dest_file, ios::binary);

	transform(istreambuf_iterator<char>(in_file), istreambuf_iterator<char>(), ostreambuf_iterator<char>(out_file), [num](char c) { return sqrt(c); });

	in_file.close();
	out_file.close();
	cout << "File decoded (Decodet.txt)" << endl;
}