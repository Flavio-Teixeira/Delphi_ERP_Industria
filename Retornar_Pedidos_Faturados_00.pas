unit Retornar_Pedidos_Faturados_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TRetornarPedidosFaturados00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit_nro_faturado: TEdit;
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
    procedure Edit_nro_faturadoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Obtem_Pedido(var Nro: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RetornarPedidosFaturados00: TRetornarPedidosFaturados00;
  Nro_Pedido: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TRetornarPedidosFaturados00.BT_SairClick(Sender: TObject);
begin
  RetornarPedidosFaturados00.Close;
end;

procedure TRetornarPedidosFaturados00.Obtem_Pedido(var Nro: String);
  Begin
  Ampulheta();
  Edit_Codigo.Text        :='';
  Edit_Cliente.Text       :='';
  Edit_Valor_Pedido.Text  :='';
// Verifica se o número do faturado foi digitado
  If Trim(Nro) = '' Then
    Begin
    MSG_Erro('Preencha o Campo ' + #39 + 'Nro Pedido' + #39 + ' Antes de Prosseguir...');

    BT_Cancelar.Enabled := False;
    End
  Else
    Begin
// Procura Pedido
    ConexaoBD.SQL_Faturados.SQL.Clear;
    ConexaoBD.SQL_Faturados.SQL.Add('Select * From faturados Where (faturado_pedido_numero = ' + Nro + ')');
    ConexaoBD.SQL_Faturados.Open;
    If (ConexaoBD.SQL_Faturados.Eof=True) And (ConexaoBD.SQL_Faturados.Bof=True) Then
      Begin
      MSG_Erro('O faturado referente a essa nota não foi encontrado...');

      BT_Cancelar.Enabled := False;
      End
    Else
      Begin
      Edit_Cliente.Text       := ConexaoBD.SQL_Faturadosfaturado_cliente_nome.Text;
      Edit_Codigo.Text        := ConexaoBD.SQL_Faturadosfaturado_cliente_codigo.Text;
      Edit_Valor_Pedido.Text  := ConexaoBD.SQL_Faturadosfaturado_valor_total.Text;
      Edit_Status.Text        := ConexaoBD.SQL_Faturadosfaturado_status.Text;
      Nro_Pedido              := ConexaoBD.SQL_Faturadosfaturado_numero.Text;
    End;
    ConexaoBD.SQL_Faturados.Close;
  End;
  Seta();
End;

procedure TRetornarPedidosFaturados00.BT_CancelarClick(Sender: TObject);
begin
  IF Trim(Edit_nro_faturado.Text) <>'' Then
    Begin
    If Trim(Edit_Status.Text) = 'Faturado' Then
       Begin
       ConexaoBD.SQL_Comunitario.SQL.Clear;
       ConexaoBD.SQL_Comunitario.SQL.Add('Update faturados Set faturado_status = ' +#39+ 'Aguardando' +#39+ ' Where faturado_pedido_numero = ' + Trim(Edit_nro_faturado.Text));
       ConexaoBD.SQL_Comunitario.ExecSQL;

       MSG_Erro('Retorno do Pedido Efetuado com sucesso...');
       RetornarPedidosFaturados00.Close;
       End
    Else
       Begin
       MSG_Erro('Pedido Não Faturado, Não pode ser Retornado...');
    End;

  End;
end;

procedure TRetornarPedidosFaturados00.BT_ProcurarClick(Sender: TObject);
begin
    Nro_Pedido := Trim(Edit_nro_faturado.Text);
    Obtem_Pedido(Nro_Pedido);
end;

procedure TRetornarPedidosFaturados00.Edit_nro_faturadoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
    Begin
    Nro_Pedido := Edit_nro_faturado.Text;
    Obtem_Pedido(Nro_Pedido);
  End;
  If Not(key in ['0'..'9',#8]) Then
    Begin
    key := #0;
  End;
end;

procedure TRetornarPedidosFaturados00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     RetornarPedidosFaturados00 := Nil;
end;

end.
