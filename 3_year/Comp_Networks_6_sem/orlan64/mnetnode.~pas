// ********************************************************************
//  mnetnode.pas
//
//  Создание класса NetNode
//  Экземпляры класса описывают узлы модели
// ********************************************************************

unit mnetnode;

interface

uses classes;

const
   MaxNodeConns : Integer = 32;

type
   NetNode = class
   public
     //Список доменов, к которым подключен узел (индексы массива Network.Domains)
      Conns : array[0..31] of Integer;
     //Массив соединений доменов, которые обеспечивает этот узел.
     //Цифры обозначают число тиков, которое требуется для данного перехода.
{      Delays : array[0..31,0..31] of int64;}

      MaxTaskNumber : integer; // максимальное число пакетов в состоянии StNetNode,
                               // которые могут приготавливаться одновременно в этом узле.

//Общее время ожидания каждой заявки в узле, включая время на обработку (в тиках)
      JobWaitTics : array of int64;
//Общее время ожидания каждой заявки в узле, включая время на обработку (в тактах)
      JobWaitTacts : array of int64;
//Общее время ОБРАБОТКИ каждой заявки в узле, без учета времени на ожидание в очереди (в тиках)
      JobServicingTics : array of int64;

//Суммарное среднее время ожидания всех заявок в этом узле (в тиках)
      TotalJobsWaitTics : int64;
//Суммарное время ожидания всех заявок в этом узле (в тактах).
      TotalJobsWaitTacts : int64;
//Суммарное время обслуживания всех заявок в этом узле (в тиках).
      TotalJobsServicingTics : int64;

//Суммарное число тактов, промоделированных в этом узле
      TotalTacts : int64;

      constructor Create( );
   end;

implementation

constructor NetNode.Create( );
begin
   inherited Create();
   MaxTaskNumber := MaxInt;
   TotalTacts := 0;
   TotalJobsWaitTacts := 0;
   TotalJobsWaitTics := 0;
   TotalJobsServicingTics := 0;
end;

end.
