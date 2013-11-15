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
  sinapsis.axn.m.Catalogo;

type
  TMenu = class;
  [ListOf('sinapsis.axn.m.mdl.TMenu')]
  TMenus = class (TObjectList<TMenu>)
  private
    function GetMenu(Index: string): TMenu;
  public
    property Menu[Index:string]: TMenu read GetMenu;

  end;

  [Entity('MEN_MEN0_MENU')]
  TMenu = class (TAxnMCTL)
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
    property Menus: TMenus read FMenus;
  end;


implementation

{ TMenus }

function TMenus.GetMenu(Index: string): TMenu;
var
  Menu :TMenu;
begin
  for Menu in List do
  begin
    if CompareText(Menu.Codigo,Index) = 0 then
      Break
  end;
  Result := Menu;
end;

{ TMenu }

constructor TMenu.Create;
begin
  FMenus := TMenus.Create(True);
end;

end.
