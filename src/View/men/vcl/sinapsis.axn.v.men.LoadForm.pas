unit sinapsis.axn.v.men.LoadForm;

interface

Type
  IViewPackage = interface
    ['{EB2EA0C2-3C73-4262-A68E-DD126B6467AA}']
    function  GetArchivo:String;
    procedure SetArchivo(const Value : String);

    property Archivo: String read GetArchivo write SetArchivo;

    function LoadForm(const strNombre : String; dm:TObject) : TObject;


  end;

  TViewPackage = class(TInterfacedObject, IViewPackage)
  private
    FArchivo:string;
    Fphm: HModule;
  protected
    function GetArchivo: string;
    procedure SetArchivo(const Value: string);
    procedure Load;
  public
    constructor Create;
    function LoadForm(const strNombre: string; dm: TObject): TObject;
    destructor Destroy; override;

    property Archivo: String read GetArchivo write SetArchivo;

  end;

implementation

uses
  System.SysUtils,
  Winapi.Windows;

{ TViewPackage }

constructor TViewPackage.Create;
begin
  FArchivo := '';
  Fphm := 0;
end;


destructor TViewPackage.Destroy;
begin
 if Fphm <> 0 then
    UnloadPackage(Fphm);
  inherited;
end;

function TViewPackage.GetArchivo: string;
begin
  Result := FArchivo;
end;

function TViewPackage.LoadForm(const strNombre: string; dm: TObject): TObject;
var
  T : procedure (var FormName; DM : TObject);
begin
  if Fphm = 0 then
    Load;
   @T :=GetProcAddress(Fphm,PWideChar(strNombre));
   if Assigned(T) then
      T(Result,DM);
end;

procedure TViewPackage.Load;
begin
  if Fphm = 0 then
    Fphm:=LoadPackage(PWideChar(Archivo));
end;

procedure TViewPackage.SetArchivo(const Value: string);
begin
  FArchivo := Value;
end;

end.
