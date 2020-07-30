unit Estoque_Exclusao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEstoqueExclusao00 = class(TForm)
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Movto_Lancto: TEdit;
    BT_Buscar: TBitBtn;
    GroupBox1: TGroupBox;
    Movto_Nro_Lancto: TEdit;
    Movto_Nota: TEdit;
    Movto_Saldo: TEdit;
    Movto_Data: TEdit;
    Movto_Movimento: TEdit;
    Movto_Qtde: TEdit;
    Movto_Valor: TEdit;
    Movto_Obs: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BT_Excluir: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    Movto_Descricao: TEdit;
    Movto_Codigo: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_BuscarClick(Sender: TObject);
    procedure Movto_LanctoKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_Nro_LanctoKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_SaldoKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_DataKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_MovimentoKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure Movto_ObsKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstoqueExclusao00: TEstoqueExclusao00;

implementation

uses Conexao_BD, Rotinas_Gerais, DB;

{$R *.dfm}

procedure TEstoqueExclusao00.BT_SairClick(Sender: TObject);
begin
     EstoqueExclusao00.Close;
end;

procedure TEstoqueExclusao00.BT_BuscarClick(Sender: TObject);

var
   Comando_SQL: String;
   
begin
     If Trim(Movto_Lancto.Text) <> '' Then
        Begin
        Comando_SQL := 'Select * from fb_movto_estoque Where fb_movto_estoque_numero = ' + Trim(Movto_Lancto.Text) + ' Order By fb_movto_estoque_numero';

        ConexaoBD.SQL_FB_Movto_Estoque.Close;
        ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
        ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Movto_Estoque.Open;

        If Not conexaoBD.SQL_FB_Movto_Estoque.Eof Then
           Begin
           Movto_Codigo.Text     := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_codigo.Text;
           Movto_Descricao.Text  := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_descricao.Text;
           Movto_Nro_Lancto.Text := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_numero.Text;
           Movto_Nota.Text       := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_pedido.Text;
           Movto_Saldo.Text      := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_qtde_atual.Text;
           Movto_Data.Text       := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_data.Text;
           Movto_Movimento.Text  := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_cod_registro.Text;
           Movto_Qtde.Text       := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_qtde.Text;
           Movto_Valor.Text      := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_vlr_unitario.Text;
           Movto_Obs.Text        := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_obs.Text;
        End;
     End;
end;

procedure TEstoqueExclusao00.Movto_LanctoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_Nro_LanctoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_SaldoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_DataKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_MovimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_QtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.Movto_ObsKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoqueExclusao00.BT_ExcluirClick(Sender: TObject);

var
   Qtde_Atual: Real;
   Nro_Lancto, Comando_SQL: String;

begin
     If Trim(Movto_Lancto.Text) <> '' Then
        Begin

         If Confirma('Confirma a Exclusão?') = 6 Then
            Begin
            Ampulheta();

            //*** Deleta o Item Escolhido ***

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_movto_estoque Where fb_movto_estoque_numero = ' + Trim(Movto_Lancto.Text));
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Atualiza o Movimento do Estoque ***
            //*** Localiza o último Registro ***

            Comando_SQL := 'Select * from fb_movto_estoque Where fb_movto_estoque_numero < ' + Trim(Movto_Lancto.Text) + ' And fb_movto_estoque_codigo = ' + Trim(Movto_Codigo.Text) + ' Order By fb_movto_estoque_numero Desc';

            ConexaoBD.SQL_FB_Movto_Estoque.Close;
            ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
            ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Movto_Estoque.Open;

            Qtde_Atual := 0;

            If Not conexaoBD.SQL_FB_Movto_Estoque.Eof Then
               Begin
               Qtde_Atual := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_qtde_atual.AsFloat;

               If conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_cod_registro.AsInteger <= 49 Then
                  Begin
                  Qtde_Atual := Qtde_Atual + conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_qtde.AsFloat;
                  End
               Else
                  Begin
                  Qtde_Atual := Qtde_Atual - conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_qtde.AsFloat;
               End;
            End;

            //*** Localiza os Registros Posteriores ***

            Comando_SQL := 'Select * from fb_movto_estoque Where fb_movto_estoque_numero > ' + Trim(Movto_Lancto.Text) + ' And fb_movto_estoque_codigo = ' + Trim(Movto_Codigo.Text) + ' Order By fb_movto_estoque_numero Asc';

            ConexaoBD.SQL_FB_Movto_Estoque.Close;
            ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
            ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Movto_Estoque.Open;

            While Not conexaoBD.SQL_FB_Movto_Estoque.Eof Do
               Begin
               Nro_Lancto := conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_numero.Text;

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_movto_estoque Set fb_movto_estoque_qtde_atual = ' + Virgula_Ponto(FloatToStr(Qtde_Atual)) + ' Where fb_movto_estoque_numero = ' + Trim(Nro_Lancto) );
               ConexaoBD.SQL_Comunitario.ExecSQL;

               If conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_cod_registro.AsInteger <= 49 Then
                  Begin
                  Qtde_Atual := Qtde_Atual + conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_qtde.AsFloat;
                  End
               Else
                  Begin
                  Qtde_Atual := Qtde_Atual - conexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_qtde.AsFloat;
               End;

               ConexaoBD.SQL_FB_Movto_Estoque.Next;
            End;

            Seta();

            MSG_Erro('Exclusão Efetuada...');

            EstoqueExclusao00.Close;
         End;
     End;
end;

procedure TEstoqueExclusao00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     EstoqueExclusao00 := Nil;
end;

end.
