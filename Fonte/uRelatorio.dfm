object FormRelatorio: TFormRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Abastecimentos'
  ClientHeight = 442
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Relatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = DtsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 39
      Top = 39
      Width = 716
      Height = 22
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 716
        Height = 23
        Align = faTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 39
      Top = 61
      Width = 716
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      object RLLabel2: TRLLabel
        Left = 8
        Top = 0
        Width = 28
        Height = 16
        Caption = 'Dia'
      end
      object RLLabel3: TRLLabel
        Left = 96
        Top = 0
        Width = 49
        Height = 16
        Caption = 'Tamque'
      end
      object RLLabel5: TRLLabel
        Left = 608
        Top = -1
        Width = 42
        Height = 16
        Caption = 'Valor'
      end
      object RLLabel4: TRLLabel
        Left = 344
        Top = -1
        Width = 42
        Height = 16
        Caption = 'Bomba'
      end
    end
    object RLBand3: TRLBand
      Left = 39
      Top = 77
      Width = 716
      Height = 16
      object RLDBText1: TRLDBText
        Left = 8
        Top = 0
        Width = 28
        Height = 15
        DataField = 'DIA'
        DataSource = DtsRelatorio
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 96
        Top = 0
        Width = 49
        Height = 15
        DataField = 'TANQUE'
        DataSource = DtsRelatorio
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 344
        Top = 0
        Width = 42
        Height = 15
        DataField = 'BOMBA'
        DataSource = DtsRelatorio
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 608
        Top = 0
        Width = 42
        Height = 15
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DtsRelatorio
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 39
      Top = 93
      Width = 716
      Height = 16
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedTop = True
      Borders.FixedBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      object RLDBResult1: TRLDBResult
        Left = 387
        Top = 0
        Width = 273
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DtsRelatorio
        DisplayMask = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = 'Valor Total do Per'#237'odo:    '
        OnCompute = RLDBResult1Compute
      end
    end
  end
  object QRelatorio: TFDQuery
    Connection = DM.Connection
    SQL.Strings = (
      'SELECT'
      
        'A.dia, T.DESCTANQUE AS TANQUE, B.DESCBOMBA AS BOMBA, SUM(A.valor' +
        ') AS VALOR'
      'FROM abastecimentos A'
      'INNER JOIN BOMBAS B ON B.id = A.id_bomba'
      'INNER JOIN TANQUES T ON T.id = B.id_tanque'
      'GROUP BY A.DIA, T.desctanque, B.descbomba'
      'order by A.dia, T.DESCTANQUE')
    Left = 184
    Top = 232
    object QRelatorioDIA: TDateField
      FieldName = 'DIA'
      Origin = 'DIA'
      Required = True
    end
    object QRelatorioTANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE'
      Origin = 'DESCTANQUE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QRelatorioBOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA'
      Origin = 'DESCBOMBA'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QRelatorioVALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  object DtsRelatorio: TDataSource
    DataSet = QRelatorio
    Left = 248
    Top = 232
  end
end
