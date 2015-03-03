unit sinapsis.axn.common.configuracion;

interface

type
  TAxnTConf = (tcModel, tcModelView, tcView);

  TAxnConf = class abstract (TObject)
  private
    FArchivo : String;
    FConfiguracion:String;
  protected
    function GetKey:String;Virtual; abstract;
  public
    constructor Create; Virtual;
    procedure LeerConfiguracion; virtual;
    procedure CrearConfiguracion; Virtual;
  end;
  TAxonConfModel = class(TAxnConf)
  protected
    function GetKey: string; override;
  public
    Constructor Create; override;

  end;

const
  AxonConfiguracion = 'cnf';

implementation

uses
 System.IOUtils,
 System.Classes,
 System.SysUtils,
 Spring.Cryptography
 ;
{ TAxnConfiguracion }

procedure TAxnConf.CrearConfiguracion;
var
  ConfW : TStreamWriter;
  Cryp:  ISymmetricAlgorithm;
  Buf : TBuffer;
begin
  Cryp := CreateDES;
  Cryp.PaddingMode := TPaddingMode.PKCS7;
  Cryp.Key := TBuffer.FromHexString(GetKey);
  Cryp.IV := TBuffer.FromHexString('1234567890abcdef');

  Buf := Cryp.Encrypt(TBuffer.Create(FConfiguracion));

  ConfW := TStreamWriter.Create(TFileStream.Create(FArchivo+'.enc', fmCreate));
  ConfW.Write(Buf.ToHexString);
  ConfW.Free;



end;

constructor TAxnConf.Create();
begin
  inherited;
  FArchivo := '';
end;

procedure TAxnConf.LeerConfiguracion;
var
  ConfR : TTextReader;
  strArchivo:String;
  strPath:string;
  Cryp:  ISymmetricAlgorithm;
  Buf : TBuffer;

begin
  strPath := TDirectory.GetParent(TDirectory.GetCurrentDirectory);
  {$IFDEF DEBUG}
    strPath := TDirectory.GetParent(strPath);
    strPath := TDirectory.GetParent(strPath);
    strPath := TDirectory.GetParent(strPath);
//    strPath := TDirectory.GetParent(TDirectory.GetParent(TDirectory.GetParent(TDirectory.GetParent(TDirectory.GetCurrentDirectory))));
  {$ENDIF}
  FArchivo := strPath+'\'+AxonConfiguracion+'\'+FArchivo;
  if TFile.Exists(FArchivo) then
  begin
    ConfR := TFile.OpenText(FArchivo);
  end;
  FConfiguracion := ConfR.ReadToEnd;
  ConfR.Free;
  Cryp := CreateDES;
  Cryp.PaddingMode := TPaddingMode.PKCS7;
  Cryp.Key := TBuffer.FromHexString(GetKey);
  Cryp.IV := TBuffer.FromHexString('1234567890abcdef');
  Buf := Cryp.Decrypt(TBuffer.FromHexString(FConfiguracion));
//  Buf := Cryp.Decrypt( FConfiguracion);

  FConfiguracion := Buf.ToString;


end;

{ TAxonConfModel }

constructor TAxonConfModel.Create;
begin
  inherited;
  FArchivo := 'axn.m.conf';
end;

function TAxonConfModel.GetKey: string;
begin
    Result := '1234567890123456';
//  Result := 'SinapsisAxnModel';
end;

end.
