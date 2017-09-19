unit sinapsis.axn.v.men.frmMenu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ActnList,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdActns,
  dxGDIPlusClasses
  ;

type
  TfrmMenu = class(TForm)
    acMenu: TActionList;
    mmMenu: TMainMenu;
    WindowClose1: TWindowClose;
    Menu1: TMenuItem;
    Salida1: TMenuItem;
    aMenu: TAction;
    Image1: TImage;
    procedure aMenuExecute(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    FPersonalidad: String;
    { Private declarations }
  public
    { Public declarations }
    procedure CreaMenu;
    property Personalidad: String read FPersonalidad;
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

{ TfrmMenu }

procedure TfrmMenu.aMenuExecute(Sender: TObject);
begin
//
end;

procedure TfrmMenu.CreaMenu;
begin
end;

procedure TfrmMenu.FormPaint(Sender: TObject);
var
  arTVX : array[0..1] of TRIVERTEX;
  GradRect: GRADIENT_RECT;
begin
  arTVX[0].X      := 0;
  arTVX[0].Y      := 0;
  arTVX[0].Red    := $0000;
  arTVX[0].Green  := $0000;
  arTVX[0].Blue   := $8000;
  arTVX[0].Alpha  := $0000;

  arTVX[1].X      := Width;
  arTVX[1].Y      := Height;
  arTVX[1].Red    := $C000;
  arTVX[1].Green  := $C000;
  arTVX[1].Blue   := $C000;
  arTVX[1].Alpha  := $0000;

  GradRect.UpperLeft  := 0;
  GradRect.LowerRight := 1;

  GradientFill(Canvas.Handle, @arTVX, 2, @GradRect, 1, GRADIENT_FILL_RECT_V);

end;

end.
