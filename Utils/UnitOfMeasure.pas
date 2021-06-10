{*******************************************************}
{                                                       }
{       Interface and class for the unit of measure     }
{       of the converter                                }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit UnitOfMeasure;

interface

const
  QuantityNames: array[0..2] of string = ('Масса', 'Длина', 'Время');

type
  TQuantity = (qWeight, qLength, qTime);

  // Defining an interface
  IUnitOfMeasure = interface(IInterface)
    function GetQuantity: TQuantity;
    function GetRatio: double;
    function GetName: string;
    property Quantity: TQuantity read GetQuantity;
    property Ratio: Double read GetRatio;
    property Name: string read GetName;
  end;

  TUnitOfMeasure = class(TInterfacedObject, IUnitOfMeasure)
    function GetQuantity: TQuantity; virtual; abstract;
    function GetRatio: Double; virtual;
    function GetName: string;
  public
    class function Name: string; virtual; abstract;
  end;

implementation

{ TUnitOfMeasure }
function TUnitOfMeasure.GetName: string;
begin
  Result := Name;
end;

function TUnitOfMeasure.GetRatio: Double;
begin
  Result := 1;
end;

end.

