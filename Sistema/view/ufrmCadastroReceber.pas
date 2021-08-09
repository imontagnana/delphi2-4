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

procedure TfrmCadastroReceber.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    EditarDBGrid(dsParcelas, DBGrid1, State, Rect, Column);

end;

end.
