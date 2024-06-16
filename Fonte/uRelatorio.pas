unit uRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLReport, dmPrincipal;

type
  TFormRelatorio = class(TForm)
    Relatorio: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    QRelatorio: TFDQuery;
    DtsRelatorio: TDataSource;
    QRelatorioDIA: TDateField;
    QRelatorioTANQUE: TStringField;
    QRelatorioBOMBA: TStringField;
    QRelatorioVALOR: TFMTBCDField;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    procedure RLDBResult1Compute(Sender: TObject; var Value: Variant; var AText: string; var ComputeIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.dfm}

procedure TFormRelatorio.FormCreate(Sender: TObject);
begin
  QRelatorio.Open;
end;

procedure TFormRelatorio.RLDBResult1Compute(Sender: TObject; var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := QRelatorioVALOR.AsCurrency;
end;

end.
