unit ufrmCadastroPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, Datasnap.DBClient, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, tpEdit;

type
  TfrmCadastropagar = class(TfrmCadastroBasico)
    Label2: TLabel;
    edtDocumento: TEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
    Label4: TLabel;
    edtQtdeParcelas: TEdit;
    Label5: TLabel;
    edtVlrCompra: TtpEdit;
    Label7: TLabel;
    edtDtCompra: TtpEdit;
    edtVariacao: TEdit;
    Label8: TLabel;
    cdsParcelas: TClientDataSet;
    DBGrid1: TDBGrid;
    dsParcelas: TDataSource;
    btnGerarparcela: TBitBtn;
    cdsParcelasParcela: TIntegerField;
    cdsParcelasValor: TCurrencyField;
    cdsParcelasVencimento: TDateField;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    procedure btnGerarparcelaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acSalvarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastropagar: TfrmCadastropagar;

implementation

{$R *.dfm}

uses modConexao, Ufuncoes;

procedure TfrmCadastropagar.acEditarExecute(Sender: TObject);
begin
   Application.MessageBox('Não é possivel editar os campos!', 'Atenção', MB_OK+MB_ICONWARNING);

end;

procedure TfrmCadastropagar.acExcluirExecute(Sender: TObject);
begin
  //inherited;

  if Application.MessageBox('Deseja realmente cancelar o Documento?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
     begin
       try
        TClientDataSet(dsTabela.DataSet).Edit;
        DmDados.cdsContas_pagarStatus.AsString := 'C';
        TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

        Application.MessageBox('Documento cancelado com sucesso!', 'Informação', 0+64);
        TClientDataSet(dsTabela.DataSet).Open;

        except on E : Exception do
        raise Exception.Create('Erro ao excluir registro: ' + E.Message);

       end;
     end;

end;

procedure TfrmCadastropagar.acPesquisarExecute(Sender: TObject);
begin
  inherited;
  dmDados.cdsContas_pagar.Close;
  dmDados.cdsContas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR';
  dmDados.cdsContas_pagar.Open;
end;

procedure TfrmCadastropagar.acSalvarExecute(Sender: TObject);
  var i : integer;
begin

  if Trim(edtDocumento.Text) = '' then
     begin
       Application.MessageBox('Preencha o campo Documento!', 'Atenção', MB_OK+MB_ICONWARNING);
       edtDocumento.SetFocus;
       Abort;
     end;

  //CODIGO DO BOTÃO SALVAR
     try


    cdsParcelas.First;
    while not cdsParcelas.Eof do

    if dsTabela.State in [dsBrowse, dsInsert] then
    begin
     DmDados.cdscontas_pagar.Insert;
     DmDados.cdscontas_pagarid.AsInteger := GetId('ID', 'CONTAS_PAGAR');
     DmDados.cdscontas_pagarnumero_doc.AsString := trim(edtdocumento.Text);
     DmDados.cdscontas_pagardescricao.AsString := trim(edtdescricao.Text);
     DmDados.cdscontas_pagarParcela.AsInteger := cdsParcelasParcela.AsInteger;
     DmDados.cdscontas_pagarvlr_parcela.AsCurrency := cdsParcelasValor.AsInteger;
     DmDados.cdscontas_pagarvlr_compra.AsCurrency := StringParaFloat(edtVlrcompra.Text);
     DmDados.cdscontas_pagardt_compra.AsDateTime := StrToDate(edtdtcompra.Text);
     DmDados.cdscontas_pagardt_vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
     DmDados.cdscontas_pagardt_cadastro.AsDateTime := now;
     DmDados.cdscontas_pagarstatus.AsString := 'A';
     DmDados.cdscontas_pagarvlr_abatido.AsCurrency := 0;
     DmDados.cdscontas_pagar.Post;
     DmDados.cdscontas_pagar.ApplyUpdates(0);
     cdsParcelas.Next;
     end;

    Application.MessageBox('Registro Inserido com Sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
    TClientDataSet(dsTabela.DataSet).Open;


   for i := 0 to ComponentCount -1 do
    begin
     if Components[i] is TCustomEdit then
     TCustomEdit(Components[i]).Clear;
   end;

  if PageControl1.ActivePage = tbsCadastro then
    begin
    tbsCadastro.TabVisible := false;
    PageControl1.ACtivePage := tbsPesquisa;
    end;
    edtPesquisar.setFocus;


    cdsParcelas.EmptyDataSet;

  except on E : Exception do
  raise Exception.Create('Erro ao Salvar Registro: ' + E.Message);
  end;
  //FIM DO CODIGO DO BOTAO SALVAR

  //inherited;

end;

procedure TfrmCadastropagar.BitBtn2Click(Sender: TObject);
begin

  cdsParcelas.EmptyDataSet;

end;

procedure TfrmCadastropagar.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  if edtPesquisar.Text = '' then

  begin
   Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
   edtPesquisar.SetFocus;
   Abort;
  end;

  dmDados.cdsContas_pagar.Close;
  case cbxFiltros.ItemIndex of
   0 : DmDados.cdsContas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE DOCUMENTO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
   1 : DmDados.cdsContas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE DESCRICAO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  dmDados.cdsContas_pagar.Open;

end;

procedure TfrmCadastropagar.btnGerarparcelaClick(Sender: TObject);
  var I : Integer;
begin

  if edtDocumento.Text = '' then
     begin
     Application.MessageBox('Preencha o campo Documento!', 'Atenção', MB_OK+MB_ICONWARNING);
     edtDocumento.SetFocus;
     Abort;
     end;

  if edtDescricao.Text = '' then
     begin
     Application.MessageBox('Preencha o campo Descrição!', 'Atenção', MB_OK+MB_ICONWARNING);
     edtDescricao.SetFocus;
     Abort;
     end;

  if edtQtdeParcelas.Text = '' then
     begin
     Application.MessageBox('Preencha o campo Quantidade de Parecelas!', 'Atenção', MB_OK+MB_ICONWARNING);
     edtQtdeParcelas.SetFocus;
     Abort;
     end;

  if StringParaFloat(edtVlrCompra.Text) = 0 then
     begin
     Application.MessageBox('Preencha o Valor da Compra!', 'Atenção', MB_OK+MB_ICONWARNING);
     edtVlrCompra.SetFocus;
     Abort;
     end;

  if edtDtCompra.Text = '' then
     begin
     Application.MessageBox('Preencha o campo Data da Compra!', 'Atenção', MB_OK+MB_ICONWARNING);
     edtDtCompra.SetFocus;
     Abort;
     end;

    cdsParcelas.EmptyDataSet;

  for I := 1 to StrToInt(edtQtdeParcelas.Text) do
      begin
      cdsParcelas.Insert;
      cdsParcelasParcela.AsInteger := i;
      cdsParcelasValor.AsCurrency := StringParaFloat(edtVlrCompra.Text) / StrToInt(edtQtdeParcelas.Text);
      cdsParcelasVencimento.AsDateTime := StrToDate(edtDtCompra.Text) + (StrToInt(edtVariacao.Text) * i);
      cdsParcelas.Post;
      end;

end;


procedure TfrmCadastropagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  EditarDBGrid(dsParcelas, DBGrid1, State, Rect, Column);
end;

end.
