unit Historicos_Registro_Notas_Fiscais_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  THistoricosRegistroNotasFiscaisSaidas00 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBG_Notas_Saidas: TDBGrid;
    Panel5: TPanel;
    Label1: TLabel;
    Total_Pedidos_Ibrasmak: TLabel;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Numero_Nota: TEdit;
    BT_Procurar: TBitBtn;
    Label3: TLabel;
    Data_Inicial: TMaskEdit;
    Label4: TLabel;
    Data_Final: TMaskEdit;
    Label5: TLabel;
    DBG_Cliente_Observacao_Nota: TDBMemo;
    DBG_Cliente_Observacao: TDBMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Numero_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_Notas_SaidasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoricosRegistroNotasFiscaisSaidas00: THistoricosRegistroNotasFiscaisSaidas00;
  Selecionado: string;
  
implementation

uses Conexao_BD, Rotinas_Gerais, Registro_Notas_Fiscais_Saidas_01,
  Registro_Notas_Fiscais_Saidas_00,
  Historicos_Registro_Notas_Fiscais_Saidas_01;

{$R *.dfm}

procedure THistoricosRegistroNotasFiscaisSaidas00.BT_SairClick(Sender: TObject);
begin
     HistoricosRegistroNotasFiscaisSaidas00.Close;
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_FB_Nota_Fiscal.Close;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;

     If Trim(Numero_Nota.Text) <> '' Then
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(Numero_Nota.Text) + ' Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc');
        End
     Else
        Begin

        Seta();

        If Trim(Data_Inicial.Text) = '/  /' Then
           Begin
           MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
           Data_Inicial.SetFocus;
           End
        Else if Trim(Data_Final.Text) = '/  /' then
           Begin
           MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
           Data_Final.SetFocus;
           End
        Else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
           Begin
           MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
           Data_Final.SetFocus;
           End
        Else
           Begin
           Ampulheta();
           ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where (fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc');
        End;
     End;

     ConexaoBD.SQL_FB_Nota_Fiscal.Open;

     Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount);

     Seta();
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     HistoricosRegistroNotasFiscaisSaidas00 := Nil;
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***

    Data_Final.Text   := DateToStr(Date());
    Data_Inicial.Text := '01/' + Trim(Copy(Data_Final.Text,4,2)) + '/' + Trim(Copy(Data_Final.Text,7,4));
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.Numero_NotaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.Data_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas00.DBG_Notas_SaidasCellClick(
  Column: TColumn);
var
    Comando_SQL: String;
begin
    If DBG_Notas_Saidas.Fields[0].Text <> '' Then Begin
      Selecionado := DBG_Notas_Saidas.Fields[0].Text;

      If (HistoricosRegistroNotasFiscaisSaidas01 = Nil) Then Begin
        Application.CreateForm(THistoricosRegistroNotasFiscaisSaidas01,HistoricosRegistroNotasFiscaisSaidas01);
      End;

      Comando_SQL := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(DBG_Notas_Saidas.Fields[0].Text);

      ConexaoBD.SQL_FB_Nota_Fiscal.Close;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_FB_Nota_Fiscal.Open;

      If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then Begin

        //HistoricosRegistroNotasFiscaisSaidas01.BT_Incluir.Visible := False;
        //HistoricosRegistroNotasFiscaisSaidas01.BT_Alterar.Visible := True;
        //HistoricosRegistroNotasFiscaisSaidas01.BT_Excluir.Visible := True;

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Codigo_Tipo.Text          := 'CNPJ';
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Codigo.Text               := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Nome.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Nota_Numero.Text                  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Nota_Emissao.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_CFOP.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Nro_Natureza_Operacao.Text        := IntToStr(Obtem_Nro_Natureza_Operacao(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text,ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text));
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Natureza_Operacao.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_desc.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Tipo_Transporte.ItemIndex := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_transp.Text);
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Pgto_Frete.ItemIndex      := Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_pgto_frete.Text);
        HistoricosRegistroNotasFiscaisSaidas01.Nro_Transportadora.Text           := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text));

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Base_Reduzida.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms_reduzida.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Especie.Text                      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_especie.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Marca.Text                        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_marca.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Peso_Bruto.Text                   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_peso_bruto.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Peso_Liquido.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_peso_liquido.Text;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_nota.Text = 'S') Then
        Begin
            HistoricosRegistroNotasFiscaisSaidas01.Tipo_Nota_Saida.Checked := True;
        End
        Else
        Begin
            HistoricosRegistroNotasFiscaisSaidas01.Tipo_Nota_Entrada.Checked := True;
        End;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_consumo.Text = 'S') Then
        Begin
            HistoricosRegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := True;
        End
        Else
        Begin
            HistoricosRegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := False;
        End;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_zerar_icms.Text = 'S') Then
        Begin
            HistoricosRegistroNotasFiscaisSaidas01.Zera_Base_ICMS.Checked := True;
        End
        Else
        Begin
            HistoricosRegistroNotasFiscaisSaidas01.Zera_Base_ICMS.Checked := False;
        End;

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_emite_lote.Text) = 'N' Then Begin
          HistoricosRegistroNotasFiscaisSaidas01.Cliente_Emite_Lote.ItemIndex   := 0;
          End
        Else Begin
          HistoricosRegistroNotasFiscaisSaidas01.Cliente_Emite_Lote.ItemIndex   := 1;
        End;

        If ((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant) - (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsVariant)) > 0 Then
           Begin
           HistoricosRegistroNotasFiscaisSaidas01.Cliente_Aliquota_ICMS.Text        := IntToStr(((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms.AsVariant) / ((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant) - (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsVariant))) * 100);
           End
        Else
           Begin
           HistoricosRegistroNotasFiscaisSaidas01.Cliente_Aliquota_ICMS.Text        := '0';
        End;

        //*** Obtem o Cliente ***

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) + #39 );
        ConexaoBD.SQL_Clientes.Open;

        //*** Endereço Normal ***

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Complemento.Text      := conexaoBD.SQL_Clientesfb_cliente_complemento.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

        //*** Endereço de Cobrança ***

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Endereco_Cobranca.Text    := conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Complemento_Cobranca.Text := conexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Bairro_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Cidade_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Estado_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Cep_Cobranca.Text         := conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Pais_Cobranca.Text        := conexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text;

        //*** Continua Carregando os Dados ***

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_DDD.Text              := conexaoBD.SQL_Clientesfb_cliente_ddd.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Fone_Ramal.Text       := conexaoBD.SQL_Clientesfb_cliente_fone_ramal.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Fone_Residencial.Text := conexaoBD.SQL_Clientesfb_cliente_fone_residencial.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fax.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;

        //HistoricosRegistroNotasFiscaisSaidas01.Nro_Pedido_Vendas.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nro_pedido.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Tipo_Pessoa.Text           := conexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Inscricao_Estadual.Text    := conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_transp.Text);
        HistoricosRegistroNotasFiscaisSaidas01.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text));
        HistoricosRegistroNotasFiscaisSaidas01.Codigo_Transportadora.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_pgto_frete.Text));
        HistoricosRegistroNotasFiscaisSaidas01.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text,ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text));
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Suframa.Text               := conexaoBD.SQL_Clientesfb_cliente_suframa.Text;

        If Trim(conexaoBD.SQL_Clientesfb_cliente_consumo.Text) = 'S' Then
           Begin
           HistoricosRegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := True;
           End
        Else
           Begin
           HistoricosRegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := False;
        End;

        HistoricosRegistroNotasFiscaisSaidas01.Observacao_Nota.Lines.Clear;
        HistoricosRegistroNotasFiscaisSaidas01.Observacao_Nota.Lines.Add(DBG_Cliente_Observacao_Nota.Text);

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Observacao.Lines.Clear;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Observacao.Lines.Add(DBG_Cliente_Observacao.Text);

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Desconto.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text;

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text) <> 'Entrada' Then
          Begin
          HistoricosRegistroNotasFiscaisSaidas01.Tipo_Nota_Saida.Checked        := True;
          End
        Else
          Begin
          HistoricosRegistroNotasFiscaisSaidas01.Tipo_Nota_Entrada.Checked      := True;
        End;

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Ordem_Compra.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_ordem_compra.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_1.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_1.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_2.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_2.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_3.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_3.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_4.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_4.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Nota_Base_ICMS.Text              := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text)) - StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))));
        HistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ICMS.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Nota_Base_ICMS_Sub.Text          := '0,00';
        HistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_Sub.Text         := '0,00';
        HistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_Produto.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text)) - StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))));
        HistoricosRegistroNotasFiscaisSaidas01.Valor_Frete.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_frete.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_Seguro.Text           := '0,00';
        HistoricosRegistroNotasFiscaisSaidas01.Nota_Outras_Despesas.Text        := '0,00';
        HistoricosRegistroNotasFiscaisSaidas01.Valor_IPI.Text                   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Valor_Total.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
        HistoricosRegistroNotasFiscaisSaidas01.Qtde_Volume.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_volume.Text;

        HistoricosRegistroNotasFiscaisSaidas01.Imprime_Nota_Apos.Checked := False;
        HistoricosRegistroNotasFiscaisSaidas01.Programa_Anterior.Text    := 'Alteração-Exclusão';

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text) = '0,00' Then
           Begin
           HistoricosRegistroNotasFiscaisSaidas01.IPI_Zerado.Text := 'S';
           End
        Else
           Begin
           HistoricosRegistroNotasFiscaisSaidas01.IPI_Zerado.Text := 'N';
        End;

        HistoricosRegistroNotasFiscaisSaidas01.Show;

        ConexaoBD.SQL_FB_Nota_Fiscal.Locate('fb_nota_fiscal_numero',Trim(Selecionado),[]);
      End;
    End;
end;

end.
