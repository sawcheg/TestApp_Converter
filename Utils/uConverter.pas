unit uConverter;

interface
uses
  uUnit, uUnitFactory, System.Generics.Collections;

type
  TConverter = class(TObject)
  private
    list_units: TList<IUnit>;
    procedure AddAllUnitsFromFactory(factory: IUnitFactory);
  public
    constructor Create; overload;
    function ShowItem: string;
  end;

implementation


{ TConverter }

procedure TConverter.AddAllUnitsFromFactory(factory: IUnitFactory);
var
  item: IUnit;
  index: Integer;
begin
  index := 0;
  while index >= 0 do
  begin
    try
      try
        item := factory.GetUnitItem(index);
      except
        item := nil;
      end;
    finally
      if item <> nil then
      begin
        list_units.Add(item);
        Inc(index);
      end
      else
        index := -1;
    end;
  end;
end;

constructor TConverter.Create;
begin
  inherited;
  //наполнение набором всех доступных вариантов единиц измерения
  list_units := TList<IUnit>.create;
  AddAllUnitsFromFactory(TUnitLengthFactory.create);
  AddAllUnitsFromFactory(TUnitWeightFactory.create);
  AddAllUnitsFromFactory(TUnitTimeFactory.create);
end;


function TConverter.ShowItem: string;
var
  item: IUnit;
begin
  Result := '';
  for item in list_units do
    Result := Result + ',' + item.Name;
end;

end.
