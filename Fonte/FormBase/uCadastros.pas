unit uCadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, StrUtils, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmPrincipal,
  Vcl.DBCtrls;

type
  TModoTela = (tmNovo,tmAlterar,tmInicial);
  TFormPadrao = class(TForm)
    pnlBotoes: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    pgTela: TPageControl;
    tbsGrid: TTabSheet;
    tbsRegistro: TTabSheet;
    pnlPesquisa: TPanel;
    GridRegistros: TDBGrid;
    btnFiltro: TBitBtn;
    edtFiltro: TEdit;
    Label1: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtFiltroExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    FModoTela:TModoTela;
    FQGrid: TFdQuery;
    FdtsGrid: TDataSource;
    procedure InicializaComponentes;
    procedure SetClientDataSet;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    procedure ControleDosBotoes(pModoTela:TModoTela);
    function NovoId(Tabela:string):integer;

    property QGrid:TFDQuery read FQGrid;
    property DtsGrid:TDataSource read FdtsGrid;

  end;

var
  FormPadrao: TFormPadrao;

implementation

{$R *.dfm}

procedure TFormPadrao.btnAlterarClick(Sender: TObject);
begin
  if not QGrid.IsEmpty then
  begin
    FModoTela := tmAlterar;
    QGrid.Transaction.StartTransaction;
    qgrid.Edit;
    ControleDosBotoes(FModoTela);
  end;
end;

procedure TFormPadrao.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg(('Cancelar '+IfThen((Self.FModoTela = tmNovo),'novo ','altera��o de ')+'registro?'),TMsgDlgType.mtConfirmation,
                [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbNo) = mrNo then
    Abort;

  if QGrid.State in ([dsInsert, dsEdit]) then
  begin
    QGrid.Cancel;
    QGrid.Transaction.Rollback;
  end;
  ControleDosBotoes(tmInicial);

end;

procedure TFormPadrao.btnExcluirClick(Sender: TObject);
begin
  try
    if not QGrid.IsEmpty then
    begin
      if MessageDlg('Desejar excluir registro selecionado?',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbNo) = mrNo then
        Abort;

      Qgrid.Transaction.StartTransaction;
      QGrid.Delete;
      QGrid.Transaction.CommitRetaining;
    end;
  except
    QGrid.Transaction.Rollback;
  end;
end;

procedure TFormPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPadrao.btnGravarClick(Sender: TObject);
begin
  if MessageDlg(('Gravar '+IfThen((Self.FModoTela = tmNovo),'novo ','altera��o de ')+'registro?'),TMsgDlgType.mtConfirmation,
                [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbYes) = mrNo then
    Abort;

  try
    QGrid.Post;
    QGrid.Transaction.CommitRetaining;
    QGRID.Refresh;
    ControleDosBotoes(tmInicial);
  except
    QGrid.Transaction.Rollback;
  end;

end;

procedure TFormPadrao.btnNovoClick(Sender: TObject);
begin
  FModoTela := tmNovo;
  ControleDosBotoes(FModoTela);
end;

procedure TFormPadrao.ControleDosBotoes(pModoTela: TModoTela);
begin
  case pModoTela of
    tmNovo, tmAlterar:begin
      btnNovo.Enabled     := false;
      btnAlterar.Enabled  := false;
      btnGravar.Enabled   := true;
      btnCancelar.Enabled := true;
      btnExcluir.Enabled  := false;
      btnFechar.Enabled   := false;
      tbsRegistro.Show;
    end;
    else begin
      btnNovo.Enabled     := True;
      btnAlterar.Enabled  := True;
      btnGravar.Enabled   := False;
      btnCancelar.Enabled := False;
      btnExcluir.Enabled  := True;
      btnFechar.Enabled   := True;
      tbsGrid.Show;
    end;
  end;

end;

constructor TFormPadrao.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  InicializaComponentes;
end;

destructor TFormPadrao.Destroy;
begin
  FreeAndNil(FQGrid);
  inherited;
end;

procedure TFormPadrao.edtFiltroExit(Sender: TObject);
begin
  btnFiltro.Click;
end;

procedure TFormPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (QGrid.State in [dsInsert,dsEdit]) then
     QGrid.Transaction.Rollback;
end;

procedure TFormPadrao.FormCreate(Sender: TObject);
begin
  InicializaComponentes;
  ControleDosBotoes(tmInicial);
end;

procedure TFormPadrao.InicializaComponentes;
begin
  FQGrid                   := TFDQuery.Create(nil);
  FdtsGrid                 := TDataSource.Create(nil);
  FQGrid.Connection        := DM.Connection;
  FQGrid.Transaction       := dm.Transact;
  FdtsGrid.DataSet         := FQGrid;
  GridRegistros.DataSource := FdtsGrid;
  SetClientDataSet;
end;

function TFormPadrao.NovoId(Tabela: string): integer;
var QId:TFDQuery;
begin
   QId := nil;
   try
     QId := TFDQuery.Create(nil);
     QId.Connection := DM.Connection;
     QId.SQL.Clear;
     QId.SQL.Add('SELECT MAX(ID) AS Codigo FROM '+Tabela);
     QId.Open();
     Result := QId.FieldByName('Codigo').AsInteger + 1;
     QId.Close;
   finally
     FreeAndNil(QId);
   end;
end;

procedure TFormPadrao.SetClientDataSet;
var i:integer;
begin
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TDBEdit) then
      (Self.Components[i] as TDBEdit).DataSource := Self.DtsGrid;

    if (Self.Components[i] is TDBLookupComboBox) then
      (Self.Components[i] as TDBLookupComboBox).DataSource := Self.DtsGrid;
  end;
end;

end.
