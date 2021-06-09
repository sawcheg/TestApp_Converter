unit fmMainApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConverter,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, System.Generics.Collections, uUnit;

type
  TfmMainApp = class(TForm)
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
    converter: TConverter;
    formatSettings: TFormatSettings;
    arr_units: TList<IUnit>;
    FSelectedItem: Integer;
    procedure SetSelectedItem(const Value: Integer);
    property SelectedItem: Integer read FSelectedItem write SetSelectedItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMainApp;


implementation

{$R *.dfm}

procedure TfmMainApp.btnClearClick(Sender: TObject);
begin
  edFrom.Text:= '1';
  editChange(edFrom);
end;

procedure TfmMainApp.cbbChange(Sender: TObject);
begin
  if Sender.Equals(cbbFrom) then
    editChange(edFrom)
  else
    editChange(edTo);
end;

procedure TfmMainApp.editChange(Sender: TObject);
var
  vEditTo: Tmaskedit;
  val: Double;
  unitFrom, unitTo: Integer;
begin
  if Sender.Equals(edFrom) then
  begin
    vEditTo := edTo;
    unitFrom := cbbFrom.ItemIndex;
    unitTo := cbbTo.ItemIndex;
  end
  else
  begin
    vEditTo := edFrom;
    unitFrom := cbbTo.ItemIndex;
    unitTo := cbbFrom.ItemIndex;
  end;

  try
    if Tmaskedit(Sender).Text = '' then
      val := 0
    else
      val := StrToFloat(Tmaskedit(Sender).Text);
  except
    raise Exception.Create('Ошибка! Невозможно преобразовать введенное значение в формат числа с плавающей запятой!');
  end;

  try
    val := converter.ConvertUnitValue(arr_units[unitFrom], arr_units[unitTo], val);
    vEditTo.Text := val.ToString;
  except
    on E: Exception do
      ShowMessage('Ошибка при конвертации: ' + E.Message);
  end;
end;

procedure TfmMainApp.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  formatSettings:= TFormatSettings.Create;
  converter := TConverter.Create;
  for i := 0 to converter.CountTypeUnits - 1 do
  begin
    rgTypeUnit.Columns := rgTypeUnit.Columns + 1;
    rgTypeUnit.Items.Add(converter.GetTypeUnitName(i));
  end;
  if rgTypeUnit.Items.Count > 0 then
    SelectedItem := 0;
end;

procedure TfmMainApp.OnlyNumericKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, [#8, '0'..'9', '-', formatSettings.DecimalSeparator]) then
    Key := #0
  else if ((Key = formatSettings.DecimalSeparator) or (Key = '-')) and (Pos(Key, TEdit(Sender).Text) > 0) then
    Key := #0
  else if (Key = '-') and (TEdit(Sender).SelStart <> 0) then
    Key := #0;
end;

procedure TfmMainApp.rgTypeUnitClick(Sender: TObject);
begin
  if rgTypeUnit.ItemIndex <> SelectedItem then
    SelectedItem := rgTypeUnit.ItemIndex;
end;

procedure TfmMainApp.SetSelectedItem(const Value: Integer);
var
  item: IUnit;
begin
  FSelectedItem := Value;
  try
    if rgTypeUnit.ItemIndex <> Value then
      rgTypeUnit.ItemIndex := Value;
    cbbTo.Clear;
    cbbFrom.Clear;
    arr_units := converter.GetUnitsForType(Value);
    for item in arr_units do
    begin
      cbbFrom.Items.Add(item.Name);
      cbbTo.Items.Add(item.Name);
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

procedure TfmMainApp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  arr_units.Clear;
  FreeAndNil(arr_units);
  FreeAndNil(converter);
end;

end.

