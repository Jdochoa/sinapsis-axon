program fmConsulta;

uses
  FMX.Forms,
  ufrmPruebas in 'ufrmPruebas.pas' {Form2},
  ufrmConsulta in 'ufrmConsulta.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  //Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
