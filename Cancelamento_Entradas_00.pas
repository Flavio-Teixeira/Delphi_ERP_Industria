unit Cancelamento_Entradas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TCancelamentoEntradas00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit_nro_nota_fiscal: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    DBGrid_Entrada: TDBGrid;
    procedure Edit_nro_nota_fiscalKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure DBGrid_EntradaCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Obtem_Pedido(var Nro: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelamentoEntradas00: TCancelamentoEntradas00;
  Nro_Nota : String;
implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TCancelamentoEntradas00.Edit_nro_nota_fiscalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 Then
    Begin
    Nro_Nota := Edit_nro_nota_fiscal.Text;
    Obtem_Pedido(Nro_Nota);
  End;
  If Not(key in ['0'..'9',#8]) Then
    Begin
    key := #0;
  End;
end;

procedure TCancelamentoEntradas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TCancelamentoEntradas00.BT_SairClick(Sender: TObject);
begin
  CancelamentoEntradas00.Close;
end;

Procedure TCancelamentoEntradas00.Obtem_Pedido(var Nro: String);
  Begin
  Ampulheta();
// Verifica se o número da nota foi digitado
  If Trim(Nro) = '' Then
    Begin
    MSG_Erro('Preencha o Campo ' + #39 + 'Nro Nota Fiscal' + #39 + ' Antes de Prosseguir...');
    End
// Procura o número do pedido
  Else
    Begin
    ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
    ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * From fb_notas_entradas Where fb_nota_entrada_numero_nota = ' + nro);
    ConexaoBD.SQL_FB_Notas_Entradas.Open;

    DBGrid_Entrada.Refresh;
// Verifica se o número da nota existe
    If (ConexaoBD.SQL_FB_Notas_Entradas.Eof = True) And (ConexaoBD.SQL_FB_Notas_Entradas.Bof = True) Then
      Begin
      MSG_Erro('Nota Não Encontrada...');
    End;
  End;
  Seta();
End;

procedure TCancelamentoEntradas00.BT_ProcurarClick(Sender: TObject);
begin
  Nro_Nota := Edit_nro_nota_fiscal.Text;
  Obtem_Pedido(Nro_Nota);
end;

procedure TCancelamentoEntradas00.DBGrid_EntradaCellClick(Column: TColumn);

var
   Nro_Entrada: Integer;

begin
  If Trim(DBGrid_Entrada.Fields[0].Text) <> '' Then
    Begin

    Nro_Entrada := StrToInt(DBGrid_Entrada.Fields[0].Text);
    If Confirma('Deseja realmente Excluir a nota nº'+ Nro_Nota +' ?')= 6 Then
      Begin
      ConexaoBD.SQL_FB_Notas_Entradas.Close;
      ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
      ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * From fb_notas_entradas Where (fb_nota_entrada_numero_nota = ' + Nro_Nota +') And (fb_nota_entrada_numero = ' + IntToStr(Nro_Entrada) + ')');
      ConexaoBD.SQL_FB_Notas_Entradas.Open;

      ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
      ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add('Select * From fb_notas_entradas_produtos Where (fb_nota_entrada_produto_nota = ' + Nro_Nota +') And (fb_nota_entrada_produto_numero = ' + IntToStr(Nro_Entrada) + ')');
      ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

      // caso a nota cancelada não provenha de uma devolução
      // subtrai os itens do estoque e registra o movimento do estoque
      If Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_natureza_oper.Text) <> 'Devolução' Then
        Begin
        ConexaoBD.SQL_FB_Produtos.SQL.Clear;
        ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo=' +#39+ ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text +#39);
        ConexaoBD.SQL_FB_Produtos.Open;

        While ConexaoBD.SQL_FB_Produtos.Eof = False Do
          Begin
          //*** Registra o Movto de Estoque ***
          FB_Registra_Movto_Estoque('21',Nro_Nota,Nro_Nota,'-',Trim(ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text),'0',Virgula_Ponto(Trim(ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_qtde.Text)));

          ConexaoBD.SQL_FB_Produtos.Next;
        End;
      End;

      // deleta Lista de Produtos vinculados a nota de entrada
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_notas_entradas_produtos Where fb_nota_entrada_produto_numero=' + IntToStr(Nro_Entrada));
      ConexaoBD.SQL_Comunitario.ExecSQL;

      // deleta nota de entrada
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_notas_entradas Where fb_nota_entrada_numero=' + IntToStr(Nro_Entrada));
      ConexaoBD.SQL_Comunitario.ExecSQL;

      ConexaoBD.SQL_FB_Notas_Entradas.Close;
      ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;

      MSG_Erro('Exclusão Efetuada com sucesso...');
      CancelamentoEntradas00.Close;
    End;
  End;
end;

procedure TCancelamentoEntradas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ConexaoBD.SQL_FB_Notas_Entradas.Close;
end;

end.
