inherited FormCadBomba: TFormCadBomba
  Caption = 'Cadastro de Bombas de Combust'#237'veis'
  ClientHeight = 291
  ExplicitHeight = 329
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Top = 250
    ExplicitLeft = 0
    ExplicitTop = 292
    ExplicitWidth = 486
    inherited btnFechar: TBitBtn
      Left = 401
      ExplicitLeft = 397
    end
  end
  inherited pgTela: TPageControl
    Height = 250
    ActivePage = tbsRegistro
    ExplicitWidth = 486
    ExplicitHeight = 292
    inherited tbsGrid: TTabSheet
      ExplicitHeight = 240
      inherited pnlPesquisa: TPanel
        ExplicitLeft = 0
        ExplicitTop = -6
        ExplicitWidth = 482
        inherited btnFiltro: TBitBtn
          OnClick = btnFiltroClick
          ExplicitLeft = 397
        end
      end
      inherited GridRegistros: TDBGrid
        Height = 199
      end
    end
    inherited tbsRegistro: TTabSheet
      ExplicitHeight = 240
      object Label2: TLabel
        Left = 56
        Top = 32
        Width = 42
        Height = 15
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 56
        Top = 88
        Width = 41
        Height = 15
        Caption = 'Tanque:'
      end
      object Label4: TLabel
        Left = 56
        Top = 144
        Width = 197
        Height = 15
        Caption = 'Descri'#231#227'o da Bomba de Combust'#237'vel:'
      end
      object cblTanques: TDBLookupComboBox
        Left = 56
        Top = 107
        Width = 196
        Height = 23
        DataField = 'ID_TANQUE'
        KeyField = 'ID'
        ListField = 'DESCTANQUE'
        TabOrder = 0
      end
      object edtCodigo: TDBEdit
        Left = 59
        Top = 52
        Width = 121
        Height = 23
        DataField = 'ID'
        Enabled = False
        TabOrder = 1
      end
      object edtDescBomba: TDBEdit
        Left = 56
        Top = 165
        Width = 401
        Height = 23
        DataField = 'DescBomba'
        TabOrder = 2
      end
    end
  end
end
