program Consulta;

uses
  Vcl.Forms,
  DSharp.Collections,
  DSharp.Collections.ObservableCollection,
  sinapsis.axn.m.Catalogo,
  sinapsis.axn.m.clt.cliente,
  sinapsis.axn.vm.interfaz,
  sinapsis.axn.vm.Catalogo,
  sinapsis.axn.vm.clt.cliente,
  sinapsis.axn.vm.clt.interfaz,
  UfrmConsulta in 'UfrmConsulta.pas' {frmConsulta},
  ufrmPrueba in 'ufrmPrueba.pas' {Form1};

{$R *.res}

//function Datos:System.Generics.Collections.TList<TAxnMCtl>;
function Datos:IList<TAxnMCtl>;
var
  Pkg : IAxnPkgClt;
  Mdl : IAxnSrvClt;
  Cli0   : IAxnVMCli0;
  Cl : TAxnMCli0;
  cls : IAxnVMCollection<TAxnMCli0>;

begin
  Pkg := TAxnPkgClt.Create;
  Mdl := TAxnSrvClt(Pkg.SrvMdl['CLI0']);
  cls :=  Mdl.All;

//  Result := IList<TAxnMCtl>. Create;
  Result :=   TObservableCollection<TAxnMCtl>.Create();

  for Cl in  Cls.Lista do
    Result.Add(Cl)
end;


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
