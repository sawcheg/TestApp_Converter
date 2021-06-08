unit uUnitFactory;

interface

uses
  uUnit, uUnitWeight, uUnitLength, uUnitTime;

type
  IUnitFactory = interface(IInterface)
    function GetUnitItem(index: integer): IUnit;
  end;

  TUnitLengthFactory = class(TInterfacedObject, IUnitFactory)
    function GetUnitItem(index: integer): IUnit;
  end;

  TUnitWeightFactory = class(TInterfacedObject, IUnitFactory)
    function GetUnitItem(index: integer): IUnit;
  end;

  TUnitTimeFactory = class(TInterfacedObject, IUnitFactory)
    function GetUnitItem(index: integer): IUnit;
  end;

implementation

{ TUnitLengthFactory }

function TUnitLengthFactory.GetUnitItem(index: integer): IUnit;
var
  meter: TMeter;
begin
  case index of
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

{ TUnitWeightFactory }

function TUnitWeightFactory.GetUnitItem(index: integer): IUnit;
begin
  case index of
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

{ TUnitTimeFactory }

function TUnitTimeFactory.GetUnitItem(index: integer): IUnit;
begin
  case index of
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

