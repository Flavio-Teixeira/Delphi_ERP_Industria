unit Rel_Impostos_Pis_Cofins_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRelImpostosPisCofins00 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label3: TLabel;
    Panel1: TPanel;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    edtImposto: TEdit;
    Acc_Empresa: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelImpostosPisCofins00: TRelImpostosPisCofins00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Impostos_Pis_Cofins_01;

{$R *.dfm}

procedure TRelImpostosPisCofins00.btnSairClick(Sender: TObject);
begin
    RelImpostosPisCofins00.Close;
end;

procedure TRelImpostosPisCofins00.btnVisualizarClick(Sender: TObject);

var Comando_SQL, Imposto_taxa, Vlr_ICMS_Entrada: String;

begin
    if Trim(edtDataInicial.Text) = '/  /' Then Begin
        MSG_Erro('Antes de Prosseguir preencha o campo data inicial...');
        edtDataInicial.SetFocus;
    end
    Else if Trim(edtDataFinal.Text) = '/  /' Then Begin
        MSG_Erro('Antes de Prosseguir preencha o campo data final...');
        edtDataFinal.SetFocus;
    end
    Else if StrToDate(edtDataFinal.Text) < StrToDate(edtDataInicial.Text) Then Begin
        MSG_Erro('A data final não pode ser inferior a inicial...');
        edtDataInicial.SetFocus;
    end
    Else Begin
        Ampulheta();

        Application.CreateForm(TRelImpostosPisCofins01,RelImpostosPisCofins01);

        If Trim(edtImposto.Text) = 'ICMS' Then
           Begin
           Comando_SQL := 'Select sum(fb_nota_entrada_p_vlr_icms) as fb_nota_entrada_vlr_icms from fb_notas_entradas ';
           Comando_SQL := Comando_SQL + 'Where (fb_nota_entrada_desconto_icms = '+#39+'S'+#39+')';
           Comando_SQL := Comando_SQL + ' and ((fb_nota_entrada_data_emissao >= '+#39+Inverte_Data_Plus(Trim(edtDataInicial.Text),'amd','/')+#39+')';
           Comando_SQL := Comando_SQL + ' and (fb_nota_entrada_data_emissao <= '+#39+Inverte_Data_Plus(Trim(edtDataFinal.Text),'amd','/')+#39+'))';

           ConexaoBD.SQL_FB_Notas_Entradas_ICMS.Close;
           ConexaoBD.SQL_FB_Notas_Entradas_ICMS.SQL.Clear;
           ConexaoBD.SQL_FB_Notas_Entradas_ICMS.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_FB_Notas_Entradas_ICMS.Open;

           Vlr_ICMS_Entrada := Virgula_Ponto(ConexaoBD.SQL_FB_Notas_Entradas_ICMSfb_nota_entrada_vlr_icms.Text);

           If Trim(Vlr_ICMS_Entrada) = '' Then
              Begin
              Vlr_ICMS_Entrada := '0.00';
           End;

           ConexaoBD.SQL_FB_Notas_Entradas_ICMS.Close;
           End
        Else
           Begin
           Vlr_ICMS_Entrada := '0.00';
        End;

        //*** Obtem a Taxa do Imposto ***

        Comando_SQL := 'Select * from fb_impostos_taxas ';
        Comando_SQL := Comando_SQL + 'Where (fb_imposto_taxa_tipo = '+#39+Trim(edtImposto.Text)+#39+')';

        ConexaoBD.SQL_FB_Impostos_Taxas.Close;
        ConexaoBD.SQL_FB_Impostos_Taxas.SQL.Clear;
        ConexaoBD.SQL_FB_Impostos_Taxas.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Impostos_Taxas.Open;
        Imposto_taxa  := Virgula_Ponto(ConexaoBD.SQL_FB_Impostos_Taxasfb_imposto_taxa_porcentagem.Text);
        ConexaoBD.SQL_FB_Impostos_Taxas.Close;

        Comando_SQL := 'Select * from fb_notas_fiscais ';
        Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+')';
        Comando_SQL := Comando_SQL + ' and ((fb_nota_fiscal_data_emissao >= '+#39+Inverte_Data_Plus(Trim(edtDataInicial.Text),'amd','/')+#39+')';
        Comando_SQL := Comando_SQL + ' and (fb_nota_fiscal_data_emissao <= '+#39+Inverte_Data_Plus(Trim(edtDataFinal.Text),'amd','/')+#39+'))';

        ConexaoBD.SQL_FB_Rel_Impostos_Pis_Cofins.Close;
        ConexaoBD.SQL_FB_Rel_Impostos_Pis_Cofins.SQL.Clear;
        ConexaoBD.SQL_FB_Rel_Impostos_Pis_Cofins.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Rel_Impostos_Pis_Cofins.Open;

        RelImpostosPisCofins01.lblTitulo.Caption := RelImpostosPisCofins01.lblTitulo.Caption + edtImposto.Text;

        If Trim(edtImposto.Text) = 'ICMS' Then
           Begin
           RelImpostosPisCofins01.Exp_Vlr.Expression           := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',(fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi))';
           RelImpostosPisCofins01.Exp_Vlr_Total.Expression     := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',SUM(fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi))';
           RelImpostosPisCofins01.Exp_Imposto.Expression       := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',fb_nota_fiscal_icms)';
           RelImpostosPisCofins01.Total_Exp_Imposto.Expression := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',SUM(fb_nota_fiscal_icms))';
           End
        Else If Trim(edtImposto.Text) = 'IPI' Then
           Begin
           RelImpostosPisCofins01.Exp_Vlr.Expression           := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',(fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi))';
           RelImpostosPisCofins01.Exp_Vlr_Total.Expression     := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',SUM(fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi))';
           RelImpostosPisCofins01.Exp_Imposto.Expression       := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',fb_nota_fiscal_valor_ipi)';
           RelImpostosPisCofins01.Total_Exp_Imposto.Expression := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',SUM(fb_nota_fiscal_valor_ipi))';
           End
        Else
           Begin
           RelImpostosPisCofins01.Exp_Vlr.Expression           := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',(fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi))';
           RelImpostosPisCofins01.Exp_Vlr_Total.Expression     := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',SUM(fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi))';
           RelImpostosPisCofins01.Exp_Imposto.Expression       := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',(((fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi) * ' + Trim(Imposto_taxa) + ') / 100))';
           RelImpostosPisCofins01.Total_Exp_Imposto.Expression := 'FORMATNUMERIC('+#39+'R$ 0.00'+#39+',SUM((((fb_nota_fiscal_valor_total - fb_nota_fiscal_valor_ipi) * ' + Trim(Imposto_taxa) + ') / 100)))';
        End;

        RelImpostosPisCofins01.lblPeriodo.Caption             := 'Período de '+edtDataInicial.Text+' até '+edtDataFinal.Text;
        RelImpostosPisCofins01.lblPorcentagemImposto.Caption  := 'Porcentagem do Imposto: ' + Trim(Imposto_taxa);

        If Trim(edtImposto.Text) = 'ICMS' Then
           Begin
           RelImpostosPisCofins01.lblICMSNotaEntrada.Caption     := 'Valor do ICMS das Notas de Entrada: R$ ' + Trim(Vlr_ICMS_Entrada);
           RelImpostosPisCofins01.Exp_Total.Expression           := 'FORMATNUMERIC('+#39+'Valor do ICMS a ser pago R$ 0.00                        Total'+#39+', SUM(fb_nota_fiscal_icms) - ' + Trim(Vlr_ICMS_Entrada) + ')'
           End
        Else
           Begin
           RelImpostosPisCofins01.lblICMSNotaEntrada.Caption     := ' ';
           RelImpostosPisCofins01.Exp_Total.Expression           := 'IF(0=0,'+#39+'Total'+#39+','+#39+'Total'+#39+')';
        End;

        Seta();

        RelImpostosPisCofins01.QR_Imposto_Pis_Cofins.Preview;
        RelImpostosPisCofins01.Destroy;

    End;
end;

procedure TRelImpostosPisCofins00.FormShow(Sender: TObject);
begin
    edtDataInicial.Text := DateToStr(Date());
    edtDataFinal.Text   := DateToStr(Date());

    RelImpostosPisCofins00.Caption := 'Impostos - ' + edtImposto.Text;
end;

procedure TRelImpostosPisCofins00.edtDataInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelImpostosPisCofins00.edtDataFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

end.
