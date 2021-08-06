inherited frmCadastroUsuarios: TfrmCadastroUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 200
    Top = 176
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  inherited pageControl1: TPageControl
    inherited tbsPesquisa: TTabSheet
      Cursor = crHandPoint
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'login'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'senha'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end>
      end
    end
    inherited tbsCadastro: TTabSheet
      object Label3: TLabel
        Left = 43
        Top = 88
        Width = 29
        Height = 13
        Caption = 'Login:'
      end
      object Label4: TLabel
        Left = 43
        Top = 115
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label5: TLabel
        Left = 46
        Top = 61
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object edtNome: TEdit
        Left = 83
        Top = 58
        Width = 198
        Height = 21
        MaxLength = 50
        TabOrder = 0
      end
      object edtLogin: TEdit
        Left = 83
        Top = 85
        Width = 198
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
      object edtSenha: TEdit
        Left = 83
        Top = 112
        Width = 198
        Height = 21
        MaxLength = 20
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  inherited dsTabela: TDataSource
    DataSet = dmDados.cdsUsuarios
  end
end
