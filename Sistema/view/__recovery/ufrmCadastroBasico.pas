unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient;

type
  TfrmCadastroBasico = class(TForm)
    dsTabela: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ActionToolBar1: TActionToolBar;
    PageControl1: TPageControl;
    tbsCadastro: TTabSheet;
    tbsPesquisa: TTabSheet;
    DBGrid1: TDBGrid;
    ActionManagerCadastro: TActionManager;
    ImageListCadastro: TImageList;
    actInserir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actPesquisar: TAction;
    actImprimir: TAction;
    actFechar: TAction;
    ClientDataSet1: TClientDataSet;
    Panel2: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actInserirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsPesquisaShow(Sender: TObject);
    procedure actInserirUpdate(Sender: TObject);
    procedure actSalvarUpdate(Sender: TObject);
    procedure actExcluirUpdate(Sender: TObject);
    procedure actEditarUpdate(Sender: TObject);
    procedure actImprimirUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  frmCadastroBasico: TfrmCadastroBasico;

implementation

{$R *.dfm}

uses modConexao;

procedure TfrmCadastroBasico.actCancelarExecute(Sender: TObject);
begin
//CANCELAR
  LimparTudo;
  TClientDataSet(dsTabela.DataSet).Cancel;

end;

procedure TfrmCadastroBasico.actCancelarUpdate(Sender: TObject);
begin
actCancelar.Enabled := actSalvar.Enabled = true;
end;

procedure TfrmCadastroBasico.actEditarExecute(Sender: TObject);
begin
//EDITAR
  if PageControl1.ActivePage = tbsPesquisa then
     PageControl1.ActivePage := tbsCadastro;
     TClientDataSet(dsTabela.DataSet).Edit;

end;

procedure TfrmCadastroBasico.actEditarUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

  actEditar.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actExcluirExecute(Sender: TObject);
begin
//EXCLUIR

  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
     begin
       try
        TClientDataSet(dsTabela.DataSet).Delete;
        TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

        Application.MessageBox('Registro excluido com sucesso!', 'Informação', 0+64);
        TClientDataSet(dsTabela.DataSet).Open;

        except on E : Exception do
        raise Exception.Create('Erro ao excluir registro: ' + E.Message);

       end;
     end;

end;

procedure TfrmCadastroBasico.actExcluirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then
  actExcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actFecharExecute(Sender: TObject);
begin
//FECHAR
end;

procedure TfrmCadastroBasico.actImprimirExecute(Sender: TObject);
begin
//IMPRIMIR
showMessage('Em desenvolvimento');
end;

procedure TfrmCadastroBasico.actImprimirUpdate(Sender: TObject);
begin
if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then
actImprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actInserirExecute(Sender: TObject);
begin
//INSERIR
  if PageControl1.ActivePage = tbsPesquisa then
     PageControl1.ActivePage := tbsCadastro;

  if not TClientDataSet(dsTabela.DataSet).Active then
     TClientDataSet(dsTabela.DataSet).Open;
     TClientDataSet(dsTabela.DataSet).Insert;

end;

procedure TfrmCadastroBasico.actInserirUpdate(Sender: TObject);
begin
  actInserir.Enabled := dsTabela.State in [dsBrowse, dsInactive];
end;

procedure TfrmCadastroBasico.actPesquisarExecute(Sender: TObject);
begin
//PESQUISAR
    if PageControl1.ActivePage = tbsCadastro then
    PageControl1.ActivePage := tbsPesquisa;
    TClientDataSet(dsTabela.DataSet).Close;
    TClientDataSet(dsTabela.DataSet).Open;
end;

procedure TfrmCadastroBasico.actSalvarExecute(Sender: TObject);
begin
//SALVAR

  try
  TClientDataSet(dsTabela.DataSet).Post;
  TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

    case dsTabela.State of
    dsEdit : Application.MessageBox('Registro atualizado com sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
    dsinsert : Application.MessageBox('Registro inserido com sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
    end;



    //LIMPAR OS CAMPOS
    LimparTudo;
    TClientDataSet(dsTabela.DataSet).Open;


  except on E : Exception do
  raise Exception.Create('Erro ao Salvar Registro: ' + E.Message);
  end;

  end;

procedure TfrmCadastroBasico.actSalvarUpdate(Sender: TObject);
begin
//if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then
actSalvar.Enabled := dsTabela.State in [dsInsert, dsEdit];
end;

procedure TfrmCadastroBasico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TClientDataSet(dsTabela.DataSet).Cancel;
    TClientDataSet(dsTabela.DataSet).Close;
end;

procedure TfrmCadastroBasico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY = #27 then
    close;

  if key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfrmCadastroBasico.LimparTudo;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TCustomEdit then
    TCustomEdit(Components[i]).Clear;
  end;

  if PageControl1.ActivePage = tbsCadastro then
     PageControl1.ACtivePage := tbsPesquisa;
end;

procedure TfrmCadastroBasico.tbsPesquisaShow(Sender: TObject);
begin
PageControl1.ActivePage := tbsPesquisa;
end;

end.
