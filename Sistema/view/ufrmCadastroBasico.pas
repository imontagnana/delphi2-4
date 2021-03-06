unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Vcl.Buttons;

type
  TfrmCadastroBasico = class(TForm)
    dsTabela: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    pageControl1: TPageControl;
    tbsCadastro: TTabSheet;
    ImageListCadastro: TImageList;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    edtPesquisar: TEdit;
    btnFiltrar: TButton;
    actAcoes: TActionList;
    acInserir: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    acPesquisar: TAction;
    acImprimir: TAction;
    acFechar: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    dbgDados: TDBGrid;
    tbsPesquisa: TTabSheet;
    Label6: TLabel;
    cbxFiltros: TComboBoxEx;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actInserirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsPesquisarShow(Sender: TObject);
    procedure acInserirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure acInserirUpdate(Sender: TObject);
    procedure acEditarUpdate(Sender: TObject);
    procedure acExcluirUpdate(Sender: TObject);
    procedure acSalvarUpdate(Sender: TObject);
    procedure acCancelarUpdate(Sender: TObject);
    procedure acImprimirUpdate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    iModo : integer;
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  frmCadastroBasico: TfrmCadastroBasico;

implementation

{$R *.dfm}

uses modConexao, Ufuncoes;

procedure TfrmCadastroBasico.acCancelarExecute(Sender: TObject);
begin
  LimparTudo;
  TClientDataSet(dsTabela.DataSet).Cancel;

end;

procedure TfrmCadastroBasico.acCancelarUpdate(Sender: TObject);
begin
 acCancelar.Enabled := acSalvar.Enabled = true;
end;

procedure TfrmCadastroBasico.acEditarExecute(Sender: TObject);
begin
  iModo := 1;

  if PageControl1.ActivePage = tbsPesquisa then
     tbsCadastro.TabVisible := true;
     tbsPesquisa.TabVisible := false;
     PageControl1.ActivePage := tbsCadastro;
     TClientDataSet(dsTabela.DataSet).Edit;

end;

procedure TfrmCadastroBasico.acEditarUpdate(Sender: TObject);
begin
  if not TClientDataSet(dsTabela.DataSet).IsEmpty then

  acEditar.Enabled := true;
end;

procedure TfrmCadastroBasico.acExcluirExecute(Sender: TObject);
begin
 if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
     begin
       try
        TClientDataSet(dsTabela.DataSet).Delete;
        TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

        Application.MessageBox('Registro excluido com sucesso!', 'Informa??o', 0+64);
        TClientDataSet(dsTabela.DataSet).Open;

        except on E : Exception do
        raise Exception.Create('Erro ao excluir registro: ' + E.Message);

       end;
     end;
end;

procedure TfrmCadastroBasico.acExcluirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then
  acExcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.acFecharExecute(Sender: TObject);
begin
 close;
end;

procedure TfrmCadastroBasico.acImprimirExecute(Sender: TObject);
begin
 showMessage('Em desenvolvimento');
end;

procedure TfrmCadastroBasico.acImprimirUpdate(Sender: TObject);
begin
 if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then
 acImprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.acInserirExecute(Sender: TObject);
begin
    iModo := 0;

  if PageControl1.ActivePage = tbsPesquisa then
     tbsCadastro.TabVisible := true;
     tbsPesquisa.TabVisible := false;
     PageControl1.ActivePage := tbsCadastro;


  if not TClientDataSet(dsTabela.DataSet).Active then
     TClientDataSet(dsTabela.DataSet).Open;
     TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure TfrmCadastroBasico.acInserirUpdate(Sender: TObject);
begin
  acInserir.Enabled := dsTabela.State in [dsBrowse, dsInactive];
end;

procedure TfrmCadastroBasico.acPesquisarExecute(Sender: TObject);
begin
    PageControl1.ActivePage := tbsPesquisa;

    edtPesquisar.Clear;
end;

procedure TfrmCadastroBasico.acSalvarExecute(Sender: TObject);
begin

  try
  TClientDataSet(dsTabela.DataSet).Post;
  TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

    case iModo of
    0 : Application.MessageBox('Registro inserido com sucesso!', 'Informa??o', MB_OK+MB_ICONINFORMATION);
    1 : Application.MessageBox('Registro atualizado com sucesso!', 'Informa??o', MB_OK+MB_ICONINFORMATION);
    end;



    //LIMPAR OS CAMPOS
    LimparTudo;
    TClientDataSet(dsTabela.DataSet).Open;


  except on E : Exception do
  raise Exception.Create('Erro ao Salvar Registro: ' + E.Message);
  end;

end;

procedure TfrmCadastroBasico.acSalvarUpdate(Sender: TObject);
begin
  acSalvar.Enabled := dsTabela.State in [dsInsert, dsEdit];
end;

procedure TfrmCadastroBasico.actCancelarExecute(Sender: TObject);
begin
//CANCELAR

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


end;

procedure TfrmCadastroBasico.actPesquisarExecute(Sender: TObject);
begin
//PESQUISAR

end;

procedure TfrmCadastroBasico.actSalvarExecute(Sender: TObject);
begin
//SALVAR


  end;

procedure TfrmCadastroBasico.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 EditarDBGrid (dsTabela, dbgDados,State, Rect, Column);
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
  begin
  tbsCadastro.TabVisible := false;
  PageControl1.ACtivePage := tbsPesquisa;
  end;
    edtPesquisar.setFocus;
end;

procedure TfrmCadastroBasico.tbsPesquisarShow(Sender: TObject);
begin
PageControl1.ActivePage := tbsPesquisa;
end;

end.
