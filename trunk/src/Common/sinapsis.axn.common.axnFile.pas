unit sinapsis.axn.common.axnFile;

interface

uses
  Winapi.Windows,
  Winapi.ShellApi,
  Winapi.ActiveX,
  Winapi.ShlObj,

  System.Win.ComObj,
  System.SysUtils,
  System.IOUtils,

  Vcl.Forms,

  Spring.DesignPatterns,
  Spring.Utils;


type
  TFileSystemBindData = class (TInterfacedObject, IFileSystemBindData)
  private
    fw32fd: TWin32FindData;
  public
    function SetFindData(var w32fd: TWin32FindData): HRESULT; stdcall;
    function GetFindData(var w32fd: TWin32FindData): HRESULT; stdcall;
  end;

  TAxnFile = class
  private
    FNombre  :string;
    FUbicacion : string;
    function Path(Value:String):string;
    function CopyFileSHFileOperation(const srcFile: String):Boolean;
    function CopyFileIFileOperation(const srcFile: String):Boolean;
    function CopyFileIFileOperationForceDirectory(const srcFile: String):Boolean;
    function GetNombre: string;
    procedure SetNombre(const Value: string);
    function GetUbicacion: string;
    procedure SetUbicacion(const Value: string);
  protected
  public
    constructor Create(strUbicacion, strNombre : string);
    function AsString:string;
    procedure EjecutaArhivo();
    procedure ActualizaArchivo(strOrigen: string);
    property Nombre: string read GetNombre write SetNombre;
    property Ubicacion: string read GetUbicacion write SetUbicacion;
  end;

implementation

{ TFileSystemBindData }

function TFileSystemBindData.GetFindData(var w32fd: TWin32FindData): HRESULT;
begin
  w32fd:= fw32fd;
  Result := S_OK;
end;

function TFileSystemBindData.SetFindData(var w32fd: TWin32FindData): HRESULT;
begin
  fw32fd := w32fd;
  Result := S_OK;
end;

{ TAxnFile }

procedure TAxnFile.ActualizaArchivo(strOrigen: string);
Var
  fvOrigen : TFileVersionInfo;
  fvDestino: TFileVersionInfo;
  strDestino : string;
begin
  strOrigen := strOrigen + '\' + Nombre;
  strDestino := AsString;
  if FileExists(strOrigen) then
    fvOrigen := TFileVersionInfo.GetVersionInfo(strOrigen)
  else
    raise Exception.Create('Existe el origen de los documentos');
//  if DirectoryExists(strDestino) then
  begin
    if FileExists(strDestino) then
    begin
      fvDestino := TFileVersionInfo.GetVersionInfo(strDestino);
      if fvDestino.ToString <> fvOrigen.ToString then
         CopyFileIFileOperation(strOrigen)
//        CopyFileSHFileOperation(strOrigen)
    end
    else
      CopyFileIFileOperationForceDirectory(strOrigen)
  end;
//      CopyFileSHFileOperation(strOrigen)
//  end;
end;


function TAxnFile.AsString: string;
begin
  Result := Ubicacion +'\'+Nombre;
end;

function TAxnFile.CopyFileIFileOperation(const srcFile: String): Boolean;
var
  r : HRESULT;
  fileOp: IFileOperation;
  siSrcFile: IShellItem;
  siDestFolder: IShellItem;
  destFileFolder, destFileName : string;
begin
 result := false;
 destFileFolder := Ubicacion;
 destFileName := Nombre;
  //init com
 r := CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE);
 if Succeeded(r) then
 begin
    //create IFileOperation interface
    r := CoCreateInstance(CLSID_FileOperation, nil, CLSCTX_ALL, IFileOperation, fileOp);
    if Succeeded(r) then
    begin
      //set operations flags
      r := fileOp.SetOperationFlags(FOF_NO_UI OR FOF_NOCONFIRMATION OR FOFX_NOMINIMIZEBOX);
      if Succeeded(r) then
      begin
        //get source shell item
        r := SHCreateItemFromParsingName(PChar(srcFile), nil, IShellItem, siSrcFile);
        if Succeeded(r) then
        begin
          //get destination folder shell item
          r := SHCreateItemFromParsingName(PChar(destFileFolder), nil, IShellItem, siDestFolder);
          //add copy operation
          if Succeeded(r) then
            r := fileOp.CopyItem(siSrcFile, siDestFolder, PChar(destFileName), nil);
        end;
      //execute
        if Succeeded(r) then
          r := fileOp.PerformOperations;
        result := Succeeded(r);
        OleCheck(r);
      end;
    end;
  CoUninitialize;
 end;
end;

function TAxnFile.CopyFileIFileOperationForceDirectory(const srcFile: String): Boolean;
var
  r : HRESULT;
  fileOp: IFileOperation;
  siSrcFile: IShellItem;
  siDestFolder: IShellItem;
  destFileFolder, destFileName : string;
  pbc : IBindCtx;
  w32fd : TWin32FindData;
  ifs : TFileSystemBindData;
begin
  result := false;

  destFileFolder := Ubicacion;
  destFileName := Nombre;
  //init com
  r := CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE);
  if Succeeded(r) then
  begin
    //create IFileOperation interface
    r := CoCreateInstance(CLSID_FileOperation, nil, CLSCTX_ALL, IFileOperation, fileOp);
    if Succeeded(r) then
    begin
      //set operations flags
      r := fileOp.SetOperationFlags(FOF_NO_UI or FOF_NOCONFIRMATION OR FOFX_NOMINIMIZEBOX);
      if Succeeded(r) then
      begin
        //get source shell item
        r := SHCreateItemFromParsingName(PChar(srcFile), nil, IShellItem, siSrcFile);
        if Succeeded(r) then
        begin
          //create binding context to pretend there is a folder there
          if NOT DirectoryExists(destFileFolder) then
          begin
            ZeroMemory(@w32fd, Sizeof(TWin32FindData));
            w32fd.dwFileAttributes := FILE_ATTRIBUTE_DIRECTORY;
            ifs := TFileSystemBindData.Create;
            ifs.SetFindData(w32fd);
            r := CreateBindCtx(0, pbc);
            r := pbc.RegisterObjectParam(STR_FILE_SYS_BIND_DATA, ifs);
          end
          else
            pbc := nil;
          //get destination folder shell item
          r := SHCreateItemFromParsingName(PChar(destFileFolder), pbc, IShellItem, siDestFolder);
          //add copy operation
          if Succeeded(r) then
            r := fileOp.CopyItem(siSrcFile, siDestFolder, PChar(destFileName), nil);
        end;

        //execute
        if Succeeded(r) then
          r := fileOp.PerformOperations;

        result := Succeeded(r);

        OleCheck(r);
      end;
    end;

    CoUninitialize;
  end;
end;

function TAxnFile.CopyFileSHFileOperation(const srcFile: String): Boolean;
var
  shFOS : TShFileOpStruct;
begin
 ZeroMemory(@shFOS, SizeOf(TShFileOpStruct));

  shFOS.Wnd := Application.MainForm.Handle;

  shFOS.wFunc := FO_COPY;

  shFOS.pFrom := PChar(srcFile + #0);
  shFOS.pTo := PChar(AsString + #0);

  //Do not ask the user to confirm the creation of a
  //new directory if the operation requires one to be created.
  shFOS.fFlags := FOF_NO_UI;//FOF_NOCONFIRMMKDIR;

  result := SHFileOperation(shFOS) = 0;
end;

constructor TAxnFile.Create(strUbicacion, strNombre: string);
begin
  Nombre := strNombre;
  Ubicacion := strUbicacion;
end;

procedure TAxnFile.EjecutaArhivo();
begin
  case shellexecute(0,'open',pchar(AsString),pchar(''),pchar(Extractfilepath(AsString)),0) of
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

function TAxnFile.GetUbicacion: string;
begin
  Result := FUbicacion;
end;

function TAxnFile.GetNombre: string;
begin
  Result := FNombre;
end;

function TAxnFile.Path(Value: String): string;
var
  temp : TArray<string>;
  c : char;
  Folder: TSpecialFolder;
begin
  if Value.Contains('%') then
  begin
    c := '%';
    temp:= Value.Split(C);
    if temp[1].Equals('ProgramFiles') then
      Folder := sfProgramFiles
    else
    if temp[1].Equals('SystemRoot') then
      Folder := sfWindows;
    Result := Environment.GetFolderPath(Folder);
    if Length(Temp) >= 3 then
      Result := Result + temp[2]
  end
  else
    Result := Value;
end;

procedure TAxnFile.SetUbicacion(const Value: string);
begin
  FUbicacion := Path(Value);
end;

procedure TAxnFile.SetNombre(const Value: string);
begin
  FNombre := Value;
end;


end.
