unit sinapsis.axn.m.men;

interface
uses
  System.SysUtils,
  Generics.Collections,

  dorm.Mappings,
  dorm.Collections,
  dorm.Commons,
  dorm.ObjectStatus,

  sinapsis.axn.m,
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m.Catalogo,
  sinapsis.axn.m.men.interfaz
  ;

type
  TAxnMMenuItem = class;
  [ListOf('sinapsis.axn.m.men.TAxnMMenuItem')]
  TMenus = class (TObjectList<TAxnMMenuItem>)
  private
    function GetMenu(Index: string): TAxnMMenuItem;
  public
    property Menu[Index:string]: TAxnMMenuItem read GetMenu;

  end;

  [Entity('MEN_MEN0_MENU')]
  TAxnMMenuItem = class (TAxnMCTL, IAxnMMenuItem)
  private
    FObjStatus: TdormObjectStatus;
    FMod0_Id :Integer;
    FMen0_Id :Integer;
    FMenus :  TMenus;
  protected
  public
    constructor Create;
    [Column('DESCRIPCION')]
    property Descripcion: String read getDescripcion write setDescripcion;
    [Transient]
    property ObjStatus: TdormObjectStatus read FObjStatus write FObjStatus;
    [Column('Mod0_Id')]
    property Mod0_Id :Integer read FMod0_Id write FMod0_Id;
    [Column('Men0_Id')]
    property Men0_Id :Integer read FMen0_Id write FMen0_Id;
    [HasMany('Men0_ID',True)]
    property Menus: TMenus read FMenus write FMenus;
  end;


implementation

{ TMenus }

function TMenus.GetMenu(Index: string): TAxnMMenuItem;
var
  Menu :TAxnMMenuItem;
begin
  for Menu in List do
  begin
    if CompareText(Menu.Codigo,Index) = 0 then
      Break
  end;
  Result := Menu;
end;

{ TMenu }

constructor TAxnMMenuItem.Create;
begin
  FMenus := TMenus.Create(True);
end;

end.
