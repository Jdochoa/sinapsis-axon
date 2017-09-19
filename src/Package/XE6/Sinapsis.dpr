program Sinapsis;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Spring.Collections,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Criteria,
  Spring.Persistence.Criteria.Criterion.Abstract,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  //Spring.Persistence.Core.Repository.Proxy,
  Spring.Persistence.Core.Repository.Simple,
  Spring.Persistence.SQL.Params,


  //  Sinapsis.Axn.Model,
  Sinapsis.axn.model.SORM,
  Sinapsis.axn.m.ctl.sys.interfaz,
  Sinapsis.axn.m.ctl.sys




  ;

function Modelo : TAxnModelSORM;
var
  LAxnModelSORM :TAxnModelSORM;
begin
  LAxnModelSORM := TAxnModelSORM.Create(dtUIB, 'C:\Sinapsis\axn\cnf\axn.firebird.json');
(*  LAxnModelSORM.Session.Connection.AddExecutionListener(
    procedure(const command: string; const params: IEnumerable<TDBParam>)
    var
      i: Integer;
      param: TDBParam;
    begin
      i := 0;
      for param in params do
      begin
        Format('%2:D Param %0:S = %1:S', [param.Name, VarToStrDef(param.ToVariant, 'NULL'), i]);
        Inc(i);
      end;
    end);
  *)
  Result := LAxnModelSORM;
end;

procedure VistaModelo(Conexion : TAxnModelSORM);
var
  LAxnMSysEmp : TAxnMSysEmp;
  lLista : IList<TAxnMSysEmp>;
  LCriteria: ICriteria<TAxnMSysEmp>;
  LRepository: IPagedRepository<TAxnMSysEmp,Integer>;


begin
(*  LLista := Conexion.Session.FindAll<TAxnMSysEmp>;
//  LLista := Conexion.Load<TAxnMSysEmp>(1);
//  LAxnMSysEmp := Conexion.Load<TAxnMSysEmp>(1).FirstOrDefault;
 LAxnMSysEmp := lLista.First;
 writeln(LAxnMSysEmp.Id);
 writeln(LAxnMSysEmp.Codigo);
 writeln(LAxnMSysEmp.Descripcion);
 writeln(LAxnMSysEmp.PorDefecto);
 writeln(LAxnMSysEmp.SYS0);
 writeln(LAxnMSysEmp.GUID);
*)
  LCriteria := Conexion.Session.CreateCriteria<TAxnMSysEmp>;

 for LAxnMSysEmp in LCriteria.Add(Restrictions.Eq('GUID','02E94B9B-3CBC-4504-9DBB-4F2B072DE361')).ToList  do
 begin
  Write(LAxnMSysEmp.Id);

   write(LAxnMSysEmp.Codigo+ ' ');
   write(LAxnMSysEmp.Descripcion+ ' ');
   writeln(LAxnMSysEmp.GUID+ ' ');
 end;

 writeln('');writeln('');writeln('');
  LRepository := TSimpleRepository<TAxnMSysEmp, Integer>.Create(Conexion.Session);
  for LAxnMSysEmp in LRepository.FindAll  do
  begin
  Write(LAxnMSysEmp.Id);

   write(LAxnMSysEmp.Codigo+ ' ');
   write(LAxnMSysEmp.Descripcion+ ' ');
   writeln(LAxnMSysEmp.GUID+ ' ');

  end;
 writeln('');writeln('');writeln('');

  LCriteria := LRepository.FindWhere.Add(Restrictions.Eq('GUID','02E94B9B-3CBC-4504-9DBB-4F2B072DE361'));
  for LAxnMSysEmp in LCriteria.ToList  do
 begin
  Write(LAxnMSysEmp.Id);

   write(LAxnMSysEmp.Codigo+ ' ');
   write(LAxnMSysEmp.Descripcion+ ' ');
   writeln(LAxnMSysEmp.GUID+ ' ');
 end;


end;





begin
  try
    VistaModelo(Modelo);
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
