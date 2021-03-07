// ********************************************************************
//  mdomain.pas
//
//  Создание класса Domain
//  Экземпляры класса описывают домены модели
// ********************************************************************

unit mdomain;

interface

type
   RepNumberType = 0..4;

type

//_ объект описывающий имитационную модель домена
//_

	Domain = class
	public
		//Время одного такта (время передачи одного байта) в тиках.
		TicsPerTact : Integer;

		//Сколько осталось тиков до следующего такта
		TicsLeft : Integer;

		//Общее время ожидания каждой заявки в домене, включая время на
        //обработку (в тиках)
		JobWaitTics : array of int64;

		//Общее время ожидания каждой заявки в домене, включая время на
        //обработку (в тактах)
		JobWaitTacts : array of int64;

		//Общее время ОБРАБОТКИ каждой заявки в домене, без учета времени
        //на ожидание в очереди (в тиках)
		JobServicingTics : array of int64;

		//Суммарное среднее время ожидания всех заявок в этом домене в тиках
		TotalJobsWaitTics : int64;

		//Суммарное время ожидания всех заявок в этом домене коллизий
		TotalJobsWaitTacts : int64;

		//Суммарное время обслуживания всех заявок в этом домене (в тиках).
		TotalJobsServicingTics : int64;

		//Суммарное число тактов, промоделированное в этом домене
		TotalTacts : int64;

		//Минимальная длина пакета, или время, в течение которого возможно столкновение.
		FrameMinLength : byte;

		constructor Create( mTicsPerTact : Integer; mRepNumber : RepNumberType );
	end;

var
	//Минимальные длины пакетов для различных конфигураций сети с
	//одним, двумя и более репитерами, определяемые правилом круговой задержки
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
