object FormConfigBanco: TFormConfigBanco
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o de Banco de Dados'
  ClientHeight = 216
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 136
    Height = 15
    Caption = 'Local do Banco de Dados:'
  end
  object Label2: TLabel
    Left = 65
    Top = 70
    Width = 141
    Height = 15
    Caption = 'Nome do Banco de Dados:'
  end
  object Label3: TLabel
    Left = 64
    Top = 114
    Width = 43
    Height = 15
    Caption = 'Usu'#225'rio:'
  end
  object Label4: TLabel
    Left = 208
    Top = 114
    Width = 35
    Height = 15
    Caption = 'Senha:'
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 175
    Width = 434
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 224
    ExplicitWidth = 185
    DesignSize = (
      434
      41)
    object btnGravar: TBitBtn
      Left = 7
      Top = 5
      Width = 78
      Height = 32
      Caption = 'Gravar'
      TabOrder = 0
    end
    object btnFechar: TBitBtn
      Left = 339
      Top = 4
      Width = 87
      Height = 32
      Anchors = []
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
      ExplicitLeft = 346
    end
  end
  object edtLocalBanco: TEdit
    Left = 64
    Top = 45
    Width = 289
    Height = 23
    TabOrder = 1
  end
  object edtNomeBanco: TEdit
    Left = 64
    Top = 87
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object edtUsuario: TEdit
    Left = 64
    Top = 131
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object edtPassword: TEdit
    Left = 208
    Top = 131
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object btnLocalBanco: TBitBtn
    Left = 359
    Top = 43
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 5
    OnClick = btnLocalBancoClick
  end
end
