unit sinapsis.axn.v.frmsplash;

interface

uses
  WinApi.windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Winapi.Messages,
  dxGDIPlusClasses;

type
  TfrmSplash = class(TForm)
    LabelLoading: TLabel;
    Image1: TImage;
    Timer1: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    function GetMensaje: String;
    procedure SetMensaje(const Value: String);
    procedure WMNCPaint(var Msg: TWMNCPaint); message WM_NCPAINT;

  public
    property Mensaje: String read GetMensaje write SetMensaje;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}
function GradientFill(DC: THandle; Vertex: PTriVertex; NumVertex: ULONG; Mesh: Pointer; NumMesh, Mode: ULONG): BOOL;
   stdcall; external 'msimg32.dll' name 'GradientFill';


procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  BorderIcons := [];
  BorderStyle := bsNone;
  BorderWidth := 0;
  FormStyle := fsStayOnTop;
  Position := poScreenCenter;
  Self.TransparentColor := True;
  Self.TransparentColorValue := Self.Color;
end;

procedure TfrmSplash.FormPaint(Sender: TObject);
var
  arTVX : array[0..1] of TRIVERTEX;
  GradRect: GRADIENT_RECT;
begin
  arTVX[0].X      := 0;
  arTVX[0].Y      := 0;
  arTVX[0].Red    := $0000;
  arTVX[0].Green  := $0000;
  arTVX[0].Blue   := $8000;
  arTVX[0].Alpha  := $1000;

  arTVX[1].X      := Width;
  arTVX[1].Y      := Height;
  arTVX[1].Red    := $C000;
  arTVX[1].Green  := $C000;
  arTVX[1].Blue   := $C000;
  arTVX[1].Alpha  := $1000;

  GradRect.UpperLeft  := 0;
  GradRect.LowerRight := 1;

//  GradientFill(Canvas.Handle, @arTVX, 2, @GradRect, 1, GRADIENT_FILL_RECT_V);
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
  Mensaje := 'Show'
end;

function TfrmSplash.GetMensaje: String;
begin
  result := LabelLoading.Caption;
end;

procedure TfrmSplash.SetMensaje(const Value: String);
begin
  LabelLoading.Caption := 'Loading '+Value+'...';
  LabelLoading.Refresh;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TfrmSplash.WMNCPaint(var Msg: TWMNCPaint);
var
  dc: hDc;
  Pen: hPen;
  OldPen: hPen;
  OldBrush: hBrush;
begin
  inherited;
  dc := GetWindowDC(Handle);
  Msg.Result := 1;
  //Change the RGB value to change the color
  Pen := CreatePen(PS_SOLID, 1, RGB(255, 0, 0));
  OldPen := SelectObject(dc, Pen);
  OldBrush := SelectObject(dc, GetStockObject(NULL_BRUSH));
  Rectangle(dc, 0, 0, Self.Width, Self.Height);
  SelectObject(dc, OldBrush);
  SelectObject(dc, OldPen);
  DeleteObject(Pen);
  ReleaseDC(Handle, Canvas.Handle);
end;

end.
