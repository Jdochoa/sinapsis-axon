unit sinapsis.axn.v.vcl.frm.frmBasePrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.AppEvnts;

type
  TfrmBasePrincipal = class(TForm)
    acPrincipal: TActionList;
    acSalida: TAction;
    apePrincipal: TApplicationEvents;
    procedure FormPaint(Sender: TObject);
    procedure acSalidaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBasePrincipal: TfrmBasePrincipal;

implementation

{$R *.dfm}

procedure TfrmBasePrincipal.acSalidaExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmBasePrincipal.FormPaint(Sender: TObject);
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
