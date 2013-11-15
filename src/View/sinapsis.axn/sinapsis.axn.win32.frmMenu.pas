unit sinapsis.axn.win32.frmMenu;

interface

uses
  System.Classes,
  System.Actions,
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.AppEvnts,
  Vcl.Menus,
  Vcl.ActnList,
  Vcl.StdActns,

  Generics.Collections,
  Spring.DesignPatterns

  ;

type
  TForm1 = class(TForm)
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    acSalida: TAction;
    Action11: TMenuItem;
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure acSalidaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CreaMenu();
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation


{$R *.dfm}

uses
  sinapsis.axn.vm.mdl,
  sinapsis.axn.vm.sinapsis;


procedure TForm1.acSalidaExecute(Sender: TObject);
begin
  Close;
end;



procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin
  Hide();
  WindowState := wsMinimized;
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := true;
  TrayIcon1.ShowBalloonHint;
end;



procedure TForm1.CreaMenu;
var
  Modulo : TVMModulo;
  Ac : TAction;
  it : TMenuItem;
begin
  for Modulo in TSingleton.GetInstance<TVMSinapsis>.Modulos do
  begin
    if Modulo.Modulo.Ejecutale = 1 then
    begin
      Ac := TAction.Create(ActionList1);
      Ac.Caption := Modulo.Modulo.Descripcion;
      Ac.Hint := Modulo.Codigo;
      Ac.Tag  := Modulo.Modulo.Id;
      Ac.ActionList := ActionList1;
      Ac.OnExecute := TSingleton.GetInstance<TVMSinapsis>.Ejecutar;
      it := TMenuItem.Create(PopupMenu1);
      it.Action := AC;
      PopupMenu1.Items.Add(It);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CreaMenu;
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
//  TrayIcon1.Visible := False;
//  Show();
//  WindowState := wsNormal;
//  Application.BringToFront();
end;


end.
