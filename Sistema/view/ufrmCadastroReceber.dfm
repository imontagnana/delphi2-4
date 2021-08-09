inherited frmCadastroReceber: TfrmCadastroReceber
  Caption = 'Cadastro de Contas a receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageControl1: TPageControl
    ActivePage = tbsCadastro
    inherited tbsPesquisa: TTabSheet
      object Label9: TLabel [2]
        Left = 13
        Top = 168
        Width = 176
        Height = 13
        Caption = 'Status: Cancelado, Ativo ou Baixado'
      end
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'documento'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parcela'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_parcela'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_abatido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_vencimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_pagamento'
            Visible = True
          end>
      end
      inherited cbxFiltros: TComboBoxEx
        ItemsEx = <
          item
            Caption = 'Descricao'
          end
          item
            Caption = 'Documento'
          end>
      end
    end
    inherited tbsCadastro: TTabSheet
      TabVisible = True
      object Label2: TLabel
        Left = 27
        Top = 24
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object Label3: TLabel
        Left = 27
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 27
        Top = 96
        Width = 67
        Height = 13
        Caption = 'Qtde Parcelas'
      end
      object Label5: TLabel
        Left = 27
        Top = 131
        Width = 64
        Height = 13
        Caption = 'Valor Compra'
      end
      object Label7: TLabel
        Left = 27
        Top = 163
        Width = 66
        Height = 13
        Caption = 'Dt da Compra'
      end
      object Label8: TLabel
        Left = 267
        Top = 96
        Width = 41
        Height = 13
        Caption = 'Varia'#231#227'o'
      end
      object edtDocumento: TEdit
        Left = 100
        Top = 21
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 0
      end
      object edtDescricao: TEdit
        Left = 100
        Top = 53
        Width = 413
        Height = 21
        MaxLength = 200
        TabOrder = 1
      end
      object edtQtdeParcelas: TEdit
        Left = 100
        Top = 93
        Width = 77
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
      object edtVlrCompra: TtpEdit
        Left = 100
        Top = 128
        Width = 77
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        TabOrder = 3
        Text = '0,00'
        Caracter = tcReal
      end
      object edtDtCompra: TtpEdit
        Left = 100
        Top = 160
        Width = 77
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 4
        Check = ckDate
        Caracter = tcNumeric
      end
      object edtVariacao: TEdit
        Left = 324
        Top = 93
        Width = 77
        Height = 21
        NumbersOnly = True
        TabOrder = 5
      end
      object DBGrid1: TDBGrid
        Left = 108
        Top = 232
        Width = 245
        Height = 209
        DataSource = dsParcelas
        DrawingStyle = gdsGradient
        GradientStartColor = clGradientInactiveCaption
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Parcela'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vencimento'
            Width = 86
            Visible = True
          end>
      end
      object btnGerarparcela: TBitBtn
        Left = 102
        Top = 187
        Width = 75
        Height = 25
        Caption = 'Gerar parcelas'
        TabOrder = 7
      end
      object BitBtn2: TBitBtn
        Left = 267
        Top = 187
        Width = 75
        Height = 25
        Caption = 'Limpar parcelas'
        TabOrder = 8
      end
    end
  end
  inherited dsTabela: TDataSource
    DataSet = dmDados.csdContas_receber
  end
  inherited ClientDataSet1: TClientDataSet
    Left = 756
    Top = 416
  end
  object cdsParcelas: TClientDataSet
    PersistDataPacket.Data = {
      5F0000009619E0BD0100000018000000030000000000030000005F0007506172
      63656C6104000100000000000556616C6F720800040000000100075355425459
      50450200490006004D6F6E6579000A56656E63696D656E746F04000600000000
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 20
    Top = 336
    object cdsParcelasParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object cdsParcelasValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cdsParcelasVencimento: TDateField
      FieldName = 'Vencimento'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 20
    Top = 408
  end
end
