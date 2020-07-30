unit Cancelamento_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCancelamentoSaidas00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit_nro_nota_fiscal: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BT_Cancelar: TBitBtn;
    BT_Sair: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_Cliente: TEdit;
    Edit_Codigo: TEdit;
    Edit_Valor_Nota: TEdit;
    Label6: TLabel;
    Opc_Ibrasmak: TRadioButton;
    Opc_Monibras: TRadioButton;
    procedure Edit_nro_nota_fiscalKeyPress(Sender: TObject; var Key: Char);
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
  CancelamentoSaidas00: TCancelamentoSaidas00;
  Nro_Nota, Nro_Pedido : String;
implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TCancelamentoSaidas00.Edit_nro_nota_fiscalKeyPress(Sender: TObject; var Key: Char);
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

procedure TCancelamentoSaidas00.BT_ProcurarClick(Sender: TObject);
begin
  Nro_Nota := Edit_nro_nota_fiscal.Text;

  Obtem_Pedido(Nro_Nota);
end;

procedure TCancelamentoSaidas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

Procedure TCancelamentoSaidas00.Obtem_Pedido(var Nro: String);
Begin
  Ampulheta();

  Edit_Codigo.Text      :='';
  Edit_Cliente.Text     :='';
  Edit_Valor_Nota.Text  :='';

  // Verifica se o número da nota foi digitado

  If Trim(Nro) = '' Then
     Begin
     MSG_Erro('Preencha o Campo ' + #39 + 'Nro Nota Fiscal' + #39 + ' Antes de Prosseguir...');

     BT_Cancelar.Enabled := False;
     End
  Else
     Begin

     BT_Cancelar.Enabled := True;

     If Opc_Ibrasmak.Checked Then
        Begin

        // Verifica se o número da nota existe

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * From fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Nro);
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount <= 0 Then
           Begin
           MSG_Erro('Nota Não Encontrada...');

           BT_Cancelar.Enabled := False;
           End
        Else
           Begin

           // Procura o número do pedido

           Nro_Pedido := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nro_pedido.Text;

           If Trim(Nro_Pedido) = '' Then
              Begin
              Nro_pedido := '0';
           End;

           If StrToInt(Trim(Nro_Pedido)) <= 0 Then
              Begin
              ConexaoBD.SQL_FB_Movto_Estoque.Close;
              ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
              ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add('Select * From fb_movto_estoque Where (fb_movto_estoque_cod_registro = 51) And (fb_movto_estoque_nota = ' + Trim(Nro) + ')');
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

           Edit_Cliente.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;
           Edit_Codigo.Text      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
           Edit_Valor_Nota.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
        End;

        End
     Else
        Begin

        // Verifica se o número da nota existe

        ConexaoBD.SQL_MB_Nota_Fiscal.Close;
        ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add('Select * From mb_notas_fiscais Where mb_nota_fiscal_numero = ' + Nro);
        ConexaoBD.SQL_MB_Nota_Fiscal.Open;

        If ConexaoBD.SQL_MB_Nota_Fiscal.RecordCount <= 0 Then
           Begin
           MSG_Erro('Nota Não Encontrada...');

           BT_Cancelar.Enabled := False;
           End
        Else
           Begin

           // Procura o número do pedido

           Nro_Pedido := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_nro_pedido.Text;

           If Trim(Nro_Pedido) = '' Then
              Begin
              Nro_pedido := '0';
           End;

           If StrToInt(Trim(Nro_Pedido)) <= 0 Then
              Begin
              ConexaoBD.SQL_FB_Movto_Estoque.Close;
              ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
              ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add('Select * From fb_movto_estoque Where (fb_movto_estoque_cod_registro = 51) And (fb_movto_estoque_nota = ' + Trim(Nro) + ')');
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

           Edit_Cliente.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_nome.Text;
           Edit_Codigo.Text      := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_codigo.Text;
           Edit_Valor_Nota.Text  := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
        End;

     End;

  End;

  Seta();
End;

procedure TCancelamentoSaidas00.BT_SairClick(Sender: TObject);
begin
  CancelamentoSaidas00.Close;
end;

procedure TCancelamentoSaidas00.BT_CancelarClick(Sender: TObject);
begin
    IF Trim(Nro_Nota) <>'' Then
      Begin
      If Confirma('Deseja realmente Excluir a nota nº'+ Nro_Nota +' ?')= 6 Then
        Begin

        // Coloca o pedido de novo na lista de não atendidos

        If StrToInt(Trim(Nro_Pedido)) > 0 Then
           Begin
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('Update pedidos Set pedido_status=' +#39+ 'Aguardando' +#39+ 'Where pedido_numero=' + Nro_Pedido );
           ConexaoBD.SQL_Comunitario.ExecSQL;
        End;

        If Opc_Ibrasmak.Checked Then
           Begin

           // Seleciona os produtos da nota
           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add('Select * From fb_notas_fiscais_produtos Where fb_nota_fiscal_produto_numero=' + Nro_Nota);
           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

           // deleta Lista de Produtos vinculados a nota
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_notas_fiscais_produtos Where fb_nota_fiscal_produto_numero=' + Edit_nro_nota_fiscal.Text);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           // deleta nota fiscal
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_notas_fiscais Where fb_nota_fiscal_numero=' + Edit_nro_nota_fiscal.Text);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           // deleta histórico
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete From fb_historicos Where (fb_historico_codigo_cliente =' +#39+ Edit_Codigo.Text +#39+ ') And (fb_historico_tipo_faturamento="Nota Fiscal") And (fb_historico_nro_nota=' + Nro_Nota + ')');
           ConexaoBD.SQL_Comunitario.ExecSQL;

           End
        Else
           Begin
           // Seleciona os produtos da nota
           ConexaoBD.SQL_MB_Nota_Fiscal_Produto.SQL.Clear;
           ConexaoBD.SQL_MB_Nota_Fiscal_Produto.SQL.Add('Select * From mb_notas_fiscais_produtos Where mb_nota_fiscal_produto_numero=' + Nro_Nota);
           ConexaoBD.SQL_MB_Nota_Fiscal_Produto.Open;

           // deleta Lista de Produtos vinculados a nota
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete From mb_notas_fiscais_produtos Where mb_nota_fiscal_produto_numero=' + Edit_nro_nota_fiscal.Text);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           // deleta nota fiscal
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add('Delete From mb_notas_fiscais Where mb_nota_fiscal_numero=' + Edit_nro_nota_fiscal.Text);
           ConexaoBD.SQL_Comunitario.ExecSQL;
        End;

        MSG_Erro('Exclusão Efetuada com sucesso...');
        CancelamentoSaidas00.Close;
      End;
    End;
end;

end.
