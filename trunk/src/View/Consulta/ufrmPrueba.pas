unit ufrmPrueba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXFirebird, Vcl.StdCtrls, Data.DB,
  Data.SqlExpr;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
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
  UfrmConsulta;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with TfrmConsulta.Create(Self) do
  try
    Connection := SQLConnection1;
     Execute;
      showmessage(IntToStr(Id));


  finally
    Free;
  end;
end;

end.
