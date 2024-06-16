unit uCadTanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastros, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Param, StrUtils, Vcl.Mask, Vcl.DBCtrls, dmPrincipal;

type
  TFormCadTanques = class(TFormPadrao)
    lblCodigo: TLabel;
    lblDescTanque: TLabel;
    edtCodigo: TDBEdit;
    edtDescTanque: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure InicializarTela;
    procedure NovoRegistro;

  public
    { Public declarations }
  end;

var
  FormCadTanques: TFormCadTanques;

implementation

{$R *.dfm}

procedure TFormCadTanques.btnFiltroClick(Sender: TObject);
begin
  inherited;
  if not (SameText(Trim(edtFiltro.Text),'')) then
  begin
    QGrid.Filtered := false;
    QGrid.Filter := 'DescTanque Like '+QuotedStr('%'+edtFiltro.Text+'%');
    QGrid.Filtered := true;
  end
  else
    QGrid.Filtered := false;

end;

procedure TFormCadTanques.btnNovoClick(Sender: TObject);
begin
  inherited;
  NovoRegistro;
end;

procedure TFormCadTanques.FormCreate(Sender: TObject);
begin
  inherited;
  InicializarTela;
end;

procedure TFormCadTanques.InicializarTela;
var
  i:integer;
  Coluna:TColumn;
begin
  QGrid.SQL.Clear;
  QGrid.SQL.Add(dm.SQLTanques);
  QGrid.Open;

  for i := 0 to QGrid.FieldCount-1 do
  begin
    Coluna               := GridRegistros.Columns.Add();
    Coluna.FieldName     := QGrid.Fields[i].FieldName;
    Coluna.Title.Caption := IfThen(SameText(UpperCase(QGrid.Fields[i].FieldName),'ID'),'Código','Descrição do Tanque');
  end;

end;

procedure TFormCadTanques.NovoRegistro;
begin
  QGrid.Transaction.StartTransaction;
  QGrid.Append;
  QGrid.FieldByName('Id').AsInteger := NovoId('TANQUES');
end;

end.
