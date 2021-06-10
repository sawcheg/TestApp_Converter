{*******************************************************}
{                                                       }
{       Interface and class for the unit of measure     }
{       of the converter (type Time)                    }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit UnitOfMeasureTime;

interface

uses
  UnitOfMeasure;

type
  TUnitOfMeasureTime = class(TUnitOfMeasure)
    function GetQuantity: TQuantity; override;
  end;
  // according to the SI table, the second is the standard

  TSecond = class(TUnitOfMeasureTime)
  public
    class function Name: string; override;
  end;

  THour = class(TUnitOfMeasureTime)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

  TDay = class(TUnitOfMeasureTime)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

implementation

{ TUnitOfMeasureTime }

function TUnitOfMeasureTime.GetQuantity: TQuantity;
begin
  Result := TQuantity.qTime;
end;

{ TSecond }

class function TSecond.Name: string;
begin
  Result := 'секунда';
end;

{ THour }

function THour.GetRatio: Double;
begin
  Result := 3600;
end;

class function THour.Name: string;
begin
  Result := 'час';
end;

{ TDay }

function TDay.GetRatio: Double;
begin
  Result := 86400;
end;

class function TDay.Name: string;
begin
  Result := 'сутки';
end;

end.

