unit ufrmCadastroReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, Datasnap.DBClient, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, tpEdit;

type
  TfrmCadastroReceber = class(TfrmCadastroBasico)
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtDocumento: TEdit;
    edtDescricao: TEdit;
    edtQtdeParcelas: TEdit;
    edtVlrCompra: TtpEdit;
    edtDtCompra: TtpEdit;
    edtVariacao: TEdit;
    DBGrid1: TDBGrid;
    btnGerarparcela: TBitBtn;
    BitBtn2: TBitBtn;
    cdsParcelas: TClientDataSet;
    cdsParcelasParcela: TIntegerField;
    cdsParcelasValor: TCurrencyField;
    cdsParcelasVencimento: TDateField;
    dsParcelas: TDataSource;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnGerarparcelaClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroReceber: TfrmCadastroReceber;

implementation

{$R *.dfm}

uses modConexao, Ufuncoes;

procedure TfrmCadastroReceber.acEditarExecute(Sender: TObject);
begin
 Application.MessageBox('Não é possível editar os campos!', 'Atenção', MB_OK+MB_ICONWARNING);

end;

procedure TfrmCadastroReceber.acExcluirExecute(Sender: TObject);
 begin
    try
      TClientDataSet(dsTabela.DataSet).Edit;
      Dmdados.cdscontas_receberStatus.AsString := 'C';
      TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Documento Cancelado com sucesso!', 'Informação', 0+64);
      TClientDataSet(dsTabela.DataSet).Open;

      except on E : Exception do

      raise Exception.Create('Erro ao Excluir Registro: '+E.Message);

    end;
 end;

procedure TfrmCadastroReceber.acPesquisarExecute(Sender: TObject);
begin
  inherited;
    DmDados.cdscontas_receber.Close;
    DmDados.cdscontas_receber.CommandText := 'SELECT * FROM CONTAS_RECEBER';
    DmDados.cdscontas_receber.Open;
end;

procedure TfrmCadastroReceber.acSalvarExecute(Sender: TObject);
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
     DmDados.cdscontas_receber.Insert;
     DmDados.cdscontas_receberid.AsInteger := GetId('ID', 'CONTAS_RECEBER');
     DmDados.cdscontas_receberdocumento.AsString := trim(edtdocumento.Text);
     DmDados.cdscontas_receberdescricao.AsString := trim(edtdescricao.Text);
     DmDados.cdscontas_receberParcela.AsInteger := cdsParcelasParcela.AsInteger;
     DmDados.cdscontas_recebervlr_parcela.AsCurrency := cdsParcelasValor.AsInteger;
     DmDados.cdscontas_recebervlr_compra.AsCurrency := StringParaFloat(edtVlrcompra.Text);
     DmDados.cdscontas_receberdt_compra.AsDateTime := StrToDate(edtdtcompra.Text);
     DmDados.cdscontas_receberdt_vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
     DmDados.cdscontas_receberdt_cadastro.AsDateTime := now;
     DmDados.cdscontas_receberstatus.AsString := 'A';
     DmDados.cdscontas_recebervlr_abatido.AsCurrency := 0;
     DmDados.cdscontas_receber.Post;
     DmDados.cdscontas_receber.ApplyUpdates(0);
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

procedure TfrmCadastroReceber.BitBtn2Click(Sender: TObject);
begin
  cdsParcelas.EmptyDataSet;

end;

procedure TfrmCadastroReceber.btnFiltrarClick(Sender: TObject);
begin
  inherited;
 if edtPesquisar.Text = '' then

  begin
   Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
   edtPesquisar.SetFocus;
   Abort;
  end;

  dmDados.cdsContas_receber.Close;
  case cbxFiltros.ItemIndex of
   0 : DmDados.cdsContas_receber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE DOCUMENTO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
   1 : DmDados.cdsContas_receber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE DESCRICAO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  dmDados.cdsContas_receber.Open;
end;

procedure TfrmCadastroReceber.btnGerarparcelaClick(Sender: TObject);
 var i : integer;

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

procedure TfrmCadastroReceber.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    EditarDBGrid(dsParcelas, DBGrid1, State, Rect, Column);

end;

end.
