unit sinapsis.axn.v.livebinding;

interface
uses
  System.Bindings.Expression,
  System.Bindings.Helper,

  Generics.Collections;


type
  TAxnBindData = record
      BindObject : TObject;
      BindObjectTag : String;
      BindObjectExpression : String;
   end;

  IAxnBindManager = Interface
  ['{E4F113BB-AEDF-4BB2-8349-AD333A4D6F9F}']
    procedure Notify(const APropertyName: string = '');
    procedure Bind(const AProperty: string; const ABindToObject: TObject;
        const ABindToProperty: string; const ACreateOptions:
        TBindings.TCreateOptions = [coNotifyOutput, coEvaluate]); overload;
    procedure Bind(const Source : TAxnBindData; const Control : TAxnBindData;
        const ACreateOptions:
        TBindings.TCreateOptions = [coNotifyOutput, coEvaluate]); overload;
  End;



  TAxnBindExpressionManager = class(TInterfacedObject,IAxnBindManager)
  protected
    type
      TExpressionList = TObjectList<TBindingExpression>;
  private
    FBindings: TExpressionList;
  protected
    procedure Notify(const APropertyName: string = '');
    property Bindings: TExpressionList read FBindings;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Bind(const AProperty: string; const ABindToObject: TObject;
        const ABindToProperty: string; const ACreateOptions:
        TBindings.TCreateOptions = [coNotifyOutput, coEvaluate]); overload;
    procedure Bind(const Source : TAxnBindData; const Control : TAxnBindData;
        const ACreateOptions:
        TBindings.TCreateOptions = [coNotifyOutput, coEvaluate]); overload;

    procedure ClearBindings;
  end;



implementation

{ TAxnBindExpressionManager }

procedure TAxnBindExpressionManager.Bind(const AProperty: string;
  const ABindToObject: TObject; const ABindToProperty: string;
  const ACreateOptions: TBindings.TCreateOptions);
begin
  FBindings.Add(TBindings.CreateManagedBinding(
      { inputs }
      [TBindings.CreateAssociationScope([Associate(Self, 'src')])],
      'src.' + AProperty,
      { outputs }
      [TBindings.CreateAssociationScope([Associate(ABindToObject, 'dst')])],
      'dst.' + ABindToProperty,
      nil, nil, ACreateOptions));
  // From dest to source
  FBindings.Add(TBindings.CreateManagedBinding(
      { inputs }
      [TBindings.CreateAssociationScope([Associate(ABindToObject, 'src')])],
      'src.' + ABindToProperty,
      { outputs }
      [TBindings.CreateAssociationScope([Associate(Self, 'dst')])],
      'dst.' + AProperty,
      nil, nil, ACreateOptions));
end;

procedure TAxnBindExpressionManager.Bind(const Source, Control: TAxnBindData;
  const ACreateOptions: TBindings.TCreateOptions);
begin
  FBindings.Add(TBindings.CreateManagedBinding(
      { inputs }
      [TBindings.CreateAssociationScope([Associate(Source.BindObject, Source.BindObjectTag)])],
      Source.BindObjectTag+'.' + Source.BindObjectExpression,
      { outputs }
      [TBindings.CreateAssociationScope([Associate(Control.BindObject, Control.BindObjectTag)])],
      Control.BindObjectTag+'.' + Control.BindObjectExpression,
      nil, nil, ACreateOptions));
  // From dest to source
  FBindings.Add(TBindings.CreateManagedBinding(
      { inputs }
      [TBindings.CreateAssociationScope([Associate(Control.BindObject, Control.BindObjectTag)])],
      Control.BindObjectTag+'.' + Control.BindObjectExpression,
      { outputs }
      [TBindings.CreateAssociationScope([Associate(Source.BindObject, Source.BindObjectTag)])],
      Source.BindObjectTag+'.' + Source.BindObjectExpression,
      nil, nil, ACreateOptions));

end;

procedure TAxnBindExpressionManager.ClearBindings;
var
  i: TBindingExpression;
begin
  for i in FBindings do
    TBindings.RemoveBinding(i);
  FBindings.Clear;
end;

constructor TAxnBindExpressionManager.Create;
begin
  inherited;
  FBindings := TExpressionList.Create(false);
end;

destructor TAxnBindExpressionManager.Destroy;
begin
  ClearBindings;
  FBindings.Free;
  inherited;
end;

procedure TAxnBindExpressionManager.Notify(const APropertyName: string);
begin
  TBindings.Notify(Self, APropertyName);
end;

end.
