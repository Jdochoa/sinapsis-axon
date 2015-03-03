unit sinapsis.axn.Configuracion;

interface

type
  TAxnConf = class
  private
    FFileName:String;
  protected
    function GetFileName: string;
    procedure SetFileName(const Value: string);
  public
    property FileName: string read GetFileName write SetFileName;

  end;

implementation

{ TAxnConf }

function TAxnConf.GetFileName: string;
begin
  Result := FFileName;
end;

procedure TAxnConf.SetFileName(const Value: string);
begin
  FFileName = Value;
end;

end.
