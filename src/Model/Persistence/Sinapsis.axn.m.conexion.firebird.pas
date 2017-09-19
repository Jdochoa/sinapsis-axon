unit Sinapsis.axn.m.conexion.firebird;

interface
uses
  // Spring
  Spring.Collections,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Adapters.UIB,
  Spring.Persistence.SQL.Interfaces;

type
  TFBConnection = class(TInterfacedObject, IDBConnection)
  strict private

    fAdapter: IDBConnection;
    function GetAutoFreeConnection: Boolean;
    function GetExecutionListeners: IList<TExecutionListenerProc>;
    function GetQueryLanguage: TQueryLanguage;
    procedure SetAutoFreeConnection(value: Boolean);
    procedure SetQueryLanguage(const value: TQueryLanguage);
  public
    constructor Create;
    procedure Connect;
    procedure Disconnect;

    function IsConnected: Boolean;
    function CreateStatement: IDBStatement;
    function BeginTransaction: IDBTransaction;

    procedure AddExecutionListener(const listenerProc: TExecutionListenerProc);
    procedure ClearExecutionListeners;

    property AutoFreeConnection: Boolean read GetAutoFreeConnection write SetAutoFreeConnection;
    property ExecutionListeners: IList<TExecutionListenerProc> read GetExecutionListeners;
    property QueryLanguage: TQueryLanguage read GetQueryLanguage write SetQueryLanguage;
  end;



implementation

uses
    Spring.Persistence.Core.ConnectionFactory;

procedure TFBConnection.AddExecutionListener(
  const listenerProc: TExecutionListenerProc);
begin
  fAdapter.AddExecutionListener(listenerProc);
end;

function TFBConnection.BeginTransaction: IDBTransaction;
begin
  Result := fAdapter.BeginTransaction;
end;

procedure TFBConnection.ClearExecutionListeners;
begin
  fAdapter.ClearExecutionListeners;
end;

procedure TFBConnection.Connect;
begin
  fAdapter.Connect;
end;

constructor TFBConnection.Create;
begin
  inherited;
  fAdapter := TConnectionFactory.GetInstanceFromFile(dtUIB, 'Conn_Firebird.json');
  fAdapter.AutoFreeConnection := False;
  fAdapter.Connect;

end;

function TFBConnection.CreateStatement: IDBStatement;
begin
  Result := fAdapter.CreateStatement;
end;


procedure TFBConnection.Disconnect;
begin
  fAdapter.Disconnect;
end;

function TFBConnection.GetAutoFreeConnection: Boolean;
begin
  Result := fAdapter.AutoFreeConnection;
end;

function TFBConnection.GetExecutionListeners: IList<TExecutionListenerProc>;
begin
  Result := fAdapter.ExecutionListeners;
end;

function TFBConnection.GetQueryLanguage: TQueryLanguage;
begin
  Result := fAdapter.QueryLanguage;
end;

function TFBConnection.IsConnected: Boolean;
begin
  Result := fAdapter.IsConnected;
end;

procedure TFBConnection.SetAutoFreeConnection(value: Boolean);
begin
  fAdapter.AutoFreeConnection := value;
end;

procedure TFBConnection.SetQueryLanguage(const value: TQueryLanguage);
begin
  fAdapter.QueryLanguage := value;
end;

end.
