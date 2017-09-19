program Pruebas;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Classes,
  System.SysUtils,
  sinapsis.axn.model,
  Spring.Cryptography,
  PruebasDelModelo in 'PruebasDelModelo.pas',
  sinapsis.axn.common.configuracion in '..\..\..\Common\sinapsis.axn.common.configuracion.pas';

type
  TByteArr = array of byte;
function ByteToString(const Value: TBytes): String;
var
  I: integer;
  S : String;
  Letra: char;
begin
  S := '';
  for I := Length(Value)-1 Downto 0 do
  begin
    letra := Chr(Value[I] + 48);
    S := letra + S;
  end;
  Result := S;
end;


function HexToString(H: String): String;
var I: Integer;
  str :string;
  c : char;
begin
  Result:= '';
  for I := 1 to length (H) div 2 do
  begin
    str :=Copy(H,(I-1)*2+1,2);
    c := Char(StrToInt('$'+str));
    Result:= Result+c;
  end;
end;

Procedure Buffer;
const
  t = 'Esta es una prueba de un texto';
var
  I : TBuffer;
  O : TBuffer;
  temp : String;
begin
  Writeln(t);
  I := TBuffer.Create(t);
  temp := I.ToHexString;
  WriteLn(Temp);
  Temp:= HexToString(Temp);
  Writeln(Temp);
  Temp := ByteToString(I.ToBytes);
  Writeln(Temp);
//  Temp :=   TBuffer.ConvertToHexString(I, i.Size);

//  Writeln(Temp);
//  O := TBuffer.FromHexString(Temp);
//  temp := O.ToString;
//  Writeln(Temp);
//  temp := O.ToHexString;
//  Writeln(Temp);


end;
Procedure Configuracion;
Var
  Conf : TAxnConf;
begin
  Conf := TAxonConfModel.Create;
  Conf.LeerConfiguracion;
//  Conf.CrearConfiguracion;
end;

begin
  try
    buffer;
//    Configuracion;
    //Test1(AxnModel(amtLocal));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
