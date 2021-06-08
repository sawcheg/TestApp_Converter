unit uUnitTime;

interface

uses
  uTUnit, uUnit;

type
  TUnitTime = class(TUnit)
    function GetQuantity: TQuantity; override;
  end;
  // �������� ������� �� ������� �������� ��������

  TSecond = class(TUnitTime)
  public
    class function Name: string; override;
  end;

  THour = class(TUnitTime)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

  TDay = class(TUnitTime)
    function GetRatio: Double; override;
  public
    class function Name: string; override;
  end;

implementation

{ TUnitTime }

function TUnitTime.GetQuantity: TQuantity;
begin
  Result := TQuantity.qTime;
end;

{ TSecond }

class function TSecond.Name: string;
begin
  Result := '�������';
end;

{ THour }

function THour.GetRatio: Double;
begin
  Result := 3600;
end;

class function THour.Name: string;
begin
  Result := '���';
end;

{ TDay }

function TDay.GetRatio: Double;
begin
  Result := 86400;
end;

class function TDay.Name: string;
begin
  Result := '�����';
end;

end.

