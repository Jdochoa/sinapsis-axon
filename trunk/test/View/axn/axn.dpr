program axn;

uses
  Vcl.Forms,
  axon in 'axon.pas' {Form1},
  sinapsis.axon.view in '..\..\..\src\View\axn\sinapsis.axon.view.pas',
  sinapsis.axon.m in '..\..\..\src\Model\axn\sinapsis.axon.m.pas',
  sinapsis.axn.v.livebinding in '..\..\..\src\View\common\sinapsis.axn.v.livebinding.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
