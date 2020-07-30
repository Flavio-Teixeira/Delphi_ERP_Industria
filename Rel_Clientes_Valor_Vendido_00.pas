unit Rel_Clientes_Valor_Vendido_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRelClientesValorVendido00 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Panel1: TPanel;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    rbNotasFiscais: TRadioButton;
    rbPapeletas: TRadioButton;
    rbTodas: TRadioButton;
    Label4: TLabel;
    edtRanking: TEdit;
    Acc_Empresa: TEdit;
    Label5: TLabel;
    rbOS: TRadioButton;
    Label6: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtRankingKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Prepara_Relatorio_Notas_Fiscais();
    procedure Prepara_Relatorio_Papeletas();
    procedure Prepara_Relatorio_Todas();
    procedure Prepara_Relatorio_OS();

    procedure Prepara_Relatorio_Notas_Fiscais_MB();
    procedure Prepara_Relatorio_Papeletas_MB();
    procedure Prepara_Relatorio_Todas_MB();
    procedure Prepara_Relatorio_OS_MB();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelClientesValorVendido00: TRelClientesValorVendido00;

implementation

uses Rotinas_Gerais, Conexao_BD, Rel_Clientes_Valor_Vendido_01, DB, Math;

{$R *.dfm}

procedure TRelClientesValorVendido00.btnSairClick(Sender: TObject);
begin
    RelClientesValorVendido00.Close;
end;

procedure TRelClientesValorVendido00.btnVisualizarClick(Sender: TObject);
begin
    If Trim(edtDataInicial.Text) = '/  /' Then
       Begin
       MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
       edtDataInicial.SetFocus;
       End
    Else if Trim(edtDataFinal.Text) = '/  /' then
       Begin
       MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
       edtDataFinal.SetFocus;
       End
    Else if StrToDate(edtDataInicial.Text) > StrToDate(edtDataFinal.Text) then
       Begin
       MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
       edtDataFinal.SetFocus;
       End
    Else if StrToInt(edtRanking.Text) <= 0 then
       Begin
       MSG_Erro('A Quantidade de Clientes para o Ranking deve ser Maior ou Igual a 1...');
       edtRanking.SetFocus;
       End
    Else Begin
        Ampulheta();
        If Trim(edtRanking.Text) = '' Then edtRanking.Text := '0';

        if (Acc_Empresa.Text = 'Monibras') then
            begin
            If rbNotasFiscais.Checked Then
               Begin
               Prepara_Relatorio_Notas_Fiscais_MB();
               End
            Else If rbPapeletas.Checked Then
               Begin
               Prepara_Relatorio_Papeletas_MB();
               End
            Else If rbTodas.Checked Then
               Begin
               Prepara_Relatorio_Todas_MB();
               End
            Else If rbOS.Checked Then
               Begin
               Prepara_Relatorio_OS_MB();
            End;
            End
        else
            begin
            If rbNotasFiscais.Checked Then
               Begin
               Prepara_Relatorio_Notas_Fiscais();
               End
            Else If rbPapeletas.Checked Then
               Begin
               Prepara_Relatorio_Papeletas();
               End
            Else if rbTodas.Checked Then
               Begin
               Prepara_Relatorio_Todas();
               End
            Else If rbOS.Checked Then
               Begin
               Prepara_Relatorio_OS();
            End;
        end;

        Seta();
    End;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_Notas_Fiscais;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select * from fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And fb_nota_fiscal_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By fb_nota_fiscal_codigo, fb_nota_fiscal_numero';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do Begin

            If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

            If ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

               While Not ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.AsFloat;

                     ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
               End;
            End;

            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;

            ConexaoBD.SQL_FB_Nota_Fiscal.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Ibrasmak';
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'Nota Fiscal' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text;

    Seta();

    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_OS;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select * from pedidos Where ';
    Comando_SQL := Comando_SQL + 'pedido_empresa = '+#39+'Ibrasmak'+#39+' and ';
    Comando_SQL := Comando_SQL + '(pedido_data >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And pedido_data <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By pedido_numero';

    ConexaoBD.SQL_Pedidos.Close;
    ConexaoBD.SQL_Pedidos.SQL.Clear;
    ConexaoBD.SQL_Pedidos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Pedidos.Open;

    If ConexaoBD.SQL_Pedidos.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_Pedidos.First;

        While Not ConexaoBD.SQL_Pedidos.Eof Do Begin

            If Trim(ConexaoBD.SQL_Pedidospedido_numero.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_Pedidospedido_cliente_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_Pedidospedido_cliente_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_Pedidospedido_valor_pedido.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from pedidos_produtos Where ';
            Comando_SQL := Comando_SQL + 'pedido_produto_numero_pedido = ' + ConexaoBD.SQL_Pedidospedido_numero.Text;

            ConexaoBD.SQL_Pedidos_Produtos.Close;
            ConexaoBD.SQL_Pedidos_Produtos.SQL.Clear;
            ConexaoBD.SQL_Pedidos_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Pedidos_Produtos.Open;

            If ConexaoBD.SQL_Pedidos_Produtos.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_Pedidos_Produtos.First;

               While Not ConexaoBD.SQL_Pedidos_Produtos.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_Pedidos_Produtospedido_produto_quantidade.AsFloat;

                     ConexaoBD.SQL_Pedidos_Produtos.Next;
               End;
            End;

            ConexaoBD.SQL_Pedidos_Produtos.Close;

            ConexaoBD.SQL_Pedidos.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRLabel13.Caption         := 'Qtde. OS';
    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Ibrasmak';
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'OS' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text + ' - OS (Ordens de Serviço)';

    Seta();

    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_OS_MB;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select * from pedidos Where ';
    Comando_SQL := Comando_SQL + 'pedido_empresa = '+#39+'Monibras'+#39+' and ';
    Comando_SQL := Comando_SQL + '(pedido_data >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And pedido_data <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By pedido_numero';

    ConexaoBD.SQL_Pedidos.Close;
    ConexaoBD.SQL_Pedidos.SQL.Clear;
    ConexaoBD.SQL_Pedidos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Pedidos.Open;

    If ConexaoBD.SQL_Pedidos.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_Pedidos.First;

        While Not ConexaoBD.SQL_Pedidos.Eof Do Begin

            If Trim(ConexaoBD.SQL_Pedidospedido_numero.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_Pedidospedido_cliente_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_Pedidospedido_cliente_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_Pedidospedido_valor_pedido.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from pedidos_produtos Where ';
            Comando_SQL := Comando_SQL + 'pedido_produto_numero_pedido = ' + ConexaoBD.SQL_Pedidospedido_numero.Text;

            ConexaoBD.SQL_Pedidos_Produtos.Close;
            ConexaoBD.SQL_Pedidos_Produtos.SQL.Clear;
            ConexaoBD.SQL_Pedidos_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Pedidos_Produtos.Open;

            If ConexaoBD.SQL_Pedidos_Produtos.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_Pedidos_Produtos.First;

               While Not ConexaoBD.SQL_Pedidos_Produtos.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_Pedidos_Produtospedido_produto_quantidade.AsFloat;

                     ConexaoBD.SQL_Pedidos_Produtos.Next;
               End;
            End;

            ConexaoBD.SQL_Pedidos_Produtos.Close;

            ConexaoBD.SQL_Pedidos.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRLabel13.Caption         := 'Qtde. OS';    
    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Monibras';
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'OS' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text + ' - OS (Ordens de Serviço)';

    Seta();

    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRelClientesValorVendido00.FormShow(Sender: TObject);
begin
    edtDataInicial.Text := DateToStr(Date());
    edtDataFinal.Text   := DateToStr(Date());
    edtRanking.Text     := '1';
end;

procedure TRelClientesValorVendido00.edtDataInicialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelClientesValorVendido00.edtDataFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelClientesValorVendido00.edtRankingKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
    End
    Else Begin
        So_Numero(Sender,Key);
    End;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_Papeletas;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Papeleta ***

    Comando_SQL := 'Select * from fb_papeletas Where ';
    Comando_SQL := Comando_SQL + '(fb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(fb_papeleta_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And fb_papeleta_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By fb_papeleta_codigo, fb_papeleta_numero';

    ConexaoBD.SQL_FB_Papeletas.Close;
    ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Papeletas.Open;

    If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_FB_Papeletas.First;

        While Not ConexaoBD.SQL_FB_Papeletas.Eof Do Begin

            If Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from fb_papeletas_produtos Where ';
            Comando_SQL := Comando_SQL + 'fb_papeleta_produto_numero = ' + ConexaoBD.SQL_FB_Papeletasfb_papeleta_numero.Text;

            ConexaoBD.SQL_FB_Papeletas_Produtos.Close;
            ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Clear;
            ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Papeletas_Produtos.Open;

            If ConexaoBD.SQL_FB_Papeletas_Produtos.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_FB_Papeletas_Produtos.First;

               While Not ConexaoBD.SQL_FB_Papeletas_Produtos.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_qtde.AsFloat;

                     ConexaoBD.SQL_FB_Papeletas_Produtos.Next;
               End;
            End;

            ConexaoBD.SQL_FB_Papeletas_Produtos.Close;

            ConexaoBD.SQL_FB_Papeletas.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Ibrasmak';    
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'Orçamento' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text;

    Seta();
    
    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_Todas;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total, Nro_Notas, Nro_produtos : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select * from fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And fb_nota_fiscal_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By fb_nota_fiscal_codigo, fb_nota_fiscal_numero';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do Begin

            If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

            If ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

               While Not ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.AsFloat;

                     ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
               End;
            End;

            ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;

            ConexaoBD.SQL_FB_Nota_Fiscal.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Papeleta ***

    Comando_SQL := 'Select * from fb_papeletas Where ';
    Comando_SQL := Comando_SQL + '(fb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(fb_papeleta_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And fb_papeleta_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By fb_papeleta_codigo, fb_papeleta_numero';

    ConexaoBD.SQL_FB_Papeletas.Close;
    ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Papeletas.Open;

    If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_FB_Papeletas.First;

        While Not ConexaoBD.SQL_FB_Papeletas.Eof Do Begin

            If Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  ConexaoBD.SQL_Swap_Valor_Vendido.Close;
                  ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
                  ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39 );
                  ConexaoBD.SQL_Swap_Valor_Vendido.Open;

                  If ConexaoBD.SQL_Swap_Valor_Vendido.RecordCount > 0 Then
                     Begin
                     Comando_SQL := 'Update ' + Nome_Tabela_Nota + ' Set ';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_notas = (fb_swap_nro_notas + ' + IntToStr(C_Qtde_Notas) + '), ';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos = (fb_swap_nro_produtos + ' + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + '), ';
                     Comando_SQL := Comando_SQL + 'fb_swap_valor = (fb_swap_valor + ' + Virgula_Ponto(FloatToStr(Valor_Total)) + ') ';
                     Comando_SQL := Comando_SQL + 'Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39;
                     End
                  Else
                     Begin
                     Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                     Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                     Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                     Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                     Comando_SQL := Comando_SQL + ' Values(';

                     Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                     Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                     Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                     Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                     Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';
                  End;

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from fb_papeletas_produtos Where ';
            Comando_SQL := Comando_SQL + 'fb_papeleta_produto_numero = ' + ConexaoBD.SQL_FB_Papeletasfb_papeleta_numero.Text;

            ConexaoBD.SQL_FB_Papeletas_Produtos.Close;
            ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Clear;
            ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Papeletas_Produtos.Open;

            If ConexaoBD.SQL_FB_Papeletas_Produtos.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_FB_Papeletas_Produtos.First;

               While Not ConexaoBD.SQL_FB_Papeletas_Produtos.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_qtde.AsFloat;

                     ConexaoBD.SQL_FB_Papeletas_Produtos.Next;
               End;
            End;

            ConexaoBD.SQL_FB_Papeletas_Produtos.Close;

            ConexaoBD.SQL_FB_Papeletas.Next;
        End;

        ConexaoBD.SQL_Swap_Valor_Vendido.Close;
        ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
        ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39 );
        ConexaoBD.SQL_Swap_Valor_Vendido.Open;

        If ConexaoBD.SQL_Swap_Valor_Vendido.RecordCount > 0 Then
           Begin
           Comando_SQL := 'Update ' + Nome_Tabela_Nota + ' Set ';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_notas = (fb_swap_nro_notas + ' + IntToStr(C_Qtde_Notas) + '), ';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos = (fb_swap_nro_produtos + ' + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + '), ';
           Comando_SQL := Comando_SQL + 'fb_swap_valor = (fb_swap_valor + ' + Virgula_Ponto(FloatToStr(Valor_Total)) + ') ';
           Comando_SQL := Comando_SQL + 'Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39;
           End
        Else
           Begin
           Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
           Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
           Comando_SQL := Comando_SQL + 'fb_swap_nome,';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
           Comando_SQL := Comando_SQL + 'fb_swap_valor)';
           Comando_SQL := Comando_SQL + ' Values(';

           Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
           Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
           Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
           Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';
        End;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Ibrasmak';
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'Todas' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text;

    Seta();
    
    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_Notas_Fiscais_MB;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select * from mb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '(mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(mb_nota_fiscal_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And mb_nota_fiscal_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By mb_nota_fiscal_codigo, mb_nota_fiscal_numero';

    ConexaoBD.SQL_mb_nota_Fiscal.Close;
    ConexaoBD.SQL_mb_nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_mb_nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_mb_nota_Fiscal.Open;

    If ConexaoBD.SQL_mb_nota_Fiscal.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_mb_nota_Fiscal.First;

        While Not ConexaoBD.SQL_mb_nota_Fiscal.Eof Do Begin

            If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from mb_notas_fiscais_produtos Where ';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_numero = ' + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_numero.Text;

            ConexaoBD.SQL_mb_nota_Fiscal_Produto.Close;
            ConexaoBD.SQL_mb_nota_Fiscal_Produto.SQL.Clear;
            ConexaoBD.SQL_mb_nota_Fiscal_Produto.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_mb_nota_Fiscal_Produto.Open;

            If ConexaoBD.SQL_mb_nota_Fiscal_Produto.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_mb_nota_Fiscal_Produto.First;

               While Not ConexaoBD.SQL_mb_nota_Fiscal_Produto.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_mb_nota_Fiscal_Produtomb_nota_fiscal_produto_qtde.AsFloat;

                     ConexaoBD.SQL_mb_nota_Fiscal_Produto.Next;
               End;
            End;

            ConexaoBD.SQL_mb_nota_Fiscal_Produto.Close;

            ConexaoBD.SQL_mb_nota_Fiscal.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Monibras';    
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'Nota Fiscal' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text;

    Seta();
    
    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_Papeletas_MB;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Papeleta ***

    Comando_SQL := 'Select * from mb_papeletas Where ';
    Comando_SQL := Comando_SQL + '(mb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(mb_papeleta_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And mb_papeleta_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By mb_papeleta_codigo, mb_papeleta_numero';

    ConexaoBD.SQL_mb_papeletas.Close;
    ConexaoBD.SQL_mb_papeletas.SQL.Clear;
    ConexaoBD.SQL_mb_papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_mb_papeletas.Open;

    If ConexaoBD.SQL_mb_papeletas.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_mb_papeletas.First;

        While Not ConexaoBD.SQL_mb_papeletas.Eof Do Begin

            If Trim(ConexaoBD.SQL_mb_papeletasmb_papeleta_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_mb_papeletasmb_papeleta_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_mb_papeletasmb_papeleta_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_mb_papeletasmb_papeleta_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from mb_papeletas_produtos Where ';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_numero = ' + ConexaoBD.SQL_mb_papeletasmb_papeleta_numero.Text;

            ConexaoBD.SQL_mb_papeletas_Produtos.Close;
            ConexaoBD.SQL_mb_papeletas_Produtos.SQL.Clear;
            ConexaoBD.SQL_mb_papeletas_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_mb_papeletas_Produtos.Open;

            If ConexaoBD.SQL_mb_papeletas_Produtos.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_mb_papeletas_Produtos.First;

               While Not ConexaoBD.SQL_mb_papeletas_Produtos.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_mb_papeletas_Produtosmb_papeleta_produto_qtde.AsFloat;

                     ConexaoBD.SQL_mb_papeletas_Produtos.Next;
               End;
            End;

            ConexaoBD.SQL_mb_papeletas_Produtos.Close;

            ConexaoBD.SQL_mb_papeletas.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Monibras';    
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'Orçamento' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text;

    Seta();
    
    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRelClientesValorVendido00.Prepara_Relatorio_Todas_MB;
var
    Ind, Ranking_Posicao: Integer;
    Comando_SQL : String;
    Nome_Tabela_Nota: String;
    Valor_Total, Nro_Notas, Nro_produtos : Real;

    C_Codigo, C_Nome: String;
    C_Qtde_Notas: Integer;
    C_Qtde_Produtos: Real;

    Primeira_Vez: Boolean;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota := 'fb_swap_valor_vendido_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_notas int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos int(13) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select * from mb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '(mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(mb_nota_fiscal_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And mb_nota_fiscal_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By mb_nota_fiscal_codigo, mb_nota_fiscal_numero';

    ConexaoBD.SQL_mb_nota_Fiscal.Close;
    ConexaoBD.SQL_mb_nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_mb_nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_mb_nota_Fiscal.Open;

    If ConexaoBD.SQL_mb_nota_Fiscal.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_mb_nota_Fiscal.First;

        While Not ConexaoBD.SQL_mb_nota_Fiscal.Eof Do Begin

            If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                  Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                  Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                  Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                  Comando_SQL := Comando_SQL + ' Values(';

                  Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                  Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                  Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from mb_notas_fiscais_produtos Where ';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_numero = ' + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_numero.Text;

            ConexaoBD.SQL_mb_nota_Fiscal_Produto.Close;
            ConexaoBD.SQL_mb_nota_Fiscal_Produto.SQL.Clear;
            ConexaoBD.SQL_mb_nota_Fiscal_Produto.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_mb_nota_Fiscal_Produto.Open;

            If ConexaoBD.SQL_mb_nota_Fiscal_Produto.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_mb_nota_Fiscal_Produto.First;

               While Not ConexaoBD.SQL_mb_nota_Fiscal_Produto.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_mb_nota_Fiscal_Produtomb_nota_fiscal_produto_qtde.AsFloat;

                     ConexaoBD.SQL_mb_nota_Fiscal_Produto.Next;
               End;
            End;

            ConexaoBD.SQL_mb_nota_Fiscal_Produto.Close;

            ConexaoBD.SQL_mb_nota_Fiscal.Next;
        End;

        Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
        Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
        Comando_SQL := Comando_SQL + 'fb_swap_nome,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
        Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
        Comando_SQL := Comando_SQL + 'fb_swap_valor)';
        Comando_SQL := Comando_SQL + ' Values(';

        Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
        Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Papeleta ***

    Comando_SQL := 'Select * from mb_papeletas Where ';
    Comando_SQL := Comando_SQL + '(mb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+') And ';
    Comando_SQL := Comando_SQL + '(mb_papeleta_data_emissao >= ' +#39+ Inverte_Data_Plus(edtDataInicial.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ' And mb_papeleta_data_emissao <= ' +#39+ Inverte_Data_Plus(edtDataFinal.Text,'amd','/') +#39;
    Comando_SQL := Comando_SQL + ') Order By mb_papeleta_codigo, mb_papeleta_numero';

    ConexaoBD.SQL_mb_papeletas.Close;
    ConexaoBD.SQL_mb_papeletas.SQL.Clear;
    ConexaoBD.SQL_mb_papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_mb_papeletas.Open;

    If ConexaoBD.SQL_mb_papeletas.RecordCount > 0 Then
       Begin

        Ranking_Posicao := 1;
        C_Codigo        := ' ';
        C_Nome          := ' ';
        C_Qtde_Notas    := 0;
        C_Qtde_Produtos := 0;
        Valor_Total     := 0;

        Primeira_Vez    := True;

        ConexaoBD.SQL_mb_papeletas.First;

        While Not ConexaoBD.SQL_mb_papeletas.Eof Do Begin

            If Trim(ConexaoBD.SQL_mb_papeletasmb_papeleta_codigo.Text) <> Trim(C_Codigo) Then
               Begin

               If Not Primeira_Vez Then
                  Begin
                  ConexaoBD.SQL_Swap_Valor_Vendido.Close;
                  ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
                  ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39 );
                  ConexaoBD.SQL_Swap_Valor_Vendido.Open;

                  If ConexaoBD.SQL_Swap_Valor_Vendido.RecordCount > 0 Then
                     Begin
                     Comando_SQL := 'Update ' + Nome_Tabela_Nota + ' Set ';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_notas = (fb_swap_nro_notas + ' + IntToStr(C_Qtde_Notas) + '), ';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos = (fb_swap_nro_produtos + ' + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + '), ';
                     Comando_SQL := Comando_SQL + 'fb_swap_valor = (fb_swap_valor + ' + Virgula_Ponto(FloatToStr(Valor_Total)) + ') ';
                     Comando_SQL := Comando_SQL + 'Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39;
                     End
                  Else
                     Begin
                     Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
                     Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
                     Comando_SQL := Comando_SQL + 'fb_swap_nome,';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
                     Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
                     Comando_SQL := Comando_SQL + 'fb_swap_valor)';
                     Comando_SQL := Comando_SQL + ' Values(';

                     Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
                     Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
                     Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
                     Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
                     Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';
                  End;

                  ConexaoBD.SQL_Comunitario.Close;
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;

               Primeira_Vez := False;

               C_Codigo        := Trim(ConexaoBD.SQL_mb_papeletasmb_papeleta_codigo.Text);
               C_Nome          := Trim(ConexaoBD.SQL_mb_papeletasmb_papeleta_nome.Text);
               C_Qtde_Notas    := 0;
               C_Qtde_Produtos := 0;
               Valor_Total     := 0;
            End;

            C_Qtde_Notas := C_Qtde_Notas + 1;
            Valor_Total  := Valor_Total + ConexaoBD.SQL_mb_papeletasmb_papeleta_valor_total.AsFloat;

            //*** Seleciona os Produtos da Nota ***

            Comando_SQL := 'Select * from mb_papeletas_produtos Where ';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_numero = ' + ConexaoBD.SQL_mb_papeletasmb_papeleta_numero.Text;

            ConexaoBD.SQL_mb_papeletas_Produtos.Close;
            ConexaoBD.SQL_mb_papeletas_Produtos.SQL.Clear;
            ConexaoBD.SQL_mb_papeletas_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_mb_papeletas_Produtos.Open;

            If ConexaoBD.SQL_mb_papeletas_Produtos.RecordCount > 0 Then
               Begin

               ConexaoBD.SQL_mb_papeletas_Produtos.First;

               While Not ConexaoBD.SQL_mb_papeletas_Produtos.Eof Do
                     Begin
                     C_Qtde_Produtos := C_Qtde_Produtos + ConexaoBD.SQL_mb_papeletas_Produtosmb_papeleta_produto_qtde.AsFloat;

                     ConexaoBD.SQL_mb_papeletas_Produtos.Next;
               End;
            End;

            ConexaoBD.SQL_mb_papeletas_Produtos.Close;

            ConexaoBD.SQL_mb_papeletas.Next;
        End;

        ConexaoBD.SQL_Swap_Valor_Vendido.Close;
        ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
        ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39 );
        ConexaoBD.SQL_Swap_Valor_Vendido.Open;

        If ConexaoBD.SQL_Swap_Valor_Vendido.RecordCount > 0 Then
           Begin
           Comando_SQL := 'Update ' + Nome_Tabela_Nota + ' Set ';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_notas = (fb_swap_nro_notas + ' + IntToStr(C_Qtde_Notas) + '), ';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos = (fb_swap_nro_produtos + ' + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + '), ';
           Comando_SQL := Comando_SQL + 'fb_swap_valor = (fb_swap_valor + ' + Virgula_Ponto(FloatToStr(Valor_Total)) + ') ';
           Comando_SQL := Comando_SQL + 'Where fb_swap_codigo = ' + #39 + Trim(C_Codigo) + #39;
           End
        Else
           Begin
           Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
           Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
           Comando_SQL := Comando_SQL + 'fb_swap_nome,';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_notas,';
           Comando_SQL := Comando_SQL + 'fb_swap_nro_produtos,';
           Comando_SQL := Comando_SQL + 'fb_swap_valor)';
           Comando_SQL := Comando_SQL + ' Values(';

           Comando_SQL := Comando_SQL + #39 + Trim(C_Codigo) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(C_Nome) + #39 + ',';
           Comando_SQL := Comando_SQL + IntToStr(C_Qtde_Notas) + ',';
           Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(C_Qtde_Produtos)) + ',';
           Comando_SQL := Comando_SQL + Virgula_Ponto(FloatToStr(Valor_Total)) + ')';
        End;
    End;

    ConexaoBD.SQL_Swap_Valor_Vendido.Close;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Clear;
    ConexaoBD.SQL_Swap_Valor_Vendido.SQL.Add('Select * from '+Nome_Tabela_Nota+' Order By fb_swap_valor desc limit ' + Trim(edtRanking.Text) );
    ConexaoBD.SQL_Swap_Valor_Vendido.Open;

    Application.CreateForm(TRelClientesValorVendido01,RelClientesValorVendido01);

    If (Trim(edtRanking.Text) <> '') And (StrToInt(edtRanking.Text) > 0) Then
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := RelClientesValorVendido01.lblQtdeDoRanking.Caption + Trim(edtRanking.Text)
    Else
        RelClientesValorVendido01.lblQtdeDoRanking.Caption  := '';

    RelClientesValorVendido01.QRL_Empresa.Caption       := 'Monibras';    
    RelClientesValorVendido01.lblTipoRelatorio.Caption  := RelClientesValorVendido01.lblTipoRelatorio.Caption + 'Todas' ;
    RelClientesValorVendido01.lblPeriodo.Caption        := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text;

    Seta();
    
    RelClientesValorVendido01.QR_ClientesValorVendido.Preview;
    RelClientesValorVendido01.QR_ClientesValorVendido.Destroy;
    RelClientesValorVendido01.Destroy;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

end.
