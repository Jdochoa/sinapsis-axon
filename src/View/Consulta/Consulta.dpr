program Consulta;

uses
  Vcl.Forms,
  UfrmConsulta in 'UfrmConsulta.pas' {frmConsulta},
  ufrmPrueba in 'ufrmPrueba.pas' {Form1},
  sinapsis.axn.v.consulta.interfaz in 'sinapsis.axn.v.consulta.interfaz.pas',
  sinapsis.axn.v.consulta in 'sinapsis.axn.v.consulta.pas';

{$R *.res}

//function Datos:System.Generics.Collections.TList<TAxnMCtl>;
//function Datos:IList<TAxnMCtl>;
//var
//  Pkg : IAxnPkgClt;
//  Mdl : IAxnSrvClt;
//  Cli0   : IAxnVMCli0;
//  Cl : TAxnMCli0;
//  cls : IAxnVMCollection<TAxnMCli0>;
//
//begin
//  Pkg := TAxnPkgClt.Create;
//  Mdl := TAxnSrvClt(Pkg.SrvMdl['CLI0']);
//  cls :=  Mdl.All;
//
////  Result := IList<TAxnMCtl>. Create;
//  Result :=   TObservableCollection<TAxnMCtl>.Create();
//
//  for Cl in  Cls.Lista do
//    Result.Add(Cl)
//end;


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
