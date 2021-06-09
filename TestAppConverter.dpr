program TestAppConverter;

uses
  Vcl.Forms,
  fmMainApp in 'fmMainApp.pas' {Form1},
  uUnit in 'Utils\uUnit.pas',
  uUnitWeight in 'Utils\uUnitWeight.pas',
  uUnitLength in 'Utils\uUnitLength.pas',
  uUnitTime in 'Utils\uUnitTime.pas',
  uConverter in 'Utils\uConverter.pas',
  uUnitFactory in 'Utils\uUnitFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMainApp, fmMain);
  Application.Run;
end.

