inherited FormAbastecimentos: TFormAbastecimentos
  Caption = 'Abastecimentos'
  TextHeight = 15
  inherited pnlBotoes: TPanel
    inherited btnFechar: TBitBtn
      Left = 397
      ExplicitLeft = 393
    end
  end
  inherited pgTela: TPageControl
    ActivePage = tbsRegistro
    inherited tbsGrid: TTabSheet
      inherited pnlPesquisa: TPanel
        ExplicitWidth = 482
        inherited Label1: TLabel
          Left = 7
          Top = 13
          Width = 70
          Caption = 'Filtro por dia:'
          ExplicitLeft = 7
          ExplicitTop = 13
          ExplicitWidth = 70
        end
        inherited btnFiltro: TBitBtn
          OnClick = btnFiltroClick
          ExplicitLeft = 401
        end
        inherited edtFiltro: TEdit
          Left = 84
          Width = 309
          Hint = 'Filtro apenas por data'
          ParentShowHint = False
          ShowHint = True
          ExplicitLeft = 84
          ExplicitWidth = 309
        end
      end
    end
    inherited tbsRegistro: TTabSheet
      object Label2: TLabel
        Left = 66
        Top = 40
        Width = 42
        Height = 15
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 66
        Top = 87
        Width = 41
        Height = 15
        Caption = 'Bomba:'
      end
      object Label4: TLabel
        Left = 66
        Top = 130
        Width = 20
        Height = 15
        Caption = 'Dia:'
      end
      object Label5: TLabel
        Left = 66
        Top = 177
        Width = 32
        Height = 15
        Caption = 'Litros:'
      end
      object Label6: TLabel
        Left = 169
        Top = 177
        Width = 29
        Height = 15
        Caption = 'Valor:'
      end
      object Label7: TLabel
        Left = 265
        Top = 177
        Width = 48
        Height = 15
        Caption = 'Al'#237'quota:'
      end
      object Label8: TLabel
        Left = 328
        Top = 177
        Width = 47
        Height = 15
        Caption = 'Imposto:'
      end
      object edtCodigo: TDBEdit
        Left = 66
        Top = 58
        Width = 120
        Height = 23
        DataField = 'ID'
        Enabled = False
        TabOrder = 0
      end
      object edtLitros: TDBEdit
        Left = 66
        Top = 195
        Width = 98
        Height = 23
        DataField = 'Litros'
        TabOrder = 3
      end
      object edtDia: TDBEdit
        Left = 66
        Top = 148
        Width = 121
        Height = 23
        DataField = 'Dia'
        TabOrder = 2
        OnExit = edtDiaExit
      end
      object edtValor: TDBEdit
        Left = 169
        Top = 195
        Width = 90
        Height = 23
        DataField = 'Valor'
        TabOrder = 4
      end
      object edtAliquota: TDBEdit
        Left = 265
        Top = 195
        Width = 48
        Height = 23
        DataField = 'Aliquota'
        TabOrder = 5
        OnExit = edtAliquotaExit
      end
      object edtImposto: TDBEdit
        Left = 327
        Top = 195
        Width = 90
        Height = 23
        DataField = 'Imposto'
        Enabled = False
        TabOrder = 6
      end
      object CblBombas: TDBLookupComboBox
        Left = 66
        Top = 101
        Width = 217
        Height = 23
        DataField = 'ID_BOMBA'
        KeyField = 'ID'
        ListField = 'DESCBOMBA'
        TabOrder = 1
      end
    end
  end
end
