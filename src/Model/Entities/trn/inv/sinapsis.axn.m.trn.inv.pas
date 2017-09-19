unit sinapsis.axn.m.trn.inv;

interface
uses
  Spring,
  Spring.Collections,
  {$IFDEF Marshmallow}
    Spring.Persistence.Mapping.Attributes,
  {$ELSE}
   {$IFDEF DORM}
    dorm.Mappings,
   {$ENDIF}
  {$ENDIF}

  sinapsis.axn.m.trn,
  sinapsis.axn.m.trn.inv.interfaz
  ;

type
  {$IFDEF Marshmallow}
    [Entity]
    [Table('INV_TRN1_TRANSACCION','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('INV_TRN1_TRANSACCION')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TTrnInv = class
  private
    FTrn0_Id : Int64;
    FInv_Afecta : Integer;
    FTrn0 : TAxnMTrn;
    function GetInv_Afecta: Integer;
    procedure SetInv_Afecta(const Value: Integer);
    function GetTrn0: TAxnMTrn;
    procedure SetTrn0(const Value: TAxnMTrn);
  protected
    function GetTrn0_Id: Int64;
    procedure SetTrn0_Id(const Value: Int64);
  public
  {$IFDEF Marshmallow}
     //[Column('TRN0_ID', [cpRequired, cpNotNull], -1, -1, -1, 'Número de Lineas')]
     [Column('TRN0_ID',[cpPrimaryKey])]
     [ForeignJoinColumn('TRN0_ID', 'TRN_TRN0_TRANSACCION', 'ID', [fsOnDeleteCascade, fsOnUpdateCascade])]
  {$ELSE}
   {$IFDEF DORM}
    [Column('TRN0_ID')]
   {$ENDIF}
  {$ENDIF}
    property Trn0_Id: Int64 read GetTrn0_Id write SetTrn0_Id;
    [ManyToOne(True, [ckCascadeAll], 'TRN0_ID')]
    property Trn0: TAxnMTrn read GetTrn0 write SetTrn0;

  {$IFDEF Marshmallow}
     [Column('INV_AFECTA', [cpRequired, cpNotNull], -1, -1, -1, '')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('INV_AFECTA')]
   {$ENDIF}
  {$ENDIF}
    property Inv_Afecta: Integer read GetInv_Afecta write SetInv_Afecta;
  end;

  TAxnMTrnInv = class(TAxnMTrn, IAxnMTrnInv)
  private
    [OneToMany(True, [ckCascadeAll])]
    FTrnInv : Lazy<IList<TTrnInv>>;
    FInvAfecta :Integer;
    function GetTrnInv: IList<TTrnInv>;
    procedure SetTrnInv(const Value: IList<TTrnInv>);
  protected
    procedure SetInvAfecta (const Value : Integer);

    function GetInvAfecta:Integer;

  public
    constructor Create;
    property InvAfecta: Integer read GetInvAfecta write SetInvAfecta;
    property TrnInv: IList<TTrnInv> read GetTrnInv write SetTrnInv;
  end;

implementation

{ TAxnMTrnInv }


constructor TAxnMTrnInv.Create;
begin
  FTrnInv := TCollections.CreateObjectList<TTrnInv>;
end;

function TAxnMTrnInv.GetInvAfecta: Integer;
begin
  Result := FInvAfecta;
end;

function TAxnMTrnInv.GetTrnInv: IList<TTrnInv>;
begin
  Result := FTrnInv;
end;

procedure TAxnMTrnInv.SetInvAfecta(const Value: Integer);
begin
  FInvAfecta := Value;
end;

procedure TAxnMTrnInv.SetTrnInv(const Value: IList<TTrnInv>);
begin
  FTrnInv := Value;
end;

{ TTrnInv }

function TTrnInv.GetInv_Afecta: Integer;
begin
  Result := FInv_Afecta;
end;

function TTrnInv.GetTrn0: TAxnMTrn;
begin
  Result := FTrn0;
end;

function TTrnInv.GetTrn0_Id: Int64;
begin
  Result := FTrn0_Id;
end;

procedure TTrnInv.SetInv_Afecta(const Value: Integer);
begin
  FInv_Afecta := Value;
end;

procedure TTrnInv.SetTrn0(const Value: TAxnMTrn);
begin
  FTrn0 := Value;
end;

procedure TTrnInv.SetTrn0_Id(const Value: Int64);
begin
  FTrn0_Id := Value;
end;

end.
