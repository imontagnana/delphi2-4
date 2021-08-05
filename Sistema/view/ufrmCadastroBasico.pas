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
  private
    { Private declarations }
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

TClientDataSet(dsTabela.DataSet).Cancel;
if PageControl1.ActivePage = tbsCadastro then
  PageControl1.ActivePage := tbsPesquisa;
end;

procedure TfrmCadastroBasico.actCancelarUpdate(Sender: TObject);
begin
actCancelar.Enabled := actSalvar.Enabled = true;
end;

procedure TfrmCadastroBasico.actEditarExecute(Sender: TObject);
begin
//EDITAR
end;

procedure TfrmCadastroBasico.actExcluirExecute(Sender: TObject);
begin
//EXCLUIR
end;

procedure TfrmCadastroBasico.actFecharExecute(Sender: TObject);
begin
//FECHAR
end;

procedure TfrmCadastroBasico.actImprimirExecute(Sender: TObject);
begin
//IMPRIMIR
end;

procedure TfrmCadastroBasico.actInserirExecute(Sender: TObject);
begin
//INSERIR
if PageControl1.ActivePage = tbsPesquisa then
PageControl1.ACtivePage := tbsCadastro;
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
    TClientDataSet(dsTabela.DataSet).Close;
    TClientDataSet(dsTabela.DataSet).Open;
end;

procedure TfrmCadastroBasico.actSalvarExecute(Sender: TObject);
begin
//SALVAR
end;

procedure TfrmCadastroBasico.actSalvarUpdate(Sender: TObject);
begin
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

procedure TfrmCadastroBasico.tbsPesquisaShow(Sender: TObject);
begin
PageControl1.ActivePage := tbsPesquisa;
end;

end.