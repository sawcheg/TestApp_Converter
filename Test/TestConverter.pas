{*******************************************************}
{                                                       }
{       Factory for unit of measure                     }
{                                                       }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit TestConverter;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, System.Generics.Collections, uConverter, System.SysUtils,
  uUnitFactory, uUnit, uUnitLength, uUnitWeight, uUnitTime;

type
  // Test methods for class TConverter

  TestTConverter = class(TTestCase)
  strict private
    FConverter: TConverter;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestConvertUnitValue;
  end;

implementation

procedure TestTConverter.SetUp;
begin
  FConverter := TConverter.Create;
end;

procedure TestTConverter.TearDown;
begin
  FConverter.Free;
  FConverter := nil;
end;

procedure TestTConverter.TestConvertUnitValue;
var
  ReturnValue: Double;
  isError: Boolean;
begin
  // ???? ?? ????????????? ???????????
  ReturnValue := FConverter.ConvertUnitValue(TKilometer.Create, TMeter.Create);
  CheckEquals(1000, ReturnValue, '????????? ?? ???????? (1 ?? = 1000 ?)!');
  ReturnValue := FConverter.ConvertUnitValue(THour.Create, TSecond.Create);
  CheckEquals(3600, ReturnValue, '????????? ?? ???????? (1 ????? = 3600 ?)!');
  ReturnValue := FConverter.ConvertUnitValue(TTon.Create, TKilogram.Create);
  CheckEquals(1000, ReturnValue, '????????? ?? ???????? (1 ?? = 1000 ?)!');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTConverter.Suite);
end.

