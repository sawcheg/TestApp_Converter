{*******************************************************}
{                                                       }
{       Interface and class for the unit of measure     }
{       of the converter (type Length)                  }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit UnitOfMeasureLength;

interface

uses
  UnitOfMeasure;

type
  TUnitOfMeasureLength = class(TUnitOfMeasure)
    function GetQuantity: TQuantity; override;
  end;
  // according to the SI table, the meter is a standard

  TMeter = class(TUnitOfMeasureLength)
  public
    class function Name: string; override;
  end;

  TKilometer = class(TUnitOfMeasureLength)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

  TInch = class(TUnitOfMeasureLength)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

implementation

{ TUnitOfMeasureLength }

function TUnitOfMeasureLength.GetQuantity: TQuantity;
begin
  Result := TQuantity.qLength;
end;


{ TMeter }
class function TMeter.Name: string;
begin
  Result := 'метр';
end;


{ TKilometer }
function TKilometer.GetRatio: Double;
begin
  Result := 1000;
end;

class function TKilometer.Name: string;
begin
  Result := 'километр';
end;

{ TInch }
function TInch.GetRatio: Double;
begin
  Result := 0.0254;
end;

class function TInch.Name: string;
begin
  Result := 'дюйм';
end;

end.

