program Validaciones;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Rtti,
  System.TypInfo,
  System.DateUtils,
  sinapsys.axon.common.anotation in '..\..\..\Common\sinapsys.axon.common.anotation.pas';

const
  D : TDate = 1;

Type
  TDato = class
  //private
    FDato : Double;
    FFecha : TDate;
    function getter: Double;
    procedure setter(Value: Double);virtual;
    function GetFEcha: TDate;
    procedure SetFEcha(const Value: TDate); virtual;
//  public
  [ValorMinimo(0,'Error')]
  property Dato: Double read getter write setter;
  [FechaMinima('2013-01-01' ,'Fecha Inválida')]
  property FEcha: TDate read GetFEcha write SetFEcha;

  end;


{ TDato }

function TDato.GetFEcha: TDate;
begin
  Result := FFecha;
end;

function TDato.getter: Double;
begin
  Result := FDato;
end;

procedure TDato.SetFEcha(const Value: TDate);
begin
  FFecha := Value;
end;

procedure TDato.setter(Value: Double);
begin
  FDato := Value;
end;



procedure Dato;
var
  T: TDato;
  vmi: TVirtualMethodInterceptor;
  vi : TVirtualInterface;
begin
  vmi := nil;
  T := TDato.Create;
  try
    vmi := TVirtualMethodInterceptor.Create(T.ClassType);

    vmi.OnAfter :=  procedure(Instance: TObject; Method: TRttiMethod;
                              const Args: TArray<TValue>; var Result: TValue)
                    begin

                      //if not Validate(Instance) then
                      if not Validate2(Instance, Method) then
                          Writeln('No se Pudo');
                    end;
    vmi.Proxify(T);
    T.Dato := -10;

    T.FEcha :=  IncYear(Date,-1);
  finally
    T.Free;
    vmi.Free;
  end;
end;

function CA(Address:Pointer):Pointer;
var
  i: Integer;
  FCodeAddress : Pointer;
  FVirtualIndex:SmallInt;
begin
  FVirtualIndex := -1;
  i := 0;
  while True do
  begin
    case PByte(Address)[i] of
      $C3:
      begin
        FVirtualIndex := PByte(Address)[i - 4] div SizeOf(Pointer);
        Break;
      end;
      $E9:
      begin
        FCodeAddress := Pointer(PNativeUInt(@PByte(Address)[i + 1])^ + NativeUInt(@PByte(Address)[i]) + 5);
        Break;
      end;
    end;
    Inc(i);
  end;
  Result :=FCodeAddress;
end;

procedure _RTTI(Target : TObject);
var
  ctx : TRttiContext;
  t : TRttiType;
  p : TRttiProperty;
  a : TCustomAttribute;
  pi: TRttiIndexedProperty;
  m : TRttiMethod;
  PMethod: Longint;
  PropInfo: PPropInfo;
  m1 : TMethod;
begin
  ctx := TRttiContext.Create.Create;
  try
    t := ctx.GetType(Target.ClassType);
    for p in t.GetProperties do
      if p is TRttiInstanceProperty then
      begin
          PropInfo := TRttiInstanceProperty(p).PropInfo;
        if PropInfo^.SetProc <> nil then
            PMethod := Longint(PropInfo^.SetProc);
      if (PMethod and $FF000000) = $FE000000 then
        M1.Code := Pointer(PInteger(PInteger(Target)^ + SmallInt(PMethod))^)
      else
        M1.Code := Pointer(PMethod);
      M1.Data := Target;


        Writeln(p.ToString+
                Format('Set: %p',   [TRttiInstanceProperty(p).PropInfo^.SetProc])+
                Format('  Get: %p', [TRttiInstanceProperty(p).PropInfo^.GetProc])+
                Format('  Get: %p', [M1.Code])

                );
      end;

  Writeln('------------------------------------------------------');
    for m in t.GetMethods do
    begin
      if not (m.IsConstructor or m.IsDestructor or m.IsClassMethod)  then
          Writeln(m.ToString+Format(': %p', [m.CodeAddress])+'  ');
    end;
    readln;

  finally
    ctx.Free;
  end;
end;

var
  x : TDato;
begin
  try
    //Dato;
    x := TDato.Create;
    _RTTI(X);
    Dato;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
