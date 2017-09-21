unit sinapsis.axn.e.trn.inv;

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

  sinapsis.axn.e.trn,
  sinapsis.axn.e.trn.inv.interfaz
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
  TInvTrn1 = class
  private
    FTrn0_Id : Int64;
    FInv_Afecta : Integer;
    FTrn0 : TETrn0;
    function GetInv_Afecta: Integer;
    procedure SetInv_Afecta(const Value: Integer);
    function GetTrn0: TETrn0;
    procedure SetTrn0(const Value: TETrn0);
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
    property Trn0: TETrn0 read GetTrn0 write SetTrn0;

  {$IFDEF Marshmallow}
     [Column('INV_AFECTA', [cpRequired, cpNotNull], -1, -1, -1, '')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('INV_AFECTA')]
   {$ENDIF}
  {$ENDIF}
    property Inv_Afecta: Integer read GetInv_Afecta write SetInv_Afecta;
  end;

  TETrn0Inv0 = class(TETrn0, IETrn0Inv0)
  private
    [OneToMany(True, [ckCascadeAll])]
    FTrnInv : Lazy<IList<TInvTrn1>>;
    FInvAfecta :Integer;
    function GeTInvTrn1: IList<TInvTrn1>;
    procedure SeTInvTrn1(const Value: IList<TInvTrn1>);
  protected
    procedure SetInvAfecta (const Value : Integer);

    function GetInvAfecta:Integer;

  public
    constructor Create;
    property InvAfecta: Integer read GetInvAfecta write SetInvAfecta;
    property TrnInv: IList<TInvTrn1> read GeTInvTrn1 write SeTInvTrn1;
  end;

implementation

{ TAxnMTrnInv }


constructor TETrn0Inv0.Create;
begin
  FTrnInv := TCollections.CreateObjectList<TInvTrn1>;
end;

function TETrn0Inv0.GetInvAfecta: Integer;
begin
  Result := FInvAfecta;
end;

function TETrn0Inv0.GeTInvTrn1: IList<TInvTrn1>;
begin
  Result := FTrnInv;
end;

procedure TETrn0Inv0.SetInvAfecta(const Value: Integer);
begin
  FInvAfecta := Value;
end;

procedure TETrn0Inv0.SeTInvTrn1(const Value: IList<TInvTrn1>);
begin
  FTrnInv := Value;
end;

{ TInvTrn1 }

function TInvTrn1.GetInv_Afecta: Integer;
begin
  Result := FInv_Afecta;
end;

function TInvTrn1.GetTrn0: TETrn0;
begin
  Result := FTrn0;
end;

function TInvTrn1.GetTrn0_Id: Int64;
begin
  Result := FTrn0_Id;
end;

procedure TInvTrn1.SetInv_Afecta(const Value: Integer);
begin
  FInv_Afecta := Value;
end;

procedure TInvTrn1.SetTrn0(const Value: TETrn0);
begin
  FTrn0 := Value;
end;

procedure TInvTrn1.SetTrn0_Id(const Value: Int64);
begin
  FTrn0_Id := Value;
end;

end.
