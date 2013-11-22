unit sinapsis.axn.vm.men;

interface

uses
  System.Generics.Collections,

	Spring.Collections,
  Spring.Collections.Lists,

  sinapsis.axn.m,
  sinapsis.axn.m.men,

  sinapsis.axn.vm,
  sinapsis.axn.vm.Catalogo,
  sinapsis.axn.vm.ViewModel,

  sinapsis.axn.m.mdl,
  sinapsis.axn.vm.mdl,

  dorm.Filters

  ;

type
  TAxnVMMenus = class;

  TAxnVMMenuItem = class(TAxnVMCtl)
  private
    FHModule : HMODULE;
  protected
    function GetMenuItem: TAxnMMenuItem;
    procedure SetMenuItem(const Value : TAxnMMenuItem);
  public
    constructor Create(Value : TAxnM); override;
    destructor Destroy; override;

    property MenuItem: TAxnMMenuItem read GetMenuItem write SetMenuItem;
    procedure Ejecutar();
    function SubMenu:TAxnVMMenus;
  end;

  TAxnVMMenus = class(TAxnMVLista<TAxnVMMenuItem,TAxnMMenuItem>)
  private
  protected
    function NewItem(const Value: TAxnMMenuItem):TAxnVMMenuItem;override ;
  public
  end;

  TViewModelMenu = class (TViewModel)
  private
    function GetMenu(Index: String ): TAxnVMMenus;
  protected
  public
    property Menu[Index:String]: TAxnVMMenus read GetMenu;
  end;


implementation

uses
    System.SysUtils,
    Winapi.Windows
    ;


{ TAxnVMMenuItem }


constructor TAxnVMMenuItem.Create(Value: TAxnM);
begin
  inherited Create(Value);
  MenuItem := TAxnMMenuItem(Value);
  FHModule := 0;

end;

destructor TAxnVMMenuItem.Destroy;
begin
  if FHModule <> 0 then
    UnloadPackage(FHModule);
  inherited;
end;

procedure TAxnVMMenuItem.Ejecutar;
Var
//  Proc : FARPROC;
  Proc : Pointer;
begin
  if FHModule = 0 then
    FHModule := LoadPackage(MenuItem.Descripcion);
  if FHModule <> 0 then
  begin
    Proc := GetProcAddress(FHModule,'');
//    if Assigned(Proc) then
//      Proc;
  end;
end;

function TAxnVMMenuItem.GetMenuItem: TAxnMMenuItem;
begin
  Result := TAxnMMenuItem(AxnMCTL)
end;

procedure TAxnVMMenuItem.SetMenuItem(const Value: TAxnMMenuItem);
begin
  SetAxnMCTL(Value);
  MenuItem.Mod0_Id := Value.Mod0_Id;
  MenuItem.Men0_Id := Value.Men0_Id;
  MenuItem.Menus := Value.Menus;
end;

function TAxnVMMenuItem.SubMenu: TAxnVMMenus;
begin
  Result := TAxnVMMenus.Create(MenuItem.Menus);
end;

{ TViewModelMenu }


function TViewModelMenu.GetMenu(Index: String): TAxnVMMenus;
var
  M :TModulo;
  Lista : System.Generics.Collections.TObjectList<TAxnMMenuItem>;
begin
  M :=Session.Load<TModulo>(TdormCriteriaItem.NewCriteria('Codigo', coEqual,Index));
  Lista := Session.LoadList<TAxnMMenuItem>(TdormCriteriaItem.NewCriteria('Mod0_Id', coEqual,M.ID)._And('Men0_Id', coIsNull,''));
  Result := TAxnVMMenus.Create(Lista);
end;


{ TAxnVMMenus }

{ TAxnVMMenus }

function TAxnVMMenus.NewItem(const Value: TAxnMMenuItem): TAxnVMMenuItem;
begin
  Result := TAxnVMMenuItem.Create(Value);
end;

end.
