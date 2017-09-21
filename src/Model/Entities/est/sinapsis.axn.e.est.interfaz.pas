unit sinapsis.axn.e.est.interfaz;

interface
uses
  sinapsis.axn.e.ctl.interfaz
  ;

type
  IEEst0 = interface(IAxnECtl)
    ['{A104F8CF-6469-47C6-A1D9-D81FC3CF9921}']
    procedure SetAfecto(const Value : String);
    function GetAfecto:string;
    property Afecto: String read GetAfecto write SetAfecto;
  end;

  IESig = interface
    ['{7CD01D1C-4CA8-464B-9F95-9A5503C8C27E}']
    procedure SetEst0_Id(const Value : Int64);
    procedure SetEst0_Id_Sig(const Value : Int64);
    function GetEst0_Id : Int64;
    function GetEst0_Id_Sig : Int64;

    property Est0_Id: Int64 read GetEst0_Id write SetEst0_Id;
    property Est0_Id_Sig: Int64 read GetEst0_Id_Sig write SetEst0_Id_Sig;
 end;


  IESSS0 = interface
    ['{FA3682D4-C2FF-4FE3-BA82-4A0F7048A8D9}']
    procedure SetEst0_Id(const Value : Int64);
    procedure SetEst0_Id_Equ(const Value : Int64);
    procedure SetSSS0_Id (const Value: Int64);

    function GetEst0_Id : Int64;
    function GetEst0_Id_Equ : Int64;
    function GetSSS0_Id : Int64;

    property Est0_Id: Int64 read GetEst0_Id write SetEst0_Id;
    property Est0_Id_Equ: Int64 read GetEst0_Id_Equ write SetEst0_Id_Equ;
    property SSS0_Id: Int64 read GetSSS0_Id write SetSSS0_Id;
 end;

implementation

end.
