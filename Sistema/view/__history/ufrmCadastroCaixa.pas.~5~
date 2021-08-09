unit ufrmCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, Datasnap.DBClient, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, tpEdit;

type
  TfrmCadastroCaixa = class(TfrmCadastroBasico)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNumerodoc: TEdit;
    edtDescricao: TEdit;
    RadioGroup: TRadioGroup;
    edtValor: TtpEdit;
    procedure acSalvarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCaixa: TfrmCadastroCaixa;

implementation

{$R *.dfm}

uses modConexao, Ufuncoes, System.Math;


procedure TfrmCadastroCaixa.acEditarExecute(Sender: TObject);
begin
  inherited;
  edtNumerodoc.Text := DmDados.cdsCaixanumero.AsString;
  edtDescricao.Text := DmDados.cdsCaixadescricao.AsString;
  edtValor.Text := FormatFloat(',#0.00',DmDados.cdsCaixavalor.AsCurrency);
  RadioGroup.ItemIndex := ifthen(DmDados.cdsCaixatipo.AsString = 'C', 0,1);
end;

procedure TfrmCadastroCaixa.acPesquisarExecute(Sender: TObject);
begin
  inherited;
  dmDados.cdsCaixa.Close;
  dmDados.cdsCaixa.CommandText := 'SELECT * FROM CAIXA';
  dmDados.cdsCaixa.Open;
end;

procedure TfrmCadastroCaixa.acSalvarExecute(Sender: TObject);
begin
  if Trim(edtNumerodoc.Text) = '' then
     begin
       Application.MessageBox('Preencha o campo Numero do Documento!', 'Atenção', MB_OK+MB_ICONWARNING);
       edtNumerodoc.SetFocus;
       Abort;
     end;

     if Trim(edtDescricao.Text) = '' then
     begin
       Application.MessageBox('Preencha o campo Descrição!', 'Atenção', MB_OK+MB_ICONWARNING);
       edtDescricao.SetFocus;
       Abort;
     end;

     if StringParaFloat(edtValor.Text) <= 0 then
      begin
        Application.MessageBox('Insira um Valor maior que zero', 'Atenção', MB_OK+MB_ICONWARNING);
        edtDescricao.SetFocus;
        Abort;
     end;

     if dsTabela.State in [dsInsert] then

     dmDados.cdsCaixaid.asInteger := GetId('ID', 'CAIXA');
     dmDados.cdsCaixanumero.AsString := trim(edtNumerodoc.Text);
     dmDados.cdsCaixadescricao.AsString := trim(edtDescricao.Text);
     dmDados.cdsCaixavalor.AsCurrency := StringParaFloat(edtValor.Text);
     dmDados.cdsCaixadt_cadastro.AsDateTime := now;
      case RadioGroup.ItemIndex of
      0 : dmDados.cdsCaixatipo.AsString := 'C';
      1 : dmDados.cdsCaixatipo.AsString := 'D';
      end;


  inherited;

end;

procedure TfrmCadastroCaixa.btnFiltrarClick(Sender: TObject);
begin
  if edtPesquisar.Text = '' then

 begin
   Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
   edtPesquisar.SetFocus;
   Abort;
 end;

  inherited;
  dmDados.cdsCaixa.Close;
  case cbxFiltros.ItemIndex of
   0 : DmDados.cdsCaixa.CommandText := 'SELECT * FROM CAIXA WHERE NUMERO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
   1 : DmDados.cdsCaixa.CommandText := 'SELECT * FROM CAIXA WHERE DESCRICAO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  dmDados.cdsUsuarios.Open;
end;

end.
