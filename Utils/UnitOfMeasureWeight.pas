{*******************************************************}
{                                                       }
{ Interface and class for the unit of measure           }
{ of the converter (type Weight)                        }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit UnitOfMeasureWeight;

interface

uses
  UnitOfMeasure;

type
  TUnitOfMeasureWeight = class(TUnitOfMeasure)
    function GetQuantity: TQuantity; override;
  end;
  // according to the SI table, the kilogram is the standard

  TKilogram = class(TUnitOfMeasureWeight)
  public
    class function Name: string; override;
  end;

  TPound = class(TUnitOfMeasureWeight)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

  TTon = class(TUnitOfMeasureWeight)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

implementation

{ TUnitWeight }

function TUnitOfMeasureWeight.GetQuantity: TQuantity;
begin
  Result := TQuantity.qWeight;
end;

{ TKilogram }
class function TKilogram.Name: string;
begin
  Result := 'килограмм';
end;

{ TPound }

function TPound.GetRatio: Double;
begin
  Result := 0.453592;
end;

class function TPound.Name: string;
begin
  Result := 'фунт';
end;

{ TTon }
function TTon.GetRatio: Double;
begin
  Result := 1000;
end;

class function TTon.Name: string;
begin
  Result := 'тонна';
end;

end.

