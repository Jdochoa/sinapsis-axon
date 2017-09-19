program axn;

uses
  Vcl.Forms,
  Winapi.Windows,
//  sinapsis.axn.v.men.frmMenu in 'sinapsis.axn.v.men.frmMenu.pas' {frmMenu},
//  sinapsis.axn.v.men.LoadForm in 'sinapsis.axn.v.men.LoadForm.pas',
  sinapsis.axn.v.frmsplash in '..\..\sinapsis\sinapsis.axn.v.frmsplash.pas' {frmSplash};

//  sinapsis.axn.vm.mdl in '..\..\..\ViewModel\mdl\sinapsis.axn.vm.mdl.pas',
//  sinapsis.axn.m.mdl in '..\..\..\Model\mdl\sinapsis.axn.m.mdl.pas',
//  sinapsis.axn.common.axnFile in '..\..\..\Common\sinapsis.axn.common.axnFile.pas',
//  sinapsis.axn.m.catalogo in '..\..\..\Model\axn\sinapsis.axn.m.catalogo.pas',
//  sinapsis.axn.m in '..\..\..\Model\axn\sinapsis.axn.m.pas',
//  sinapsis.axn.common.clases in '..\..\..\Common\sinapsis.axn.common.clases.pas',
//  sinapsis.axn.m.interfaz in '..\..\..\Model\axn\sinapsis.axn.m.interfaz.pas',
//  sinapsis.axn.vm.interfaz in '..\..\..\ViewModel\axn\sinapsis.axn.vm.interfaz.pas',
//  sinapsis.axn.vm in '..\..\..\ViewModel\axn\sinapsis.axn.vm.pas',
//  sinapsis.axn.vm.Catalogo in '..\..\..\ViewModel\axn\sinapsis.axn.vm.Catalogo.pas',
//  sinapsis.axn.m.men in '..\..\..\Model\men\sinapsis.axn.m.men.pas',
//  sinapsis.axn.vm.men in '..\..\..\ViewModel\men\sinapsis.axn.vm.men.pas',
//  sinapsis.axn.m.men.interfaz in '..\..\..\Model\men\sinapsis.axn.m.men.interfaz.pas',
//  sinapsis.axn.vm.ViewModel in '..\..\..\ViewModel\axn\sinapsis.axn.vm.ViewModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
//  Application.CreateForm(TfrmMenu, frmMenu);
//  Application.CreateForm(TfrmSplash, frmSplash);
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.ShowModal;
//  frmSplash.Close;
  Application.ShowMainForm := True;
  Application.Run;
end.
