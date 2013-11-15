unit sinapsis.axn.v.men.frmMenu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ActnList,
  Vcl.Menus,
  sinapsis.axn.vm.men,
  Spring.DesignPatterns, Vcl.StdActns
  ;

type
  TfrmMenu = class(TForm)
    acMenu: TActionList;
    mmMenu: TMainMenu;
    WindowClose1: TWindowClose;
    Menu1: TMenuItem;
    Salida1: TMenuItem;
    aMenu: TAction;
    procedure FormCreate(Sender: TObject);
    procedure aMenuExecute(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreaMenu;
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
  function Accion(Menu:TVMMenu; Categoria:string):TAction;
  begin
      Result := TAction.Create(acMenu);
      Result.Caption := Menu.Menu.Descripcion;
      Result.Hint := Menu.Menu.Codigo;
      Result.Tag  := Menu.Menu.Id;
      Result.Category := Categoria;
  end;
  procedure subMenu(Menu:TVMMenu; MenuItem :TMenuItem);
  var
    Men0:TVMMenu;
    it : TMenuItem;
  begin
    for Men0 in TSingleton.GetInstance<TVMMen>.SubMenu[Menu] do
    begin
      it := TMenuItem.Create(MenuItem);
      it.Action := Accion(Men0,Menu.Menu.Descripcion);
      it.Action.OnExecute :=aMenuExecute;
      MenuItem.Add(it);
      subMenu(Men0,it);
    end;
  end;
var
  it : TMenuItem;
  Men0 : TVMMenu;
begin
  for Men0 in TSingleton.GetInstance<TVMMen>.Menu['cxc'] do
  begin
      it := TMenuItem.Create(mmMenu);
      it.Action := Accion(Men0,'Menu');
      it.Action.OnExecute :=aMenuExecute;
      mmMenu.Items.Add(it);
      subMenu(Men0, it);
  end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  CreaMenu;
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
