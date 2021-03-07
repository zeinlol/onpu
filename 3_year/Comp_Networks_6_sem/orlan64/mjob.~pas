// ********************************************************************
//  mjob.pas
//
//  Создание класса Netjob
//  Экземпляры класса описывают заявки модели
// ********************************************************************

unit mjob;

interface

uses mdomain;

type
   FrameStateType = (
//ожидание начала обработки пакета станцией в случае, если она не может обрабатывать несколько пакетов одновременно
                      StInBuffer,
//пакет готовится на клиенте, сервере или коммутаторе к передаче
                      StNetNode,
//передача преамбулы и начала пакета. В это время возможно столкновение
                      StCanCollide,
//передача остатка пакета
                      StTransmission,
//ожидание полного освобождения канала
                      StPostWait,
//пауза в передаче после возникновения столкновения
                      StRandomWait,
//ожидание освобождения канала
                      StWaitForFree,
//ожидание окончания цикла, если требуется
                      StWaitForCycle );

type
   DynIntArray = array of integer;

type
   DynInt64Array = array of int64;

type
   DistDelayType = (Constant,
                    Exponential);
type
   NetJob = class
   public
      ReqSize : integer;      //размер запроса в байтах
      ReqsNumber : integer;   //не может быть равно 0. Сначала обрабатываются все запросы, потом все ответы.
      AnsSize : integer;      //размер ответа в байтах
      AnssNumber : integer;   //Количество ответов на ReqsNumber запросов. Может быть равно 0
      Category : byte;		  //приоритет заявки
      CycleTime : int64;      //время цикла заявки, то есть минимальное время между передачами новых заявок

      Hops : DynIntArray;       //маршрут заявки: Client->Switch1->...->SwitchN->Server (индексы массива Network.NetNodes)
      HopDelays : DynInt64Array;//массив задержек в узлах, в том числе задержки в клиенте и сервере
      CurrHopIndx : integer;    //индекс в Hops и HopDelays - текущий узел, который передает эту заявку
      CurrDomain : Domain;      //текущий домен
      ReqsLeft : integer;       //сколько осталось передать запросов в этом цикле
      AnssLeft : integer;       //сколько осталось передать ответов в этом цикле.
      FrameState : FrameStateType;	//текущее состояние пакета
      TactsLeft : integer;			//сколько тактов осталось находиться в этом состоянии
      TactsSpentInCycle : int64;	//сколько тактов заявка уже передается в текущем цикле

      StatTriesCount : integer;		//сколько было неудачных попыток передачи
      StatSuccCount : integer;		//сколько всего было послано запросов плюс послано ответов

      //------------------------------------------------------------------------
      MaxServTime : integer;			//_ максимальное время передачи для заявок данного класса
      CurrServTime: integer;			//_ текущее время передачи для заявок данного класса

      PossibleTime : integer;  			//_ некоторое допустимое время передачи
      PossiblePercent : byte;	 		//_ допустимый процент заявок, которые могут превышать допустимое время
      CountOfExcQueries: integer;		//_ количество заявок с временем передачи, превышающем допустимое

      DistOfServerDelay: DistDelayType; //_ распределние задержки на сервере
      HopDelay2: int64;                 //_ для равномерного - вторая величина

      PositionInQueue: byte;			//_ положение заявки в очереди

   public
      procedure SetNewState( mNewState : FrameStateType );
      constructor Create( mReqSize : integer;
                          mReqsNumber : integer;
                          mAnsSize : integer;
                          mAnssNumber : integer;
                          mCategory : integer;
                          mCycleTime : int64  );
   end;

   function IntToDistr(OrdValue: byte): DistDelayType;

implementation

uses math, mnetwork;

//=============================================================================
// Convert numder to value 
//=============================================================================
function IntToDistr(OrdValue: byte): DistDelayType;
begin
	case OrdValue of
    	0:	Result:=Constant;
        //1: Result:=Uniform;
	    1:	Result:=Exponential;
    end;
end;


constructor NetJob.Create( mReqSize : integer;
                           mReqsNumber : integer;
                           mAnsSize : integer;
                           mAnssNumber : integer;
                           mCategory : integer;
                           mCycleTime : int64  );
begin
   inherited Create();

   ReqSize := mReqSize;
   ReqsNumber := mReqsNumber;
   AnsSize := mAnsSize;
   AnssNumber := mAnssNumber;
   Category := mCategory;
   CycleTime := mCycleTime;

   StatTriesCount := 0;
   StatSuccCount := 0;

   TactsSpentInCycle := 0;

   PositionInQueue := 0;
end;

function Exp2( Arg : word ) : word;
var
  i   : byte;
  Res : word;
begin
  Res := 1;
  for i:=0 to Arg do
    Res := Res shl 1;
  Exp2 := Res;
end;

procedure NetJob.SetNewState( mNewState : FrameStateType );

begin
   case mNewState of

       StNetNode:
       begin
          TactsLeft := Round( HopDelays[CurrHopIndx] / CurrDomain.TicsPerTact);
          //если сервер, то определим распределение
          {if CurrHopIndx = Length(Hops) - 1 then
                case DistOfServerDelay of
                    // постоянное
                    Constant:
                    TactsLeft:=TactsLeft;

                    // равномерное распределение
                    Uniform:
                    TactsLeft:=Round( TactsLeft+Random*(HopDelay2-TactsLeft));

                    // экспоненциальное
                    Exponential:
                    TactsLeft := Round(-TactsLeft * ln(1 - Random));
                end
          else
          // все что не сервер - экспоненциальное}
          TactsLeft := Round(-TactsLeft * ln(1 - Random));

          StatTriesCount := 0;
          Inc(TactsSpentInCycle, TactsLeft);
       end;

       StCanCollide:
       begin
//Это значение зависит от числа повторителей
          TactsLeft := CurrDomain.FrameMinLength;
          Inc(TactsSpentInCycle, TactsLeft);
       end;

       StTransmission:
       begin
//Это значение зависит от длины пакета
          if (ReqsLeft > 0) then
          		//-------------------------------------------------------------
          		case DistOfServerDelay of
                    // постоянное
                    Constant:
                    TactsLeft:= ReqSize - CurrDomain.FrameMinLength;

                    // равномерное распределение
                    //Uniform:
                    //begin
                    //TactsLeft:= ReqSize - CurrDomain.FrameMinLength;
                    //TactsLeft:= Round( TactsLeft+Random*(HopDelay2-TactsLeft));
                    //end;

                    // экспоненциальное
                    Exponential:
                    begin
                    TactsLeft:= ReqSize - CurrDomain.FrameMinLength;
                    TactsLeft := Round(-TactsLeft * ln(1 - Random));
                    end;
                end
                //-------------------------------------------------------------

             //TactsLeft := ReqSize - CurrDomain.FrameMinLength
          else
             TactsLeft := AnsSize - CurrDomain.FrameMinLength;

          Inc(TactsSpentInCycle, TactsLeft);
       end;

       StPostWait:
//Это значение постоянно и определено стандартом Ethernet
       begin
          TactsLeft := Round( 9600 / Speeder / CurrDomain.TicsPerTact); //9.6 микросекунд
          Inc(TactsSpentInCycle, TactsLeft);
       end;

//если время передачи заявки оказалось меньше времени цикла, подождать...
       StWaitForCycle:
       begin
          TactsLeft := Max(Round(CycleTime / CurrDomain.TicsPerTact) - TactsSpentInCycle, 1);
          TactsSpentInCycle := 0;
       end;

       StRandomWait:
       begin
          Inc( StatTriesCount );
          //Двоичный экспоненциальный усеченный алгоритм задержки
          if StatTriesCount > 9 then
             TactsLeft := Round( Random( Exp2( 10 )) * 51200 / Speeder / CurrDomain.TicsPerTact )
          else
             TactsLeft := Round( Random( Exp2( StatTriesCount )) * 51200 / Speeder / CurrDomain.TicsPerTact );

          Inc(TactsSpentInCycle, TactsLeft);
       end;

//Каждый такт линия проверяется на занятость,
       StWaitForFree,
//или станция проверяется на занятость
       StInBuffer:
       begin
          TactsLeft := 1;
          Inc(TactsSpentInCycle, TactsLeft);
       end;
   end;

   FrameState := mNewState;
end;

end.
