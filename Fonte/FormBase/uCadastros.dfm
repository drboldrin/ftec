object FormPadrao: TFormPadrao
  Left = 0
  Top = 0
  Caption = 'FormPadrao'
  ClientHeight = 334
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 293
    Width = 490
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 292
    ExplicitWidth = 486
    DesignSize = (
      490
      41)
    object btnNovo: TBitBtn
      Left = 7
      Top = 6
      Width = 75
      Height = 28
      Hint = 'Incluir novo registro'
      Caption = 'Novo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 86
      Top = 6
      Width = 75
      Height = 28
      Hint = 'Alterar registro selecionado'
      Caption = 'Alterar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 246
      Top = 6
      Width = 75
      Height = 28
      Hint = 'Cancelar Opera'#231#227'o'
      Caption = 'Cancelar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnExcluir: TBitBtn
      Left = 323
      Top = 6
      Width = 75
      Height = 28
      Hint = 'Excluir registro'
      Caption = 'Excluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnFechar: TBitBtn
      Left = 401
      Top = 6
      Width = 75
      Height = 28
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnFecharClick
      ExplicitLeft = 397
    end
    object btnGravar: TBitBtn
      Left = 165
      Top = 6
      Width = 75
      Height = 28
      Hint = 'Gravar registro'
      Caption = 'Gravar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnGravarClick
    end
  end
  object pgTela: TPageControl
    Left = 0
    Top = 0
    Width = 490
    Height = 293
    ActivePage = tbsGrid
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 486
    ExplicitHeight = 292
    object tbsGrid: TTabSheet
      Caption = 'tbsGrid'
      TabVisible = False
      object pnlPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 482
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        ExplicitWidth = 478
        DesignSize = (
          482
          41)
        object Label1: TLabel
          Left = 16
          Top = 12
          Width = 30
          Height = 15
          Caption = 'Filtro:'
        end
        object btnFiltro: TBitBtn
          Left = 401
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Filtrar'
          TabOrder = 0
          ExplicitLeft = 397
        end
        object edtFiltro: TEdit
          Left = 52
          Top = 10
          Width = 333
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnExit = edtFiltroExit
          ExplicitWidth = 329
        end
      end
      object GridRegistros: TDBGrid
        Left = 0
        Top = 41
        Width = 482
        Height = 242
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = btnAlterarClick
      end
    end
    object tbsRegistro: TTabSheet
      Caption = 'tbsRegistro'
      ImageIndex = 1
      TabVisible = False
    end
  end
  object FDQuery1: TFDQuery
    Left = 324
    Top = 206
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = DM.Connection
    Left = 404
    Top = 206
  end
end
