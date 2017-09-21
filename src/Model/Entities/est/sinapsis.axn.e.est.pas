unit sinapsis.axn.e.est;

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
  sinapsis.axn.e,
  sinapsis.axn.e.ctl,
  sinapsis.axn.e.est.interfaz
  ;

type
  TESSS0 = class;
  TESig = class;

  {$IFDEF Marshmallow}
    [Entity]
    [Table('EST_EST0_ESTADO','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('EST_EST0_ESTADO')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TEEst0 = class(TAxnECTL, IEEst0)
  private
    [OneToMany(True, [ckCascadeAll])]
    FTESig : Lazy<IList<TESig>>;
    [OneToMany(True, [ckCascadeAll])]
    FTESSS0 : Lazy<IList<TESSS0>>;
    FAfecto : string;
  protected
    function GetAfecto: string;
    function GetESig: IList<TESig>;
    function GetSSS0: IList<TESSS0>;
    procedure SetAfecto(const Value: string);
    procedure SetESig(const Value: IList<TESig>);
    procedure SetSSS0(const Value: IList<TESSS0>);
  public
  {$IFDEF Marshmallow}
     [Column('AFECTO', [cpRequired, cpNotNull], -1, -1, -1, 'Forma Afecta')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('AFECTO')]
   {$ENDIF}
  {$ENDIF}
    property Afecto: String read GetAfecto write SetAfecto;
    property ESig: IList<TESig>  read GetESig write SetESig;
    property SSS0: IList<TESSS0> read GetSSS0 write SetSSS0;
  end;

  {$IFDEF Marshmallow}
    [Entity]
    [Table('EST_EST1_SIGUIENTE','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('EST_EST1_SIGUIENTE')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TESig = class(TInterfacedObject, IESig)
  private
    FEst0_Id : Int64;
    FEst0_Id_Sig : Int64;
  protected
    procedure SetEst0_Id(const Value : Int64);
    procedure SetEst0_Id_Sig(const Value : Int64);
    function GetEst0_Id : Int64;
    function GetEst0_Id_Sig : Int64;
  public
  {$IFDEF Marshmallow}
     //[Column('EST0_ID', [cpRequired, cpNotNull], -1, -1, -1, 'Estado Id')]
     [Column('EST0_ID',[cpPrimaryKey])]
     [ForeignJoinColumn('EST0_ID', 'EST_EST0_ESTADO', 'ID', [fsOnDeleteCascade, fsOnUpdateCascade])]
  {$ELSE}
   {$IFDEF DORM}
    [Column('EST0_ID')]
   {$ENDIF}
  {$ENDIF}
    property Est0_Id: Int64 read GetEst0_Id write SetEst0_Id;
  {$IFDEF Marshmallow}
     [Column('EST0_ID_SIG', [cpRequired, cpNotNull], -1, -1, -1, 'Estado Siguiente')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('EST0_ID_SIG')]
   {$ENDIF}
  {$ENDIF}
    property Est0_Id_Sig: Int64 read GetEst0_Id_Sig write SetEst0_Id_Sig;
 end;

  {$IFDEF Marshmallow}
    [Entity]
    [Table('EST_EST1_SUBSISTEMA','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('EST_EST1_SUBSISTEMA')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TESSS0 = class(TInterfacedObject, IESSS0)
  private
    FEst0_Id : Int64;
    FEst0_Id_Equ : Int64;
    FSSS0_Id : Int64;
  protected
    procedure SetEst0_Id(const Value : Int64);
    procedure SetEst0_Id_Equ(const Value : Int64);
    procedure SetSSS0_Id(const Value : Int64);
    function GetEst0_Id : Int64;
    function GetEst0_Id_Equ : Int64;
    function GetSSS0_Id : Int64;
  public
  {$IFDEF Marshmallow}
     //[Column('EST0_ID', [cpRequired, cpNotNull], -1, -1, -1, 'Estado Id')]
     [Column('EST0_ID',[cpPrimaryKey])]
     [ForeignJoinColumn('EST0_ID', 'EST_EST0_ESTADO', 'ID', [fsOnDeleteCascade, fsOnUpdateCascade])]
  {$ELSE}
   {$IFDEF DORM}
    [Column('EST0_ID')]
   {$ENDIF}
  {$ENDIF}
    property Est0_Id: Int64 read GetEst0_Id write SetEst0_Id;
  {$IFDEF Marshmallow}
     [Column('EST0_ID_EQU', [cpRequired, cpNotNull], -1, -1, -1, 'Estado Equivalente')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('EST0_ID_EQU')]
   {$ENDIF}
  {$ENDIF}
    property Est0_Id_Equ: Int64 read GetEst0_Id_Equ write SetEst0_Id_Equ;
  {$IFDEF Marshmallow}
     [Column('SSS0_ID', [cpRequired, cpNotNull], -1, -1, -1, 'SubSistema')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('SSS0_ID')]
   {$ENDIF}
  {$ENDIF}
    property SSS0_Id: Int64 read GetSSS0_Id write SetSSS0_Id;
 end;

implementation

{ TEEst0 }

function TEEst0.GetAfecto: string;
begin
  Result := FAfecto;
end;

function TEEst0.GetESig: IList<TESig>;
begin
  Result := FTESig;
end;

function TEEst0.GetSSS0: IList<TESSS0>;
begin
  Result := FTESSS0;
end;

procedure TEEst0.SetAfecto(const Value: string);
begin
  FAfecto := Value;
end;

procedure TEEst0.SetESig(const Value: IList<TESig>);
begin
  FTESig := Value;
end;

procedure TEEst0.SetSSS0(const Value: IList<TESSS0>);
begin
  FTESSS0 := Value;
end;

{ TESig }

function TESig.GetEst0_Id: Int64;
begin
  Result := FEst0_Id;
end;

function TESig.GetEst0_Id_Sig: Int64;
begin
  Result := FEst0_Id_Sig;
end;

procedure TESig.SetEst0_Id(const Value: Int64);
begin
  FEst0_Id := Value;
end;

procedure TESig.SetEst0_Id_Sig(const Value: Int64);
begin
  FEst0_Id_Sig := Value;
end;

{ TEEqu }

function TESSS0.GetEst0_Id: Int64;
begin
  Result := FEst0_Id;
end;

function TESSS0.GetEst0_Id_Equ: Int64;
begin
  Result := FEst0_Id_Equ;
end;

function TESSS0.GetSSS0_Id: Int64;
begin
  Result := FSSS0_Id;
end;

procedure TESSS0.SetEst0_Id(const Value: Int64);
begin
  FEst0_Id := Value;
end;

procedure TESSS0.SetEst0_Id_Equ(const Value: Int64);
begin
  FEst0_Id_Equ := Value
end;

procedure TESSS0.SetSSS0_Id(const Value: Int64);
begin
  FSSS0_Id := Value;
end;

end.
