unit sinapsis.axon.m;

interface

uses
  dorm.Mappings,
  Spring.Collections.Lists,

  sinapsis.axn.m.intefaz
  ;

type

  [Entity('AXN_DATA')]
  TAxnM = class {$ifndef Debug}abstract {$endif}(TInterfacedObject,IAxnM)
  private
    FId: Integer;
	  FCreatedBy : Integer;
	  FCreatedAt : TDateTime;
	  FModifiedBy : Integer;
	  FModifiedAt : TDateTime;
  protected
    function getId():Integer;
    function getCreatedBy():Integer;
    function getCreatedAt():TDateTime;
    function getModifiedBy():Integer;
    function getModifiedAt():TDateTime;
  public
   [Id]
   [Column('ID')]
   property Id:Integer read getId;
   [Column('CREATEDBY')]
   [Transient]
   property CreatedBy:Integer read getCreatedBy;
   [Column('CREATEDAT')]
   [Transient]
   property CreatedAt:TDateTime read getCreatedAt;
   [Column('MODIFIEDBY')]
   [Transient]
   property ModifiedBy:Integer read getModifiedBy;
   [Column('MODIFIEDAT')]
   [Transient]
   property ModifiedAt:TDateTime read getModifiedAt;
  end;


  [Entity('AXN_CATALOGO')]
  TAxnCtl = class {$ifndef Debug}abstract {$endif} (TAxnM, IAxnMCtl)
  private
    FCodigo: String;
    FDescripcion: String;
  protected
    procedure setCodigo(const Value : string);
    procedure setDescripcion (const Value : string);
    function  getCodigo : String;
    function  getDescripcion : String;
  public
    [Column('CODIGO')]
    property Codigo: String read getCodigo write setCodigo;
    [Column('DESCRIPCION')]
    property Descripcion: String read getDescripcion write setDescripcion;
  end;

  [Entity('AXN_DOCUMENTO')]
  TAxonDocumento = class {$ifndef Debug}abstract {$endif}(TAxnM, IAxnMDct)
  private
    FSerie: String;
    FCorrelativo: Integer;
    FDocumento: String;
    FFecha: TDate;
    FDescripcion: String;
    FEmp0_Id: Integer;
    FTrn0_Id: Integer;
    FEst0_Id: Integer;
  protected
    procedure setSerie(const Value : string);
    procedure setCorrelativo(const Value : Integer);
    procedure setFecha(const Value : TDate);
    procedure setDescripcion(const Value : string);
    procedure setEmp0_Id(const Value : Integer);
    procedure setTrn0_Id(const Value : Integer);
    procedure setEst0_Id(const Value : Integer);

    function getSerie:string;
    function getCorrelativo:integer;
    function getDocumento:string;
    function getFecha:TDate;
    function getDescripcion:string;
    function getEmp0_Id:Integer;
    function getTrn0_Id:Integer;
    function getEst0_Id:Integer;

  public
    [Column('SERIE')]
    property Serie: String read getSerie write setSerie;
    [Column('CORRELATIVO')]
    property Correlativo: Integer read getCorrelativo write setCorrelativo;
    [Column('DOCUMENTO')]
    property Documento: string read getDocumento;
    [Column('FECHA')]
    property Fecha: TDate read getFecha write setFecha;
    [Column('DESCRIPCION')]
    property Descripcion: String read getDescripcion write setDescripcion;
    [Column('EMP0_ID')]
    property Emp0_Id: Integer read getEmp0_Id write setEmp0_Id;
    [Column('TRN0_ID')]
    property Trn0_Id: Integer read getTrn0_Id write setTrn0_Id;
    [Column('EST0_ID')]
    property Est0_Id: Integer read getEst0_Id write setEst0_Id;
  end;

  [Entity('AXONDETALLE')]
  TAxonDetalle = class abstract (TAxnM)
  private
    FDet_Id: Integer;
  public
    [Column('DET_ID')]
    property Det_Id: Integer read FDet_Id write FDet_Id;
  end;

  TAxnModelList = class(TObjectList<TAxnM>)
  end;


implementation



{ TAxonModel }

function TAxnM.getCreatedAt: TDateTime;
begin
  Result := FCreatedAt;
end;

function TAxnM.getCreatedBy: Integer;
begin
  Result := FCreatedBy;
end;

function TAxnM.getId: Integer;
begin
  Result := FId;
end;

function TAxnM.getModifiedAt: TDateTime;
begin
  Result := FModifiedAt;
end;

function TAxnM.getModifiedBy: Integer;
begin
  Result := FModifiedBy;
end;

{ TAxonCatalogo }

function TAxnCtl.getCodigo: String;
begin
  Result := FCodigo;
end;

function TAxnCtl.getDescripcion: String;
begin
  Result := FDescripcion;
end;

procedure TAxnCtl.setCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TAxnCtl.setDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;


{ TAxonDocumento }

function TAxonDocumento.getCorrelativo: integer;
begin
  Result := FCorrelativo;
end;

function TAxonDocumento.getDescripcion: string;
begin
  Result := FDescripcion;
end;

function TAxonDocumento.getDocumento: string;
begin
  Result := FDocumento;
end;

function TAxonDocumento.getEmp0_Id: Integer;
begin
  Result := FEmp0_Id;
end;

function TAxonDocumento.getEst0_Id: Integer;
begin
  Result := FEmp0_Id;
end;

function TAxonDocumento.getFecha: TDate;
begin
  Result := FFecha;
end;

function TAxonDocumento.getSerie: string;
begin
  Result := FSerie;
end;

function TAxonDocumento.getTrn0_Id: Integer;
begin
  Result := FTrn0_Id;
end;

procedure TAxonDocumento.setCorrelativo(const Value: Integer);
begin
  FCorrelativo := Value;
end;

procedure TAxonDocumento.setDescripcion(const Value: string);
begin
  FDescripcion :=  Value;
end;

procedure TAxonDocumento.setEmp0_Id(const Value: Integer);
begin
  FEmp0_Id := Value;
end;

procedure TAxonDocumento.setEst0_Id(const Value: Integer);
begin
  FEst0_Id := Value;
end;

procedure TAxonDocumento.setFecha(const Value: TDate);
begin
  FFecha := Value;
end;

procedure TAxonDocumento.setSerie(const Value: string);
begin
  FSerie := Value;
end;

procedure TAxonDocumento.setTrn0_Id(const Value: Integer);
begin
  FTrn0_Id := Value;
end;

end.
