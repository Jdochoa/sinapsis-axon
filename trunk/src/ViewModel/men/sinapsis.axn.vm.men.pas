unit sinapsis.axn.vm.men;

interface

uses
  sinapsis.axn.vm.Catalogo,
  sinapsis.axn.m.men;

type
  TVMMenu = class(TAxnCTLVM)
  private
    FHModule : HMODULE;
  protected
    function GetMenu: TMenu;
    procedure SetMenu(const Value : TMenu);
  public
    constructor Create ( const Value : TMenu);
    destructor Destroy; override;

    property Menu: TMenu read GetMenu write SetMenu;
    procedure Ejecutar();
  end;

  TVMMen = class
  private
  protected
  public
  end;




implementation

uses
    System.SysUtils,
    Winapi.Windows
    ;


{ TVMMenu }

constructor TVMMenu.Create(const Value: TMenu);
begin
  Menu := Value;
  FHModule := 0;
end;

destructor TVMMenu.Destroy;
begin
  if FHModule <> 0 then
    UnloadPackage(FHModule);
  inherited;
end;

procedure TVMMenu.Ejecutar;
Var
//  Proc : FARPROC;
  Proc : Pointer;
begin
  if FHModule = 0 then
    FHModule := LoadPackage(Menu.Descripcion);
  if FHModule <> 0 then
  begin
    Proc := GetProcAddress(FHModule,'');
//    if Assigned(Proc) then
//      Proc;
  end;
end;

function TVMMenu.GetMenu: TMenu;
begin
  Result := TMenu(AxnMCTL)
end;

procedure TVMMenu.SetMenu(const Value: TMenu);
begin
  SetAxnMCTL(Value);
  Menu.Mod0_Id := Value.Mod0_Id;
  Menu.Men0_Id := Value.Men0_Id;
//  Menu.Menus := Value.Menus;
end;

end.
