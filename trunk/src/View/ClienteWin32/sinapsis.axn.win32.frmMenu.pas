unit sinapsis.axn.win32.frmMenu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellApi,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.AppEvnts,
  Vcl.Menus,
  Vcl.ActnList,
  Vcl.StdActns,
  Vcl.OleCtnrs,
  Generics.Collections,

  sinapsis.axn.win32.BussinesObjects,
  Spring.DesignPatterns,
  Spring.Utils
  ;

type
  TForm1 = class(TForm)
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    acSalida: TAction;
    Action11: TMenuItem;
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acSalidaExecute(Sender: TObject);
  private
    { Private declarations }
    procedure NuevoMenu(Value :TModulo);
    procedure Accion(Sender:TObject);
    procedure ActualizaModulo(Modulo :TModulo);
    procedure ActualizaDependencias(Modulo: TModulo);
    procedure ActualizaArchivo(strOrigen, strDestino, strNombre : string);
    procedure EjecutaArhivo(Value : string);
    procedure SHCopyFile(hWndOwner: HWND; const SourceFile, TargetFile: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

uses  sqlite.win32.axn.sinapsis;

procedure TForm1.FormCreate(Sender: TObject);
var
  Modulo : TModulo;
begin
  for Modulo in TSingleton.GetInstance<TSQLite>.Modulos do
    if Modulo.Ejecutale = 1 then
      NuevoMenu(Modulo);
end;

procedure TForm1.NuevoMenu(Value: TModulo);
Var
  Ac : TAction;
  it : TMenuItem;
begin
  Ac := TAction.Create(ActionList1);
  Ac.Caption := Value.Descripcion;
  Ac.Hint := Value.Codigo;
  Ac.Tag  := Value.Id;
  Ac.ActionList := ActionList1;
  Ac.OnExecute := Accion;
  it := TMenuItem.Create(PopupMenu1);
  it.Action := AC;
  PopupMenu1.Items.Add(It);
end;


procedure TForm1.SHCopyFile(hWndOwner: HWND; const SourceFile,
  TargetFile: string);
var
  Info: TSHFileOpStruct;
  Aborted : Boolean;
begin
  Aborted := False;
  with Info do
  begin
    Wnd := hWndOwner;
    wFunc := FO_COPY;
    pFrom := pChar(SourceFile);
    pTo := pChar(TargetFile);
    fFlags := FOF_NO_UI;
    fAnyOperationsAborted := Aborted;
  end;
  try
    SHFileOperation(Info);
  finally
    if Aborted then; { enact upon any user cancellations }
  end;

end;

procedure TForm1.Accion(Sender: TObject);
Var
  Modulo :TModulo;
begin
  if Sender is TAction then
  begin
    Modulo := TSingleton.GetInstance<TSQLite>.Modulo[TAction(Sender).Hint];
    ActualizaModulo(Modulo);
    EjecutaArhivo(Modulo.Nombre);
  end;
end;

procedure TForm1.acSalidaExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ActualizaArchivo(strOrigen, strDestino, strNombre: string);
Var
  fvOrigen : TFileVersionInfo;
  fvDestino: TFileVersionInfo;
begin
  strOrigen := strOrigen + '\' + strNombre;
  if FileExists(strOrigen) then
    fvOrigen := TFileVersionInfo.GetVersionInfo(strOrigen)
  else
    raise Exception.Create('Existe el origen de los documentos');
  if not DirectoryExists(strDestino) then
  begin
    if FileExists(strDestino) then
    begin
      fvDestino := TFileVersionInfo.GetVersionInfo(strDestino);
      if fvDestino.ToString <> fvOrigen.ToString then
        SHCopyFile(Application.Handle, strOrigen, strDestino)
    end
    else
      SHCopyFile(Application.Handle, strOrigen, strDestino)
  end;
end;

procedure TForm1.ActualizaDependencias(Modulo: TModulo);
var
  Dependencia :TDependencia;
begin
  for Dependencia  in TSingleton.GetInstance<TSQLite>.Dependencias[Modulo] do
    ActualizaModulo(TSingleton.GetInstance<TSQLite>.Mod0(Dependencia.Mod0_Id_Dep0));
end;

procedure TForm1.ActualizaModulo(Modulo: TModulo);
var
  ModUbic: TModUbic;
  strDestino : string;
  strOrigen  : string;
begin
  for ModUbic in TSingleton.GetInstance<TSQLite>.UbicacionModulo[Modulo] do
  begin
    if ModUbic.Tipo = 'Destino' then
      strDestino := TSingleton.GetInstance<TSQLite>.Ubicacion[ModUbic.Ubi0_Id].Descripcion;
    if ModUbic.Tipo = 'Origen' then
      strOrigen := TSingleton.GetInstance<TSQLite>.Ubicacion[ModUbic.Ubi0_Id].Descripcion;
  end;
  ActualizaArchivo(strOrigen, strDestino,Modulo.Nombre);
  ActualizaDependencias(Modulo);
end;

procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin
  Hide();
  WindowState := wsMinimized;
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := true;
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.EjecutaArhivo(Value: string);
begin
  case shellexecute(0,'open',pchar(Value),pchar(''),pchar(Extractfilepath(Value)),0) of
    ERROR_FILE_NOT_FOUND	  : raise exception.create('El archivo especificado no existe');
    ERROR_PATH_NOT_FOUND	  : raise exception.create('El path del archivo no existe');
    ERROR_BAD_FORMAT	      : raise exception.create('El formato del archivo es invalido');
    SE_ERR_ACCESSDENIED	    : raise exception.create('Acceso Denegado');
    SE_ERR_ASSOCINCOMPLETE	: raise exception.create('La asociacion del archivo es incompleta o invalida');
    SE_ERR_DDEBUSY	        : raise exception.create('La transaccion no fue ejecutada porque hay otras transacciones DDE procesandose');
    SE_ERR_DDEFAIL	        : raise exception.create('Error en Transaccion');
    SE_ERR_DDETIMEOUT	      : raise exception.create('La transaccion DDE no fue completada porque se agoto el tiempo de espera');
    SE_ERR_DLLNOTFOUND	    : raise exception.create('La libreria dinamica especificada no existe');
    SE_ERR_NOASSOC	        : raise exception.create('No hay ninguna transaccion asociada con el archivo');
    SE_ERR_OOM	            : raise exception.create('No hay memoria suficiente para ejecutar el archivo');
    SE_ERR_SHARE	          : raise exception.create('Error al compartir informacion');
  end;
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
//  TrayIcon1.Visible := False;
//  Show();
//  WindowState := wsNormal;
//  Application.BringToFront();
end;

end.
