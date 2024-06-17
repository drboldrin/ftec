unit uAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastros, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, dmPrincipal, StrUtils, UITypes, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Math;

type
  TFormAbastecimentos = class(TFormPadrao)
    edtCodigo: TDBEdit;
    edtLitros: TDBEdit;
    edtDia: TDBEdit;
    edtValor: TDBEdit;
    edtAliquota: TDBEdit;
    edtImposto: TDBEdit;
    CblBombas: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnFiltroClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtAliquotaExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtDiaExit(Sender: TObject);
  private
    { Private declarations }
    FQBombas: TFDQuery;
    FDtsBombas: TDataSource;
    procedure InicializarTela;
    procedure CarregaListBombas;
    procedure FormataCamposQuery(DataSet:TDataSet);
    procedure NovoRegistro;
    procedure CalculaImposto;
    function ValidaData(Value:string):Boolean;

  public
    { Public declarations }
  end;

var
  FormAbastecimentos: TFormAbastecimentos;

implementation

{$R *.dfm}

{ TFormPadrao1 }

procedure TFormAbastecimentos.btnFiltroClick(Sender: TObject);
begin
  inherited;
  if not (SameText(Trim(edtFiltro.Text),'')) then
  begin
    if ValidaData(edtFiltro.Text) then
    begin
      QGrid.Filtered := false;
      QGrid.Filter   := 'Dia = '+QuotedStr(edtFiltro.Text);
      QGrid.Filtered := true;
    end
    else
    begin
      MessageDlg('Informe uma data válida!',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0,TMsgDlgBtn.mbOK);
      edtFiltro.SetFocus;
    end;
  end
  else
    QGrid.Filtered := false;
end;

procedure TFormAbastecimentos.btnGravarClick(Sender: TObject);
begin
  CalculaImposto;
  if not ValidaData(edtDia.Text) then
  begin
    MessageDlg('Data inválida! Verifique',TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0,TMsgDlgBtn.mbOK);
    edtDia.SetFocus;
    Abort;
  end;
  inherited;

end;

procedure TFormAbastecimentos.btnNovoClick(Sender: TObject);
begin
  inherited;
  NovoRegistro;
end;

procedure TFormAbastecimentos.CalculaImposto;
begin
  QGrid.FieldByName('Imposto').AsCurrency := (QGrid.FieldByName('Valor').AsFloat * QGrid.FieldByName('Aliquota').AsFloat)/100;
end;

procedure TFormAbastecimentos.CarregaListBombas;
begin
  FQBombas            := TFDQuery.Create(nil);
  FQBombas.Connection := dm.Connection;
  FQBombas.SQL.Clear;
  FQBombas.SQL.Add(dm.SQLBombas);
  FQBombas.Open;
  FDtsBombas           := TDataSource.Create(nil);
  FDtsBombas.DataSet   := FQBombas;
  CblBombas.ListSource := FDtsBombas;
end;

procedure TFormAbastecimentos.edtDiaExit(Sender: TObject);
begin
  inherited;
  if ValidaData(edtDia.Text) then
    edtDia.Text := FormatDateTime('dd/MM/yyyy',StrToDate(edtDia.Text))
  else
    MessageDlg('Data inválida!, Verifique',TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0,TMsgDlgBtn.mbOK);
end;

procedure TFormAbastecimentos.edtAliquotaExit(Sender: TObject);
begin
  inherited;
  CalculaImposto;
end;

procedure TFormAbastecimentos.FormataCamposQuery(DataSet:TDataSet);
begin
  DataSet.FieldByName('Dia').EditMask := '!99/99/9999';
  TFloatField(DataSet.FieldByName('Valor')).currency    := True;
  TFloatField(DataSet.FieldByName('Imposto')).currency  := True;
  TFloatField(DataSet.FieldByName('Aliquota')).DisplayFormat := '0.00';
  TFloatField(DataSet.FieldByName('Litros')).DisplayFormat := '0.000';

end;

procedure TFormAbastecimentos.FormCreate(Sender: TObject);
begin
  inherited;
  InicializarTela;
  CarregaListBombas;

end;

procedure TFormAbastecimentos.InicializarTela;
var
  i:integer;
  Coluna:TColumn;
begin
  QGrid.AfterOpen := nil;
  QGrid.SQL.Clear;
  QGrid.SQL.Add(dm.SQLAbastecimento);
  QGrid.AfterOpen := FormataCamposQuery;
  QGrid.Open;

  for i := 0 to QGrid.FieldCount-1 do
  begin
    Coluna           := GridRegistros.Columns.Add();
    Coluna.FieldName := QGrid.Fields[i].FieldName;
    case IndexStr(UpperCase(QGrid.Fields[i].FieldName),['ID','ID_BOMBA','DESCBOMBA','DIA','LITROS','VALOR','ALIQUOTA','IMPOSTO']) of
      0:Coluna.Title.Caption := 'Código';
      1:Coluna.Visible       := false;
      2: begin
        Coluna.Title.Caption := 'Bomba';
        Coluna.Width         := 120;
      end;
      3:Coluna.Title.Caption := 'Dia';
      4:Coluna.Title.Caption := 'Litros';
      5:Coluna.Title.Caption := 'Valor';
      6:Coluna.Title.Caption := 'Aliquota';
      7:Coluna.Title.Caption := 'Imposto';
    end;
  end;

end;

procedure TFormAbastecimentos.NovoRegistro;
begin
  QGrid.Transaction.StartTransaction;
  QGrid.Append;
  QGrid.FieldByName('Id').AsInteger     := NovoId('ABASTECIMENTOS');
  QGrid.FieldByName('Aliquota').AsFloat := 13.00;
end;

function TFormAbastecimentos.ValidaData(Value: string): Boolean;
begin
  try
    StrToDate(Value);
    Result := true;
  except
    Result := false;
  end;
end;

end.
