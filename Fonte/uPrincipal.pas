unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UITypes, dmPrincipal, uCadTanques, uCadBombas,
  uAbastecimentos, uRelatorio;

type
  TFormPrincipal = class(TForm)
    Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Bombas1: TMenuItem;
    Bombas2: TMenuItem;
    Fechar1: TMenuItem;
    Relatrio1: TMenuItem;
    procedure Fechar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Cadastros2Click(Sender: TObject);
    procedure Bombas1Click(Sender: TObject);
    procedure Bombas2Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.Bombas1Click(Sender: TObject);
begin
  FormCadBomba := nil;
  try
    FormCadBomba := TFormCadBomba.Create(Self);
    FormCadBomba.ShowModal;
  finally
    FreeAndNil(FormCadBomba);
  end;
end;

procedure TFormPrincipal.Bombas2Click(Sender: TObject);
begin
  FormAbastecimentos := nil;
  try
    FormAbastecimentos := TFormAbastecimentos.Create(Self);
    FormAbastecimentos.ShowModal;
  finally
    FreeAndNil(FormAbastecimentos);
  end;
end;

procedure TFormPrincipal.Cadastros2Click(Sender: TObject);
begin
  FormCadTanques := nil;
  try
    FormCadTanques := TFormCadTanques.Create(Self);
    FormCadTanques.ShowModal;
  finally
    FreeAndNil(FormCadTanques);
  end;
end;

procedure TFormPrincipal.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (MessageDlg('Desejar encerrar o sistema?',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbNo) = mrYes) then
  begin
    Action := TCloseAction.caFree;
  end
  else
    Action := TCloseAction.caNone;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
 if not DM.PrepararBancoDeDados then
    MessageDlg('Falha ao conectar ao banco de dados',mtWarning,[mbOk],0,mbOK);
end;

procedure TFormPrincipal.Relatrio1Click(Sender: TObject);
begin
  FormRelatorio := nil;
  try
    FormRelatorio := TFormRelatorio.Create(Self);
    FormRelatorio.Relatorio.PreviewModal;
  finally
    FreeAndNil(FormRelatorio)
  end;
end;

end.
