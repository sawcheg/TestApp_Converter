{*******************************************************}
{                                                       }
{       Factory for unit of measure                     }
{                                                       }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit FactoryUnitOfMeasure;

interface

uses
  UnitOfMeasure, UnitOfMeasureWeight, UnitOfMeasureLength, UnitOfMeasureTime;

type
  IFactoryUnitOfMeasure = interface(IInterface)
    function GetUnitItem(index: Integer): IUnitOfMeasure;
  end;

  TFactoryUnitOfLength = class(TInterfacedObject, IFactoryUnitOfMeasure)
    function GetUnitItem(Index: Integer): IUnitOfMeasure;
  end;

  TFactoryUnitOfWeight = class(TInterfacedObject, IFactoryUnitOfMeasure)
    function GetUnitItem(Index: Integer): IUnitOfMeasure;
  end;

  TFactoryUnitOfTime = class(TInterfacedObject, IFactoryUnitOfMeasure)
    function GetUnitItem(Index: Integer): IUnitOfMeasure;
  end;

implementation

{ TFactoryUnitOfLength }

function TFactoryUnitOfLength.GetUnitItem(Index: Integer): IUnitOfMeasure;
begin
  case Index of
    0:
      Result := TMeter.Create;
    1:
      Result := TKilometer.Create;
    2:
      Result := TInch.Create;
  else
    Result := nil;
  end;
end;

{ TFactoryUnitOfWeight }

function TFactoryUnitOfWeight.GetUnitItem(Index: Integer): IUnitOfMeasure;
begin
  case Index of
    0:
      Result := TKilogram.Create;
    1:
      Result := TPound.Create;
    2:
      Result := TTon.Create;
  else
    Result := nil;
  end;
end;

{ TFactoryUnitOfTime }

function TFactoryUnitOfTime.GetUnitItem(Index: Integer): IUnitOfMeasure;
begin
  case Index of
    0:
      Result := TSecond.Create;
    1:
      Result := THour.Create;
    2:
      Result := TDay.Create;
  else
    Result := nil;
  end;
end;

end.

