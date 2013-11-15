unit sinapsis.axn.common.anotation;

interface

uses
	Classes,
  System.Rtti,
  System.SysUtils,
  DSharp.Core.Reflection
  ;

Type
	CustomValidate = class(TCustomAttribute)
	private
    FMensaje: string;
    FDato :TValue;
    constructor Create(const Mensaje:String); 
    function IsValid (Value: TValue):Boolean; virtual;
    property Mensaje: string read FMensaje;
	end;

  ValorMinimo = class(CustomValidate)
   constructor Create(Value:Double; const Mensaje:String);
   function IsValid(Value: TValue): Boolean; override;
  end;

  ValorMaximo = class(CustomValidate)
   constructor Create(Value:Double; const Mensaje:String);
   function IsValid(Value: TValue): Boolean; override;
  end;

  FechaMinima = class(CustomValidate)
   constructor Create(Value:String; const Mensaje:String);
   function IsValid(Value: TValue): Boolean; override;
  end;

  FechaMaxima = class(CustomValidate)
   constructor Create(Value:String; const Mensaje:String);
   function IsValid(Value: TValue): Boolean; override;
  end;


  function Validate(Target : TObject) : boolean;
  function Validate2(Target : TObject; Method: TRttiMethod) : boolean;

var
  AxonFormatSetting : TFormatSettings;


implementation

uses
  System.TypInfo;

function Validate2(Target:TObject; Method: TRttiMethod): boolean;
var
  p : TRttiProperty;
  PropInfo: PPropInfo;
  PM: Longint;
  m : TMethod;
  a : TCustomAttribute;
  rm : TRttiMethod;

begin
  if not Assigned(Target) then
    raise Exception.Create('Can''t validate nil object');
  for p in Target.GetProperties do
    if p is TRttiInstanceProperty then
    begin
      PropInfo := TRttiInstanceProperty(p).PropInfo;
      if PropInfo^.SetProc <> nil then
            PM := Longint(PropInfo^.SetProc);
      if (PM and $FF000000) = $FE000000 then
        M.Code := Pointer(PInteger(PInteger(Target)^ + SmallInt(PM))^)
      else
        M.Code := Pointer(PM);
      M.Data := Target;
      //p.TryGetMethod();
      //TRttiInstanceProperty(p).GetCustomAttribute
      Writeln('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
      Writeln(p.ToString+
                Format('Set: %p',   [TRttiInstanceProperty(p).PropInfo^.SetProc])+
                Format('  Get: %p', [TRttiInstanceProperty(p).PropInfo^.GetProc])+
                Format('  Get: %p', [M.Code])

                );

    for rm in Target.GetMethods do
    begin
      if not (rm.IsConstructor or rm.IsDestructor or rm.IsClassMethod)  then
          Writeln(rm.ToString+Format(': %p', [rm.CodeAddress])+'  ');
    end;
    readln;

{      if Method.CodeAddress = m.Code then
        for a in p.GetAttributes do
            if a is CustomValidate then
              Result:= CustomValidate(a).IsValid(P.GetValue(Target));}
    end;

end;

function Validate(Target : TObject) : boolean;
var
  ctx : TRttiContext;
  t : TRttiType;
  p : TRttiProperty;
  a : TCustomAttribute;
  pi: TRttiIndexedProperty;
  m : TRttiMethod;
begin
  Result := True;

  if not Assigned(Target) then
    raise Exception.Create('Can''t validate nil object');

  ctx := TRttiContext.Create.Create;
  try
    t := ctx.GetType(Target.ClassType);
    for p in t.GetProperties do
      if p is TRttiInstanceProperty then
      begin
          for pi in t.GetIndexedProperties  do
        //    pi.Name


        //TRttiInstanceProperty(p).PropInfo^.SetProc
        for a in p.GetAttributes do
          if a is CustomValidate then
         Result:= CustomValidate(a).IsValid(P.GetValue(Target));
      end;
  finally
    ctx.Free;
  end;
end;


{ CustomValidate }

constructor CustomValidate.Create(const Mensaje: String);
begin
  FMensaje :=Mensaje;
end;

function CustomValidate.IsValid(Value: TValue): Boolean;
begin

end;

{ TValorValidate }

constructor ValorMinimo.Create(Value: Double; const Mensaje: String);
begin
  inherited Create(Mensaje);
  FDato := Value;
end;

function ValorMinimo.IsValid(Value: TValue): Boolean;
begin
  Result := Value.AsExtended >= FDato.AsExtended;
end;

{ ValorMaximo }

constructor ValorMaximo.Create(Value: Double; const Mensaje: String);
begin
  inherited Create(Mensaje);
  FDato := Value;
end;

function ValorMaximo.IsValid(Value: TValue): Boolean;
begin
  Result := Value.AsExtended <= FDato.AsExtended;
end;

{ FechaMinimo }

constructor FechaMinima.Create(Value: string; const Mensaje: String);
begin
  inherited Create(Mensaje);
  FDato := StrToDateDef(Value,Date, AxonFormatSetting);
end;

function FechaMinima.IsValid(Value: TValue): Boolean;
begin
  Result := Value.AsCurrency >= FDato.AsCurrency;
end;

{ FechaMaximo }

constructor FechaMaxima.Create(Value: string; const Mensaje: String);
begin
  inherited Create(Mensaje);
  FDato := StrToDateDef(Value,Date, AxonFormatSetting);
end;

function FechaMaxima.IsValid(Value: TValue): Boolean;
begin
  Result := Value.AsCurrency <= FDato.AsCurrency;
end;


initialization
  AxonFormatSetting.ShortDateFormat := 'yyyy-mm-dd';
end.