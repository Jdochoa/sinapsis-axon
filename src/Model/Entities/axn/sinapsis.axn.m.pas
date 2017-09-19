unit sinapsis.axn.m;

interface

{.$I Model.inc}

uses
{$IFDEF Marshmallow}
  Spring.Persistence.Mapping.Attributes,
{$ELSE}
{$IFDEF DORM}
  dorm.Mappings,
{$ENDIF}
{$ENDIF}
  sinapsis.axn.m.interfaz;

type
  TAxnMBase = class abstract(TInterfacedObject, IAxnMBase)
  private
    FId: Int64;
  protected
    function getId(): Int64;
    procedure setId(Value: Int64);
  public
    function ObjectClone: TObject;
    function InterfaceClone: IAxnMBase;
{$IFDEF Marshmallow}
    [Id]
    [Column('ID', [cpRequired, cpPrimaryKey, cpNotNull], -1, -1, -1,
      'Primary Key')]
{$ELSE}
{$IFDEF DORM}
    [Id]
    [Column('ID')]
{$ENDIF}
{$ENDIF}
    property Id: Int64 read getId write setId;

  end;

{$IFDEF Marshmallow}
  [Entity]
  [Table('AXN_DATA', 'AXN')]
{$ELSE}
{$IFDEF DORM}
  [Entity('AXN_DATA')]
  [NoAutomapping]
{$ENDIF}
{$ENDIF}

  TAxnM = class {$IFNDEF Debug}abstract {$ENDIF}(TAxnMBase, IAxnM)
  private
    FCreatedBy: Integer;
    FCreatedAt: TDateTime;
    FModifiedBy: Integer;
    FModifiedAt: TDateTime;
  protected
    function getCreatedBy(): Integer;
    function getCreatedAt(): TDateTime;
    function getModifiedBy(): Integer;
    function getModifiedAt(): TDateTime;
    procedure setCreatedBy(Value: Integer);
    procedure setCreatedAt(Value: TDateTime);
    procedure setModifiedBy(Value: Integer);
    procedure setModifiedAt(Value: TDateTime);

  public
{$IFDEF Marshmallow}
    // [Column('CREATEDBY', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Create by')]
{$ELSE}
{$IFDEF DORM}
    [Transient]
    [Column('CREATEDBY')]
{$ENDIF}
{$ENDIF}
    property CreatedBy: Integer read getCreatedBy;
{$IFDEF Marshmallow}
    // [Column('CREATEDAT', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Created at')]
{$ELSE}
{$IFDEF DORM}
    [Transient]
    [Column('CREATEDAT')]
{$ENDIF}
{$ENDIF}
    property CreatedAt: TDateTime read getCreatedAt;
{$IFDEF Marshmallow}
    // [Column('MODIFIEDBY', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Modified by')]
{$ELSE}
{$IFDEF DORM}
    [Transient]
    [Column('MODIFIEDBY')]
{$ENDIF}
{$ENDIF}
    property ModifiedBy: Integer read getModifiedBy;
{$IFDEF Marshmallow}
    // [Column('MODIFIEDAT', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Modified at')]
{$ELSE}
{$IFDEF DORM}
    [Transient]
    [Column('MODIFIEDAT')]
{$ENDIF}
{$ENDIF}
    property ModifiedAt: TDateTime read getModifiedAt;

  end;

  // TAxnMList<T:TAxnM> = class(TObjectList<T>, IAxnMList<T>)
  // private
  // protected
  // public
  // end;

implementation

uses
  System.JSON,
  System.JSONConsts,
  Data.DBXJSONReflect;

{ TAxonModel }

function TAxnM.getCreatedAt: TDateTime;
begin
  Result := FCreatedAt;
end;

function TAxnM.getCreatedBy: Integer;
begin
  Result := FCreatedBy;
end;

function TAxnM.getModifiedAt: TDateTime;
begin
  Result := FModifiedAt;
end;

function TAxnM.getModifiedBy: Integer;
begin
  Result := FModifiedBy;
end;

procedure TAxnM.setCreatedAt(Value: TDateTime);
begin
  FCreatedAt := Value;
end;

procedure TAxnM.setCreatedBy(Value: Integer);
begin
  FCreatedBy := Value;
end;

procedure TAxnM.setModifiedAt(Value: TDateTime);
begin
  FModifiedAt := Value;
end;

procedure TAxnM.setModifiedBy(Value: Integer);
begin
  FModifiedBy := Value;
end;

{ TAxnMBase }

function TAxnMBase.getId: Int64;
begin
  Result := FId;
end;

function TAxnMBase.InterfaceClone: IAxnMBase;
begin
  Result := nil;
end;

function TAxnMBase.ObjectClone: TObject;
var
  MarshalObj: TJSONMarshal;
  UnMarshalObj: TJSONUnMarshal;
  JSONValue: TJSONValue;
begin
  Result := nil;
  MarshalObj := TJSONMarshal.Create;
  UnMarshalObj := TJSONUnMarshal.Create;
  try
    JSONValue := MarshalObj.Marshal(Self);
    try
      if Assigned(JSONValue) then
        Result := UnMarshalObj.Unmarshal(JSONValue);
    finally
      JSONValue.Free;
    end;
  finally
    MarshalObj.Free;
    UnMarshalObj.Free;
  end;
end;

procedure TAxnMBase.setId(Value: Int64);
begin
  FId := Value;
end;

end.
