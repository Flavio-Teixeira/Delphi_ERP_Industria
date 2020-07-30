unit Historicos_Pedidos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  THistoricosPedidos00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Pedidos: TDBGrid;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    DBG_Cliente_Observacao: TDBMemo;
    DBG_Observacao_Nota: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    DBG_Observacao_Fabrica: TDBMemo;
    DBG_Observacao_Faturamento: TDBMemo;
    Label8: TLabel;
    Linhas_Selecionadas: TMemo;
    BT_Faturamento: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure DBGrid_PedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_PedidosDblClick(Sender: TObject);
    procedure DBGrid_PedidosCellClick(Column: TColumn);
    procedure BT_FaturamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoricosPedidos00: THistoricosPedidos00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, Historicos_Pedidos_01;

var Selecionado: string;

{$R *.dfm}

procedure THistoricosPedidos00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure THistoricosPedidos00.FormShow(Sender: TObject);
begin
    If Trim(Dados_Procura.Text) <> '' Then
       Begin
       BT_ProcurarClick(Sender);
       End
    Else
       Begin
       ConexaoBD.SQL_Pedidos.Close;
       ConexaoBD.SQL_Pedidos.SQL.Clear;
       ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Order By pedido_numero');
       ConexaoBD.SQL_Pedidos.Open;
    End;
end;

procedure THistoricosPedidos00.BT_SairClick(Sender: TObject);
begin
     HistoricosPedidos00.Close;
end;

procedure THistoricosPedidos00.DBGrid_PedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (DBGrid_Pedidos.Fields[5].Text = 'Aguardando') Or (DBGrid_Pedidos.Fields[5].Text = '') Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clRed;
        End
     Else If DBGrid_Pedidos.Fields[5].Text = 'Semi-Faturado' Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clSkyBlue;
     End;

     DBGrid_Pedidos.DefaultDrawDataCell(Rect, DBGrid_Pedidos.columns[datacol].field, State);
end;

procedure THistoricosPedidos00.Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosPedidos00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosPedidos00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_Pedidos.Close;
     ConexaoBD.SQL_Pedidos.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Nro.OS' Then
           Begin
           ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Where pedido_numero = ' + Trim(Dados_Procura.Text) + ' Order By pedido_numero');
           End
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Where pedido_cliente_nome Like '  +#39+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By pedido_numero');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Nro.OS' Then
           Begin
           ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Order By pedido_numero');
           End        
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Order By pedido_numero');
        End;

     End;

     ConexaoBD.SQL_Pedidos.Open;

     Seta();
end;

procedure THistoricosPedidos00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     HistoricosPedidos00 := Nil; 
end;

procedure THistoricosPedidos00.DBGrid_PedidosDblClick(Sender: TObject);

var
    Nro_Pedido, Codigo_Cliente, Vlr_Exibicao: String;
    Erro: Integer;
    Vlr_Numero: Real;

begin
    If Trim(Linhas_Selecionadas.Text) <> '' Then
       Begin

       Selecionado := DBGrid_Pedidos.Fields[0].Text;

       If (HistoricosPedidos01 = Nil) Then Begin
         Ampulheta();
         Application.CreateForm(THistoricosPedidos01,HistoricosPedidos01);

         //*** Obtem os Dados do Pedido ***

         Nro_Pedido := Trim(Linhas_Selecionadas.Text);

         ConexaoBD.SQL_NF_FB_Pedidos.Close;
         ConexaoBD.SQL_NF_FB_Pedidos.SQL.Clear;
         ConexaoBD.SQL_NF_FB_Pedidos.SQL.Add('Select * from pedidos Where pedido_numero IN (' + Trim(Nro_Pedido) + ')' );
         ConexaoBD.SQL_NF_FB_Pedidos.Open;

         ConexaoBD.SQL_NF_FB_Pedidos.First;

         HistoricosPedidos01.Nro_Pedido_Unico.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_numero.Text;

         //*** Obtem os Dados dos Clientes ***

         Codigo_Cliente := ConexaoBD.SQL_NF_FB_Pedidospedido_cliente_codigo.Text;

         ConexaoBD.SQL_Clientes.Close;
         ConexaoBD.SQL_Clientes.SQL.Clear;
         ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
         ConexaoBD.SQL_Clientes.Open;

         //*** Carrega os Dados Obtidos ***

         HistoricosPedidos01.Nro_Pedido.Text               := Nro_Pedido;
         HistoricosPedidos01.Pedido_Data_Inclusao.Text     := conexaoBD.SQL_NF_FB_Pedidospedido_data.Text;
         if conexaoBD.SQL_NF_FB_Pedidospedido_empresa.Text = 'Ibrasmak' Then begin
             HistoricosPedidos01.Pedido_Empresa.ItemIndex  := 0;
             end
         else begin
             HistoricosPedidos01.Pedido_Empresa.ItemIndex  := 1;
         end;
         HistoricosPedidos01.Cliente_Codigo.Text           := conexaoBD.SQL_Clientesfb_cliente_codigo.Text;
         HistoricosPedidos01.Cliente_Codigo_Tipo.Text      := conexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text;
         HistoricosPedidos01.Cliente_Nome.Text             := conexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

         //*** Endereço Normal ***

         HistoricosPedidos01.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
         HistoricosPedidos01.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
         HistoricosPedidos01.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
         HistoricosPedidos01.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
         HistoricosPedidos01.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
         HistoricosPedidos01.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

         //*** Continua Carregando os Dados ***

         HistoricosPedidos01.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
         HistoricosPedidos01.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone_comercial.Text;
         HistoricosPedidos01.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
         HistoricosPedidos01.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fone_fax.Text;
         HistoricosPedidos01.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;
         HistoricosPedidos01.Cliente_Site.Text             := conexaoBD.SQL_Clientesfb_cliente_site.Text;

         HistoricosPedidos01.Pedido_Data.Text              := conexaoBD.SQL_NF_FB_Pedidospedido_data.Text;

         //HistoricosPedidos01.Cliente_Desconto.Text              := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_desconto.Text;
         //HistoricosPedidos01.Cliente_Condicao_Pgto_1.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_1.Text;
         //HistoricosPedidos01.Cliente_Condicao_Pgto_2.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_2.Text;
         //HistoricosPedidos01.Cliente_Condicao_Pgto_3.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_3.Text;
         //HistoricosPedidos01.Cliente_Condicao_Pgto_4.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_4.Text;

         HistoricosPedidos01.Cliente_Tipo_Faturamento.ItemIndex := Obtem_Nro_Tipo_Faturamento(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_tipo_faturamento.Text);
         HistoricosPedidos01.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_emite_lote.Text);
         HistoricosPedidos01.Cliente_Transportadora.ItemIndex   := Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text);
         HistoricosPedidos01.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_tipo_transporte.Text);
         HistoricosPedidos01.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text));
         HistoricosPedidos01.Codigo_Transportadora.Text         := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text;
         HistoricosPedidos01.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_pgto_frete.Text));
         HistoricosPedidos01.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(conexaoBD.SQL_NF_FB_Pedidospedido_natureza_operacao.Text,'0'));

         HistoricosPedidos01.Observacao_Nota.Lines.Clear;
         HistoricosPedidos01.Observacao_Nota.Lines.Add(DBG_Observacao_Nota.Text);

         HistoricosPedidos01.Cliente_Observacao.Lines.Clear;
         HistoricosPedidos01.Cliente_Observacao.Lines.Add(DBG_Cliente_Observacao.Text);

         HistoricosPedidos01.Observacao_Faturamento.Lines.Clear;
         HistoricosPedidos01.Observacao_Faturamento.Lines.Add(DBG_Observacao_Faturamento.Text);

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_frete.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         HistoricosPedidos01.Valor_Frete.Text := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_desconto.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         HistoricosPedidos01.Valor_Desconto.Text := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_pedido.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         HistoricosPedidos01.Valor_Pedido.Text := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_total.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         HistoricosPedidos01.Valor_Total.Text   := Vlr_Exibicao;

         Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_ipi.Text));
         Val(Vlr_Exibicao,Vlr_Numero,Erro);
         Str(Vlr_Numero:13:2,Vlr_Exibicao);
         Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

         HistoricosPedidos01.Valor_IPI.Text    := Vlr_Exibicao;

         HistoricosPedidos01.Data_Entrega.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_data_entrega.Text;

         HistoricosPedidos01.Status_Pedido.Text := DBGrid_Pedidos.Fields[5].Text;

         HistoricosPedidos01.Parcela_Descricao.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_descricao.Text;

         If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '' Then Begin
           HistoricosPedidos01.Cliente_Suframa.Caption := 'COM SUFRAMA';
           HistoricosPedidos01.Valor_IPI.Text := '0,00';
           End
         Else Begin
           HistoricosPedidos01.Cliente_Suframa.Caption := '';
         End;

         //*** Opções de Financiamento ***

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_bnds.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Financiamento_BNDS.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_proger.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Financiamento_Proger.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_leasing.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Financiamento_Leasing.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_ibrasmak.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Financiamento_Ibrasmak.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_vista.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Pagamento_Vista.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_parcelado.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Pagamento_Parcelado.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_combinar.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Pagamento_Combinar.Checked := True;
         End;

         HistoricosPedidos01.Parcela_Nro.Text         := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_nro.Text);
         HistoricosPedidos01.Parcela_Vencto.Text      := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_vencto.Text);
         HistoricosPedidos01.Parcela_Dias_Vencto.Text := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_dias_vencto.Text);

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_mes_subsequente.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Parcela_Mes_Subsequente.Checked := True;
         End;

         HistoricosPedidos01.Parcela_Porcentagem_Ato.Text := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_porcentagem_ato.Text);
         HistoricosPedidos01.Parcela_Vlr_Ato.Text         := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_vlr_ato.Text);
         HistoricosPedidos01.Parcela_Prazo_Inicio.Text    := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_prazo_inicio.Text);

         HistoricosPedidos01.Observacao_Fabrica.Lines.Clear;
         HistoricosPedidos01.Observacao_Fabrica.Lines.Add(DBG_Observacao_Fabrica.Text);

         HistoricosPedidos01.Cliente_Alimentacao.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_alimentacao.Text;
         HistoricosPedidos01.Cliente_Peso.Text        := ConexaoBD.SQL_NF_FB_Pedidospedido_peso.Text;
         HistoricosPedidos01.Cliente_Volume.Text      := ConexaoBD.SQL_NF_FB_Pedidospedido_volume.Text;
         HistoricosPedidos01.Cliente_Solicitado.Text  := ConexaoBD.SQL_NF_FB_Pedidospedido_solicitado.Text;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_pedido.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Parcela_Pedido.Checked := True;
         End;

         If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_faturamento.Text) = 'S' Then
            Begin
            HistoricosPedidos01.Parcela_Faturamento.Checked := True;
         End;

         //*** Fecha SQL ***

         ConexaoBD.SQL_NF_FB_Pedidos.Close;
         ConexaoBD.SQL_Clientes.Close;

         Seta();

       End;

       HistoricosPedidos01.ShowModal;

       ConexaoBD.SQL_Pedidos.Locate('pedido_numero',Trim(Selecionado),[]);
    End;

    Linhas_Selecionadas.Lines.Clear;
end;

procedure THistoricosPedidos00.DBGrid_PedidosCellClick(Column: TColumn);

var
  contador: Integer;
  Linha_Lista : String;

begin
    If DBGrid_Pedidos.Fields[0].Text <> '' Then begin
        Linha_Lista := '';
        With DBGrid_Pedidos do Begin
          for contador:= 0 to Pred(SelectedRows.Count) do Begin
            Datasource.Dataset.Bookmark:= SelectedRows[contador]; // posiciona nos registros selecionados do DBGrid
            If (contador > 0) then
               Begin
               Linha_Lista := Trim(Linha_Lista) + ', ' + Trim(Fields[0].Text);
               End
            Else
               Begin
               Linha_Lista := Trim(Fields[0].Text);
            End;
          end;
        end;

        Linha_Lista := Trim(Linha_Lista);

        Linhas_Selecionadas.Lines.Clear;
        Linhas_Selecionadas.Lines.Add(Linha_Lista);
    End;
end;

procedure THistoricosPedidos00.BT_FaturamentoClick(Sender: TObject);
begin
     DBGrid_PedidosDblClick(Sender);
end;

end.
