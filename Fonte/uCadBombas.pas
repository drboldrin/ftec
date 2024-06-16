unit uCadBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastros, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, StrUtils, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmPrincipal,
  Vcl.Mask;

type
  TFormCadBomba = class(TFormPadrao)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cblTanques: TDBLookupComboBox;
    edtCodigo: TDBEdit;
    edtDescBomba: TDBEdit;
    procedure btnFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);

  private
    { Private declarations }
    FDtsTanques: TDataSource;
    FQTanques: TFDQuery;
    procedure InicializarTela;
    procedure CarregaListTanques;
    procedure NovoRegistro;

  public
    { Public declarations }
  end;

var
  FormCadBomba: TFormCadBomba;

implementation

{$R *.dfm}

{ TFormCadBomba }

procedure TFormCadBomba.btnFiltroClick(Sender: TObject);
begin
  inherited;
  if not (SameText(Trim(edtFiltro.Text),'')) then
  begin
    QGrid.Filtered := false;
    QGrid.Filter := 'DescBomba Like '+QuotedStr('%'+edtFiltro.Text+'%');
    QGrid.Filtered := true;
  end
  else
    QGrid.Filtered := false;
end;

procedure TFormCadBomba.btnNovoClick(Sender: TObject);
begin
  inherited;
  NovoRegistro;
end;

procedure TFormCadBomba.CarregaListTanques;
begin
  FQTanques := TFDQuery.Create(nil);
  FQTanques.Connection := dm.Connection;
  FQTanques.SQL.Clear;
  FQTanques.SQL.Add(dm.SQLTanques);
  FQTanques.Open;
  FDtsTanques := TDataSource.Create(nil);
  FDtsTanques.DataSet := FQTanques;
  cblTanques.ListSource := FDtsTanques;

end;

procedure TFormCadBomba.FormCreate(Sender: TObject);
begin
  inherited;
  InicializarTela;
  CarregaListTanques;
end;

procedure TFormCadBomba.InicializarTela;
var
i:integer;
Coluna:TColumn;
begin
  QGrid.SQL.Clear;
  QGrid.SQL.Add(dm.SQLBombas);
  QGrid.Open;

  for i := 0 to QGrid.FieldCount-1 do
  begin
    Coluna           := GridRegistros.Columns.Add();
    Coluna.FieldName := QGrid.Fields[i].FieldName;

    case IndexStr(UpperCase(QGrid.Fields[i].FieldName),['ID','TANQUE','DESCBOMBA']) of
      0:Coluna.Title.Caption := 'Código';
      1:Coluna.Title.Caption := 'Tanque';
      2:Coluna.Title.Caption := 'Descrição da Bomba';
      else
        Coluna.Visible := false;
    end;

  end;

end;

procedure TFormCadBomba.NovoRegistro;
begin
  QGrid.Transaction.StartTransaction;
  QGrid.Append;
  QGrid.FieldByName('Id').AsInteger := NovoId('BOMBAS');
end;



end.
