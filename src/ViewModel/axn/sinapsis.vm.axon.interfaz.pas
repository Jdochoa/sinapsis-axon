unit sinapsis.vm.axon.interfaz;


interface

type

	IVMAxon = interface
	// CRUD Create; Read; Update; Delete
		function Update:Integer;
		function Delete:Boolean;
		function Read(Id:Integer):Boolean;

		function Editar:Boolean;
		function Cancelar:Boolean;

    function Save:Boolean;

		function getId : Integer;
		procedure setId (const Value : Integer);
    function getIsEdited:Boolean;
    function getIsNew:Boolean;
    function getIsDeleted:Boolean;

		property Id : Integer read getId write setId;
    property IsEdited:boolean read getisEdited;
    property IsNew:Boolean read getisNew;
    property IsDeteled :Boolean read getisDeleted;
   
	end;

	IVMAxonList<T: IVMAxon> = Interface
	// CRUD Create; Read; Update; Delete
		function Update:Integer;
		function Delete:Boolean;
		function Create:Boolean;
		function Read:Boolean;
   
		function Editar:Boolean;
		function Cancelar:Boolean;
	end;
 
 
	IVMAxonCatalogo = interface(IVMAxon)
		function Read(Codigo:String):Boolean;

		function getCodigo : string;	
		procedure setCodigo (const Value : String);

		function getDescripcion : string;	
		procedure setDescripcion (const Value : String);
 
		property Codigo : string read getCodigo write setCodigo;
		property Descripcion : string read getDescripcion write setDescripcion;
   
	end;
  
	
  
	IVMAxonMovimiento = interface(IVMAxon)
	end;
  
	IViewModelAxonDetalle = Interface(IVMAxon)
	end;
 
implementation

end.
