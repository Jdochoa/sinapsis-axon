program axn;

uses
  Vcl.Forms,
  System.SysUtils,
  FormSplashU in '..\..\View\sinapsis\FormSplashU.pas' {FormSplash},
  sinapsis.axn.v.vcl.frm.frmBasePrincipal in '..\..\View\vcl\frm\sinapsis.axn.v.vcl.frm.frmBasePrincipal.pas' {frmBasePrincipal},
  sinapsis.axn.v.frmWin32 in '..\..\View\sinapsis\sinapsis.axn.v.frmWin32.pas' {frmMenuPrincipalWin32},
  sinapsis.axn.vm.mdl in '..\..\ViewModel\mdl\sinapsis.axn.vm.mdl.pas',
  sinapsis.axn.vm.sinapsis in '..\..\ViewModel\sinapsis.axn\sinapsis.axn.vm.sinapsis.pas';

{$R *.res}

var
  i:Integer;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  FormSplash := TFormSplash.Create(Application);
  FormSplash.Show;
  FormSplash.Refresh;
  Application.CreateForm(TfrmMenuPrincipalWin32, frmMenuPrincipalWin32);
  for i := 1  to 10 do
  begin
    FormSplash.Mensaje := Format('Número %d',[i]);
    Sleep(1000);
  end;
  FormSplash.Close;
  Application.Run;
end.
