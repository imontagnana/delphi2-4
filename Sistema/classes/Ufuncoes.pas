unit Ufuncoes;



interface

uses
  Vcl.Forms, System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,
  Vcl.DBGrids, Vcl.Grids, System.Types, System.Generics.Collections;

function GetId(Campo, Tabela : string) : Integer;
function GetLoginCadastrado (Login : string) : Boolean;
procedure EditarDBGrid(DataSource : TDataSource; Sender : TDBGrid; State :TGridDrawState; Rect : TRect; Column : TColumn);
implementation

uses modConexao, ufrmCadastroUsuarios;

  function GetId(Campo, Tabela : string) : Integer;
    begin
      with
      TSQLQuery.Create(nil) do
      try
        SQLConnection := dmDados.SQLConnection;
        sql.Add('SELECT '+Campo+' FROM '+Tabela+' ORDER BY '+Campo+' DESC LIMIT 1');
        open;
        Result := Fields[0].AsInteger + 1;
      finally
        close;
        free;
      end;
    end;

    function GetLoginCadastrado (Login : string) : Boolean;
     begin
     result := false;
      with
      TSQLQuery.Create(nil) do

      try
      SQLConnection := DmDados.SQLConnection;
        Sql.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
        Params[0].ASString := Login;
        Open;

        if not IsEmpty then
        result := true;
      finally
      Close;
      Free;
      end;
     end;

     procedure EditarDBGrid(DataSource : TDataSource; Sender : TDBGrid; State :TGridDrawState; Rect : TRect; Column : TColumn);
     begin
       if not odd(DataSource.DataSet.RecNo) then
       begin
         if not (gdSelected in state) then
         begin
           Sender.Canvas.Brush.Color := $454545;
           Sender.Canvas.FillRect(Rect);
           Sender.DefaultDrawDataCell(Rect,Column.Field,State);
         end;
       end;
     end;

end.
