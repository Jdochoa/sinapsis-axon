unit axon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxLabel,
  sinapsis.Axon.view, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid, Data.Bind.GenData,
  System.Bindings.Expression, Vcl.ComCtrls,  Generics.Collections,
  System.Bindings.Helper,
  sinapsis.axn.v.livebinding, Vcl.ExtCtrls
  ;



type

  TPerson = class
  private
    FAge: Integer;
    FLastname: string;
    FFirstname: string;
    FBinding: IAxnBindManager;
    procedure setFirsname(const Value :String);
  public
    constructor Create(const Firstname, Lastname : string; Age : Integer); virtual;
    property Firstname : string read FFirstname write FFirstname;
    property Lastname : string read FLastname write FLastname;
    property Age : Integer read FAge write FAge;
    property Binding: IAxnBindManager read FBinding write FBinding;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    tbZoomy: TTrackBar;
    edtZoomyValue: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbZoomyChange(Sender: TObject);
    procedure edtZoomyValueChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    vCatalogo : IAxnVCatalogo;
    MyPerson : TPerson;
    BindingManager:IAxnBindManager;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  vCatalogo := TAxonVCatalogoVCL.AxonVCatalogoVCL(Self);
  vCatalogo.Parent := Panel1;
end;

procedure TForm1.edtZoomyValueChange(Sender: TObject);
begin
  TBindings.Notify(Sender,'Text');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  sourceObject, controlObject : TAxnBindData;
begin
  MyPerson := TPerson.Create('José', 'Ochoa',12);

  sourceObject.BindObject := MyPerson;
  SourceObject.BindObjectTag := 'MyPerson';
  SourceObject.BindObjectExpression := 'Firstname';

  ControlObject.BindObject := edtZoomyValue;
  ControlObject.BindObjectTag := 'edtZoomyValue';
  ControlObject.BindObjectExpression := 'Text';

//  MyPerson.Bind('Firstname', edtZoomyValue, 'Text');
  BindingManager := TAxnBindExpressionManager.Create;
  MyPerson.Binding := BindingManager;

  MyPerson.Binding.Bind(sourceObject, controlObject);

  ControlObject.BindObject := Label1;
  ControlObject.BindObjectTag := Label1.Name;
  ControlObject.BindObjectExpression := 'Caption';
  MyPerson.Binding.Bind(sourceObject, controlObject);


end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  vCatalogo._Release;
  vCatalogo := nil;
end;

procedure TForm1.tbZoomyChange(Sender: TObject);
begin
  TBindings.Notify(Sender,'Position');
end;

{ TPerson }

constructor TPerson.Create(const Firstname, Lastname: string; Age: Integer);
begin
    FFirstname := Firstname;
    FLastname := Lastname;
    FAge := Age;
    inherited create;
end;

procedure TPerson.setFirsname(const Value: String);
begin
  if Value  <> FFirstname then
  begin
    FFirstname := Value;
    FBinding.Notify('Firstname');
  end;
end;



end.


