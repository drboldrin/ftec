object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema Posto ABC'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = Menu
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Menu: TMainMenu
    Left = 560
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Cadastros2: TMenuItem
        Caption = 'Tanques'
        OnClick = Cadastros2Click
      end
      object Bombas1: TMenuItem
        Caption = 'Bombas'
        OnClick = Bombas1Click
      end
    end
    object Bombas2: TMenuItem
      Caption = 'Abastecimento'
      OnClick = Bombas2Click
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      OnClick = Relatrio1Click
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      Hint = 'Encerrar e Fechar o Sistema'
      OnClick = Fechar1Click
    end
  end
end
