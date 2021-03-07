// ********************************************************************
//  mdomain.pas
//
//  �������� ������ Domain
//  ���������� ������ ��������� ������ ������
// ********************************************************************

unit mdomain;

interface

type
   RepNumberType = 0..4;

type

//_ ������ ����������� ������������ ������ ������
//_

	Domain = class
	public
		//����� ������ ����� (����� �������� ������ �����) � �����.
		TicsPerTact : Integer;

		//������� �������� ����� �� ���������� �����
		TicsLeft : Integer;

		//����� ����� �������� ������ ������ � ������, ������� ����� ��
        //��������� (� �����)
		JobWaitTics : array of int64;

		//����� ����� �������� ������ ������ � ������, ������� ����� ��
        //��������� (� ������)
		JobWaitTacts : array of int64;

		//����� ����� ��������� ������ ������ � ������, ��� ����� �������
        //�� �������� � ������� (� �����)
		JobServicingTics : array of int64;

		//��������� ������� ����� �������� ���� ������ � ���� ������ � �����
		TotalJobsWaitTics : int64;

		//��������� ����� �������� ���� ������ � ���� ������ ��������
		TotalJobsWaitTacts : int64;

		//��������� ����� ������������ ���� ������ � ���� ������ (� �����).
		TotalJobsServicingTics : int64;

		//��������� ����� ������, ����������������� � ���� ������
		TotalTacts : int64;

		//����������� ����� ������, ��� �����, � ������� �������� �������� ������������.
		FrameMinLength : byte;

		constructor Create( mTicsPerTact : Integer; mRepNumber : RepNumberType );
	end;

var
	//����������� ����� ������� ��� ��������� ������������ ���� �
	//�����, ����� � ����� ����������, ������������ �������� �������� ��������
	FrameMinLengthArray : array [0..4] of byte = (28, 33, 34, 37, 41);

implementation

constructor Domain.Create( mTicsPerTact : Integer; mRepNumber : RepNumberType );
begin
	inherited Create();
	TotalTacts := 0;
	TotalJobsWaitTacts := 0;
	TotalJobsWaitTics := 0;
	TotalJobsServicingTics := 0;
	TicsPerTact := mTicsPerTact;
	TicsLeft := mTicsPerTact;
	FrameMinLength := FrameMinLengthArray[ mRepNumber ];
end;

end.
