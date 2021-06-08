unit uUnitWeight;

interface

uses
  uUnit;

type
  TUnitWeight = class(TUnit)
    function GetQuantity: TQuantity; override;
  end;
  // согласно таблице СИ килограмм является эталоном

  TKilogram = class(TUnitWeight)
  public
    class function Name: string; override;
  end;

  TPound = class(TUnitWeight)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

  TTon = class(TUnitWeight)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

implementation

{ TUnitWeight }

function TUnitWeight.GetQuantity: TQuantity;
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

