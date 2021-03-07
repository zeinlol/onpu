// ********************************************************************
//  imit_in.pas
//
//  Имитационное моделирование - описание см. ниже
// ********************************************************************

unit imit_in;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, mnetwork, mnetnode, mdomain, mjob, orlan;

procedure RunImit		( nStep : Integer );

implementation

uses main, scat_in, wait, ex_anal, switch, connect, JobsPack, math;


//=================================================================
// Описание:   Ядро имитационного моделирования
//
// Параметры:  nStep - количество шагов
// Результаты: StringGridImit & StringGridImitAll в форме ScatForm
//=================================================================
procedure RunImit( nStep : Integer );
var
   Lan : Network;

   Node : NetNode;
   Dom : Domain;
   Job : NetJob;
   Ji : integer;
   i, del : int64;
   j, z, k, h, m : integer;
   Counter, Counter2, ConnsCount, PortIndx : integer;
   dValue : double;
   sValue : string;
   sLine : string;

   PortEl : Port_Element;
   PortEl2 : Port_Element;
   El : TOrLan;
   El2 : TOrLan;
   ModelEl : Model_Element;

   AnsSize, AnsNumber : integer;
   HopClient, HopServer : integer;

   TotalTics : int64;
   KommIndx : Integer;

   mHops : DynIntArray;
   mHopDelays : DynInt64Array;
   nBeg : Integer;


   begin
   //_ Создание объекта модели сети
   /////////////////////////////////////////////////////////////////////////////
   Lan := Network.Create();

   Speeder := 1000;

   //_  найти значение Speeder -
   //_  будет равен (8000/МаксимальнаяСкоростьПередачиПоОдномуИзПортовОдногоИзУзлов)
   /////////////////////////////////////////////////////////////////////////////
   for j:=0 to Nodes.Count-1 do
   begin
     El := TOrLAN(Nodes[j]);
     for z:=0 to El.Ports.Count-1 do
     begin
       PortEl := Port_Element(El.Ports[z]);
       if PortEl.IsUsed = True then
         Speeder := Min( Round(8000 / PortEl.Speed), Speeder );
     end;
   end;

   TotalTics := Setup_.ImitInterval * Round(1000000 / Speeder);

   FormWait.Gauge1.MaxValue:=TotalTics div Round(1000000 / (Speeder));
   FormWait.Gauge1.Progress:=0;
   FormWait.LabelMessage.Caption:='Создается имитационная модель...';
   FormWait.Show;
   Application.ProcessMessages;


   //_	ПРОВЕРКА НА НАЛИЧИЕ КАНАЛОВ АТМ и FDDI.
   //   проверить, все ли каналы имеют тип, пригодный для моделирования
   //_  система не работает c каналами FDDI и ATM
   /////////////////////////////////////////////////////////////////////////////
   for j:=0 to Nodes.Count-1 do
   begin
     El := TOrLAN(Nodes[j]);
     for z:=0 to El.Ports.Count-1 do
     begin
       PortEl := Port_Element(El.Ports[z]);
       if PortEl.IsUsed = True then
       begin
          KommIndx := FormSwTime.ChannalTypeToKommIndx( PortEl.PortType );
          if (KommIndx < 1) or (KommIndx > 3)then
          begin
             raise NetworkError.Create('Имитационное моделирование не поддерживает протокол ' + PortEl.PortType + '.');
             Exit;
          end;
       end;
     end;
   end;

   //_
   //_  СОЗДАНИЕ МАССИВА LAN.DOMAINS И ЗАПОЛНЕНИЕ ЕГО ЗНАЧЕНИЯМИ.
   //_	РАЗМЕРНОСТЬ МАССИВА РАВНА КОЛИЧЕСТВУ СЕГМЕНТОВ МОДЕЛИ.
   //_  ДЛЯ КАЖДОГО СЕГМЕНТА СОЗДАЕТСЯ ДОМЕН СО СКОРОСТЬЮ ПЕРЕДАЧИ,
   //_  КОТОРАЯ ОПРЕДЕЛЯЕТСЯ ПО ОДНОМУ ИЗ ПОРТОВ, ПОДКЛЮЧЕННЫХ К ДОМЕНУ.
   //_
   //_  Lan - экземпляр класса Network, который, собственно, и описывает модель
   //_  Среди прочих полей сущ. поле Domains, которое представляет собой дин. массив
   //_  ссылок на объекты класса Domain. В массиве хранятся все домены модели. Домены
   //_  представляют собой сегемент плюс дополн. данные вроде таких как ВремяОбработки...
   /////////////////////////////////////////////////////////////////////////////

	//_  Установить длину массива Domains равной количеству сегментов модели (MaxSegID)
	SetLength( Lan.Domains, MaxSegID );

	//_  и обнулить каждый элемент массива
	for j:=0 to Length(Lan.Domains)-1 do
		Lan.Domains[j] := nil;

	//_ цикл по всем узлам
	for j:=0 to Nodes.Count-1 do
	begin
		El := TOrLAN(Nodes[j]);

	 //_ цикл по всем портам узла
     for z:=0 to El.Ports.Count-1 do
     begin
       PortEl := Port_Element(El.Ports[z]);
       if PortEl.IsUsed = True then
       begin
       	 //_ если домен не существует - создадим его
         if Lan.Domains[PortEl.SegmentID-1] = nil then
         begin
         	//_ создадим объект домен и присвоим его элементу массива Domains
            //_ Разрядность массива = количеству сегментов моделируемой сети
           Dom := Domain.Create( Round(8000 / PortEl.Speed / Speeder), 0 );
           Lan.Domains[PortEl.SegmentID-1] := Dom;
         end;
       end;
     end;
   end;

   //Счетчик узлов
   Counter:=0;

   //_
   //_	СОЗДАЕТСЯ МАССИВ LAN.NETNODES РАЗМЕРНОСТЬЮ = КОЛИЧЕСТВУ ЭЛЕМЕНТОВ СЕТИ БЕЗ ХАБОВ
   /////////////////////////////////////////////////////////////////////////////
   for j:=0 to Nodes.Count-1 do
   begin
     El := TOrLAN(Nodes[j]);
     if (El.NodeType='WS') or (El.NodeType='SERV') or (El.NodeType='KOMM') then
     begin
        Node := NetNode.Create();

        //_ Counter2 - счетчик соединений данного узла
        //_ Т.е. какое количество портов данного узла - активно
        Counter2 := 0;
        for z:=0 to El.Ports.Count-1 do
        begin
           PortEl := Port_Element(El.Ports[z]);
           if PortEl.IsUsed = True then
              Inc(Counter2);
        end;

		//_ если список соединений данного узла больше, то уменьшим до кол-ва
        //_ MaxNodeConns
        //_ это может иметь место если устройство будет содержать более 32 активных портов 8-)
        ConnsCount := min(Counter2,MaxNodeConns);

        //обнуляем список доменов, к которым принадлежит узел
        //_ т.е. проставляем в массиве Conns 32 раза "-1"
        for z:=0 to MaxNodeConns-1 do
	  		Node.Conns[z] := -1;

        //_ В этом цикле по всем портам данного узла будем
        //_ присваивать элементам массива Conns значение
        //_ (НомерСегментаПорта - 1, что равно индексу элемента массива Domains). Присвоим стольким элементам
        //_ сколько активных портов
        //////////////////////////////////////////////////
        Counter2 := 0;
        for z:=0 to El.Ports.Count-1 do
        begin
           PortEl := Port_Element(El.Ports[z]);
           if PortEl.IsUsed = True then
           begin
              Node.Conns[Counter2] := PortEl.SegmentID - 1;
              Inc(Counter2);
           end;
        end;

        if (El.NodeType='SERV') OR (El.NodeType='KOMM') then
           Node.MaxTaskNumber := 1
        else
           Node.MaxTaskNumber := MaxInt;

        //_ увеличиваем длину массива NetNodes, элементы которого
        //_ указатели на объекты Node, которые в свою очередь представляют
        //_ собой имитационные аналоги узлов моделируемой сети
        SetLength( Lan.NetNodes, Counter+1 );
        Lan.NetNodes[ Counter ] := Node;

        //__ не понятно только, чем не устраивала переменная цикла j
        Inc(Counter);
     end;
   end;

  //_ добавить заявки:
  //_ выполняется преобразование множества заявок массива
  //_ RequestClass каждого узла в массив работ (jobs)
  //_ Алгоритм таков: цикл по узлам, цикл по классам
  //_ заявок узла, нахождение пути от клиента к серверу для конкретного класса
  //_ заявок и добавление в массив работ с помощью Lan.AddJob()
  /////////////////////////////////////////////////////////////////////////////

  for j:=0 to Nodes.Count-1 do
  begin
     El := TOrLAN(Nodes[j]);
     if El.NodeType='WS' then
     begin
       for z:=0 to El.WSParameters.RequestClass.Count-1 do
       begin
         Route.Clear;
         ModelEl := Model_Element(El.WSParameters.RequestClass.Items[z]);

         //_ для текущего узла для текущего класса заявок найдем
         //_ ее путь следования к серверу и поместим цепочку станций,
         //_ через которые движется заявка в переменную Route типа TList.
         //_ На самом деле мы поместим не саму станцию, а указатель на структуру,
         //_ в которой кроме ID станции будет указан номер порта подключения,
         //_ время пребывания в данном узле и т.д.
         //////////////////////////////////////////////////////////////////////
         try
           Application.ProcessMessages;
           ScatForm.FindRoute(
             El.NodeID,                           //_ откуда
             ModelEl.ServID_, 					  //_ куда
             El.NodeID,                           //_ промежуточная вершина
             0,                                   //_ ...
             z                                    //_ номер заявки
             );
         except

         //_ вообще-то, по большому счету, это _никогда_ не должно выполняться!
         raise ScatError.Create('Не найден путь для заявки при имитационном моделировании.' + #13 + #10 +
                 'Маршрут заявки: "' + El.NodeName + '" - "' + FormConnect.IDToName(ModelEl.ServID_) + '".');
         Exit;
         end;

         //_ упакуем путь, исключив ... хабы
         ScatForm.PackRoute(ModelEl.Size_);

         //_ обнуляем массивы содержащие кол-во узлов и время пребывания в этих узлах
         SetLength( mHops, 0 );
         SetLength( mHopDelays, 0 );

         //_ Проходим по всем узлам в массиве Route и заполняем
         //_ массив mHops и mHopDelays
         ///////////////////////////////////////////////////
         Counter := 0;
         for m := 0 to Route.Count-1 do
         begin
         	//_ Если элемент массива Route имеет тип "Узел",
            //_ тогда найдем соответствующий узел в массиве Nodes ..
            ////////////////////////////////////////////////
           if Route_Type(Route[m]).type_=0 then
           begin
              Counter2 := 0;
              El2 := nil;
              for h:=0 to Nodes.Count-1 do
              begin
                El2 := TOrLAN(Nodes[h]);

                if El2.NodeID = Route_Type(Route[m]).ID then
                   break;

                //_ почему не h ?..
                Inc(Counter2);
              end;

              //_ .. и если он [узел] НЕ концентратор, то добавим его в
              //_ массив mHops[], а его задержку в массив mHopDelays[]
              ////////////////////////////////////////////////////
              if  (El2.NodeType<>'KONC') then
              begin
                Inc(Counter);
                SetLength( mHops, Counter );
                SetLength( mHopDelays, Counter );

                mHops[Counter-1] := Counter2;
                mHopDelays[Counter-1] := Round(Route_Type(Route[m]).s * 1000000000 / Speeder);
              end
           end;
         end;

         //_ Первый элемент массива - клиент, последний -
         //_ сервер. В массиве mHops[] хранятся номера
         //_ узлов (индексы в массиве Nodes[]), в mHopDelays -
         //_ задержки на этих узлах
         ///////////////////////////////////////////////////

         //_ берем первый (Клиент) и последний (Сервер)
         ///////////////////////////////////////////////////
         HopClient := mHops[0];
         HopServer := mHops[Length(mHops)-1];

         //_ определяем есть ли ответ и, если есть, то
         //_ указываем его размер
         //////////////////////////////////////////////////
         if ModelEl.AnsSize_ > 0 then
         begin
            AnsNumber := 1;
            AnsSize := ModelEl.AnsSize_;
         end
         else
         begin
            AnsNumber := 0;
            AnsSize := 0;
         end;

         //_ каждой заявке соответствует объект типа Network,
         //_ которые хранятся в массиве Jobs
         ////////////////////////////////////////////////
    // Если HopDelay2 не инициализирована, то обнулить
    // иначе возникает ошибка "Invalid floating point operation"
   if (ModelEl.HopDelay2 < 0.0000000000000001) or (ModelEl.HopDelay2 > 1000000000.0) then
   begin
      ModelEl.HopDelay2 := 0;
   end;

         Lan.AddJob( HopClient,
                     ModelEl.Size_,
                     Round(ModelEl.TimeWS * 1000000000 / Speeder),
                     1,
                     HopServer,
                     AnsSize,
                     Round(ModelEl.TimeServ * 1000000000 / Speeder),
                     AnsNumber,
                     ModelEl.Priority,
                     mHops,
                     mHopDelays,
                     Round(ModelEl.TimeCycle * 1000000000 / Speeder),
                     ModelEl.PossibleTime,
                     ModelEl.PossiblePercent,
                     ModelEl.DistOfServerDelay,
                     Round(ModelEl.HopDelay2 * 1000000000 / Speeder) );
       end;
     end;
  end;


 FormWait.LabelMessage.Caption:='Идет имитационное моделирование...';
 Application.ProcessMessages;

 FormWait.Cancelled := False;
 FormWait.BitBtnCancel.Visible := True;

 i := 1;

 counter:=0;
    /////////////////////////////////////////////////////////////////////
	// собственно имитационное моделирование
    /////////////////////////////////////////////////////////////////////
   while i < TotalTics do
	begin
		Lan.OneTic();
		Inc(i);
        if (i and $0000FFFF = $0000FFFF) then
			begin
			FormWait.Gauge1.Progress := i div Round(1000000 / (Speeder));
			Application.ProcessMessages;
			if FormWait.Cancelled = True then
				begin
				FormWait.Hide;
				Exit;
				end;
			end;
	end;
	//////////////////////////////////////////////////////////////////////

	FormWait.BitBtnCancel.Visible := False;

	FormWait.LabelMessage.Caption:='Обработка результатов моделирования...';
	Application.ProcessMessages;

	Lan.CalculateProfile;

 //_ Формирование результатов для имитационного моделирования
 /////////////////////////////////////////////////////////////////////////////
 //_
 //_ кол-во строк = (КолвоУзлов + КолвоСегментов)*(КолвоЗакладок=4)
 //_ +1 (еще для одной закладки, на которой будет отображаться максимальное время)
 //_ +1 (еще для одной закладки, на которой будет кол-во переданных заявок для каждого класса)
 //_ +1 (еще для одной закладки, на которой будет допустимый процент "некачественных" заявок)
 //_ +1 (еще для одной закладки, на которой будет реальный процент "некачественных" заявок)
 ScatForm.StringGridImit.RowCount:=((Length(Lan.NetNodes) + Length(Lan.Domains)) * 4) + 1 + 1 + 1 + 1;

 //_ кол-во столбцов = КолвоКлассовЗаявок
 ScatForm.StringGridImit.ColCount:=Length(Lan.Jobs);

 //  средняя длина очереди - в первую четверть таблицы
 //_ первая закладка
     h:=0;
     k:=0;

   	// узлы
    //////////////////

     for j := 0 to Length(Lan.NetNodes)-1 do
     begin
        Node := Lan.NetNodes[j];
        for z := 0 to Length(Node.JobWaitTacts)-1 do
        begin
           Job := Lan.Jobs[z];
//           if Job.AnssNumber = 1 then
//              dValue := Node.JobWaitTacts[z] / (Node.TotalTacts/ 2)
//              else
              dValue := Node.JobWaitTacts[z] / Node.TotalTacts;
           ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(dValue,ffFixed,6,6);
        end;
        Inc(k);
     end;
     Inc(h,k);

	 // сегменты
     //////////////////
     k:=0;
     for j := 0 to Length(Lan.Domains)-1 do
     begin
        Dom := Lan.Domains[j];
        for z := 0 to Length(Dom.JobWaitTacts)-1 do
        begin
           Job := Lan.Jobs[z];
//           if Job.AnssNumber = 1 then
//              dValue := Dom.JobWaitTacts[z] / (Dom.TotalTacts/ 2)
//              else
              dValue := Dom.JobWaitTacts[z] / Dom.TotalTacts;
           ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(dValue,ffFixed,6,6);
        end;
        Inc(k);
     end;
     Inc(h,k);

 //Среднне время ожидания - вторая четверть таблицы
	//_ вторая закладка
    //////////////////////////////////////////////////////

 	// узлы
    //////////////////
     k:=0;
     for j := 0 to Length(Lan.NetNodes)-1 do
     begin
        Node := Lan.NetNodes[j];
        for z := 0 to Length(Node.JobWaitTics)-1 do
        begin
          Job := Lan.Jobs[z];
//          if Job.AnssNumber = 1 then
//            dValue := Node.JobWaitTics[z] / (Job.StatSuccCount / 2) / 1000000 * Speeder
//          else
            dValue := Node.JobWaitTics[z] / Job.StatSuccCount / 1000000 * Speeder;

          ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(dValue,ffFixed,6,6);
        end;
        Inc(k);
     end;
     Inc(h,k);

	// сегменты
	/////////////////
     k:=0;
     for j := 0 to Length(Lan.Domains)-1 do
     begin
        Dom := Lan.Domains[j];
        for z := 0 to Length(Dom.JobWaitTics)-1 do
        begin
          Job := Lan.Jobs[z];
//          if Job.AnssNumber = 1 then
//          dValue := Dom.JobWaitTics[z] / (Job.StatSuccCount / 2) / 1000000 * Speeder
//          else
            dValue := Dom.JobWaitTics[z] / Job.StatSuccCount / 1000000 * Speeder;

          ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(dValue,ffFixed,6,6);
        end;
        Inc(k);
     end;
     Inc(h,k);

 //Производительность - третья четверть таблицы.
 //производительность не рассчитывается в имитации.
 //_ => забиваем нулями
 	// узлы
	//////////////////
 k:=0;
 for j := 0 to Length(Lan.NetNodes)-1 do
 begin
    for z := 0 to Length(Lan.Jobs)-1 do
      ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(0.0,ffFixed,6,6);
    Inc(k);
 end;

 Inc(h,k);

	// сегменты
	/////////////////
k:=0;
 for j := 0 to Length(Lan.Domains)-1 do
 begin
    for z := 0 to Length(Lan.Jobs)-1 do
      ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(0.0,ffFixed,6,6);

    Inc(k);
 end;

 Inc(h,k);

 //Загрузка - четвертая четверть таблицы
     k:=0;
   	// узлы
	//////////////////

     for j := 0 to Length(Lan.NetNodes)-1 do
     begin
       Node := Lan.NetNodes[j];
       for z := 0 to Length(Node.JobServicingTics)-1 do
       begin
         Job := Lan.Jobs[z];
//         if Job.AnssNumber = 1 then
//            dValue := Node.JobServicingTics[z] * 100 / (TotalTics/2)
//            else
            dValue := Node.JobServicingTics[z] * 100 / TotalTics;
         ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(dValue,ffFixed,6,6);
       end;
       Inc(k);
     end;
     Inc(h,k);

	// сегменты
	/////////////////
     for j := 0 to Length(Lan.Domains)-1 do
     begin
       Dom := Lan.Domains[j];
       for z := 0 to Length(Dom.JobServicingTics)-1 do
       begin
         Job := Lan.Jobs[z];
//         if Job.AnssNumber = 1 then
//            dValue := Dom.JobServicingTics[z] * 100 / (TotalTics/2)
//            else
            dValue := Dom.JobServicingTics[z] * 100 / TotalTics;
         ScatForm.StringGridImit.Cells[z,j + h]:=FloatToStrF(dValue,ffFixed,6,6);
       end;
     end;

	for z := 0 to Length(Lan.Jobs)-1 do
		ScatForm.StringGridImit.Cells[z,ScatForm.StringGridImit.RowCount-4]:=FloatToStrF(Lan.Jobs[z].MaxServTime / 1000000 * Speeder,ffFixed,6,6);
	for z := 0 to Length(Lan.Jobs)-1 do
		ScatForm.StringGridImit.Cells[z,ScatForm.StringGridImit.RowCount-3]:=IntToStr(Lan.Jobs[z].StatSuccCount);
	for z := 0 to Length(Lan.Jobs)-1 do
		ScatForm.StringGridImit.Cells[z,ScatForm.StringGridImit.RowCount-2]:=IntToStr(Lan.Jobs[z].PossiblePercent );
	for z := 0 to Length(Lan.Jobs)-1 do
		ScatForm.StringGridImit.Cells[z,ScatForm.StringGridImit.RowCount-1]:=FloatToStrF(100 * Lan.Jobs[z].CountOfExcQueries / Lan.Jobs[z].StatSuccCount, ffFixed,6,6);

 nBeg := 0;
      for j := 0 to nStep-1 do
    Inc( nBeg, JobsPerStep[j] );

 for z:=0 to ScatForm.StringGridImitAll.RowCount-1 do
   for j:=0 to JobsPerStep[nStep]-1 do
   begin
     ScatForm.StringGridImitAll.Cells[j + nBeg,z]:=ScatForm.StringGridImit.Cells[j, z];
   end;


 ScatForm.RichEdit2.Clear;
 for z:=0 to ScatForm.StringGridImit.RowCount-3 do
 begin
   sLine:='';
   for j:=0 to ScatForm.StringGridImit.ColCount-1 do
      sLine := sLine + ScatForm.StringGridImit.Cells[j,z] + ' ';

   ScatForm.RichEdit2.Lines.Add(sLine);
   if ((z+1) mod (ScatForm.StringGridImit.RowCount div 4)) = 0 then
      ScatForm.RichEdit2.Lines.Add('');
 end;

 Str(Lan.StatSuccCount, sLine);
 sLine := 'Всего передано пакетов: ' + sLine;
 ScatForm.RichEdit2.Lines.Add(sLine);
 ScatForm.RichEdit2.Lines.Add('..и по классам заявок:');

 sLine := '';
 for j := 0 to Length(Lan.Jobs)-1 do
 begin
    Job := Lan.Jobs[j];
    dValue := Job.StatSuccCount;
    Str(dValue:8:0, sValue);
    sLine := sLine + sValue + ' ';
 end;

 ScatForm.RichEdit2.Lines.Add(sLine);

 try
   ScatForm.RichEdit2.Lines.SaveToFile(Project_Path + Project_Name +  '_' + IntToStr(nStep) + '.imo');
 except
   on E:Exception do
   begin
     MessageDlg('Ошибка записи файла результата имитации. ' + E.Message, mtError, [mbOk], 0);
   end;
 end;

 FormWait.Hide;

 Lan.Free;
end;

end.
