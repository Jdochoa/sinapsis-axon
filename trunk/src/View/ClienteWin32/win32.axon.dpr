program win32.axon;

uses
  Vcl.Forms,
  dorm.loggers.FileLog,
  sinapsis.axn.win32.frmMenu in 'sinapsis.axn.win32.frmMenu.pas' {Form1},
  sinapsis.axn.win32.BussinesObjects in 'sinapsis.axn.win32.BussinesObjects.pas',
  sqlite.win32.axn.sinapsis in 'sqlite.win32.axn.sinapsis.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
