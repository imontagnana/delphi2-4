object dmDados: TdmDados
  OldCreateOrder = False
  Height = 721
  Width = 553
  object SQLConnection: TSQLConnection
    ConnectionName = 'financeiro'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver270.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver270.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'Database=financeiro'
      'User_Name=root'
      'Password=101199'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'HostName=localhost')
    Connected = True
    Left = 152
    Top = 40
  end
  object sdsCaixa: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'SELECT * FROM caixa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 144
  end
  object dspCaixa: TDataSetProvider
    DataSet = sdsCaixa
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 144
  end
  object cdsCaixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 352
    Top = 144
    object cdsCaixaid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCaixanumero: TStringField
      DisplayLabel = 'Numero doc'
      FieldName = 'numero'
      Required = True
    end
    object cdsCaixadescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 200
    end
    object cdsCaixavalor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
      currency = True
      Precision = 20
      Size = 2
    end
    object cdsCaixatipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCaixadt_cadastro: TDateField
      DisplayLabel = 'Data cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
  end
  object sdsContas_pagar: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'SELECT * FROM contas_pagar'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 216
  end
  object dspContas_pagar: TDataSetProvider
    DataSet = sdsContas_pagar
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 216
  end
  object cdsContas_pagar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_pagar'
    Left = 352
    Top = 216
    object cdsContas_pagarid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_pagarnumero_doc: TStringField
      DisplayLabel = 'Numero doc'
      FieldName = 'numero_doc'
      Required = True
    end
    object cdsContas_pagardescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 200
    end
    object cdsContas_pagarparcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
      Required = True
    end
    object cdsContas_pagarvlr_parcela: TFMTBCDField
      DisplayLabel = 'Valor parcela'
      FieldName = 'vlr_parcela'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_pagarvlr_compra: TFMTBCDField
      DisplayLabel = 'Valor compra'
      FieldName = 'vlr_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_pagarvlr_abatido: TFMTBCDField
      DisplayLabel = 'Valor abatido'
      FieldName = 'vlr_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object cdsContas_pagardt_compra: TDateField
      DisplayLabel = 'Data da compra'
      FieldName = 'dt_compra'
      Required = True
    end
    object cdsContas_pagardt_cadastro: TDateField
      DisplayLabel = 'Data do cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
    object cdsContas_pagardt_vencimento: TDateField
      DisplayLabel = 'Data de vencimento'
      FieldName = 'dt_vencimento'
      Required = True
    end
    object cdsContas_pagardt_pagamento: TDateField
      DisplayLabel = 'Data pagamento'
      FieldName = 'dt_pagamento'
    end
    object cdsContas_pagarstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sdsContas_receber: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'SELECT * FROM contas_receber'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 296
  end
  object dspContas_receber: TDataSetProvider
    DataSet = sdsContas_receber
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 296
  end
  object cdsContas_receber: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_receber'
    Left = 352
    Top = 304
    object cdsContas_receberid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_receberdocumento: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
      Required = True
    end
    object cdsContas_receberdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 200
    end
    object cdsContas_receberparcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
      Required = True
    end
    object cdsContas_recebervlr_parcela: TFMTBCDField
      DisplayLabel = 'valor parcela'
      FieldName = 'vlr_parcela'
      Required = True
      currency = True
      Precision = 20
      Size = 2
    end
    object cdsContas_recebervlr_compra: TFMTBCDField
      DisplayLabel = 'valor compra'
      FieldName = 'vlr_compra'
      Required = True
      currency = True
      Precision = 20
      Size = 2
    end
    object cdsContas_recebervlr_abatido: TFMTBCDField
      DisplayLabel = 'valor abatido'
      FieldName = 'vlr_abatido'
      Required = True
      currency = True
      Precision = 20
      Size = 2
    end
    object cdsContas_receberdt_compra: TDateField
      DisplayLabel = 'data compra'
      FieldName = 'dt_compra'
      Required = True
    end
    object cdsContas_receberdt_vencimento: TDateField
      DisplayLabel = 'data vencimento'
      FieldName = 'dt_vencimento'
      Required = True
    end
    object cdsContas_receberdt_cadastro: TDateField
      DisplayLabel = 'data cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
    object cdsContas_receberstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsContas_receberdt_pagamento: TStringField
      DisplayLabel = 'data pagamento'
      FieldName = 'dt_pagamento'
      FixedChar = True
      Size = 10
    end
  end
  object sdsUsuarios: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'SELECT * FROM usuarios'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 376
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sdsUsuarios
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 376
  end
  object cdsUsuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 352
    Top = 376
    object cdsUsuariosid: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsuariosnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object cdsUsuarioslogin: TStringField
      DisplayLabel = 'Login'
      FieldName = 'login'
      Required = True
    end
    object cdsUsuariossenha: TStringField
      FieldName = 'senha'
      Required = True
    end
    object cdsUsuariosstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosdt_cadastro: TDateField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'dt_cadastro'
    end
  end
end
