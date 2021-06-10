{*******************************************************}
{                                                       }
{       TestApplication - converter for unit of measure }
{                                                       }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

program TestAppConverter;

uses
  Vcl.Forms,
  FormMainApp in 'FormMainApp.pas' {FormMainApp},
  UnitOfMeasure in 'Utils\UnitOfMeasure.pas',
  UnitOfMeasureWeight in 'Utils\UnitOfMeasureWeight.pas',
  UnitOfMeasureLength in 'Utils\UnitOfMeasureLength.pas',
  UnitOfMeasureTime in 'Utils\UnitOfMeasureTime.pas',
  ConverterUnit in 'Utils\ConverterUnit.pas',
  FactoryUnitOfMeasure in 'Utils\FactoryUnitOfMeasure.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$EndIf}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainApp, fmMainApp);
  Application.Run;
end.

