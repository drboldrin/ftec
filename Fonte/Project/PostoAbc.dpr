program PostoAbc;

uses
  Vcl.Forms,
  uPrincipal in '..\uPrincipal.pas' {FormPrincipal},
  dmPrincipal in '..\dmPrincipal.pas' {DM: TDataModule},
  uCadastros in '..\FormBase\uCadastros.pas' {FormPadrao},
  uCadTanques in '..\uCadTanques.pas' {FormCadTanques},
  uCadBombas in '..\uCadBombas.pas' {FormCadBomba},
  uAbastecimentos in '..\uAbastecimentos.pas' {FormAbastecimentos},
  uRelatorio in '..\uRelatorio.pas' {FormRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
