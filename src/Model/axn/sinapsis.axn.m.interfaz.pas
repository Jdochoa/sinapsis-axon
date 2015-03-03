unit sinapsis.axn.m.interfaz;

interface
//uses
//  Spring.Collections
//  ;

type

  IAxnM = Interface
    ['{8F8D6CA2-E11F-4DB1-9AF4-31C21E17519F}']
    function getId():Integer;
    function getCreatedBy():Integer;
    function getCreatedAt():TDateTime;
    function getModifiedBy():Integer;
    function getModifiedAt():TDateTime;
    procedure setId(Value:Integer);
    procedure setCreatedBy(Value :Integer);
    procedure setCreatedAt(Value :TDateTime);
    procedure setModifiedBy(Value :Integer);
    procedure setModifiedAt(Value :TDateTime);

    property Id:Integer read getId write setId;
    property CreatedBy:Integer read getCreatedBy write setCreatedBy;
    property CreatedAt:TDateTime read getCreatedAt write setCreatedAt ;
    property ModifiedBy:Integer read getModifiedBy write setModifiedBy;
    property ModifiedAt:TDateTime read getModifiedAt write setModifiedAt;
  end;

//  IAxnMList<I : IAxnM> = interface
//    ['{EB39FDB4-675C-45DA-83FE-D9CB63E935F0}']
////    procedure SetLista(Value : IList<I>);
////    function GetLista : IList<I>;
////    property Lista: IList<I> read GetLista write SetLista;
//  end;




implementation

end.
