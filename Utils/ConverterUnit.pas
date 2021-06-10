{*******************************************************}
{                                                       }
{       Basic logic of the Converter                    }
{                                                       }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit ConverterUnit;

interface

uses
  UnitOfMeasure, FactoryUnitOfMeasure, System.Generics.Collections, System.SysUtils;

type
  TConverter = class(TObject)
  private
    function GetCountTypeUnits: Integer;
  public
    // get name of Unit Type by index
    function GetTypeUnitName(Index: Integer): string;
    // get units collection for type by index
    function GetUnitsForType(Index: Integer): TList<IUnitOfMeasure>;
    // calc
    function ConvertUnitValue(UnitFrom, UnitTo: IUnitOfMeasure; Value: Double = 1): Double;
    // count of available unit types
    property CountTypeUnits: Integer read GetCountTypeUnits;
  end;

implementation

{ TConverter }
function TConverter.GetCountTypeUnits: Integer;
begin
  Result := Ord(High(TQuantity)) + 1;
end;

function TConverter.GetTypeUnitName(Index: Integer): string;
begin
  Result := QuantityNames[Index];
end;

function TConverter.GetUnitsForType(Index: Integer): TList<IUnitOfMeasure>;
var
  Factory: IFactoryUnitOfMeasure;
  ResultList: TList<IUnitOfMeasure>;
  Item: IUnitOfMeasure;
  i: Integer;
begin
  case index of
    Ord(TQuantity.qWeight):
      Factory := TFactoryUnitOfWeight.Create;
    Ord(TQuantity.qLength):
      Factory := TFactoryUnitOfLength.Create;
    Ord(TQuantity.qTime):
      Factory := TFactoryUnitOfTime.Create;
  else
    raise Exception.Create('Не найден порождающий объект для выбранного типа ед.изм.');
  end;

  i := 0;
  ResultList := TList<IUnitOfMeasure>.Create;
  while i >= 0 do
  begin
    try
      try
        Item := Factory.GetUnitItem(i);
      except
        Item := nil;
      end;
    finally
      if Item <> nil then
      begin
        ResultList.Add(Item);
        Inc(i);
      end
      else
        i := -1;
    end;
  end;
  Result := ResultList;
end;

function TConverter.ConvertUnitValue(UnitFrom, UnitTo: IUnitOfMeasure; Value: Double): Double;
begin
  if UnitFrom.Quantity <> UnitTo.Quantity then
    raise Exception.Create('В конвертер поступили несовместимые типы!');
  Result := Value * UnitFrom.Ratio / UnitTo.Ratio;
end;

end.

