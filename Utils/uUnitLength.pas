unit uUnitLength;

interface

uses
  uUnit;

type
  TUnitLength = class(TUnit)
    function GetQuantity: TQuantity; override;
  end;
  // согласно таблице СИ метр является эталоном

  TMeter = class(TUnitLength)
  public
    class function Name: string; override;
  end;

  TKilometer = class(TUnitLength)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

  TInch = class(TUnitLength)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

implementation

{ TUnitLength }

function TUnitLength.GetQuantity: TQuantity;
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

