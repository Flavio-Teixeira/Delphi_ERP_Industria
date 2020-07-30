unit Registro_OS_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, Mask;

type
  TRegistroOS00 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BT_Atualizar: TBitBtn;
    BT_Sair: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    Label1: TLabel;
    Total_Pedidos_Ibrasmak: TLabel;
    Tempo_Refresh: TTimer;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    BT_Procurar: TBitBtn;
    Label4: TLabel;
    Opcao_Faturamento: TComboBox;
    DBGrid_Pedidos: TDBGrid;
    Opcoes_Procura: TComboBox;
    Dados_Procura: TEdit;
    Label5: TLabel;
    Data_Inicial: TMaskEdit;
    Label6: TLabel;
    Data_Final: TMaskEdit;
    DBG_Cliente_Observacao: TDBMemo;
    DBG_Observacao_Nota: TDBMemo;
    DBG_Observacao_Fabrica: TDBMemo;
    DBG_Observacao_Faturamento: TDBMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AtualizarClick(Sender: TObject);
    procedure Tempo_RefreshTimer(Sender: TObject);
    procedure Opcao_FaturamentoChange(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Opcao_FaturamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_PedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_PedidosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistroOS00: TRegistroOS00;

implementation

uses Conexao_BD, Rotinas_Gerais, Faturamento_01, Pedidos_02;

var Selecionado: string;

{$R *.dfm}

//***************
//*** Funções ***
//***************

//******************
//*** Procedures ***
//******************

procedure TRegistroOS00.BT_SairClick(Sender: TObject);
begin
     RegistroOS00.Close;
end;

procedure TRegistroOS00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRegistroOS00.FormShow(Sender: TObject);
begin
     //*** Carrega data atual nos campos de periodo ***
     Data_Final.Text   := DateToStr(Date());
     Data_Inicial.Text := '01/' + Trim(Copy(Data_Final.Text,4,7));
 
     BT_ProcurarClick(Sender);
end;

procedure TRegistroOS00.BT_AtualizarClick(Sender: TObject);
begin
     BT_ProcurarClick(Sender);
end;

procedure TRegistroOS00.Tempo_RefreshTimer(Sender: TObject);
begin
     BT_ProcurarClick(Sender);
end;

procedure TRegistroOS00.Opcao_FaturamentoChange(Sender: TObject);
begin
     BT_ProcurarClick(Sender);
end;

procedure TRegistroOS00.BT_ProcurarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     Ampulheta();

     Comando_SQL := 'Select * FROM ';
     Comando_SQL := Comando_SQL + 'pedidos ';
     Comando_SQL := Comando_SQL + 'LEFT JOIN fb_notas_fiscais ';
     Comando_SQL := Comando_SQL + 'ON (pedido_numero = fb_nota_fiscal_nro_pedido) ';

     ConexaoBD.SQL_Pedidos_Geral.Close;
     ConexaoBD.SQL_Pedidos_Geral.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Nro.OS' Then
           Begin
           Comando_SQL := Comando_SQL + 'WHERE (pedido_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and pedido_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ') AND pedido_numero = ' + Trim(Dados_Procura.Text);
           End
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           Comando_SQL := Comando_SQL + 'WHERE (pedido_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and pedido_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ') AND pedido_cliente_nome Like '  +#39+ Trim(Dados_Procura.Text) +'%'+#39;
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Nro.OS' Then
           Begin
           Comando_SQL := Comando_SQL + 'WHERE (pedido_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and pedido_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ')';
           End
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           Comando_SQL := Comando_SQL + 'WHERE (pedido_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and pedido_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ')';
        End;

     End;

     If Trim(Opcao_Faturamento.Text) <> '--- TODOS ---' Then
        Begin
        Comando_SQL := Comando_SQL + ' AND pedido_status = ' +#39+ Trim(Opcao_Faturamento.Text) + #39;
     End;

     Comando_SQL := Comando_SQL + ' ORDER BY pedido_numero Desc';

     ConexaoBD.SQL_Pedidos_Geral.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Pedidos_Geral.Open;

     Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_Pedidos_Geral.RecordCount);

     DBGrid_Pedidos.Refresh;

     Seta();
end;

procedure TRegistroOS00.Opcao_FaturamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroOS00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroOS00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroOS00.DBGrid_PedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (Trim(DBGrid_Pedidos.Fields[6].Text) = 'Aguardando') Or (Trim(DBGrid_Pedidos.Fields[6].Text) = '') Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clRed;
        End
     Else If Trim(DBGrid_Pedidos.Fields[6].Text) = 'Semi-Faturado' Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clSkyBlue;
        End
     Else If Trim(DBGrid_Pedidos.Fields[6].Text) = 'Faturado' Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clMoneyGreen;
        End
     Else
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clRed;
     End;

     DBGrid_Pedidos.DefaultDrawDataCell(Rect, DBGrid_Pedidos.columns[datacol].field, State);
end;

procedure TRegistroOS00.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroOS00.Data_FinalKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroOS00.DBGrid_PedidosDblClick(Sender: TObject);

var
    Nro_Pedido, Codigo_Cliente, Vlr_Exibicao: String;
    Erro: Integer;
    Vlr_Numero: Real;

begin
    If Trim(DBGrid_Pedidos.Fields[0].Text) <> '' Then
       Begin

       Selecionado := DBGrid_Pedidos.Fields[0].Text;

       If (Pedidos02 = Nil) Then Begin
         Ampulheta();
         Application.CreateForm(TPedidos02,Pedidos02);

         //*** Obtem os Dados do Pedido ***

         Nro_Pedido := Trim(Selecionado);

         ConexaoBD.SQL_NF_FB_Pedidos.Close;
         ConexaoBD.SQL_NF_FB_Pedidos.SQL.Clear;
         ConexaoBD.SQL_NF_FB_Pedidos.SQL.Add('Select * from pedidos Where pedido_numero IN (' + Trim(Nro_Pedido) + ')' );
         ConexaoBD.SQL_NF_FB_Pedidos.Open;

         ConexaoBD.SQL_NF_FB_Pedidos.First;

         Pedidos02.Nro_Pedido_Unico.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_numero.Text;

         //*** Obtem os Dados dos Clientes ***

         Codigo_Cliente := ConexaoBD.SQL_NF_FB_Pedidospedido_cliente_codigo.Text;

         ConexaoBD.SQL_Clientes.Close;
         ConexaoBD.SQL_Clientes.SQL.Clear;
         ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
         ConexaoBD.SQL_Clientes.Open;

         //*** Carrega os Dados Obtidos ***

         Pedidos02.Nro_Pedido.Text               := Nro_Pedido;
         Pedidos02.Pedido_Data_Inclusao.Text     := conexaoBD.SQL_NF_FB_Pedidospedido_data.Text;
         if conexaoBD.SQL_NF_FB_Pedidospedido_empresa.Text = 'Ibrasmak' Then begin
             Pedidos02.Pedido_Empresa.ItemIndex  := 0;
             end
         else begin
             Pedidos02.Pedido_Empresa.ItemIndex  := 1;
         end;
         Pedidos02.Cliente_Codigo.Text           := conexaoBD.SQL_Clientesfb_cliente_codigo.Text;
         Pedidos02.Cliente_Codigo_Tipo.Text      := conexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text;
         Pedidos02.Cliente_Nome.Text             := conexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

         //*** Endereço Normal ***

         Pedidos02.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
         Pedidos02.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
         Pedidos02.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
         Pedidos02.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
         Pedidos02.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
         Pedidos02.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

         //*** Continua Carregando os Dados ***

         Pedidos02.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
         Pedidos02.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone_comercial.Text;
         Pedidos02.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
         Pedidos02.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fone_fax.Text;
         Pedidos02.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;
         Pedidos02.Cliente_Site.Text             := conexaoBD.SQL_Clientesfb_cliente_site.Text;

         Pedidos02.Pedido_Data.Text              := conexaoBD.SQL_NF_FB_Pedidospedido_data.Text;

         Pedidos02.Porcentagem_Desconto.Text     := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_desconto.Text;

         //Pedidos02.Cliente_Condicao_Pgto_1.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_1.Text;
         //Pedidos02.Cliente_Condicao_Pgto_2.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_2.Text;
         //Pedidos02.Cliente_Condicao_Pgto_3.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_3.Text;
         //Pedidos02.Cliente_Condicao_Pgto_4.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_4.Text;

         Pedidos02.Cliente_Tipo_Faturamento.ItemIndex := Obtem_Nro_Tipo_Faturamento(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_tipo_faturamento.Text);
         Pedidos02.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_emite_lote.Text);
         Pedidos02.Cliente_Transportadora.ItemIndex   := Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text);
         Pedidos02.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_tipo_transporte.Text);
         Pedidos02.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text));
         Pedidos02.Codigo_Transportadora.Text         := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text;
         Pedidos02.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_pgto_frete.Text));
         Pedidos02.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(conexaoBD.SQL_NF_FB_Pedidospedido_natureza_operacao.Text,'0'));

         Pedidos02.Observacao_Nota.Lines.Clear;
         Pedidos02.Observacao_Nota.Lines.Add(DBG_Observacao_Nota.Text);

         Pedidos02.Cliente_Observacao.Lines.Clear;
         Pedidos02.Cliente_Observacao.Lines.Add(DBG_Cliente_Observacao.Text);

         Pedidos02.Observacao_Faturamento.Lines.Clear;
         Pedidos02.Observacao_Faturamento.Lines.Add(DBG_Observacao_Faturamento.Text);

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_frete.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         Pedidos02.Valor_Frete.Text := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_desconto.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         Pedidos02.Valor_Desconto.Text := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_pedido.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         Pedidos02.Valor_Pedido.Text := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_total.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         Pedidos02.Valor_Total.Text   := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_ipi.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         Pedidos02.Valor_IPI.Text    := Vlr_Exibicao;

         Pedidos02.Data_Entrega.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_data_entrega.Text;

         Pedidos02.Status_Pedido.Text := DBGrid_Pedidos.Fields[5].Text;

         Pedidos02.Parcela_Descricao.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_descricao.Text;

         If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '' Then Begin
           Pedidos02.Cliente_Suframa.Caption := 'COM SUFRAMA';
           Pedidos02.Valor_IPI.Text := '0,00';
           End
         Else Begin
           Pedidos02.Cliente_Suframa.Caption := '';
         End;

         //*** Opções de Financiamento ***

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_bnds.Text) = 'S' Then
            Begin
            Pedidos02.Financiamento_BNDS.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_proger.Text) = 'S' Then
            Begin
            Pedidos02.Financiamento_Proger.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_leasing.Text) = 'S' Then
            Begin
            Pedidos02.Financiamento_Leasing.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_ibrasmak.Text) = 'S' Then
            Begin
            Pedidos02.Financiamento_Ibrasmak.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_vista.Text) = 'S' Then
            Begin
            Pedidos02.Pagamento_Vista.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_parcelado.Text) = 'S' Then
            Begin
            Pedidos02.Pagamento_Parcelado.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_combinar.Text) = 'S' Then
            Begin
            Pedidos02.Pagamento_Combinar.Checked := True;
         End;

         Pedidos02.Parcela_Nro.Text         := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_nro.Text);
         Pedidos02.Parcela_Vencto.Text      := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_vencto.Text);
         Pedidos02.Parcela_Dias_Vencto.Text := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_dias_vencto.Text);

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_mes_subsequente.Text) = 'S' Then
            Begin
            Pedidos02.Parcela_Mes_Subsequente.Checked := True;
         End;

         Pedidos02.Parcela_Porcentagem_Ato.Text := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_porcentagem_ato.Text);
         Pedidos02.Parcela_Vlr_Ato.Text         := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_vlr_ato.Text);
         Pedidos02.Parcela_Prazo_Inicio.Text    := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_prazo_inicio.Text);

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_opc_fabrica.Text) = 'S' Then
            Begin
            Pedidos02.OPC_Fabrica.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_opc_faturamento.Text) = 'S' Then
            Begin
            Pedidos02.OPC_Faturamento.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_opc_nao_imprimir.Text) = 'S' Then
            Begin
            Pedidos02.OPC_Nao_Imprimir.Checked := True;
         End;

         Pedidos02.Observacao_Fabrica.Lines.Clear;
         Pedidos02.Observacao_Fabrica.Lines.Add(DBG_Observacao_Fabrica.Text);

         Pedidos02.Cliente_Alimentacao.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_alimentacao.Text;
         Pedidos02.Cliente_Peso.Text        := ConexaoBD.SQL_NF_FB_Pedidospedido_peso.Text;
         Pedidos02.Cliente_Volume.Text      := ConexaoBD.SQL_NF_FB_Pedidospedido_volume.Text;
         Pedidos02.Cliente_Solicitado.Text  := ConexaoBD.SQL_NF_FB_Pedidospedido_solicitado.Text;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_pedido.Text) = 'S' Then
            Begin
            Pedidos02.Parcela_Pedido.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_faturamento.Text) = 'S' Then
            Begin
            Pedidos02.Parcela_Faturamento.Checked := True;
         End;

         Pedidos02.Cliente_Ordem_Compra.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_ordem_compra.Text;

         //*** Fecha SQL ***

         ConexaoBD.SQL_NF_FB_Pedidos.Close;
         ConexaoBD.SQL_Clientes.Close;

         Seta();

       End;

       Pedidos02.BT_Procurar.Visible        := False;
       Pedidos02.BT_Produtos.Visible        := False;
       Pedidos02.BT_Imprimir.Visible        := True;
       Pedidos02.BT_Alterar_Pedidos.Visible := False;
       Pedidos02.BT_Excluir.Visible         := False;
       Pedidos02.BT_Faturamento.Visible     := False;
       Pedidos02.OPC_Fabrica.Visible        := True;
       Pedidos02.OPC_Faturamento.Visible    := True;
       Pedidos02.OPC_Nao_Imprimir.Visible   := False;
       Pedidos02.BT_Adicionar.Visible       := False;
       Pedidos02.BT_Adicionar_Transportadora.Visible := False;
       Pedidos02.Registro_OS_Geral.Text     := 'Ativo';

       Pedidos02.ShowModal;

       ConexaoBD.SQL_Pedidos.Locate('pedido_numero',Trim(Selecionado),[]);
    End;
end;

end.
