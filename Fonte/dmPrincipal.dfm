object DM: TDM
  Height = 195
  Width = 288
  object Connection: TFDConnection
    Params.Strings = (
      'Database=C:\FortesTec\DB\POSTOABC.FDB'
      'CharacterSet=win1252'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = Transact
    Left = 40
    Top = 32
  end
  object Transact: TFDTransaction
    Connection = Connection
    Left = 88
    Top = 32
  end
end
