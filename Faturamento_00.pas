unit Faturamento_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, Mask;

type
  TFaturamento00 = class(TForm)
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
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Label4: TLabel;
    Opcao_Faturamento: TComboBox;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AtualizarClick(Sender: TObject);
    procedure Tempo_RefreshTimer(Sender: TObject);
    procedure DBG_Pedidos_IbrasmakDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBG_Pedidos_IbrasmakCellClick(Column: TColumn);
    procedure Opcao_FaturamentoChange(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Opcao_FaturamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Atualiza_Grid_Ibrasmak();
  public
    { Public declarations }
  end;

var
  Faturamento00: TFaturamento00;

implementation

uses Conexao_BD, Rotinas_Gerais, Faturamento_01; 

var Selecionado: string;

{$R *.dfm}

//***************
//*** Funções ***
//***************

//******************
//*** Procedures ***
//******************

procedure TFaturamento00.Atualiza_Grid_Ibrasmak();
begin
     Ampulheta();

     If Trim(Opcao_Faturamento.Text) = '--- TODOS ---' Then
        Begin
        ConexaoBD.SQL_NF_FB_Faturados.Close;
        ConexaoBD.SQL_NF_FB_Faturados.SQL.Clear;
        ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Order By faturado_cliente_tipo_faturamento, faturado_numero');
        ConexaoBD.SQL_NF_FB_Faturados.Open;
        End
     Else
        Begin
        ConexaoBD.SQL_NF_FB_Faturados.Close;
        ConexaoBD.SQL_NF_FB_Faturados.SQL.Clear;
        ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where faturado_status = '+#39+Trim(Opcao_Faturamento.Text)+#39+' Order By faturado_cliente_tipo_faturamento, faturado_numero');
        ConexaoBD.SQL_NF_FB_Faturados.Open;
     End;

     Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_NF_FB_Faturados.RecordCount);

     Faturamento00.Refresh;
     Seta();
end;

procedure TFaturamento00.BT_SairClick(Sender: TObject);
begin
     Faturamento00.Close;
end;

procedure TFaturamento00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFaturamento00.FormShow(Sender: TObject);
begin
    If Trim(Dados_Procura.Text) <> '' Then
       Begin
       BT_ProcurarClick(Sender);
       End
    Else
       Begin
       Atualiza_Grid_Ibrasmak();
    End;
end;

procedure TFaturamento00.BT_AtualizarClick(Sender: TObject);
begin
     Atualiza_Grid_Ibrasmak();
end;

procedure TFaturamento00.Tempo_RefreshTimer(Sender: TObject);
begin
     Atualiza_Grid_Ibrasmak();
end;

procedure TFaturamento00.DBG_Pedidos_IbrasmakDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If DBG_Pedidos_Ibrasmak.Fields[5].Text = 'Aguardando' Then
        Begin
        DBG_Pedidos_Ibrasmak.Canvas.Brush.Color := clRed;
        End
     Else If DBG_Pedidos_Ibrasmak.Fields[5].Text = 'Faturado' Then
        Begin
        DBG_Pedidos_Ibrasmak.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBG_Pedidos_Ibrasmak.DefaultDrawDataCell(Rect, DBG_Pedidos_Ibrasmak.columns[datacol].field, State);
end;

procedure TFaturamento00.DBG_Pedidos_IbrasmakCellClick(
  Column: TColumn);

var
    Nro_Pedido, Nro_Fat, Codigo_Cliente, Vlr_Exibicao, MSG_Suframa: String;
    Ind, Erro: Integer;
    Vlr_Numero, Vlr_Numero_IPI: Real;
begin
    If DBG_Pedidos_Ibrasmak.Fields[1].Text <> '' Then Begin
      Selecionado := DBG_Pedidos_Ibrasmak.Fields[1].Text;

      Faturamento00.Visible := False;

      Ampulheta();
      Application.CreateForm(TFaturamento01,Faturamento01);

      //*** Obtem os Dados do Pedido ***

      Nro_Fat             := DBG_Pedidos_Ibrasmak.Fields[0].Text;
      Nro_Pedido          := DBG_Pedidos_Ibrasmak.Fields[1].Text;

      ConexaoBD.SQL_NF_FB_Faturados.Close;
      ConexaoBD.SQL_NF_FB_Faturados.SQL.Clear;
      ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where faturado_numero = ' + Trim(Nro_Fat) + ' Order by faturado_numero Desc');
      ConexaoBD.SQL_NF_FB_Faturados.Open;

      //*** Obtem os Dados dos Clientes ***

      Codigo_Cliente := ConexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_codigo.Text;

      ConexaoBD.SQL_Clientes.Close;
      ConexaoBD.SQL_Clientes.SQL.Clear;
      ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
      ConexaoBD.SQL_Clientes.Open;

      //*** Carrega os Dados Obtidos ***

      Faturamento01.Nro_Pedido.Text               := Nro_Pedido;
      Faturamento01.Sequencia_Pedidos.Text        := Copy(Trim(conexaoBD.SQL_NF_FB_Faturadosfaturado_sequencia_pedidos.Text),1,(Length(Trim(conexaoBD.SQL_NF_FB_Faturadosfaturado_sequencia_pedidos.Text)) - 1) );
      Faturamento01.Nro_Pedido_Faturado.Text      := DBG_Pedidos_Ibrasmak.Fields[0].Text;

      Faturamento01.Cliente_Codigo.Text           := conexaoBD.SQL_Clientesfb_cliente_codigo.Text;
      Faturamento01.Cliente_Codigo_Tipo.Text      := conexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text;
      Faturamento01.Cliente_Nome.Text             := conexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

      //*** Endereço Normal ***

      Faturamento01.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
      Faturamento01.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
      Faturamento01.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
      Faturamento01.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
      Faturamento01.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
      Faturamento01.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

      //*** Continua Carregando os Dados ***

      Faturamento01.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
      Faturamento01.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;

      Faturamento01.Cliente_Desconto.Text              := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_desconto.Text;
      Faturamento01.Cliente_Condicao_Pgto_1.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_1.Text;
      Faturamento01.Cliente_Condicao_Pgto_2.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_2.Text;
      Faturamento01.Cliente_Condicao_Pgto_3.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_3.Text;
      Faturamento01.Cliente_Condicao_Pgto_4.Text       := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_condicao_pgto_4.Text;
      Faturamento01.Cliente_Tipo_Faturamento.ItemIndex := Obtem_Nro_Tipo_Faturamento(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_tipo_faturamento.Text);
      Faturamento01.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_emite_lote.Text);
      Faturamento01.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_tipo_transporte.Text);
      Faturamento01.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_transportadora.Text));
      Faturamento01.Codigo_Transportadora.Text         := conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_transportadora.Text;
      Faturamento01.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(conexaoBD.SQL_NF_FB_Faturadosfaturado_cliente_pgto_frete.Text));
      Faturamento01.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(conexaoBD.SQL_NF_FB_Faturadosfaturado_natureza_operacao.Text,conexaoBD.SQL_NF_FB_Faturadosfaturado_cfop.Text));

      Faturamento01.Observacao_Nota.Lines.Clear;

      If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) = '' Then Begin

        If Trim(DBG_FB_Observacao_Nota.Text) <> '' Then Begin
          Faturamento01.Observacao_Nota.Lines.Add(DBG_FB_Observacao_Nota.Text);
        End;

        End
      Else Begin
        MSG_Suframa := 'EM TRANSITO PELO ESTABELECIMENTO DE ' + Trim(conexaoBD.SQL_Clientesfb_cliente_razao_social.Text) + ' | ';
        MSG_Suframa := MSG_Suframa + Trim(conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' | ' + Trim(conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text) + ' | CEP: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' | ';
        MSG_Suframa := MSG_Suframa + 'INSC.ESTADUAL: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text) + ' | ' +  'CNPJ: ' + Trim(conexaoBD.SQL_Clientesfb_cliente_codigo.Text) + ' | PROC.DRTC-III 004630/95 - SEFAZ/SP';

        Faturamento01.Observacao_Nota.Lines.Add(Trim(DBG_FB_Observacao_Nota.Text) + UpperCase(Trim(MSG_Suframa)));
      End;

      Faturamento01.Cliente_Observacao.Lines.Clear;
      Faturamento01.Cliente_Observacao.Lines.Add(DBG_FB_Cliente_Observacao.Text);

      Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_ipi.Text));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);
      Val(Vlr_Exibicao,Vlr_Numero_IPI,Erro);
      Str(Vlr_Numero:13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

      Faturamento01.Valor_IPI.Text := Vlr_Exibicao;

      Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_frete.Text));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);
      Str(Vlr_Numero:13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

      Faturamento01.Valor_Frete.Text := Vlr_Exibicao;

      Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_desconto.Text));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);
      Str(Vlr_Numero:13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

      Faturamento01.Valor_Desconto.Text := Vlr_Exibicao;

      Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_pedido.Text));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);
      Str(Vlr_Numero:13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

      Faturamento01.Valor_Pedido.Text := Vlr_Exibicao;

      Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturadosfaturado_valor_total.Text));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);
      Str((Vlr_Numero + Vlr_Numero_IPI):13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

      Faturamento01.Valor_Total.Text := Vlr_Exibicao;

      Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Clientesfb_cliente_icms.Text));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);

      If( Vlr_Numero <= 0 ) Then Begin
        Vlr_Numero := 18;
      End;

      Str(Vlr_Numero:13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

      Faturamento01.Data_Entrega.Text := ConexaoBD.SQL_NF_FB_Faturadosfaturado_data_entrega.Text;

      Faturamento01.Cliente_Ordem_Compra.Text := ConexaoBD.SQL_NF_FB_Faturadosfaturado_ordem_compra.Text;

      If DBG_Pedidos_Ibrasmak.Fields[4].Text = 'Faturado' Then Begin
        Faturamento01.BT_Excluir.Enabled := False;
      End;

      //*** Fecha SQL ***

      ConexaoBD.SQL_NF_FB_Faturados.Close;
      ConexaoBD.SQL_Clientes.Close;   

      Seta();

      Faturamento01.ShowModal;
      Faturamento01.Destroy;

      Faturamento00.Visible := True;      

      ConexaoBD.SQL_NF_FB_Faturados.Locate('faturado_numero',Trim(Selecionado),[]);
    End;
end;

procedure TFaturamento00.Opcao_FaturamentoChange(Sender: TObject);
begin
     Atualiza_Grid_Ibrasmak();
end;

procedure TFaturamento00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_NF_FB_Faturados.Close;
     ConexaoBD.SQL_NF_FB_Faturados.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Nro.Pedido' Then
           Begin
           ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where faturado_pedido_numero = ' + Trim(Dados_Procura.Text) + ' Order By faturado_pedido_numero');
           End
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where faturado_cliente_nome Like '  +#39+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By faturado_pedido_numero');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Nro.Pedido' Then
           Begin
           ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where Order By faturado_pedido_numero');
           End
        Else If Opcoes_Procura.Text = 'Cliente' Then
           Begin
           ConexaoBD.SQL_NF_FB_Faturados.SQL.Add('Select * from faturados Where Order By faturado_pedido_numero');
        End;

     End;

     ConexaoBD.SQL_NF_FB_Faturados.Open;

     Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_NF_FB_Faturados.RecordCount);

     Faturamento00.Refresh;

     Seta();
end;

procedure TFaturamento00.Opcao_FaturamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
