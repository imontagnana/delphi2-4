unit ufrmCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, Datasnap.DBClient, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmCadastroUsuarios = class(TfrmCadastroBasico)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    procedure acSalvarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

{$R *.dfm}

uses modConexao, Ufuncoes;

procedure TfrmCadastroUsuarios.acEditarExecute(Sender: TObject);
begin
  inherited;
  edtNome.Text := DmDados.cdsUsuariosnome.AsString;
  edtLogin.Text := DmDados.cdsUsuarioslogin.AsString;
  edtSenha.Text := DmDados.cdsUsuariossenha.AsString;
end;

procedure TfrmCadastroUsuarios.acPesquisarExecute(Sender: TObject);
begin
  inherited;
  dmDados.cdsUsuarios.Close;
  dmDados.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS';
  dmDados.cdsUsuarios.Open;
end;

procedure TfrmCadastroUsuarios.acSalvarExecute(Sender: TObject);
begin
     if  (dsTabela.State in [dsInsert]) and (GetLoginCadastrado(trim(edtLogin.Text))) then
      begin
       Application.MessageBox('O Login Já está Cadastrado!', 'Atenção', MB_OK+MB_ICONWARNING);
       edtLogin.SetFocus;
       abort;
     end;

     if Trim(edtNome.Text) = '' then
     begin
       Application.MessageBox('Preencha o campo Nome!', 'Atenção', MB_OK+MB_ICONWARNING);
       edtNome.SetFocus;
       Abort;
     end;

     if Trim(edtLogin.Text) = '' then
     begin
       Application.MessageBox('Preencha o campo Login!', 'Atenção', MB_OK+MB_ICONWARNING);
       edtLogin.SetFocus;
       Abort;
     end;

     if Trim(edtSenha.Text) = '' then
     begin
       Application.MessageBox('Preencha o campo Senha!', 'Atenção', MB_OK+MB_ICONWARNING);
       edtSenha.SetFocus;
       Abort;
     end;

   if dsTabela.State in [dsInsert] then

   dmDados.cdsUsuariosid.AsInteger := GetId('ID', 'USUARIOS');
   dmDados.cdsUsuariosnome.AsString := trim(edtNome.Text);
   dmDados.cdsUsuarioslogin.AsString := trim(edtLogin.Text);
   dmDados.cdsUsuariossenha.AsString := trim(edtSenha.Text);
   dmDados.cdsUsuariosstatus.AsString := 'A';
   dmDados.cdsUsuariosdt_cadastro.AsDateTime := now;
  inherited;

end;

procedure TfrmCadastrousuarios.btnfiltrarClick(Sender: TObject);
begin
 if edtPesquisar.Text = '' then

 begin
   Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
   edtPesquisar.SetFocus;
   Abort;
 end;

  inherited;
  DmDados.cdsUsuarios.Close;
  case cbxFiltros.ItemIndex of
   0 : DmDados.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS WHERE NOME LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
   1 : DmDados.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS WHERE LOGIN LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  DmDados.cdsUsuarios.Open;
end;

end.

