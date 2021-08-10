unit udmRelatorios;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF;

type
  Tdmrelatorios = class(TDataModule)
    frxReport: TfrxReport;
    frxDBDsusuarios: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmrelatorios: Tdmrelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses modConexao, ufrmCadastroUsuarios;

{$R *.dfm}

end.
