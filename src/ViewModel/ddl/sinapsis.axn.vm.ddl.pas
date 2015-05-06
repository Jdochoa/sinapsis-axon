unit sinapsis.axn.vm.ddl;

interface

uses

  sinapsis.axn.m.ddl.interfaz,
  sinapsis.axn.m.ddl,
  sinapsis.axn.vm,
  sinapsis.axn.vm.interfaz,
  sinapsis.axn.vm.catalogo.interfaz,
  sinapsis.axn.vm.catalogo,
  sinapsis.axn.vm.ddl.interfaz;


type
  TAxnVMDdl = class (TAxnVMCtl, IAxnVMDdl)
  private
  protected
    function GetAxnMDdl: TAxnMDdl;
    procedure SetAxnMDdl(Value: TAxnMDdl);
  public
    constructor Create(Value: TAxnMDdl);
    function DDLAlter: string; virtual; abstract;
    function DDLCreate: string; virtual; abstract;
    function DDLDrop: string; virtual; abstract;
    property AxnMDdl: TAxnMDdl read GetAxnMDdl write SetAxnMDdl;


  end;

  TAxnVMTdt0 = class (TAxnVMDdl, IAxnVMTdt0)
  private
  protected
    function GetAxnMTdt0: TAxnMTdt0;
    procedure SetAxnMTdt0(Value: TAxnMTdt0);
  public
    constructor Create(Value: TAxnMTdt0);

    function DDLAlter: string; override;
    function DDLDrop: string; override;
    function DDLCreate: string;override;


    property AxnMTdt0: TAxnMTdt0 read GetAxnMTdt0 write SetAxnMTdt0;

  end;

  TAxnVMAtr0 = class (TAxnVMDdl, IAxnVMAtr0)
  private

  protected
    function GetAxnMAtr0: TAxnMAtr0;
    procedure SetAxnMAtr0(Value: TAxnMAtr0);
  public
    constructor Create(Value: TAxnMAtr0);
    property AxnMAtr0: TAxnMAtr0 read GetAxnMAtr0 write SetAxnMAtr0;
  end;

  TAxnVMCls0 = class (TAxnVMDdl, IAxnVMCls0)
  private
  protected
    function GetAxnMCls0: TAxnMCls0;
    procedure SetAxnMCls0(Value: TAxnMCls0);
  public
    constructor Create(Value: TAxnMCls0);
    property AxnMCls0: TAxnMCls0 read GetAxnMCls0 write SetAxnMCls0;
  end;

  TAxnVMPkg0 = class (TAxnVMDdl, IAxnVMPkg0)
  private
  protected
    function GetAxnMPkg0: TAxnMPkg0;
    procedure SetAxnMPkg0(Value: TAxnMPkg0);
  public
    constructor Create(Value: TAxnMPkg0);
    property AxnMPkg0: TAxnMPkg0 read GetAxnMPkg0 write SetAxnMPkg0;
  end;

implementation

{ TAxnVMCli0 }

constructor TAxnVMDdl.Create(Value: TAxnMDdl);
begin
  AxnMDdl := Value;
end;

function TAxnVMDdl.GetAxnMDdl: TAxnMDdl;
begin
  Result := TAxnMDdl(FAxnM);
end;

procedure TAxnVMDdl.SetAxnMDdl(Value: TAxnMDdl);
begin
  TAxnMDdl(FAxnM) := Value;
end;

{ TAxnVMTdt0 }

constructor TAxnVMTdt0.Create(Value: TAxnMTdt0);
begin
  AxnMTdt0 := Value;
end;

function TAxnVMTdt0.DDLAlter: string;
begin
  Result := 'Alter Domanin '+Codigo+' as '+Descripcion+';';
end;

function TAxnVMTdt0.DDLCreate: string;
begin
  Result := 'Create Domanin '+Codigo+' as '+Descripcion+';';
end;

function TAxnVMTdt0.DDLDrop: string;
begin
  Result := 'Drop Domanin '+Codigo+';';
end;

function TAxnVMTdt0.GetAxnMTdt0: TAxnMTdt0;
begin
  Result := TAxnMTdt0(FAxnM);
end;

procedure TAxnVMTdt0.SetAxnMTdt0(Value: TAxnMTdt0);
begin
  TAxnMTdt0(FAxnM) := Value;
end;

{ TAxnVMPkg0 }

constructor TAxnVMPkg0.Create(Value: TAxnMPkg0);
begin
  AxnMPkg0 := Value;
end;

function TAxnVMPkg0.GetAxnMPkg0: TAxnMPkg0;
begin
  Result := TAxnMPkg0(FAxnM);
end;

procedure TAxnVMPkg0.SetAxnMPkg0(Value: TAxnMPkg0);
begin
  TAxnMPkg0(FAxnM) := Value;
end;

{ TAxnVMCls0 }

constructor TAxnVMCls0.Create(Value: TAxnMCls0);
begin
  AxnMCls0 := Value;
end;

function TAxnVMCls0.GetAxnMCls0: TAxnMCls0;
begin
  Result := TAxnMCls0(FAxnM);
end;

procedure TAxnVMCls0.SetAxnMCls0(Value: TAxnMCls0);
begin
  TAxnMCls0(FAxnM) := Value;
end;

{ TAxnVMAtr0 }

constructor TAxnVMAtr0.Create(Value: TAxnMAtr0);
begin
  AxnMAtr0 := Value;
end;

function TAxnVMAtr0.GetAxnMAtr0: TAxnMAtr0;
begin
  Result := TAxnMAtr0(FAxnM);
end;

procedure TAxnVMAtr0.SetAxnMAtr0(Value: TAxnMAtr0);
begin
  TAxnMAtr0(FAxnM) := Value;
end;

end.
