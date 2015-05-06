unit ufrmPrueba;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Data.DBXFirebird,
  Data.DB,
  Data.SqlExpr
  ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  cxGridTableView,
  cxDataStorage,
  UfrmConsulta,
  Spring.Collections,
  sinapsis.axn.vm.catalogo.interfaz,

  sinapsis.axn.vm.interfaz,

  sinapsis.axn.m.clt.interfaz,
  sinapsis.axn.m.clt.cliente,
  sinapsis.axn.vm.clt.interfaz,
  sinapsis.axn.vm.clt.cliente,

  uib,
  Spring.Persistence.Adapters.UIB

  ;

{$R *.dfm}

function XXXDatos:IList<IAxnVMCtl>;
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
//
  Result := TCollections.CreateInterfaceList<IAxnVMCtl>;

  for Cl in  Cls.Lista do
    Result.Add(TAxnVMCli0.Create(Cl))

end;

procedure TForm1.Button1Click(Sender: TObject);
Var
  LDato : IAxnVMCli0;
begin
  with TfrmConsulta.Create(Self) do
  try
    GenerateColumns(  Procedure (tvConsulta:TcxGridTableView)
                      Begin
                        with tvConsulta as TcxGridTableView do
                        begin
                              with CreateColumn as TcxGridColumn do
                              begin
                                Caption := 'ID';
                                DataBinding.ValueTypeClass := TcxIntegerValueType;
                                Width := 50;
                                Visible := False;
                              end;

                              with CreateColumn as TcxGridColumn do
                              begin
                                Caption := 'Código';
                                DataBinding.ValueTypeClass := TcxIntegerValueType;
                                Width := 100;
                              end;

                              with CreateColumn as TcxGridColumn do
                              begin
                                Caption := 'Descripción';
                                DataBinding.ValueTypeClass := TcxStringValueType;
                                Width := 250;
                              end;
                          end;
                      End
                  );
    Datos :=    XXXDatos;
    if Execute = mrOk then
    begin
      LDato := IAxnVMCli0(AxnVMCtl);
      Application.MessageBox(PWideChar(LDato.Codigo+'-'+LDato.Descripcion+'--'+LDato.NIT), 'Resultado', MB_OK);
    end;
  finally
    Free;
  end;
end;

end.
