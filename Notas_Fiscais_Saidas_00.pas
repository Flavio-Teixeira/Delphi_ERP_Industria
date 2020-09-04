unit Notas_Fiscais_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, Mask;

type
  TNotasFiscaisSaidas00 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BT_Atualizar: TBitBtn;
    BT_Sair: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBG_Pedidos_Ibrasmak: TDBGrid;
    Panel5: TPanel;
    Label1: TLabel;
    Total_Pedidos_Ibrasmak: TLabel;
    Tempo_Refresh: TTimer;
    DBG_FB_Cliente_Observacao: TDBMemo;
    DBG_FB_Observacao_Logistica: TDBMemo;
    DBG_FB_Observacao_Nota: TDBMemo;
    DBG_Observacao_Fabrica: TDBMemo;
    DBG_Observacao_Faturamento: TDBMemo;
    GroupBox2: TGroupBox;
    DBG_Pedidos_Monibras: TDBGrid;
    Panel4: TPanel;
    Label2: TLabel;
    Total_Pedidos_Monibras: TLabel;
    DBG_MB_Cliente_Observacao: TDBMemo;
    DBG_MB_Observacao_Nota: TDBMemo;
    DBG_MB_Observacao_Fabrica: TDBMemo;
    DBG_MB_Observacao_Faturamento: TDBMemo;
    Tipo_Emissao_Nota: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AtualizarClick(Sender: TObject);
    procedure Tempo_RefreshTimer(Sender: TObject);
    procedure DBG_Pedidos_IbrasmakDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBG_Pedidos_IbrasmakCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBG_Pedidos_MonibrasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBG_Pedidos_MonibrasCellClick(Column: TColumn);
  private
    { Private declarations }
    procedure Atualiza_Grid_Ibrasmak();
  public
    { Public declarations }
  end;

var
  NotasFiscaisSaidas00: TNotasFiscaisSaidas00;

implementation

uses Conexao_BD, Rotinas_Gerais, Notas_Fiscais_Saidas_01,
  Notas_Fiscais_Saidas_02;

var Selecionado: string;

{$R *.dfm}

//***************
//*** Funções ***
//***************

//******************
//*** Procedures ***
//******************

procedure TNotasFiscaisSaidas00.Atualiza_Grid_Ibrasmak();
begin
     Ampulheta();
     ConexaoBD.SQL_NF_FB_Faturados.Close;
     ConexaoBD.SQL_NF_FB_Faturados.SQL.Clear;
     ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where (faturado_status <> '+#39+'Faturado'+#39+') and (faturado_empresa <> '+#39+'Monibras'+#39+') Order By faturado_cliente_tipo_faturamento, faturado_numero');
     ConexaoBD.SQL_NF_FB_Faturados.Open;

     Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_NF_FB_Faturados.RecordCount);


     ConexaoBD.SQL_NF_MB_Faturados.Close;
     ConexaoBD.SQL_NF_MB_Faturados.SQL.Clear;
     ConexaoBD.SQL_NF_MB_Faturados.SQL.Add('Select * from faturados Where (faturado_status <> '+#39+'Faturado'+#39+') and (faturado_empresa = '+#39+'Monibras'+#39+') Order By faturado_cliente_tipo_faturamento, faturado_numero');
     ConexaoBD.SQL_NF_MB_Faturados.Open;

     Total_Pedidos_Monibras.Caption := IntToStr(ConexaoBD.SQL_NF_MB_Faturados.RecordCount);

     NotasFiscaisSaidas00.Update;
     Seta();
end;

procedure TNotasFiscaisSaidas00.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisSaidas00.Close;
end;

procedure TNotasFiscaisSaidas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TNotasFiscaisSaidas00.FormShow(Sender: TObject);
begin
     Atualiza_Grid_Ibrasmak();
end;

procedure TNotasFiscaisSaidas00.BT_AtualizarClick(Sender: TObject);
begin
     Atualiza_Grid_Ibrasmak();
end;

procedure TNotasFiscaisSaidas00.Tempo_RefreshTimer(Sender: TObject);
begin
     Atualiza_Grid_Ibrasmak();
end;

procedure TNotasFiscaisSaidas00.DBG_Pedidos_IbrasmakDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If DBG_Pedidos_Ibrasmak.Fields[4].Text = 'Aguardando' Then
        Begin
        DBG_Pedidos_Ibrasmak.Canvas.Brush.Color := clRed;
        End
     Else If DBG_Pedidos_Ibrasmak.Fields[4].Text = 'Conferência' Then
        Begin
        DBG_Pedidos_Ibrasmak.Canvas.Brush.Color := clSkyBlue;
        End
     Else If DBG_Pedidos_Ibrasmak.Fields[4].Text = 'Emissão' Then
        Begin
        DBG_Pedidos_Ibrasmak.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBG_Pedidos_Ibrasmak.DefaultDrawDataCell(Rect, DBG_Pedidos_Ibrasmak.columns[datacol].field, State);
end;

procedure TNotasFiscaisSaidas00.DBG_Pedidos_IbrasmakCellClick(
  Column: TColumn);
var
    Nro_Pedido, Codigo_Cliente, Vlr_Exibicao, MSG_Suframa, Nro_Faturado: String;
    Ind, Erro: Integer;
    Vlr_Numero, Vlr_Numero_IPI: Real;
begin
    If DBG_Pedidos_Ibrasmak.Fields[0].Text <> '' Then Begin
        Selecionado := DBG_Pedidos_Ibrasmak.Fields[1].Text;

        NotasFiscaisSaidas00.Visible := False;

        Ampulheta();
        Application.CreateForm(TNotasFiscaisSaidas01,NotasFiscaisSaidas01);

        NotasFiscaisSaidas01.Empresa.Text := 'Ibrasmak';

        //*** Obtem os Dados do Pedido ***

        Nro_Pedido    := DBG_Pedidos_Ibrasmak.Fields[1].Text;
        Nro_Faturado  := DBG_Pedidos_Ibrasmak.Fields[0].Text;

        ConexaoBD.SQL_NF_FB_Faturados.Close;
        ConexaoBD.SQL_NF_FB_Faturados.SQL.Clear;
        ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where faturado_numero = ' + Trim(Nro_Faturado)  + ' And faturado_empresa = ' +#39+ 'Ibrasmak' +#39 );
        ConexaoBD.SQL_NF_FB_Faturados.Open;

        //*** Obtem os Dados dos Clientes ***

        Codigo_Cliente := ConexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_codigo.Text;

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
        ConexaoBD.SQL_Clientes.Open;

        //*** Carrega os Dados Obtidos ***

        NotasFiscaisSaidas01.Nro_Pedido.Text               := Nro_Pedido;
        NotasFiscaisSaidas01.Nro_Pedido_Faturado.Text      := DBG_Pedidos_Ibrasmak.Fields[0].Text;
        NotasFiscaisSaidas01.Nro_Pedido_Vendas.Text        := DBG_Pedidos_Ibrasmak.Fields[1].Text;

        NotasFiscaisSaidas01.Cliente_Codigo.Text           := conexaoBD.SQL_Clientesfb_cliente_codigo.Text;
        NotasFiscaisSaidas01.Cliente_Codigo_Tipo.Text      := conexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text;
        NotasFiscaisSaidas01.Cliente_Nome.Text             := conexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

        NotasFiscaisSaidas01.Cliente_Vendedor.Text         := conexaoBD.SQL_Clientesfb_cliente_vendedor.Text;
        NotasFiscaisSaidas01.Cliente_Banco.Text            := conexaoBD.SQL_Clientesfb_cliente_banco.Text;

        //*** Endereço Normal ***

        NotasFiscaisSaidas01.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
        NotasFiscaisSaidas01.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
        NotasFiscaisSaidas01.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
        NotasFiscaisSaidas01.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
        NotasFiscaisSaidas01.Cliente_Complemento.Text      := conexaoBD.SQL_Clientesfb_cliente_complemento.Text;
        NotasFiscaisSaidas01.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
        NotasFiscaisSaidas01.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

        //*** Endereço de Cobrança ***

        NotasFiscaisSaidas01.Cliente_Endereco_Cobranca.Text    := conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text;
        NotasFiscaisSaidas01.Cliente_Complemento_Cobranca.Text := conexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
        NotasFiscaisSaidas01.Cliente_Bairro_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
        NotasFiscaisSaidas01.Cliente_Cidade_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
        NotasFiscaisSaidas01.Cliente_Estado_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
        NotasFiscaisSaidas01.Cliente_Cep_Cobranca.Text         := conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text;
        NotasFiscaisSaidas01.Cliente_Pais_Cobranca.Text        := conexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text;

        //*** Continua Carregando os Dados ***

        NotasFiscaisSaidas01.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
        NotasFiscaisSaidas01.Cliente_DDD.Text              := conexaoBD.SQL_Clientesfb_cliente_ddd.Text;
        NotasFiscaisSaidas01.Cliente_Fone_Ramal.Text       := conexaoBD.SQL_Clientesfb_cliente_fone_ramal.Text;
        NotasFiscaisSaidas01.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone.Text;
        NotasFiscaisSaidas01.Cliente_Fone_Residencial.Text := conexaoBD.SQL_Clientesfb_cliente_fone_residencial.Text;
        NotasFiscaisSaidas01.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
        NotasFiscaisSaidas01.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fax.Text;
        NotasFiscaisSaidas01.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email_nfe.Text;

        NotasFiscaisSaidas01.Cliente_Desconto.Text              := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_desconto.Text;
        //NotasFiscaisSaidas01.Cliente_Condicao_Pgto_1.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_1.Text;
        //NotasFiscaisSaidas01.Cliente_Condicao_Pgto_2.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_2.Text;
        //NotasFiscaisSaidas01.Cliente_Condicao_Pgto_3.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_3.Text;
        //NotasFiscaisSaidas01.Cliente_Condicao_Pgto_4.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_4.Text;
        NotasFiscaisSaidas01.Cliente_Tipo_Faturamento.ItemIndex := Obtem_Nro_Tipo_Faturamento(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_tipo_faturamento.Text);
        NotasFiscaisSaidas01.Nro_Tipo_Tabela.Text               := IntToStr(Obtem_Nro_Tipo_Tabela(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_tipo_tabela.Text));
        NotasFiscaisSaidas01.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_emite_lote.Text);
        NotasFiscaisSaidas01.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_tipo_transporte.Text);
        NotasFiscaisSaidas01.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_transportadora.Text));
        NotasFiscaisSaidas01.Codigo_Transportadora.Text         := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_transportadora.Text;
        NotasFiscaisSaidas01.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_pgto_frete.Text));

        NotasFiscaisSaidas01.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_natureza_operacao.Text),Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_cfop.Text)));

        NotasFiscaisSaidas01.Parcela_Nro.Text                   := conexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_nro.Text;
        NotasFiscaisSaidas01.Parcela_Descricao.Text             := conexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_descricao.Text;

        If Trim(conexaoBD.SQL_Clientesfb_cliente_consumo.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Nota_Consumo.Checked := True;
           End
        Else
           Begin
           NotasFiscaisSaidas01.Nota_Consumo.Checked := False;
        End;

        NotasFiscaisSaidas01.Cliente_Suframa.Text               := conexaoBD.SQL_Clientesfb_cliente_suframa.Text;
        NotasFiscaisSaidas01.Observacao_Nota.Lines.Clear;

        If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) = '' Then
           Begin

           If Trim(DBG_FB_Observacao_Nota.Text) <> '' Then
              Begin
              NotasFiscaisSaidas01.Observacao_Nota.Lines.Add(DBG_FB_Observacao_Nota.Text);
           End;

           End
        Else
           Begin
           MSG_Suframa := 'EM TRANSITO PELO ESTABELECIMENTO DE ' + Trim(conexaoBD.SQL_Clientesfb_cliente_razao_social.Text) + ' | ';
           MSG_Suframa := MSG_Suframa + Trim(conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text) + ' | CEP: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' | ';
           MSG_Suframa := MSG_Suframa + 'INSC.ESTADUAL: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text) + ' | ' +  'CNPJ: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_codigo.Text) + ' | PROC.DRTC-III 004630/95 - SEFAZ/SP';

           NotasFiscaisSaidas01.Observacao_Nota.Lines.Add(Trim(DBG_FB_Observacao_Nota.Text) + UpperCase(Trim(MSG_Suframa)));
        End;

        NotasFiscaisSaidas01.Cliente_Observacao.Lines.Clear;
        NotasFiscaisSaidas01.Cliente_Observacao.Lines.Add(DBG_FB_Cliente_Observacao.Text);

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_ipi.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Val(Vlr_Exibicao,Vlr_Numero_IPI,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas01.Valor_IPI.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_frete.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas01.Valor_Frete.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_desconto.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas01.Valor_Desconto.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_pedido.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas01.Valor_Pedido.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_total.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str((Vlr_Numero + Vlr_Numero_IPI):13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas01.Valor_Total.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Clientesfb_cliente_icms.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);

        If( Vlr_Numero <= 0 ) Then
           Begin
           Vlr_Numero := 18;
        End;

        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) = '' Then
           Begin
           //NotasFiscaisSaidas01.Cliente_Aliquota_ICMS.Text := Vlr_Exibicao;
           NotasFiscaisSaidas01.Cliente_Aliquota_ICMS.Text := '0';
           End
        Else
           Begin
           NotasFiscaisSaidas01.Cliente_Aliquota_ICMS.Text := '0';
        End;

        NotasFiscaisSaidas01.Cliente_Tipo_Pessoa.Text        := conexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text;
        NotasFiscaisSaidas01.Cliente_Inscricao_Estadual.Text := conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text;
        NotasFiscaisSaidas01.Caption := 'Notas Fiscais - SAÍDAS - PROCESSO DE LIBERAÇÃO: ' + Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_status.Text);

        NotasFiscaisSaidas01.Data_Entrega.Text := ConexaoBD.SQL_NF_FB_Faturadosfaturado_data_entrega.Text;

        NotasFiscaisSaidas01.Cliente_Ordem_Compra.Text := ConexaoBD.SQL_NF_FB_Faturadosfaturado_ordem_compra.Text;

        //*** Opções de Financiamento ***

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_financiamento_bnds.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Financiamento_BNDS.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_financiamento_proger.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Financiamento_Proger.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_financiamento_leasing.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Financiamento_Leasing.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_financiamento_ibrasmak.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Financiamento_Ibrasmak.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_pagamento_vista.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Pagamento_Vista.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_pagamento_parcelado.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Pagamento_Parcelado.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_pagamento_combinar.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Pagamento_Combinar.Checked := True;
        End;

        NotasFiscaisSaidas01.Parcela_Nro.Text         := Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_nro.Text);
        NotasFiscaisSaidas01.Parcela_Vencto.Text      := Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_vencto.Text);
        NotasFiscaisSaidas01.Parcela_Dias_Vencto.Text := Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_dias_vencto.Text);

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_mes_subsequente.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Parcela_Mes_Subsequente.Checked := True;
        End;

        NotasFiscaisSaidas01.Parcela_Porcentagem_Ato.Text := Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_porcentagem_ato.Text);
        NotasFiscaisSaidas01.Parcela_Vlr_Ato.Text         := Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_vlr_ato.Text);
        NotasFiscaisSaidas01.Parcela_Prazo_Inicio.Text    := Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_prazo_inicio.Text);

        NotasFiscaisSaidas01.Observacao_Fabrica.Lines.Clear;
        NotasFiscaisSaidas01.Observacao_Fabrica.Lines.Add(DBG_Observacao_Fabrica.Text);

        NotasFiscaisSaidas01.Cliente_Alimentacao.Text := ConexaoBD.SQL_NF_FB_Faturadosfaturado_alimentacao.Text;

        NotasFiscaisSaidas01.Peso_Bruto.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_NF_FB_Faturadosfaturado_peso.Text)) + ((StrToFloat(Ponto_Virgula(ConexaoBD.SQL_NF_FB_Faturadosfaturado_peso.Text)) * 1.5) / 100)));
        NotasFiscaisSaidas01.Peso_Liquido.Text        := ConexaoBD.SQL_NF_FB_Faturadosfaturado_peso.Text;
        NotasFiscaisSaidas01.Qtde_Volume.Text         := ConexaoBD.SQL_NF_FB_Faturadosfaturado_volume.Text;
        NotasFiscaisSaidas01.Cliente_Solicitado.Text  := ConexaoBD.SQL_NF_FB_Faturadosfaturado_solicitado.Text;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_pedido.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Parcela_Pedido.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_FB_Faturadosfaturado_parcela_faturamento.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas01.Parcela_Faturamento.Checked := True;
        End;

        NotasFiscaisSaidas01.Pedido_Data_Inclusao.Text := ConexaoBD.SQL_NF_FB_Faturadosfaturado_data.Text;

        NotasFiscaisSaidas01.Observacao_Faturamento.Lines.Clear;
        NotasFiscaisSaidas01.Observacao_Faturamento.Lines.Add(DBG_Observacao_Faturamento.Text);

        //*** Fecha SQL ***

        ConexaoBD.SQL_NF_FB_Faturados.Close;
        ConexaoBD.SQL_Clientes.Close;

        NotasFiscaisSaidas01.Tipo_Nota_Emissao.Text := Tipo_Emissao_Nota.Text;

        Seta();

        NotasFiscaisSaidas01.ShowModal;
        NotasFiscaisSaidas01.Destroy;

        NotasFiscaisSaidas00.Visible := True; 

        ConexaoBD.SQL_NF_FB_Faturados.Locate('faturado_numero',Trim(Selecionado),[]);
    End;
end;

procedure TNotasFiscaisSaidas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     NotasFiscaisSaidas00 := Nil;
end;

procedure TNotasFiscaisSaidas00.DBG_Pedidos_MonibrasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If DBG_Pedidos_Monibras.Fields[4].Text = 'Aguardando' Then
        Begin
        DBG_Pedidos_Monibras.Canvas.Brush.Color := clRed;
        End
     Else If DBG_Pedidos_Monibras.Fields[4].Text = 'Conferência' Then
        Begin
        DBG_Pedidos_Monibras.Canvas.Brush.Color := clSkyBlue;
        End
     Else If DBG_Pedidos_Monibras.Fields[4].Text = 'Emissão' Then
        Begin
        DBG_Pedidos_Monibras.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBG_Pedidos_Monibras.DefaultDrawDataCell(Rect, DBG_Pedidos_Monibras.columns[datacol].field, State);
end;

procedure TNotasFiscaisSaidas00.DBG_Pedidos_MonibrasCellClick(
  Column: TColumn);
var
    Nro_Pedido, Codigo_Cliente, Vlr_Exibicao, MSG_Suframa, Nro_Faturado: String;
    Ind, Erro: Integer;
    Vlr_Numero, Vlr_Numero_IPI: Real;
begin
    If DBG_Pedidos_Monibras.Fields[0].Text <> '' Then Begin
        Selecionado := DBG_Pedidos_Monibras.Fields[1].Text;

        NotasFiscaisSaidas00.Visible := False;

        Ampulheta();
        Application.CreateForm(TNotasFiscaisSaidas02,NotasFiscaisSaidas02);

        //NotasFiscaisSaidas02.Empresa.Text := 'Monibras';

        //*** Obtem os Dados do Pedido ***

        Nro_Pedido   := DBG_Pedidos_Monibras.Fields[1].Text;
        Nro_Faturado := DBG_Pedidos_Monibras.Fields[0].Text;

        ConexaoBD.SQL_NF_MB_Faturados.Close;
        ConexaoBD.SQL_NF_MB_Faturados.SQL.Clear;
        ConexaoBD.SQL_NF_MB_Faturados.SQL.Add('Select * from faturados Where faturado_numero = ' + Trim(Nro_Faturado) + ' And faturado_empresa = ' +#39+ 'Monibras' +#39);
        ConexaoBD.SQL_NF_MB_Faturados.Open;

        //*** Obtem os Dados dos Clientes ***

        Codigo_Cliente := ConexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_codigo.Text;

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
        ConexaoBD.SQL_Clientes.Open;

        //*** Carrega os Dados Obtidos ***

        NotasFiscaisSaidas02.Nro_Pedido.Text               := Nro_Pedido;
        NotasFiscaisSaidas02.Nro_Pedido_Faturado.Text      := DBG_Pedidos_Monibras.Fields[0].Text;
        NotasFiscaisSaidas02.Nro_Pedido_Vendas.Text        := DBG_Pedidos_Monibras.Fields[1].Text;

        NotasFiscaisSaidas02.Cliente_Codigo.Text           := conexaoBD.SQL_Clientesfb_cliente_codigo.Text;
        NotasFiscaisSaidas02.Cliente_Codigo_Tipo.Text      := conexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text;
        NotasFiscaisSaidas02.Cliente_Nome.Text             := conexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

        NotasFiscaisSaidas02.Cliente_Vendedor.Text         := conexaoBD.SQL_Clientesfb_cliente_vendedor.Text;
        NotasFiscaisSaidas02.Cliente_Banco.Text            := conexaoBD.SQL_Clientesfb_cliente_banco.Text;

        //*** Endereço Normal ***

        NotasFiscaisSaidas02.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
        NotasFiscaisSaidas02.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
        NotasFiscaisSaidas02.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
        NotasFiscaisSaidas02.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
        NotasFiscaisSaidas02.Cliente_Complemento.Text      := conexaoBD.SQL_Clientesfb_cliente_complemento.Text;
        NotasFiscaisSaidas02.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
        NotasFiscaisSaidas02.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

        //*** Endereço de Cobrança ***

        NotasFiscaisSaidas02.Cliente_Endereco_Cobranca.Text    := conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text;
        NotasFiscaisSaidas02.Cliente_Complemento_Cobranca.Text := conexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
        NotasFiscaisSaidas02.Cliente_Bairro_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
        NotasFiscaisSaidas02.Cliente_Cidade_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
        NotasFiscaisSaidas02.Cliente_Estado_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
        NotasFiscaisSaidas02.Cliente_Cep_Cobranca.Text         := conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text;
        NotasFiscaisSaidas02.Cliente_Pais_Cobranca.Text        := conexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text;

        //*** Continua Carregando os Dados ***

        NotasFiscaisSaidas02.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
        NotasFiscaisSaidas02.Cliente_DDD.Text              := conexaoBD.SQL_Clientesfb_cliente_ddd.Text;
        NotasFiscaisSaidas02.Cliente_Fone_Ramal.Text       := conexaoBD.SQL_Clientesfb_cliente_fone_ramal.Text;
        NotasFiscaisSaidas02.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone.Text;
        NotasFiscaisSaidas02.Cliente_Fone_Residencial.Text := conexaoBD.SQL_Clientesfb_cliente_fone_residencial.Text;
        NotasFiscaisSaidas02.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
        NotasFiscaisSaidas02.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fax.Text;
        NotasFiscaisSaidas02.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email_nfe.Text;

        NotasFiscaisSaidas02.Cliente_Desconto.Text              := conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_desconto.Text;
        //NotasFiscaisSaidas02.Cliente_Condicao_Pgto_1.Text       := conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_condicao_pgto_1.Text;
        //NotasFiscaisSaidas02.Cliente_Condicao_Pgto_2.Text       := conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_condicao_pgto_2.Text;
        //NotasFiscaisSaidas02.Cliente_Condicao_Pgto_3.Text       := conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_condicao_pgto_3.Text;
        //NotasFiscaisSaidas02.Cliente_Condicao_Pgto_4.Text       := conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_condicao_pgto_4.Text;
        NotasFiscaisSaidas02.Cliente_Tipo_Faturamento.ItemIndex := Obtem_Nro_Tipo_Faturamento(conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_tipo_faturamento.Text);
        NotasFiscaisSaidas02.Nro_Tipo_Tabela.Text               := IntToStr(Obtem_Nro_Tipo_Tabela(conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_tipo_tabela.Text));
        NotasFiscaisSaidas02.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_emite_lote.Text);
        NotasFiscaisSaidas02.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_tipo_transporte.Text);
        NotasFiscaisSaidas02.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_transportadora.Text));
        NotasFiscaisSaidas02.Codigo_Transportadora.Text         := conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_transportadora.Text;
        NotasFiscaisSaidas02.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(conexaoBD.SQL_NF_MB_Faturadosfaturado_cliente_pgto_frete.Text));

        NotasFiscaisSaidas02.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(Trim(conexaoBD.SQL_NF_MB_Faturadosfaturado_natureza_operacao.Text),Trim(conexaoBD.SQL_NF_MB_Faturadosfaturado_cfop.Text)));

        NotasFiscaisSaidas02.Parcela_Nro.Text                   := conexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_nro.Text;
        NotasFiscaisSaidas02.Parcela_Descricao.Text             := conexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_descricao.Text;

        If Trim(conexaoBD.SQL_Clientesfb_cliente_consumo.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Nota_Consumo.Checked := True;
           End
        Else
           Begin
           NotasFiscaisSaidas02.Nota_Consumo.Checked := False;
        End;

        NotasFiscaisSaidas02.Cliente_Suframa.Text               := conexaoBD.SQL_Clientesfb_cliente_suframa.Text;
        NotasFiscaisSaidas02.Observacao_Nota.Lines.Clear;

        If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) = '' Then
           Begin

           //If Trim(DBG_MB_Observacao_Nota.Text) <> '' Then
           //   Begin
              NotasFiscaisSaidas02.Observacao_Nota.Lines.Add(Trim(Trim(DBG_MB_Observacao_Nota.Text) + ' 1-DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL. || 2-NAO GERA DIREITO A CREDITO DE ICMS E DE ISS. RESOLUCAO CGSN NO 10 DE 2007.'));
           //End;

           End
        Else
           Begin
           MSG_Suframa := 'EM TRANSITO PELO ESTABELECIMENTO DE ' + Trim(conexaoBD.SQL_Clientesfb_cliente_razao_social.Text) + ' | ';
           MSG_Suframa := MSG_Suframa + Trim(conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text) + ' | CEP: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' | ';
           MSG_Suframa := MSG_Suframa + 'INSC.ESTADUAL: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text) + ' | ' +  'CNPJ: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_codigo.Text) + ' | PROC.DRTC-III 004630/95 - SEFAZ/SP';

           NotasFiscaisSaidas02.Observacao_Nota.Lines.Add(Trim(DBG_MB_Observacao_Nota.Text) + UpperCase(Trim(MSG_Suframa)));
        End;

        NotasFiscaisSaidas02.Cliente_Observacao.Lines.Clear;
        NotasFiscaisSaidas02.Cliente_Observacao.Lines.Add(DBG_MB_Cliente_Observacao.Text);

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_MB_Faturadosfaturado_valor_ipi.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Val(Vlr_Exibicao,Vlr_Numero_IPI,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas02.Valor_IPI.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_MB_Faturadosfaturado_valor_frete.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas02.Valor_Frete.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_MB_Faturadosfaturado_valor_desconto.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas02.Valor_Desconto.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_MB_Faturadosfaturado_valor_pedido.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas02.Valor_Pedido.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_MB_Faturadosfaturado_valor_total.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str((Vlr_Numero + Vlr_Numero_IPI):13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        NotasFiscaisSaidas02.Valor_Total.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Clientesfb_cliente_icms.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);

        If( Vlr_Numero <= 0 ) Then
           Begin
           Vlr_Numero := 18;
        End;

        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) = '' Then
           Begin
           //NotasFiscaisSaidas02.Cliente_Aliquota_ICMS.Text := Vlr_Exibicao;
           NotasFiscaisSaidas02.Cliente_Aliquota_ICMS.Text := '0';
           End
        Else
           Begin
           NotasFiscaisSaidas02.Cliente_Aliquota_ICMS.Text := '0';
        End;

        NotasFiscaisSaidas02.Cliente_Tipo_Pessoa.Text        := conexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text;
        NotasFiscaisSaidas02.Cliente_Inscricao_Estadual.Text := conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text;
        NotasFiscaisSaidas02.Caption := 'Notas Fiscais - SAÍDAS - PROCESSO DE LIBERAÇÃO: ' + Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_status.Text);

        NotasFiscaisSaidas02.Data_Entrega.Text := ConexaoBD.SQL_NF_MB_Faturadosfaturado_data_entrega.Text;

        NotasFiscaisSaidas02.Cliente_Ordem_Compra.Text := ConexaoBD.SQL_NF_MB_Faturadosfaturado_ordem_compra.Text;

        //*** Opções de Financiamento ***

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_financiamento_bnds.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Financiamento_BNDS.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_financiamento_proger.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Financiamento_Proger.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_financiamento_leasing.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Financiamento_Leasing.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_financiamento_ibrasmak.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Financiamento_Monibras.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_pagamento_vista.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Pagamento_Vista.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_pagamento_parcelado.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Pagamento_Parcelado.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_pagamento_combinar.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Pagamento_Combinar.Checked := True;
        End;

        NotasFiscaisSaidas02.Parcela_Nro.Text         := Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_nro.Text);
        NotasFiscaisSaidas02.Parcela_Vencto.Text      := Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_vencto.Text);
        NotasFiscaisSaidas02.Parcela_Dias_Vencto.Text := Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_dias_vencto.Text);

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_mes_subsequente.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Parcela_Mes_Subsequente.Checked := True;
        End;

        NotasFiscaisSaidas02.Parcela_Porcentagem_Ato.Text := Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_porcentagem_ato.Text);
        NotasFiscaisSaidas02.Parcela_Vlr_Ato.Text         := Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_vlr_ato.Text);
        NotasFiscaisSaidas02.Parcela_Prazo_Inicio.Text    := Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_prazo_inicio.Text);

        NotasFiscaisSaidas02.Observacao_Fabrica.Lines.Clear;
        NotasFiscaisSaidas02.Observacao_Fabrica.Lines.Add(DBG_MB_Observacao_Fabrica.Text);

        NotasFiscaisSaidas02.Cliente_Alimentacao.Text := ConexaoBD.SQL_NF_MB_Faturadosfaturado_alimentacao.Text;
        NotasFiscaisSaidas02.Peso_Bruto.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(conexaoBD.SQL_NF_MB_Faturadosfaturado_peso.Text)) + ((StrToFloat(Ponto_Virgula(conexaoBD.SQL_NF_MB_Faturadosfaturado_peso.Text)) * 1.5) / 100)));
        NotasFiscaisSaidas02.Peso_Liquido.Text        := ConexaoBD.SQL_NF_MB_Faturadosfaturado_peso.Text;
        NotasFiscaisSaidas02.Qtde_Volume.Text         := ConexaoBD.SQL_NF_MB_Faturadosfaturado_volume.Text;
        NotasFiscaisSaidas02.Cliente_Solicitado.Text  := ConexaoBD.SQL_NF_MB_Faturadosfaturado_solicitado.Text;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_pedido.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Parcela_Pedido.Checked := True;
        End;

        If Trim(ConexaoBD.SQL_NF_MB_Faturadosfaturado_parcela_faturamento.Text) = 'S' Then
           Begin
           NotasFiscaisSaidas02.Parcela_Faturamento.Checked := True;
        End;

        NotasFiscaisSaidas02.Pedido_Data_Inclusao.Text := ConexaoBD.SQL_NF_MB_Faturadosfaturado_data.Text;

        NotasFiscaisSaidas02.Observacao_Faturamento.Lines.Clear;
        NotasFiscaisSaidas02.Observacao_Faturamento.Lines.Add(DBG_MB_Observacao_Faturamento.Text);

        //*** Fecha SQL ***

        ConexaoBD.SQL_NF_MB_Faturados.Close;
        ConexaoBD.SQL_Clientes.Close;

        NotasFiscaisSaidas02.Tipo_Nota_Emissao.Text := Tipo_Emissao_Nota.Text;        

        Seta();

        NotasFiscaisSaidas02.ShowModal;
        NotasFiscaisSaidas02.Destroy;

        NotasFiscaisSaidas00.Visible := True; 

        ConexaoBD.SQL_NF_MB_Faturados.Locate('faturado_numero',Trim(Selecionado),[]);
    End;
end;

end.
