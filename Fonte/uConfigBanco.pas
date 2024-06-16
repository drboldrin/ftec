unit uConfigBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.CustomizeDlg,
  dmPrincipal;

type
  TFormConfigBanco = class(TForm)
    pnlBotoes: TPanel;
    btnGravar: TBitBtn;
    btnFechar: TBitBtn;
    edtLocalBanco: TEdit;
    edtNomeBanco: TEdit;
    edtUsuario: TEdit;
    edtPassword: TEdit;
    btnLocalBanco: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnLocalBancoClick(Sender: TObject);
    function PegaDadosFormulario():TConfigBanco;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfigBanco: TFormConfigBanco;

implementation

{$R *.dfm}



procedure TFormConfigBanco.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormConfigBanco.btnLocalBancoClick(Sender: TObject);
var
  oFile:TOpenDialog;
begin
  oFile := nil;
  try
    oFile := TOpenDialog.Create(nil);
    if oFile.Execute then
      edtLocalBanco.GetNamePath;
  finally
    FreeAndNil(oFile);
  end;
end;

function TFormConfigBanco.PegaDadosFormulario: TConfigBanco;
begin
  Result.DriverId := 'FB';
  Result.DataBase := Trim(edtLocalBanco.Text)+'\'+Trim(edtNomeBanco.Text);
  Result.UserName := edtUsuario.Text;
  Result.Password := edtPassword.Text;
end;

end.
