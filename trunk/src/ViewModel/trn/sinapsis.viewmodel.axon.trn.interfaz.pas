Unit sinapsis.viewmodel.axon.trn.interfaz;


interface

uses 
	sinapsis.ViewModel.axon.interfaz
type
    TFormaAfecta = ();
	
	IVMTransaccion = interface(IVMAxonCatalogo)
		function getColor:integer;
		procedure setColor(aValue:Integer);
		
		property Color : integer: read getColor write setColor;
		property FormaAfecta: TFormaAfecta : read getFormaAfecta write setFormaAfecta;
		property Doble: boolean : read getDoble write setDoble;
		
	end;
 
    IVMTransaccionList = Interface (IVMAxonList<IVMTransaccion>)
	end;
 
implementation
 
 end

