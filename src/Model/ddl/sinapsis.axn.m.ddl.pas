unit sinapsis.axn.m.ddl;

interface
{$I Model.inc}
uses
  {$IFDEF Marshmallow}
    Spring.Persistence.Mapping.Attributes,
  {$ELSE}
   {$IFDEF DORM}
    dorm.Mappings,
   {$ENDIF}
  {$ENDIF}
    Spring.Collections,
    sinapsis.axn.m.Catalogo,
    sinapsis.axn.m.ddl.Interfaz
    ;

type
  {$IFDEF Marshmallow}
    [Entity]
    [Table('AXN_DDL','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('AXN_DDL')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnMDdl = class {$ifndef Debug}abstract {$endif} (TAxnMCTL, IAxnMDdl)
  private
  protected
  public
  end;

  {$IFDEF Marshmallow}
    [Entity]
    [Table('DDL_TDT0_TIPODATO','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('DDL_TDT0_TIPODATO')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnMTdt0 = class (TAxnMDdl, IAxnMTdt0)
  private
  protected
  public
  end;


  {$IFDEF Marshmallow}
    [Entity]
    [Table('DDL_ATR0_ATRIBUTO','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('DDL_ATR0_ATRIBUTO')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnMAtr0  = class (TAxnMDdl, IAxnMAtr0)
  private
    FTdt0_Id : integer;
    FCls0_Id : integer;
  protected
    procedure setTdt0_Id(const Value : integer);
    procedure setCls0_Id(const Value : integer);
    function  getTdt0_Id : integer;
    function  getCls0_Id : integer;
  public
    property Tdt0_Id : integer read getTdt0_Id write setTdt0_Id;
    property Cls0_Id : integer read getCls0_Id write setCls0_Id;
  end;


  {$IFDEF Marshmallow}
    [Entity]
    [Table('DDL_CLS0_CLASE','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('DDL_CLS0_CLASE')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnMCls0  = class (TAxnMDdl, IAxnMCls0)
  private
    FPkg0_Id : integer;
    FCls0_Id : integer;
    FAbstract : boolean;
    [OneToMany(False, [ckCascadeAll])]
    FAtributos: IList<IAxnMAtr0>;
  protected
    procedure setPkg0_Id(const Value : integer);
    procedure setCls0_Id(const Value : integer);
    procedure setAbstract(const Value : boolean);
    procedure setAtributos(const Value :IList<IAxnMAtr0>);
    function  getPkg0_Id : integer;
    function  getCls0_Id : integer;
    function  getAbstract: boolean;
    function  getAtributos: IList<IAxnMAtr0>;
  public
    property Pkg0_Id : integer read getPkg0_Id write setPkg0_Id;
    property Cls0_Id : integer read getCls0_Id write setCls0_Id;
    property Abstract : Boolean read getAbstract write setAbstract;
    property Atributos: IList<IAxnMAtr0> read GetAtributos write setAtributos;
  end;

  {$IFDEF Marshmallow}
    [Entity]
    [Table('DDL_PKG0_PACKAGE','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('DDL_PKG0_PACKAGE')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnMPkg0  = class (TAxnMDdl, IAxnMPkg0)
  private
  protected
  public
  end;


implementation

{ TAxnMCLS0 }

function TAxnMCLS0.getAbstract: boolean;
begin
  Result := FAbstract;
end;

function TAxnMCls0.getAtributos: IList<IAxnMAtr0>;
begin
  Result := FAtributos;
end;

function TAxnMCLS0.getCls0_Id: integer;
begin
  Result := FCls0_Id;
end;

function TAxnMCLS0.getPkg0_Id: integer;
begin
  Result := FPkg0_Id;
end;

procedure TAxnMCLS0.setAbstract(const Value: boolean);
begin
  FAbstract := Value;
end;

procedure TAxnMCls0.setAtributos(const Value: IList<IAxnMAtr0>);
begin
  FAtributos := Value;
end;

procedure TAxnMCLS0.setCls0_Id(const Value: integer);
begin
  FCls0_Id := Value;
end;

procedure TAxnMCLS0.setPkg0_Id(const Value: integer);
begin
  FPkg0_Id := Value;
end;

{ TAxnMATR0 }

function TAxnMATR0.getCls0_Id: integer;
begin
  Result := FCls0_Id;
end;

function TAxnMATR0.getTdt0_Id: integer;
begin
  Result := FTdt0_Id;
end;

procedure TAxnMATR0.setCls0_Id(const Value: integer);
begin
  FCls0_Id := Value;
end;

procedure TAxnMATR0.setTdt0_Id(const Value: integer);
begin
  FTdt0_Id := Value;
end;

end.
