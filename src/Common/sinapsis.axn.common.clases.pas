unit sinapsis.axn.common.clases;

interface

type
  TInterfacedObjectAxn = class(TObject, IInterface)
  protected
{$IFNDEF AUTOREFCOUNT}
    FRefCount: Integer;
{$ENDIF}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
{$IFNDEF AUTOREFCOUNT}
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
{$ENDIF}
  end;


implementation

{ TInterfacedObjectAxn }


{$IFNDEF AUTOREFCOUNT}

procedure TInterfacedObjectAxn.AfterConstruction;
begin
// Release the constructor's implicit refcount
  AtomicDecrement(FRefCount);
end;

procedure TInterfacedObjectAxn.BeforeDestruction;
begin
  if FRefCount <> 0 then
    Error(reInvalidPtr);
end;

class function TInterfacedObjectAxn.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TInterfacedObjectAxn(Result).FRefCount := 1;
end;
{$ENDIF AUTOREFCOUNT}

function TInterfacedObjectAxn.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TInterfacedObjectAxn._AddRef: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;

function TInterfacedObjectAxn._Release: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicDecrement(FRefCount);
  if Result = 0 then
    Destroy;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;

end.
