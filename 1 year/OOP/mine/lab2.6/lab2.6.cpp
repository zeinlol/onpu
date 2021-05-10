#include <iostream>
#include <string>

using namespace std;

/*class abs_figures {
	int i=0;
	int coord_x1;//���������� x ����� ������� ����� ������
	int coord_y1;//���������� y ����� ������� ����� ������
	int color[3] = {1, 2, 3};//�������� ������ �����
public:
	abs_figures() {
			coord_x1 = 0;
			coord_y1 = 0;
			color[i] = '\0';
	}

	void change_color(int i) {
			
	}

	int get_color() {
		return color[i];
	}

	int get_x1() {
		return coord_x1;
	}

	int get_y1() {
		return coord_y1;
	}

	void set_color() {

	}

	void moveX(int xMove) {
		coord_x1 = xMove;
	}
	void moveY(int yMove) {
		coord_y1 = yMove;
	}
	void set_y1(int y1, int i) {
		coord_y1 = y1;
	}

	void show() {
	}

};
class arcs : public abs_figures { //����� ����������� �� abs_figures ��������
	int coord_x2;//���������� x ����� ����
	int coord_y2;//���������� y ����� ����
	int radius; //������ ����

public:
	arcs() : abs_figures() {//�������� ��������� ������������� ������
			coord_x2 = 0;
			coord_y2 = 0;
			radius = 0;
	}

	void show() {
		cout << "Color - " << get_color() << endl;
		cout << "x1 - " << get_x1() << endl;
		cout << "y1 - " << get_y1() << endl;
		cout << "x2 - " << coord_x2 << endl;
		cout << "y2 - " << coord_y2 << endl;
		cout << "radius - " << radius << endl;
		

	}

	int get_x2() {
		return coord_x2;
	}

	int get_y2() {
		return coord_y2;
	}

	void set_x2(int x2) {
		coord_x2 = x2;
	}

	void set_y2(int y2) {
		coord_y2 = y2;
	}

	void set_radius(int r) {
		radius = r;
	}

	int get_radius() {
		return radius;
	}
};

class changed_arcs : public arcs {
public:
	
	
	void show() {
		char f;
		int xMove, yMove;
		cout << "Array of arcs before change\n";
		arcs::show();//����� ������ show ������������� ������ ���

		do {
			cout << "Enter move in x: ";
			cin >> xMove;
			cout << "Enter move in y: ";
			cin >> yMove;
			moveX(xMove);
			moveY(yMove);
			cout << "After change" << endl;
			arcs::show();//����� �������� � ��� ������ ����� ���
			cout << "Do you want to change coordinates? (Y/N)\n";
			cin >> f;
		} while (f == 'Y' || f == 'y');
	}
};*/

/*int main() {
	//������ � ������
	int xLineStart = 0;//���������� x ����� ������� ����� ������
	int yLineStart;//���������� y ����� ������� ����� ������
	string figureColor;//�������� ������ ����� 
	int xLineEnd;//���������� x ����� ����
	int yLineEnd;//���������� y ����� ����
	int curveRadius; //������ ����
	
		cout << "For Line" << endl;
		cout << "x1 = ";
		cin >> xLineStart;
		cout << "y1 = ";
		cin >> yLineStart;
		cout << "x2 = ";
		cin >> xLineEnd;
		cout << "y2 = ";
		cin >> yLineEnd;
		cout << "color = ";
		cin >> figureColor;
		cout << "radius = ";
		cin >> curveRadius;
	
	//������� ������ �� ������� ����������� �����
	abs_figures* figure;
	//������� ������ ������ ����
	arcs a(xLineStart, yLineStart, xLineEnd, yLineEnd, figureColor, curveRadius);
	//������������� ������ �� ��������� ������
	figure = &a;
	//������ � �� ������� ����� ���������� � ������� ������a ������ ����
	cout << "\nOriginal arcs\n";
	figure->show();//����� ��� ��� arcs
	cout << "\nArcs after changed colors\n";
	figure->show();// ���������� ����� �� ������

	//������� ������ ������ ���� � ������������� ������������ 
	changed_arcs b(xLineStart, yLineStart, xLineEnd, yLineEnd, figureColor, curveRadius);
	//������������� ������ �� ��������� ������
	figure = &b;
	//������ � �� ������� ����� ���������� � ������� ������a ������ ���� � ������������� ������������
	cout << "\nWork with changed_arcs\n";
	figure->show();//���� � ������ �����

	return 0;
}*/

class Figure
{
	
public:
	
	int x0, y0, xEnd, yEnd;
	string color;
	void move(int x2, int y2);
	void changeColor(Figure, string color);
	void createLine(int x0, int y0, int xEnd, int yEnd, string color);
	void createCurve(int x0, int y0, int xEnd, int yEnd, string color, int radius);
private:
	class Line
	{
	public:
		int x0, y0, xEnd, yEnd;
		string color;
	};
	class Curve
	{
	public:
		int x0, y0, xEnd, yEnd;
		string color;
		int radius;
	};

};

void Figure::move(int x2, int y2)
{
}

void Figure::changeColor(Figure, string color)
{
}

void Figure::createLine(int x0, int y0, int xEnd, int yEnd, string color)
{
	Line line1;
	line1.x0 = x0;
	line1.y0 = y0;
	line1.xEnd = xEnd;
	line1.yEnd = yEnd;
	line1.color = color;
}

void Figure::createCurve(int x0, int y0, int xEnd, int yEnd, string color, int radius)
{
}

void createFigure(Figure line);

int main() {
	Figure line;
	
	createFigure(line);
	moveIt();
	
}
void createFigure(Figure line){
	int x0, y0, xEnd, yEnd;
	string color;
	cout << "Enter x0 & y0: ";
	cin  >> x0 >> y0;
	cout << "Enter x1 & y1: ";
	cin >> xEnd >> yEnd;
	cout << "\nEnter color: ";
	cin  >> color;
	line.createLine(x0, y0, xEnd, yEnd, color);

}


