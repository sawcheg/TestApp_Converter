{*******************************************************}
{                                                       }
{       Main Application Form                           }
{                                                       }
{       Copyright (c) 2021 AlexSolovey                  }
{                                                       }
{*******************************************************}

unit FormMainApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ConverterUnit, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  System.Generics.Collections, UnitOfMeasure;

type
  TFormMainApp = class(TForm)
    rgTypeUnit: TRadioGroup;
    edFrom: TMaskEdit;
    edTo: TMaskEdit;
    cbbFrom: TComboBox;
    cbbTo: TComboBox;
    btnClear: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnlyNumericKeyPress(Sender: TObject; var Key: Char);
    procedure rgTypeUnitClick(Sender: TObject);
    procedure editChange(Sender: TObject);
    procedure cbbChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    FConverter: TConverter;
    FFormatSettings: TFormatSettings;
    FArrayOFUnits: TList<IUnitOfMeasure>;
    FSelectedItem: Integer;
    procedure SetSelectedItem(const Value: Integer);
    property SelectedItem: Integer read FSelectedItem write SetSelectedItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMainApp: TFormMainApp;

implementation

{$R *.dfm}

procedure TFormMainApp.btnClearClick(Sender: TObject);
begin
  edFrom.Text := '1';
  editChange(edFrom);
end;

procedure TFormMainApp.cbbChange(Sender: TObject);
begin
  if Sender.Equals(cbbFrom) then
    editChange(edFrom)
  else
    editChange(edTo);
end;

procedure TFormMainApp.editChange(Sender: TObject);
var
  MaskEditTo: TMaskEdit;
  Value: Double;
  IndexFrom, IndexTo: Integer;
begin
  if Sender.Equals(edFrom) then
  begin
    MaskEditTo := edTo;
    IndexFrom := cbbFrom.ItemIndex;
    IndexTo := cbbTo.ItemIndex;
  end
  else
  begin
    MaskEditTo := edFrom;
    IndexFrom := cbbTo.ItemIndex;
    IndexTo := cbbFrom.ItemIndex;
  end;

  try
    if TMaskEdit(Sender).Text = '' then
      Value := 0
    else
      Value := StrToFloat(TMaskEdit(Sender).Text);
  except
    raise Exception.Create('Ошибка! Невозможно преобразовать введенное значение в формат числа с плавающей запятой!');
  end;

  try
    Value := FConverter.ConvertUnitValue(FArrayOFUnits[IndexFrom], FArrayOFUnits[IndexTo], Value);
    MaskEditTo.Text := Value.ToString;
  except
    on E: Exception do
      ShowMessage('Ошибка при конвертации: ' + E.Message);
  end;
end;

procedure TFormMainApp.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FFormatSettings := TFormatSettings.Create;
  FConverter := TConverter.Create;
  for i := 0 to FConverter.CountTypeUnits - 1 do
  begin
    rgTypeUnit.Columns := rgTypeUnit.Columns + 1;
    rgTypeUnit.Items.Add(FConverter.GetTypeUnitName(i));
  end;
  if rgTypeUnit.Items.Count > 0 then
    SelectedItem := 0;
end;

procedure TFormMainApp.OnlyNumericKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, [#8, '0'..'9', '-', FFormatSettings.DecimalSeparator]) then
    Key := #0
  else if ((Key = FFormatSettings.DecimalSeparator) or (Key = '-')) and (Pos(Key, TEdit(Sender).Text) > 0) then
    Key := #0
  else if (Key = '-') and (TEdit(Sender).SelStart <> 0) then
    Key := #0;
end;

procedure TFormMainApp.rgTypeUnitClick(Sender: TObject);
begin
  if rgTypeUnit.ItemIndex <> SelectedItem then
    SelectedItem := rgTypeUnit.ItemIndex;
end;

procedure TFormMainApp.SetSelectedItem(const Value: Integer);
var
  Item: IUnitOfMeasure;
begin
  FSelectedItem := Value;
  try
    if rgTypeUnit.ItemIndex <> Value then
      rgTypeUnit.ItemIndex := Value;
    cbbTo.Clear;
    cbbFrom.Clear;

    if Assigned(FArrayOFUnits) then
    begin
      FArrayOFUnits.Clear;
      FreeAndNil(FArrayOFUnits);
    end;

    FArrayOFUnits := FConverter.GetUnitsForType(Value);
    for Item in FArrayOFUnits do
    begin
      cbbFrom.Items.Add(Item.Name);
      cbbTo.Items.Add(Item.Name);
    end;
    if cbbFrom.Items.Count > 0 then
    begin
      cbbFrom.ItemIndex := 0;
      cbbTo.ItemIndex := cbbTo.Items.Count - 1;
      editChange(edFrom);
    end;
  except
    on E: Exception do
      ShowMessage('Ошибка при загрузке данных по типу единиц измерения: ' + E.Message);
  end;
end;

procedure TFormMainApp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FArrayOFUnits.Clear;
  FreeAndNil(FArrayOFUnits);
  FreeAndNil(FConverter);
end;

end.

