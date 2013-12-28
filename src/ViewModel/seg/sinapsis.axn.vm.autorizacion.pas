unit sinapsis.axn.vm.autorizacion;

interface
uses
  System.Variants,
  System.SysUtils,
  System.Win.ComObj,
  System.Win.Registry,
  Winapi.Windows,
  Winapi.ActiveX,
  Spring.Cryptography;

type
  IAutorizacion = interface
    ['{50EFCBDE-F821-4712-8501-570C759B8850}']
    function GetProcessorId: String;
    function GetHDSignature: Longword;
    property ProcessorId: String read GetProcessorId;
    property HDSignature: Longword read GetHDSignature;
  end;
  IAutorizaMaquina = interface(IAutorizacion)
    ['{AABAD563-EF57-4967-A5C9-B63390D8DEFC}']
    Procedure Autoriza;
    function Autorizada:Boolean;
  end;
  IAutoizaServidor = interface(IAutorizacion)
    ['{72937380-CF1C-4357-993B-EB368F99F8ED}']
  end;

  TAutorizacion =class(TInterfacedObject, IAutorizacion)
  private
    FWbemUser:String;
    FWbemPassword:String;
    FWbemComputer:String;

    const FwbemFlagForwardOnly = $00000020;
    function GetProcessorId: String;
    function GetHDSignature: Longword;
  protected
    const strBase = 'Software\JODO\Configuration';
    function Query(ALocator, AQuery:String):IEnumvariant;
  public
    constructor Create(AWbemUser, AWbemPassword, AWbemComputer:String);
    property ProcessorId: String read GetProcessorId;
    property HDSignature: Longword read GetHDSignature;
    function DESEncrypt:String;
    function Decrypt:String;
  end;

  TAutorizaMaquina = class(TAutorizacion, IAutorizaMaquina)
  private
  protected
  public
    procedure Autoriza;
    function Autorizada: Boolean;
  end;


implementation

{ TAutorizacion }

function TAutorizacion.GetProcessorId: String;
var
  FWbemObject   : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  r : string;
begin
  r := '';
  oEnum         := Query('root\CIMV2','SELECT * FROM Win32_Processor');
  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    if R = '' then
      r := String(FWbemObject.ProcessorId);
    FWbemObject:=Unassigned;
  end;
  Result := r;
end;

function TAutorizacion.Query(ALocator, AQuery: String): IEnumvariant;
var
  FSWbemLocator : OLEVariant;
  FWMIService   : OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject   : OLEVariant;
begin
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService   := FSWbemLocator.ConnectServer(FWbemComputer, ALocator, FWbemUser, FWbemPassword);
  FWbemObjectSet:= FWMIService.ExecQuery(AQuery,'WQL',FwbemFlagForwardOnly);
  Result        := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
end;




constructor TAutorizacion.Create(AWbemUser, AWbemPassword,
  AWbemComputer: String);
begin
  FWbemUser := AWbemUser;
  FWbemPassword := AWbemPassword;
  FWbemComputer := AWbemComputer;
end;

function TAutorizacion.Decrypt: String;
Var
  InputBuffer: TBuffer;
  OutputBuffer:TBuffer;
  key :TBuffer;
  Des : ITripleDES;
  strKey:string;
begin
  InputBuffer := TBuffer.Create(ProcessorId);
  strKey := IntToStr(HDSignature);
  if strkey.Length > 12 then
    strKey := strKey.Substring(1,12)
  else
    strKey:= strKey.PadLeft(12,'0');
  Key := TBuffer.Create(strKey);

  Des := CreateTripleDES;
  Des.Key := Key;//TBuffer.Create(HDSignature);
  OutputBuffer := Des.Encrypt(InputBuffer);
  Result := OutputBuffer.ToString;
end;

function TAutorizacion.DESEncrypt: String;
Var
  InputBuffer: TBuffer;
  OutputBuffer:TBuffer;
  key :TBuffer;
  Des : IDES;
  strKey:string;
begin
  InputBuffer := TBuffer.Create(ProcessorId);
  strKey := IntToStr(HDSignature);
  if strkey.Length > 8 then
    strKey := strKey.Substring(1,4);
  Key := TBuffer.Create(strKey);

  Des := CreateDES;
  Des.Key := Key;//TBuffer.Create(HDSignature);
  OutputBuffer := Des.Encrypt(InputBuffer);
  Result := OutputBuffer.ToString;
end;

function TAutorizacion.GetHDSignature: Longword;
var
  FWbemObject   : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  x : Longword;
begin;
  x :=0;
  oEnum         := Query('root\CIMV2','SELECT * FROM Win32_DiskDrive');
  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    if x = 0 then
      x := UInt32(FWbemObject.Signature);
    FWbemObject:=Unassigned;
  end;
  Result := x;
end;


{ TAutorizaMaquina }

procedure TAutorizaMaquina.Autoriza;
var
  axnReg : TRegistry;
  strAutorizacion:string;
  strLlave:string;
begin
  axnReg := TRegistry.Create;
  try
    axnReg.RootKey := HKEY_CURRENT_USER;
    axnReg.OpenKey(strBase, True);
    strAutorizacion := axnReg.ReadString('ProductId');
    strLlave := DESEncrypt;
    if (strAutorizacion.IsEmpty) or (strAutorizacion <> strLlave) then
    begin
      axnReg.WriteString('ProductId', strLlave);
    end;
  finally
    axnReg.Free
  end;
end;

function TAutorizaMaquina.Autorizada: Boolean;
var
  axnReg : TRegistry;
  strAutorizacion:string;
  strLlave:string;
begin
  Result := False;
  axnReg := TRegistry.Create;
  try
    axnReg.RootKey := HKEY_CURRENT_USER;
    axnReg.OpenKeyReadOnly(strBase);
    strAutorizacion := axnReg.ReadString('ProductId');
    strLlave := DESEncrypt;
    Result := (strAutorizacion <> strLlave) and (not strAutorizacion.IsEmpty);
    if (strAutorizacion.IsEmpty) or (strAutorizacion <> strLlave) then
    begin
//      Application.MessageBox(PWideChar('¡El software no esta autorizado!'#10#13+
//                             'por favor comuniquesse con su proveedor y proporcione el siguente número'#10#13+
//                              GetProcessorId+#10#13+#10#13)
//                             ,'Seguridad Synapsis',MB_ICONERROR );

    end;
  finally
    axnReg.Free
  end;
end;

end.
