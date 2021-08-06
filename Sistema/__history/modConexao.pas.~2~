unit modConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TDataModule1 = class(TDataModule)
    SQLConnection: TSQLConnection;
    sdsCaixa: TSQLDataSet;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    sdsContas_pagar: TSQLDataSet;
    dspContas_pagar: TDataSetProvider;
    cdsContas_pagar: TClientDataSet;
    sdsContas_receber: TSQLDataSet;
    dspContas_receber: TDataSetProvider;
    csdContas_receber: TClientDataSet;
    sdsUsuarios: TSQLDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsCaixaid: TIntegerField;
    cdsCaixanumero: TStringField;
    cdsCaixadescricao: TStringField;
    cdsCaixavalor: TFMTBCDField;
    cdsCaixatipo: TStringField;
    cdsCaixadt_cadastro: TDateField;
    cdsContas_pagarid: TIntegerField;
    cdsContas_pagarnumero_doc: TStringField;
    cdsContas_pagardescricao: TStringField;
    cdsContas_pagarparcela: TIntegerField;
    cdsContas_pagarvlr_parcela: TFMTBCDField;
    cdsContas_pagarvlr_compra: TFMTBCDField;
    cdsContas_pagarvlr_abatido: TFMTBCDField;
    cdsContas_pagardt_compra: TDateField;
    cdsContas_pagardt_cadastro: TDateField;
    cdsContas_pagardt_vencimento: TDateField;
    cdsContas_pagardt_pagamento: TDateField;
    cdsContas_pagarstatus: TStringField;
    csdContas_receberid: TIntegerField;
    csdContas_receberdocumento: TStringField;
    csdContas_receberdescricao: TStringField;
    csdContas_receberparcela: TIntegerField;
    csdContas_recebervlr_parcela: TFMTBCDField;
    csdContas_recebervlr_compra: TFMTBCDField;
    csdContas_recebervlr_abatido: TFMTBCDField;
    csdContas_receberdt_compra: TDateField;
    csdContas_receberdt_vencimento: TDateField;
    csdContas_receberdt_cadastro: TDateField;
    csdContas_receberstatus: TStringField;
    csdContas_receberdt_pagamento: TStringField;
    cdsUsuariosid: TIntegerField;
    cdsUsuariosnome: TStringField;
    cdsUsuarioslogin: TStringField;
    cdsUsuariossenha: TStringField;
    cdsUsuariosstatus: TStringField;
    cdsUsuariosdt_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
