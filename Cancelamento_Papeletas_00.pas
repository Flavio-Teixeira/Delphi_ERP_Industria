unit Cancelamento_Papeletas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCancelamentoPapeletas00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit_nro_papeleta: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_Cliente: TEdit;
    Edit_Codigo: TEdit;
    Edit_Valor_Papeleta: TEdit;
    Panel2: TPanel;
    BT_Cancelar: TBitBtn;
    BT_Sair: TBitBtn;
    procedure Edit_nro_papeletaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_CancelarClick(Sender: TObject);
  private
    procedure Obtem_Pedido(var Nro: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelamentoPapeletas00: TCancelamentoPapeletas00;
  Nro_Papeleta, Nro_Pedido : String;
implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TCancelamentoPapeletas00.Edit_nro_papeletaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
    Begin
    Nro_Papeleta := Edit_nro_papeleta.Text;
    Obtem_Pedido(Nro_Papeleta);
  End;
  If Not(key in ['0'..'9',#8]) Then
    Begin
    key := #0;
  End;
end;

procedure TCancelamentoPapeletas00.BT_ProcurarClick(Sender: TObject);
begin
  Nro_Papeleta := Edit_nro_papeleta.Text;

  Obtem_Pedido(Nro_Papeleta);
end;

procedure TCancelamentoPapeletas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

Procedure TCancelamentoPapeletas00.Obtem_Pedido(var Nro: String);
  Begin
  Ampulheta();

  Edit_Codigo.Text          :='';
  Edit_Cliente.Text         :='';
  Edit_Valor_Papeleta.Text  :='';

  // Verifica se o número da papeleta foi digitado

  If Trim(Nro) = '' Then
     Begin
     MSG_Erro('Preencha o Campo ' + #39 + 'Nro Papeleta' + #39 + ' Antes de Prosseguir...');

     BT_Cancelar.Enabled := False;
     End
// Procura o número do pedido
  Else
     Begin
     ConexaoBD.SQL_FB_Papeletas.Close;
     ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
     ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * From fb_papeletas Where fb_papeleta_numero = ' + nro);
     ConexaoBD.SQL_FB_Papeletas.Open;

     // Verifica se o número da nota existe
     If ConexaoBD.SQL_FB_Papeletas.RecordCount <= 0 Then
        Begin
        MSG_Erro('Papeleta Não Encontrada...');

        BT_Cancelar.Enabled := False;
        End
     Else
        Begin

        // Procura o número do pedido

        Nro_Pedido := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nro_pedido.Text;

        If Trim(Nro_Pedido) = '' Then
           Begin
           Nro_pedido := '0';
        End;

        If StrToInt(Trim(Nro_Pedido)) <= 0 Then
           Begin
           ConexaoBD.SQL_FB_Movto_Estoque.Close;
           ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
           ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add('Select * From fb_movto_estoque Where (fb_movto_estoque_cod_registro = 52) And (fb_movto_estoque_nota = ' + Trim(nro) + ')');
           ConexaoBD.SQL_FB_Movto_Estoque.Open;

           If ConexaoBD.SQL_FB_Movto_Estoque.RecordCount > 0 Then
              Begin
              Nro_Pedido := ConexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_pedido.Text;
              End
           Else
              Begin
              Nro_Pedido := '0';
           End;
        End;

        Edit_Cliente.Text         := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text;
        Edit_Codigo.Text          := ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text;
        Edit_Valor_Papeleta.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
     End;
  End;

  Seta();
End;

procedure TCancelamentoPapeletas00.BT_SairClick(Sender: TObject);
begin
  CancelamentoPapeletas00.Close;
end;

procedure TCancelamentoPapeletas00.BT_CancelarClick(Sender: TObject);
begin
  IF Trim(Nro_Papeleta) <>'' Then
    Begin
    If Confirma('Deseja realmente Excluir a papeleta nº'+ Nro_Papeleta +' ?')= 6 Then
      Begin

      // Coloca o pedido de novo na lista de não atendidos

      { If StrToInt(Trim(Nro_Pedido)) > 0 Then
         Begin
         ConexaoBD.SQL_Comunitario.SQL.Clear;
         ConexaoBD.SQL_Comunitario.SQL.Add('Update pedidos Set pedido_status="Emissão" Where (pedido_empresa="Ibrasmak") And (pedido_numero=' + Nro_Pedido + ')');
         ConexaoBD.SQL_Comunitario.ExecSQL;
      End; }

      // Seleciona os produtos da papeleta
      ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Clear;
      ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Add('Select * From fb_papeletas_produtos Where fb_papeleta_produto_numero=' + Nro_Papeleta);
      ConexaoBD.SQL_FB_Papeletas_Produtos.Open;

      // deleta Lista de Produtos vinculados a papeleta
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_papeletas_produtos Where fb_papeleta_produto_numero=' + Edit_nro_papeleta.Text);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      // deleta papeleta
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_papeletas Where fb_papeleta_numero=' + Edit_nro_papeleta.Text);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      // deleta histórico
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_historicos Where (fb_historico_codigo_cliente =' +#39+ Edit_Codigo.Text +#39+ ') And (fb_historico_tipo_faturamento="Papeletas") And (fb_historico_nro_nota=' + Nro_Papeleta + ')');
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Exclusão Efetuada com sucesso...');
      CancelamentoPapeletas00.Close;
    End;
  End;


end;

end.
