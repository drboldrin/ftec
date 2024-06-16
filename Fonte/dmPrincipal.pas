unit dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TConfigBanco = record
    DriverId, DataBase, UserName, Password:string;
  end;

  TDM = class(TDataModule)
    Connection: TFDConnection;
    Transact: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
    function PrepararBancoDeDados():Boolean;
    function SQLTanques():String;
    function SQLBombas():String;
    function SQLAbastecimento():String;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses IniFiles;

{ TDataModule1 }

function TDM.PrepararBancoDeDados(): Boolean;
begin
  Result := false;
  try
    Connection.Params.Add('DriverId=FB');
    Connection.Params.Add('DataBase=C:\FortesTec\DB\POSTOABC.FDB');
    Connection.Params.Add('User_Name=sysdba');
    Connection.Params.Add('Password=masterkey');
    Connection.Params.Add('CharacterSet=win1252');
    Connection.Connected := true;
    Result := true;
  except on E:Exception do
    Assert(false,'Falha ao tentar conectar ao banco de dados: Mensagem: '+#10#13+E.Message);
  end;
end;

function TDM.SQLAbastecimento: String;
begin
  Result := 'SELECT A.ID, A.ID_BOMBA, B.descbomba, A.DIA, A.Litros, A.Valor, A.Aliquota, A.Imposto  FROM abastecimentos A INNER JOIN bombas B ON B.id = A.id_bomba';
end;

function TDM.SQLBombas: String;
begin
  Result := 'SELECT B.ID, B.ID_TANQUE, T.desctanque AS TANQUE, B.descbomba FROM BOMBAS B JOIN TANQUES T ON T.id = B.id_tanque';
end;

function TDM.SQLTanques: String;
begin
  Result := 'SELECT T.Id, T.DescTanque FROM TANQUES T';
end;

end.
