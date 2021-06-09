unit uConverter;

interface

uses
  uUnit, uUnitFactory, System.Generics.Collections, System.SysUtils;

type
  TConverter = class(TObject)
  private
    FCountTypeUnits: Integer;
    function GetCountTypeUnits: Integer;
  public
    // count of available unit types
    property CountTypeUnits: Integer read GetCountTypeUnits;
    // get name of Unit Type by index
    function GetTypeUnitName(index: Integer): string;
    // get units collection for type by index
    function GetUnitsForType(index: Integer): TList<IUnit>;
    // calc
    function ConvertUnitValue(unitFrom, unitTo: IUnit; value: Double = 1): double;
  end;

implementation


{ TConverter }

function TConverter.GetCountTypeUnits: Integer;
begin
  Result := Ord(High(TQuantity)) + 1;
end;

function TConverter.GetTypeUnitName(index: Integer): string;
begin
  Result := QuantityNames[index];
end;

function TConverter.GetUnitsForType(index: Integer): TList<IUnit>;
var
  factory: IUnitFactory;
  res_list: TList<IUnit>;
  item: IUnit;
  i: Integer;
begin
  case index of
    Ord(TQuantity.qWeight):
      factory := TUnitWeightFactory.Create;
    Ord(TQuantity.qLength):
      factory := TUnitLengthFactory.Create;
    Ord(TQuantity.qTime):
      factory := TUnitTimeFactory.Create;
  else
    raise Exception.Create('Не найден порождающий объект для выбранного типа ед.изм.');
  end;

  i := 0;
  res_list := TList<IUnit>.Create;
  while i >= 0 do
  begin
    try
      try
        item := factory.GetUnitItem(i);
      except
        item := nil;
      end;
    finally
      if item <> nil then
      begin
        res_list.Add(item);
        Inc(i);
      end
      else
        i := -1;
    end;
  end;
  Result := res_list;
end;

function TConverter.ConvertUnitValue(unitFrom, unitTo: IUnit; value: Double): double;
begin
  if unitFrom.Quantity <> unitTo.Quantity then
    raise Exception.Create('В конвертер поступили несовместимые типы!');
  Result := value * unitFrom.Ratio / unitTo.Ratio;
end;

end.

