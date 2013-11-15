program sinapsis.axon;

uses
  Vcl.Forms,
  dorm.loggers.FileLog,
  sinapsis.axn.win32.frmMenu in '..\..\view\sinapsis.axn\sinapsis.axn.win32.frmMenu.pas' {Form1},
  sinapsis.axn.m.mdl in '..\..\Model\mdl\sinapsis.axn.m.mdl.pas',
  sinapsis.axn.common.axnFile in '..\..\common\sinapsis.axn.common.axnFile.pas',
  sinapsis.axn.vm.mdl in '..\..\ViewModel\mdl\sinapsis.axn.vm.mdl.pas',
  sinapsis.axn.m in '..\..\Model\axn\sinapsis.axn.m.pas',
  sinapsis.axn.common.clases in '..\..\Common\sinapsis.axn.common.clases.pas',
  sinapsis.axn.m.interfaz in '..\..\Model\axn\sinapsis.axn.m.interfaz.pas',
  sinapsis.axn.m.catalogo in '..\..\Model\axn\sinapsis.axn.m.catalogo.pas',
  sinapsis.axn.vm.interfaz in '..\..\ViewModel\axn\sinapsis.axn.vm.interfaz.pas',
  sinapsis.axn.vm in '..\..\ViewModel\axn\sinapsis.axn.vm.pas',
  sinapsis.axn.vm.Catalogo in '..\..\ViewModel\axn\sinapsis.axn.vm.Catalogo.pas',
  sinapsis.axn.vm.sinapsis in '..\..\ViewModel\sinapsis.axn\sinapsis.axn.vm.sinapsis.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
