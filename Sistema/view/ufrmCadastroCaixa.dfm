inherited frmCadastroCaixa: TfrmCadastroCaixa
  Caption = 'Lan'#231'amento no Caixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pageControl1: TPageControl
    inherited tbsPesquisa: TTabSheet
      inherited btnFiltrar: TButton
        OnClick = btnFiltrarClick
      end
      inherited dbgDados: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 197
        Width = 857
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero'
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
            FieldName = 'valor'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end>
      end
      inherited cbxFiltros: TComboBoxEx
        ItemsEx = <
          item
            Caption = 'Documento'
          end
          item
            Caption = 'Descri'#231#227'o'
          end>
      end
    end
    inherited tbsCadastro: TTabSheet
      object Label2: TLabel
        Left = 83
        Top = 80
        Width = 57
        Height = 13
        Caption = 'Numero doc'
      end
      object Label3: TLabel
        Left = 83
        Top = 112
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 83
        Top = 152
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object edtNumerodoc: TEdit
        Left = 146
        Top = 77
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtDescricao: TEdit
        Left = 144
        Top = 112
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object RadioGroup: TRadioGroup
        Left = 80
        Top = 208
        Width = 185
        Height = 41
        Caption = 'Tipo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        TabOrder = 2
      end
      object edtValor: TtpEdit
        Left = 144
        Top = 152
        Width = 121
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        TabOrder = 3
        Text = '0,00'
        Caracter = tcReal
      end
    end
  end
end
