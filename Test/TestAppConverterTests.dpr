program TestAppConverterTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestConverterUnit in 'TestConverterUnit.pas',
  ConverterUnit in '..\Utils\ConverterUnit.pas',
  UnitOfMeasure in '..\Utils\UnitOfMeasure.pas',
  FactoryUnitOfMeasure in '..\Utils\FactoryUnitOfMeasure.pas',
  UnitOfMeasureLength in '..\Utils\UnitOfMeasureLength.pas',
  UnitOfMeasureTime in '..\Utils\UnitOfMeasureTime.pas',
  UnitOfMeasureWeight in '..\Utils\UnitOfMeasureWeight.pas',
  TestUnitTime in 'TestUnitTime.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

