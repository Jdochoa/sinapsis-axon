unit sinapsys.axon.common.anotation;

interface

uses
	Classes,
  System.Rtti,
  System.SysUtils;

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

var
  AxonFormatSetting : TFormatSettings;


implementation

  
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