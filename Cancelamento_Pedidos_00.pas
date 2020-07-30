unit Cancelamento_Pedidos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCancelamentosPedidos00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit_nro_pedido: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_Cliente: TEdit;
    Edit_Codigo: TEdit;
    Edit_Valor_Pedido: TEdit;
    Panel2: TPanel;
    BT_Cancelar: TBitBtn;
    BT_Sair: TBitBtn;
    Edit_Status: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_CancelarClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Edit_nro_pedidoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Obtem_Pedido(var Nro: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelamentosPedidos00: TCancelamentosPedidos00;
  Nro_Pedido: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TCancelamentosPedidos00.BT_SairClick(Sender: TObject);
begin
  CancelamentosPedidos00.Close;
end;

procedure TCancelamentosPedidos00.Obtem_Pedido(var Nro: String);
  Begin
  Ampulheta();
  Edit_Codigo.Text        :='';
  Edit_Cliente.Text       :='';
  Edit_Valor_Pedido.Text  :='';
// Verifica se o número do pedido foi digitado
  If Trim(Nro) = '' Then
    Begin
    MSG_Erro('Preencha o Campo ' + #39 + 'Nro Pedido' + #39 + ' Antes de Prosseguir...');

    BT_Cancelar.Enabled := False;
    End
  Else
    Begin
// Procura Pedido
    ConexaoBD.SQL_Pedidos.SQL.Clear;
    ConexaoBD.SQL_Pedidos.SQL.Add('Select * From pedidos Where (pedido_numero=' + Nro + ')');
    ConexaoBD.SQL_Pedidos.Open;
    If (ConexaoBD.SQL_Pedidos.Eof=True) And (ConexaoBD.SQL_Pedidos.Bof=True) Then
      Begin
      MSG_Erro('O pedido referente a essa nota não foi encontrado...');

      BT_Cancelar.Enabled := False;
      End
    Else
      Begin
      Edit_Cliente.Text       := ConexaoBD.SQL_Pedidospedido_cliente_nome.Text;
      Edit_Codigo.Text        := ConexaoBD.SQL_Pedidospedido_cliente_codigo.Text;
      Edit_Valor_Pedido.Text  := ConexaoBD.SQL_Pedidospedido_valor_total.Text;
      Edit_Status.Text        := ConexaoBD.SQL_Pedidospedido_status.Text;
    End;
    ConexaoBD.SQL_Pedidos.Close;
  End;
  Seta();
End;

procedure TCancelamentosPedidos00.BT_CancelarClick(Sender: TObject);
begin
  IF Trim(Nro_Pedido) <>'' Then
    Begin
    If Trim(Edit_Status.Text) = 'Faturado' Then
       Begin
       MSG_Erro('Pedido Já Faturado, Não pode ser Cancelado...');
       End
    Else If Confirma('Deseja realmente Excluir o pedido nº'+ Nro_Pedido +' ?')= 6 Then
      Begin

      // Seleciona os produtos da nota
      ConexaoBD.SQL_Pedidos_Produtos.SQL.Clear;
      ConexaoBD.SQL_Pedidos_Produtos.SQL.Add('Select * From pedidos_produtos Where pedido_produto_numero_pedido=' + Nro_Pedido);
      ConexaoBD.SQL_Pedidos_Produtos.Open;

      // Recoloca os produtos do estoque da Ibrasmak e gera informação
      // sobre movimentação do estoque
      { While ConexaoBD.SQL_Pedidos_Produtos.Eof = False Do
        Begin
        //*** Registra o Movto de Estoque ***
        FB_Registra_Movto_Estoque('11',Nro_Pedido,'0','-',Trim(ConexaoBD.SQL_Pedidos_Produtospedido_produto_codigo.Text),'0',Virgula_Ponto(Trim(ConexaoBD.SQL_Pedidos_Produtospedido_produto_quantidade.Text)));

        ConexaoBD.SQL_Pedidos_Produtos.Next;
      End; }

      // deleta Lista de Produtos vinculados ao pedido
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete From pedidos_produtos Where pedido_produto_numero_pedido=' + Edit_nro_pedido.Text);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      // deleta pedido
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete From pedidos Where pedido_numero=' + Edit_nro_pedido.Text);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Exclusão Efetuada com sucesso...');
      CancelamentosPedidos00.Close;
    End;
  End;
end;

procedure TCancelamentosPedidos00.BT_ProcurarClick(Sender: TObject);
begin
    Nro_Pedido := Edit_nro_pedido.Text;

    Obtem_Pedido(Nro_Pedido);
end;

procedure TCancelamentosPedidos00.Edit_nro_pedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
    Begin
    Nro_Pedido := Edit_nro_pedido.Text;

    Obtem_Pedido(Nro_Pedido);
  End;
  If Not(key in ['0'..'9',#8]) Then
    Begin
    key := #0;
  End;
end;

end.
