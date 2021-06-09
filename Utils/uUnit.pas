unit uUnit;

interface

const
  QuantityNames: array[0..2] of string = ('Масса', 'Длина', 'Время');

type
  TQuantity = (qWeight, qLength, qTime);

  // Defining an interface
  IUnit = interface(IInterface)
    function GetQuantity: TQuantity;
    function GetRatio: double;
    function GetName: string;
    property Quantity: TQuantity read GetQuantity;
    property Ratio: Double read GetRatio;
    property Name: string read GetName;
  end;

  TUnit = class(TInterfacedObject, IUnit)
    function GetQuantity: TQuantity; virtual; abstract;
    function GetRatio: Double; virtual;
    function GetName: string;
  public
    class function Name: string; virtual; abstract;
  end;

implementation

{ TUnit }
function TUnit.GetName: string;
begin
  Result := Name;
end;

function TUnit.GetRatio: Double;
begin
  Result := 1;
end;

end.

