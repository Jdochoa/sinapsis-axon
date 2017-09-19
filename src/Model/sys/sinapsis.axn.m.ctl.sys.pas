unit sinapsis.axn.m.ctl.sys;

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
    sinapsis.axn.m.ctl,
    sinapsis.axn.m.ctl.sys.interfaz
    ;

type
  {$IFDEF Marshmallow}
    [Entity]
    [Table('SYS_VEMP0_EMPRESA','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('SYS_VEMP0_EMPRESA')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnMSysEmp = class (TAxnMCtlV, IAxnMSysEmp)
  private
    FSYS0: String;
    FGUID: String;
  protected
    procedure setSYS0(const Value : string);
    procedure setGUID(const Value : string);
    function  getSYS0 : String;
    function  getGUID : String;
  public
  {$IFDEF Marshmallow}
     [Column('SYS0', [], 1, -1, -1, 'SYS0')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('SYS0')]
   {$ENDIF}
  {$ENDIF}
    property SYS0: String read getSYS0 write setSYS0;
  {$IFDEF Marshmallow}
     [Column('GUID', [], 1, -1, -1, 'GUID')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('GUID')]
   {$ENDIF}
  {$ENDIF}
    property GUID: String read getGUID write setGUID;
  end;


implementation

{ TAxnMSysEmp }

function TAxnMSysEmp.getGUID: String;
begin
  Result := FGUID;
end;

function TAxnMSysEmp.getSYS0: String;
begin
  Result := FSYS0;
end;

procedure TAxnMSysEmp.setGUID(const Value: string);
begin
  FGUID := Value;
end;

procedure TAxnMSysEmp.setSYS0(const Value: string);
begin
  FSYS0 := Value;
end;

end.
