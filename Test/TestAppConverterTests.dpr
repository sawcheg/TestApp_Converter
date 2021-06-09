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
  TestuConverter in 'TestuConverter.pas',
  uConverter in '..\Utils\uConverter.pas',
  uUnit in '..\Utils\uUnit.pas',
  uUnitFactory in '..\Utils\uUnitFactory.pas',
  uUnitLength in '..\Utils\uUnitLength.pas',
  uUnitTime in '..\Utils\uUnitTime.pas',
  uUnitWeight in '..\Utils\uUnitWeight.pas',
  TestuUnitTime in 'TestuUnitTime.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

