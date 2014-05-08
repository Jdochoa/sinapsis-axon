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
  Vcl.StdActns

//  Spring.Services,
//  Spring.Container,
//  Spring.DesignPatterns,
//	Spring.Collections,
//  Spring.Collections.Lists,
//
//  sinapsis.axn.vm.men,
//
//  dorm,
//  dorm.Commons
//
  ;
const
   _ConfFile =  'E:\Sinapsis\axn\cnf\axn.sqlite3.conf';
   _Origen = 'Origen';
   _Destino = 'Destino';

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
//var
//    VMMenu : TViewModelMenu;
//
//  function Accion(Menu:TAxnVMMenuItem; Categoria:string):TAction;
//  begin
//      Result := TAction.Create(acMenu);
//      Result.Caption := Menu.Descripcion;
//      Result.Hint := Menu.Codigo;
//      Result.Tag  := Menu.Id;
//      Result.Category := Categoria;
//  end;
//  procedure SubMenu(Menu:TAxnVMMenus; Item :TComponent; Categoria:String);
//  var
//    MI : TAxnVMMenuItem;
//    it : TMenuItem;
//  begin
//    for MI in Menu do
//    begin
//        it := TMenuItem.Create(Item);
//        it.Action := Accion(MI,Categoria);
//        it.Action.OnExecute :=aMenuExecute;
//        if Item is TMenuItem then
//            (Item as TMenuItem).Add(it)
//        else
//          (Item as TMainMenu).Items.Add(it);
//        VMMenu.LoadRelation(MI.MenuItem, [drHasMany], False);
//        if MI.MenuItem.Menus.Count > 0 then
//          subMenu(MI.SubMenu, It, MI.Descripcion);
//    end;
//  end;
//var
//  MenuItem : TAxnVMMenuItem;
begin
//  VMMenu := TViewModelMenu.Create;
//  try
//    SubMenu(VMMenu.Menu[Personalidad], mmMenu,'Menu');
//  finally
//    VMMenu.Free;
//  end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
//    GlobalContainer.RegisterType<TSession>.AsSingleton.Implements<IInterface>('Base').DelegateTo
//    (
//      function: TSession
//      begin
//          Result := TSession.CreateConfigured(_ConfFile,deDevelopment);
//      end
//    );
//  GlobalContainer.Build;
//  FPersonalidad := 'cxc';
//  CreaMenu;
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
