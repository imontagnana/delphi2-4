unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    imgUsuarios: TImage;
    imgReceber: TImage;
    imgPagar: TImage;
    imgCaixa: TImage;
    imgConReceber: TImage;
    imgConPagar: TImage;
    imgRelPagar: TImage;
    imgConfig: TImage;
    Label8: TLabel;
    Label9: TLabel;
    imgNavegador: TImage;
    imgRelReceber: TImage;
    imgRelCaixa: TImage;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure imgUsuariosClick(Sender: TObject);
    procedure imgCaixaClick(Sender: TObject);
    procedure imgPagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmCadastroBasico, ufrmCadastroUsuarios, ufrmCadastroCaixa,
  ufrmCadastroPagar;

  // BOTÃO CADASTRAR
procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  frmCadastroBasico := TfrmCadastroBasico.Create(nil);
  try
    frmCadastroBasico.ShowModal;
  finally
    FreeAndNil(frmCadastroBasico);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

if Application.MessageBox('Deseja realmente sair?', 'Informação', MB_YESNO+MB_ICONQUESTION) = mrYes then

Application.Terminate

else
Abort;

end;

procedure TfrmPrincipal.imgCaixaClick(Sender: TObject);
begin
    frmCadastroCaixa := TfrmCadastroCaixa.Create(nil);

  try
    frmCadastroCaixa.ShowModal;
  finally
    FreeAndNil(frmCadastroCaixa);
  end;
end;

procedure TfrmPrincipal.imgPagarClick(Sender: TObject);
begin
 frmCadastroPagar := TfrmCadastroPagar.Create(nil);

  try
    frmCadastroPagar.ShowModal;
  finally
    FreeAndNil(frmCadastroPagar);
  end;

end;

procedure TfrmPrincipal.imgUsuariosClick(Sender: TObject);
begin
 frmCadastroUsuarios := TfrmCadastroUsuarios.Create(nil);

  try
    frmCadastroUsuarios.ShowModal;
  finally
    FreeAndNil(frmCadastroUsuarios);
  end;

end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
