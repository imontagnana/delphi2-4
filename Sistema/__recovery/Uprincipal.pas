unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

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
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

if Application.MessageBox('Deseja realmente sair?', 'Informação', MB_YESNO+MB_ICONQUESTION) = mrYes then

Application.Terminate

else
Abort;

end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.