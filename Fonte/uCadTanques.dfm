inherited FormCadTanques: TFormCadTanques
  Caption = 'Cadastro de Tanques'
  ClientHeight = 211
  ClientWidth = 500
  ExplicitWidth = 512
  ExplicitHeight = 249
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Top = 170
    Width = 500
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 292
    ExplicitWidth = 496
    DesignSize = (
      500
      41)
    inherited btnAlterar: TBitBtn
      Left = 84
      ExplicitLeft = 84
    end
    inherited btnExcluir: TBitBtn
      Left = 325
      ExplicitLeft = 325
    end
    inherited btnFechar: TBitBtn
      Left = 407
      ExplicitLeft = 403
    end
  end
  inherited pgTela: TPageControl
    Width = 500
    Height = 170
    TabOrder = 0
    ExplicitWidth = 496
    ExplicitHeight = 292
    inherited tbsGrid: TTabSheet
      ExplicitWidth = 492
      ExplicitHeight = 160
      inherited pnlPesquisa: TPanel
        Width = 492
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 492
        DesignSize = (
          492
          41)
        inherited btnFiltro: TBitBtn
          Left = 397
          OnClick = btnFiltroClick
          ExplicitLeft = 407
        end
      end
      inherited GridRegistros: TDBGrid
        Width = 492
        Height = 119
      end
    end
    inherited tbsRegistro: TTabSheet
      ExplicitWidth = 492
      ExplicitHeight = 160
      object lblCodigo: TLabel
        Left = 40
        Top = 16
        Width = 42
        Height = 15
        Caption = 'C'#243'digo:'
      end
      object lblDescTanque: TLabel
        Left = 40
        Top = 80
        Width = 112
        Height = 15
        Caption = 'Descri'#231#227'o do Tanque:'
      end
      object edtCodigo: TDBEdit
        Left = 40
        Top = 37
        Width = 90
        Height = 23
        DataField = 'ID'
        Enabled = False
        TabOrder = 0
      end
      object edtDescTanque: TDBEdit
        Left = 40
        Top = 98
        Width = 417
        Height = 23
        DataField = 'DescTanque'
        TabOrder = 1
      end
    end
  end
end
