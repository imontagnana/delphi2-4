program Sistema_Financas;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  modConexao in 'modConexao.pas' {dmDados: TDataModule},
  ufrmCadastroBasico in 'view\ufrmCadastroBasico.pas' {frmCadastroBasico},
  ufrmCadastroUsuarios in 'view\ufrmCadastroUsuarios.pas' {frmCadastroUsuarios},
  Ufuncoes in 'classes\Ufuncoes.pas',
  ufrmCadastroCaixa in 'view\ufrmCadastroCaixa.pas' {frmCadastroCaixa},
  ufrmCadastroPagar in 'view\ufrmCadastroPagar.pas' {frmCadastropagar},
  ufrmCadastroReceber in 'view\ufrmCadastroReceber.pas' {frmCadastroReceber};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
