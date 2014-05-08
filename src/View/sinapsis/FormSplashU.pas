unit FormSplashU;

interface

uses
  windows,
  Classes,
  Controls,
  Forms,
  StdCtrls,
  ExtCtrls, dxGDIPlusClasses;

type
  TFormSplash = class(TForm)
    LabelLoading: TLabel;
    Image1: TImage;

    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);

  private
    function GetMensaje: String;
    procedure SetMensaje(const Value: String);

  public
    property Mensaje: String read GetMensaje write SetMensaje;
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.dfm}
function GradientFill(DC: THandle; Vertex: PTriVertex; NumVertex: ULONG; Mesh: Pointer; NumMesh, Mode: ULONG): BOOL;
   stdcall; external 'msimg32.dll' name 'GradientFill';


procedure TFormSplash.FormCreate(Sender: TObject);
begin
  BorderIcons := [];
  BorderStyle := bsNone;
  BorderWidth := 0;
  FormStyle := fsStayOnTop;
  Position := poOwnerFormCenter;
end;

procedure TFormSplash.FormPaint(Sender: TObject);
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

  GradientFill(Canvas.Handle, @arTVX, 2, @GradRect, 1, GRADIENT_FILL_RECT_V);
end;

function TFormSplash.GetMensaje: String;
begin
  result := LabelLoading.Caption;
end;

procedure TFormSplash.SetMensaje(const Value: String);
begin
  LabelLoading.Caption := 'Loading '+Value+'...';
  LabelLoading.Refresh;
end;

procedure TFormSplash.TimerTimer(Sender: TObject);
begin
  Close;
//  Release;
end;

end.
