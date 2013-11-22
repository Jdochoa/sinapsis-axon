unit sinapsis.axn.common.axnFraction;

interface
uses
  System.SysUtils,
  System.RegularExpressions,
  DelphiDabbler.Lib.Fractions;

type
  TFractionHelper = record  helper for TFraction
  public
    constructor Create(const Value: string); overload;
  end;


implementation

{ TFractionHelper }

constructor TFractionHelper.Create(const Value: string);
var
  RegEx: TRegEx;
  MC : TMatchCollection;
  GC : TGroupCollection;
  Whole, Num, Dem : Int64;
begin
  RegEx := TRegEx.Create('^(?:[ ]*(?<WholeNumber>\d*(?![/\w])){0,1}(?:[ ,\-]){0,1}(?<Fraction>(?<FracNum>\d*)\/(?<FracDem>\d*)){0,1})$');
  if RegEx.IsMatch(Value) then
  begin
    MC := RegEx.Matches(Value);
    Gc:= MC.Item[0].Groups;
    Whole :=  StrToIntDef(GC.Item['WholeNumber'].Value,0);
    Num :=    StrtoIntDef(GC.Item['FracNum'].Value,0);
    Dem :=    StrToIntDef(GC.Item['FracDem'].Value,0);
    Create((Whole*Dem)+Num,Dem);
  end
  else
    Exception.Create('El Número ingresado no es válido');
end;

end.
