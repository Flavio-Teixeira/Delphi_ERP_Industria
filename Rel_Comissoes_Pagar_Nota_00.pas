unit Rel_Comissoes_Pagar_Nota_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TRelComissoesPagarNota00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Calculo_Dia_05: TRadioButton;
    Calculo_Dia_20: TRadioButton;
    Label1: TLabel;
    Label7: TLabel;
    Calculo_Mes: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Calculo_Ano: TEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Calculo_Periodo_Inicial: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Calculo_Periodo_Final: TMaskEdit;
    Label41: TLabel;
    Calculo_Representante: TComboBox;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Calculo_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure Calculo_Dia_05Click(Sender: TObject);
    procedure Calculo_Dia_20Click(Sender: TObject);
    procedure Calculo_MesChange(Sender: TObject);
    procedure Calculo_AnoChange(Sender: TObject);
    procedure Calculo_Dia_05KeyPress(Sender: TObject; var Key: Char);
    procedure Calculo_Dia_20KeyPress(Sender: TObject; var Key: Char);
    procedure Calculo_MesKeyPress(Sender: TObject; var Key: Char);
    procedure Calculo_Periodo_InicialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Calculo_Periodo_FinalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Calculo_RepresentanteKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Prepara_Periodo_Calculo();

  public
    { Public declarations }
  end;

var
  RelComissoesPagarNota00: TRelComissoesPagarNota00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Comissoes_Pagar_Nota_01, Ibrasmak_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************


//******************
//*** Procedures ***
//******************

procedure TRelComissoesPagarNota00.BT_SairClick(Sender: TObject);
begin
     RelComissoesPagarNota00.Close;
end;

procedure TRelComissoesPagarNota00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelComissoesPagarNota00.FormShow(Sender: TObject);
begin
     Ampulheta();

     // Obtem os Representantes
     ConexaoBD.SQL_FB_Representantes.Close;
     ConexaoBD.SQL_FB_Representantes.SQL.Clear;
     ConexaoBD.SQL_FB_Representantes.SQL.Add('Select * from fb_representantes Order By fb_representante_nome');
     ConexaoBD.SQL_FB_Representantes.Open;

     Calculo_Representante.Items.Clear;
     Calculo_Representante.Items.Add('--- Todos os Repesentantes ---');

     If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
        begin
        ConexaoBD.SQL_FB_Representantes.First;

        While Not ConexaoBD.SQL_FB_Representantes.Eof Do
              begin
              Calculo_Representante.Items.Add(IntToStr(ConexaoBD.SQL_FB_Representantesfb_representante_codigo.AsInteger)+' - '+ConexaoBD.SQL_FB_Representantesfb_representante_nome.AsString);
              ConexaoBD.SQL_FB_Representantes.Next;
        End;
     end;

     ConexaoBD.SQL_FB_Representantes.Close;
     Calculo_Representante.ItemIndex := 0;

     Calculo_Ano.Text      := Copy(DateToStr(Date()),7,4);
     Calculo_Mes.ItemIndex := (StrToInt(Copy(DateToStr(Date()),4,2)) - 1);

     If StrToInt(Copy(DateToStr(Date()),1,2)) >= 20 Then
        Begin
        Calculo_Dia_20.Checked := True;
        Calculo_Dia_05.Checked := False;
        End
     Else
        Begin
        Calculo_Dia_20.Checked := False;
        Calculo_Dia_05.Checked := True;
     End;

     Prepara_Periodo_Calculo();

     Seta();
end;

procedure TRelComissoesPagarNota00.Calculo_AnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelComissoesPagarNota00.Prepara_Periodo_Calculo();

var
   Periodo_Inicial, Periodo_Final, Mes_Periodo, Ano_Periodo: String;

begin
     Periodo_Inicial := '';
     Periodo_Final   := '';

     If Calculo_Dia_20.Checked Then
        Begin
        Periodo_Inicial := '01/';
        Periodo_Final   := '15/';

        Periodo_Inicial := Periodo_Inicial + Copy(Calculo_Mes.Text,1,2) + '/' + Trim(Calculo_Ano.Text);
        Periodo_Final   := Periodo_Final + Copy(Calculo_Mes.Text,1,2) + '/' + Trim(Calculo_Ano.Text);
        End
     Else
        Begin
        Periodo_Inicial := '16/';

        Mes_Periodo := IntToStr(StrToInt(Copy(Calculo_Mes.Text,1,2)) - 1);
        Ano_Periodo := Calculo_Ano.Text;

        If (Trim(Mes_Periodo) = '0') Or (Trim(Mes_Periodo) = '00') Or (Trim(Mes_Periodo) = '') Then
           Begin
           Mes_Periodo := '12';
           Ano_Periodo := IntToStr(StrToInt(Ano_Periodo) - 1);
        End;

        If Length(Mes_Periodo) <= 1 Then
           Begin
           Mes_Periodo := '0' + Mes_Periodo;
        End;

        If (Trim(Mes_Periodo) = '01') Or (Trim(Mes_Periodo) = '03') Or (Trim(Mes_Periodo) = '05') Or (Trim(Mes_Periodo) = '07') Or (Trim(Mes_Periodo) = '08') Or (Trim(Mes_Periodo) = '10') Or (Trim(Mes_Periodo) = '12') Then
           Begin
           Periodo_Final := '31/';
           End
        Else If (Trim(Mes_Periodo) = '04') Or (Trim(Mes_Periodo) = '06') Or (Trim(Mes_Periodo) = '09') Or (Trim(Mes_Periodo) = '11') Then
           Begin
           Periodo_Final := '30/';
           End
        Else
           Begin
           If (StrToInt(Calculo_Ano.Text) Mod 4) = 0 Then
              Begin
              Periodo_Final := '29/';
              End
           Else
              Begin
              Periodo_Final := '28/';
           End;
        End;

        Periodo_Inicial := Periodo_Inicial + Trim(Mes_Periodo) + '/' + Trim(Ano_Periodo);
        Periodo_Final   := Periodo_Final + Trim(Mes_Periodo) + '/' + Trim(Ano_Periodo);
     End;

     Calculo_Periodo_Inicial.Text := Periodo_Inicial;
     Calculo_Periodo_Final.Text   := Periodo_Final;
end;

procedure TRelComissoesPagarNota00.Calculo_Dia_05Click(Sender: TObject);
begin
     Prepara_Periodo_Calculo();
end;

procedure TRelComissoesPagarNota00.Calculo_Dia_20Click(Sender: TObject);
begin
     Prepara_Periodo_Calculo();
end;

procedure TRelComissoesPagarNota00.Calculo_MesChange(Sender: TObject);
begin
     Prepara_Periodo_Calculo();
end;

procedure TRelComissoesPagarNota00.Calculo_AnoChange(Sender: TObject);
begin
     Prepara_Periodo_Calculo();
end;

procedure TRelComissoesPagarNota00.Calculo_Dia_05KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelComissoesPagarNota00.Calculo_Dia_20KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelComissoesPagarNota00.Calculo_MesKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelComissoesPagarNota00.Calculo_Periodo_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelComissoesPagarNota00.Calculo_Periodo_FinalKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelComissoesPagarNota00.Calculo_RepresentanteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelComissoesPagarNota00.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL, Rel_Expressao: String;

begin
     If ((Trim(Calculo_Periodo_Inicial.Text) <> '/  /') And (Trim(Calculo_Periodo_Final.Text) <> '/  /') And (StrToDate(Calculo_Periodo_Inicial.Text) <= StrToDate(Calculo_Periodo_Final.Text))) Then
        Begin
        If Trim(Calculo_Representante.Text) = '--- Todos os Repesentantes ---' Then
           Begin
           Comando_SQL := 'select ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_numero,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo_tipo,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nome,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_desconto,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_fatura,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_tabela,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_emite_lote,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_transp,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_transporta,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_desc,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_pedido,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_total,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao_log,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_pgto_frete,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_estado,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_faturado,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_vendedor,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_banco,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_1 <> '+#39+#39' and fb_nota_fiscal_dup_forma_1 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_1,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_2 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_2 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_2,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_3 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_3 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_3,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_volume,';
           Comando_SQL := Comando_SQL + 'fb_representante_codigo,';
           Comando_SQL := Comando_SQL + 'fb_representante_nome,';
           Comando_SQL := Comando_SQL + 'fb_representante_endereco,';
           Comando_SQL := Comando_SQL + 'fb_representante_complemento,';
           Comando_SQL := Comando_SQL + 'fb_representante_bairro,';
           Comando_SQL := Comando_SQL + 'fb_representante_cidade,';
           Comando_SQL := Comando_SQL + 'fb_representante_estado,';
           Comando_SQL := Comando_SQL + 'fb_representante_cep,';
           Comando_SQL := Comando_SQL + 'fb_representante_pais,';
           Comando_SQL := Comando_SQL + 'fb_representante_contato,';
           Comando_SQL := Comando_SQL + 'fb_representante_ddd,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_ramal,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_com,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_res,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_cel,';
           Comando_SQL := Comando_SQL + 'fb_representante_email,';
           Comando_SQL := Comando_SQL + 'fb_representante_1_porcentagem,';
           Comando_SQL := Comando_SQL + 'fb_representante_2_porcentagem,';
           Comando_SQL := Comando_SQL + 'fb_representante_icms,';
           Comando_SQL := Comando_SQL + 'fb_representante_relatorio,';
           Comando_SQL := Comando_SQL + 'fb_representante_observacao';
           Comando_SQL := Comando_SQL + ' from fb_notas_fiscais, fb_representantes';
           Comando_SQL := Comando_SQL + ' where fb_nota_fiscal_vendedor = fb_representante_codigo and fb_representante_relatorio = '+#39+'S'+#39;
           Comando_SQL := Comando_SQL + ' and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_nota_fiscal_natureza_oper = '+#39+'Vendas'+#39+' Or fb_nota_fiscal_natureza_oper = '+#39+'Exportação'+#39+') Order By fb_representante_codigo, fb_nota_fiscal_numero';
           End
        Else
           Begin
           Comando_SQL := 'select ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_numero,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo_tipo,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nome,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_desconto,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_fatura,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_tabela,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_emite_lote,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_transp,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_transporta,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_desc,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_pedido,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_total,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao_log,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_pgto_frete,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_estado,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_faturado,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_vendedor,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_banco,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_1 <> '+#39+#39' and fb_nota_fiscal_dup_forma_1 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_1,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_1,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_2 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_2 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_2,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_2,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_3 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_3 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_3,';
           Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_3,';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_volume,';
           Comando_SQL := Comando_SQL + 'fb_representante_codigo,';
           Comando_SQL := Comando_SQL + 'fb_representante_nome,';
           Comando_SQL := Comando_SQL + 'fb_representante_endereco,';
           Comando_SQL := Comando_SQL + 'fb_representante_complemento,';
           Comando_SQL := Comando_SQL + 'fb_representante_bairro,';
           Comando_SQL := Comando_SQL + 'fb_representante_cidade,';
           Comando_SQL := Comando_SQL + 'fb_representante_estado,';
           Comando_SQL := Comando_SQL + 'fb_representante_cep,';
           Comando_SQL := Comando_SQL + 'fb_representante_pais,';
           Comando_SQL := Comando_SQL + 'fb_representante_contato,';
           Comando_SQL := Comando_SQL + 'fb_representante_ddd,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_ramal,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_com,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_res,';
           Comando_SQL := Comando_SQL + 'fb_representante_fone_cel,';
           Comando_SQL := Comando_SQL + 'fb_representante_email,';
           Comando_SQL := Comando_SQL + 'fb_representante_1_porcentagem,';
           Comando_SQL := Comando_SQL + 'fb_representante_2_porcentagem,';
           Comando_SQL := Comando_SQL + 'fb_representante_icms,';
           Comando_SQL := Comando_SQL + 'fb_representante_relatorio,';
           Comando_SQL := Comando_SQL + 'fb_representante_observacao';
           Comando_SQL := Comando_SQL + ' from fb_notas_fiscais, fb_representantes';
           Comando_SQL := Comando_SQL + ' where fb_nota_fiscal_vendedor = fb_representante_codigo and';
           Comando_SQL := Comando_SQL + ' fb_representante_codigo = '+Trim(Obtem_Nro_Antes_Traco(Calculo_Representante.Text));
           Comando_SQL := Comando_SQL + ' and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
           Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_nota_fiscal_natureza_oper = '+#39+'Vendas'+#39+' Or fb_nota_fiscal_natureza_oper = '+#39+'Exportação'+#39+') Order By fb_representante_codigo, fb_nota_fiscal_numero';
        End;

        Ampulheta();

        ConexaoBD.SQL_Rel_Comissoes_Nota.Close;
        ConexaoBD.SQL_Rel_Comissoes_Nota.SQL.Clear;
        ConexaoBD.SQL_Rel_Comissoes_Nota.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Rel_Comissoes_Nota.Open;

        Application.CreateForm(TRelComissoesPagarNota01,RelComissoesPagarNota01);

        RelComissoesPagarNota01.QR_Titulo.Caption := 'Comissão a Pagar Referente ao Período de: ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text);

        If Calculo_Dia_20.Checked Then
           Begin
           RelComissoesPagarNota01.QR_DT_Pgto.Caption := '20/'+Trim(Copy(Calculo_Mes.Text,1,2))+'/'+Trim(Calculo_Ano.Text);
           End
        Else
           Begin
           RelComissoesPagarNota01.QR_DT_Pgto.Caption := '05/'+Trim(Copy(Calculo_Mes.Text,1,2))+'/'+Trim(Calculo_Ano.Text);
        End;

        Seta();

        RelComissoesPagarNota01.RelComissoesNota.Preview;
        RelComissoesPagarNota01.RelComissoesNota.Destroy;
        RelComissoesPagarNota01.Destroy;

        If Confirma('Imprime as Comissões dos Parceiros?') = 6 Then
           Begin
           Ampulheta();

           If Trim(Calculo_Representante.Text) = '--- Todos os Repesentantes ---' Then
              Begin
              Comando_SQL := 'select ';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_numero,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo_tipo,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nome,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_desconto,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_fatura,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_tabela,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_emite_lote,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_transp,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_transporta,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_desc,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_pedido,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_total,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao_log,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_pgto_frete,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_estado,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_faturado,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_vendedor,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_banco,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_1 <> '+#39+#39' and fb_nota_fiscal_dup_forma_1 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_1,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_2 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_2 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_2,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_3 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_3 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_3,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_volume,';
              Comando_SQL := Comando_SQL + 'fb_representante_codigo,';
              Comando_SQL := Comando_SQL + 'fb_representante_nome,';
              Comando_SQL := Comando_SQL + 'fb_representante_endereco,';
              Comando_SQL := Comando_SQL + 'fb_representante_complemento,';
              Comando_SQL := Comando_SQL + 'fb_representante_bairro,';
              Comando_SQL := Comando_SQL + 'fb_representante_cidade,';
              Comando_SQL := Comando_SQL + 'fb_representante_estado,';
              Comando_SQL := Comando_SQL + 'fb_representante_cep,';
              Comando_SQL := Comando_SQL + 'fb_representante_pais,';
              Comando_SQL := Comando_SQL + 'fb_representante_contato,';
              Comando_SQL := Comando_SQL + 'fb_representante_ddd,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_ramal,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_com,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_res,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_cel,';
              Comando_SQL := Comando_SQL + 'fb_representante_email,';
              Comando_SQL := Comando_SQL + 'fb_representante_1_porcentagem,';
              Comando_SQL := Comando_SQL + 'fb_representante_2_porcentagem,';
              Comando_SQL := Comando_SQL + 'fb_representante_icms,';
              Comando_SQL := Comando_SQL + 'fb_representante_relatorio,';
              Comando_SQL := Comando_SQL + 'fb_representante_observacao';
              Comando_SQL := Comando_SQL + ' from fb_notas_fiscais, fb_representantes';
              Comando_SQL := Comando_SQL + ' where fb_nota_fiscal_vendedor = fb_representante_codigo and fb_representante_relatorio = '+#39+'S'+#39+' and fb_representante_2_porcentagem > 0';
              Comando_SQL := Comando_SQL + ' and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_nota_fiscal_natureza_oper = '+#39+'Vendas'+#39+' Or fb_nota_fiscal_natureza_oper = '+#39+'Exportação'+#39+') Order By fb_representante_codigo, fb_nota_fiscal_numero';
              End
           Else
              Begin
              Comando_SQL := 'select ';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_numero,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo_tipo,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nome,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_desconto,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_fatura,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_tabela,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_emite_lote,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_transp,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_transporta,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_desc,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_pedido,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_total,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao_log,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_pgto_frete,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_estado,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_faturado,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_vendedor,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_banco,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_1 <> '+#39+#39' and fb_nota_fiscal_dup_forma_1 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_1,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_1,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_2 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_2 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_2,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_2,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_forma_3 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_3 <> '+#39+'0'+#39+') and ((fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or (fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_dup_imprime_3,';
              Comando_SQL := Comando_SQL + 'if((fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+'),'+#39+'S'+#39+','+#39+'N'+#39+') as fb_nota_fiscal_comissao_3,';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_volume,';
              Comando_SQL := Comando_SQL + 'fb_representante_codigo,';
              Comando_SQL := Comando_SQL + 'fb_representante_nome,';
              Comando_SQL := Comando_SQL + 'fb_representante_endereco,';
              Comando_SQL := Comando_SQL + 'fb_representante_complemento,';
              Comando_SQL := Comando_SQL + 'fb_representante_bairro,';
              Comando_SQL := Comando_SQL + 'fb_representante_cidade,';
              Comando_SQL := Comando_SQL + 'fb_representante_estado,';
              Comando_SQL := Comando_SQL + 'fb_representante_cep,';
              Comando_SQL := Comando_SQL + 'fb_representante_pais,';
              Comando_SQL := Comando_SQL + 'fb_representante_contato,';
              Comando_SQL := Comando_SQL + 'fb_representante_ddd,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_ramal,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_com,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_res,';
              Comando_SQL := Comando_SQL + 'fb_representante_fone_cel,';
              Comando_SQL := Comando_SQL + 'fb_representante_email,';
              Comando_SQL := Comando_SQL + 'fb_representante_1_porcentagem,';
              Comando_SQL := Comando_SQL + 'fb_representante_2_porcentagem,';
              Comando_SQL := Comando_SQL + 'fb_representante_icms,';
              Comando_SQL := Comando_SQL + 'fb_representante_relatorio,';
              Comando_SQL := Comando_SQL + 'fb_representante_observacao';
              Comando_SQL := Comando_SQL + ' from fb_notas_fiscais, fb_representantes';
              Comando_SQL := Comando_SQL + ' where fb_nota_fiscal_vendedor = fb_representante_codigo and fb_representante_2_porcentagem > 0 and ';
              Comando_SQL := Comando_SQL + ' fb_representante_codigo = '+Trim(Obtem_Nro_Antes_Traco(Calculo_Representante.Text));
              Comando_SQL := Comando_SQL + ' and ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_1 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_1 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_2 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_2 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') or ';
              Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_3 >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_dup_dt_pgto_3 <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_nota_fiscal_natureza_oper = '+#39+'Vendas'+#39+' Or fb_nota_fiscal_natureza_oper = '+#39+'Exportação'+#39+') Order By fb_representante_codigo, fb_nota_fiscal_numero';
           End;

           ConexaoBD.SQL_Rel_Comissoes_Nota.Close;
           ConexaoBD.SQL_Rel_Comissoes_Nota.SQL.Clear;
           ConexaoBD.SQL_Rel_Comissoes_Nota.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Rel_Comissoes_Nota.Open;

           Application.CreateForm(TRelComissoesPagarNota01,RelComissoesPagarNota01);

           RelComissoesPagarNota01.QR_Titulo.Caption := 'Comissão a Pagar Referente ao Período de: ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text);

           If Calculo_Dia_20.Checked Then
              Begin
              RelComissoesPagarNota01.QR_DT_Pgto.Caption := '20/'+Trim(Copy(Calculo_Mes.Text,1,2))+'/'+Trim(Calculo_Ano.Text);
              End
           Else
              Begin
              RelComissoesPagarNota01.QR_DT_Pgto.Caption := '05/'+Trim(Copy(Calculo_Mes.Text,1,2))+'/'+Trim(Calculo_Ano.Text);
           End;

           RelComissoesPagarNota01.Rel_Comissao_1.Expression := 'if(fb_nota_fiscal_dup_imprime_1 = '+#39+'S'+#39+',if(fb_nota_fiscal_comissao_1 = '+#39+'S'+#39+',FORMATNUMERIC('+#39+'0.00'+#39+',(fb_nota_fiscal_dup_vlr_pgto_1 - (IF(fb_representante_icms ='+#39+'S'+#39+',IF(fb_nota_fiscal_estado ='+#39+'SP'+#39+',fb_nota_fiscal_dup_vlr_pgto_1 * 0.18,IF((fb_nota_fiscal_estado ='+#39+'RS'+#39+') or (fb_nota_fiscal_estado ='+#39+'SC'+#39+') or (fb_nota_fiscal_estado ='+#39+'PR'+#39+') or (fb_nota_fiscal_estado ='+#39+'RJ'+#39+') or (fb_nota_fiscal_estado ='+#39+'MG'+#39+') or (fb_nota_fiscal_estado ='+#39+'MT'+#39+') or (fb_nota_fiscal_estado ='+#39+'MS'+#39+'),fb_nota_fiscal_dup_vlr_pgto_1 * 0.12,fb_nota_fiscal_dup_vlr_pgto_1 * 0.07)),0))) * (fb_representante_2_porcentagem / 100)),'+#39+'-'+#39+'),'+#39+#39+')';
           RelComissoesPagarNota01.Rel_Comissao_2.Expression := 'if(fb_nota_fiscal_dup_imprime_2 = '+#39+'S'+#39+',if(fb_nota_fiscal_comissao_2 = '+#39+'S'+#39+',FORMATNUMERIC('+#39+'0.00'+#39+',(fb_nota_fiscal_dup_vlr_pgto_2 - (IF(fb_representante_icms ='+#39+'S'+#39+',IF(fb_nota_fiscal_estado ='+#39+'SP'+#39+',fb_nota_fiscal_dup_vlr_pgto_1 * 0.18,IF((fb_nota_fiscal_estado ='+#39+'RS'+#39+') or (fb_nota_fiscal_estado ='+#39+'SC'+#39+') or (fb_nota_fiscal_estado ='+#39+'PR'+#39+') or (fb_nota_fiscal_estado ='+#39+'RJ'+#39+') or (fb_nota_fiscal_estado ='+#39+'MG'+#39+') or (fb_nota_fiscal_estado ='+#39+'MT'+#39+') or (fb_nota_fiscal_estado ='+#39+'MS'+#39+'),fb_nota_fiscal_dup_vlr_pgto_2 * 0.12,fb_nota_fiscal_dup_vlr_pgto_2 * 0.07)),0))) * (fb_representante_2_porcentagem / 100)),'+#39+'-'+#39+'),'+#39+#39+')';
           RelComissoesPagarNota01.Rel_Comissao_3.Expression := 'if(fb_nota_fiscal_dup_imprime_3 = '+#39+'S'+#39+',if(fb_nota_fiscal_comissao_3 = '+#39+'S'+#39+',FORMATNUMERIC('+#39+'0.00'+#39+',(fb_nota_fiscal_dup_vlr_pgto_3 - (IF(fb_representante_icms ='+#39+'S'+#39+',IF(fb_nota_fiscal_estado ='+#39+'SP'+#39+',fb_nota_fiscal_dup_vlr_pgto_3 * 0.18,IF((fb_nota_fiscal_estado ='+#39+'RS'+#39+') or (fb_nota_fiscal_estado ='+#39+'SC'+#39+') or (fb_nota_fiscal_estado ='+#39+'PR'+#39+') or (fb_nota_fiscal_estado ='+#39+'RJ'+#39+') or (fb_nota_fiscal_estado ='+#39+'MG'+#39+') or (fb_nota_fiscal_estado ='+#39+'MT'+#39+') or (fb_nota_fiscal_estado ='+#39+'MS'+#39+'),fb_nota_fiscal_dup_vlr_pgto_3 * 0.12,fb_nota_fiscal_dup_vlr_pgto_3 * 0.07)),0))) * (fb_representante_2_porcentagem / 100)),'+#39+'-'+#39+'),'+#39+#39+')';

           Rel_Expressao := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(if(fb_nota_fiscal_dup_imprime_1 = '+#39+'S'+#39+',if(fb_nota_fiscal_comissao_1 = '+#39+'S'+#39+',(fb_nota_fiscal_dup_vlr_pgto_1 - (IF(fb_representante_icms ='+#39+'S'+#39+',IF(fb_nota_fiscal_estado ='+#39+'SP'+#39+',fb_nota_fiscal_dup_vlr_pgto_1 * 0.18,IF((fb_nota_fiscal_estado ='+#39+'RS'+#39+') or (fb_nota_fiscal_estado ='+#39+'SC'+#39+') or (fb_nota_fiscal_estado ='+#39+'PR'+#39+') or (fb_nota_fiscal_estado ='+#39+'RJ'+#39+') or (fb_nota_fiscal_estado ='+#39+'MG'+#39+') or (fb_nota_fiscal_estado ='+#39+'MT'+#39+') or (fb_nota_fiscal_estado ='+#39+'MS'+#39+'),fb_nota_fiscal_dup_vlr_pgto_1 * 0.12,fb_nota_fiscal_dup_vlr_pgto_1 * 0.07)),0.00))) * (fb_representante_2_porcentagem / 100),0.00),0.00) + ';
           Rel_Expressao := Rel_Expressao + 'if(fb_nota_fiscal_dup_imprime_2 = '+#39+'S'+#39+',if(fb_nota_fiscal_comissao_2 = '+#39+'S'+#39+',(fb_nota_fiscal_dup_vlr_pgto_2 - (IF(fb_representante_icms ='+#39+'S'+#39+',IF(fb_nota_fiscal_estado ='+#39+'SP'+#39+',fb_nota_fiscal_dup_vlr_pgto_2 * 0.18,IF((fb_nota_fiscal_estado ='+#39+'RS'+#39+') or (fb_nota_fiscal_estado ='+#39+'SC'+#39+') or (fb_nota_fiscal_estado ='+#39+'PR'+#39+') or (fb_nota_fiscal_estado ='+#39+'RJ'+#39+') or (fb_nota_fiscal_estado ='+#39+'MG'+#39+') or (fb_nota_fiscal_estado ='+#39+'MT'+#39+') or (fb_nota_fiscal_estado ='+#39+'MS'+#39+'),fb_nota_fiscal_dup_vlr_pgto_2 * 0.12,fb_nota_fiscal_dup_vlr_pgto_2 * 0.07)),0.00))) * (fb_representante_2_porcentagem / 100),0.00),0.00) + ';
           Rel_Expressao := Rel_Expressao + 'if(fb_nota_fiscal_dup_imprime_3 = '+#39+'S'+#39+',if(fb_nota_fiscal_comissao_3 = '+#39+'S'+#39+',(fb_nota_fiscal_dup_vlr_pgto_3 - (IF(fb_representante_icms ='+#39+'S'+#39+',IF(fb_nota_fiscal_estado ='+#39+'SP'+#39+',fb_nota_fiscal_dup_vlr_pgto_3 * 0.18,IF((fb_nota_fiscal_estado ='+#39+'RS'+#39+') or (fb_nota_fiscal_estado ='+#39+'SC'+#39+') or (fb_nota_fiscal_estado ='+#39+'PR'+#39+') or (fb_nota_fiscal_estado ='+#39+'RJ'+#39+') or (fb_nota_fiscal_estado ='+#39+'MG'+#39+') or (fb_nota_fiscal_estado ='+#39+'MT'+#39+') or (fb_nota_fiscal_estado ='+#39+'MS'+#39+'),fb_nota_fiscal_dup_vlr_pgto_3 * 0.12,fb_nota_fiscal_dup_vlr_pgto_3 * 0.07)),0.00))) * (fb_representante_2_porcentagem / 100),0.00),0.00)))';
           RelComissoesPagarNota01.Rel_Tot_Comissao.Expression := Rel_Expressao;

           RelComissoesPagarNota01.Rel_Porc.Expression := 'FORMATNUMERIC('+#39+'0.00 %'+#39+',fb_representante_2_porcentagem)';

           Seta();

           RelComissoesPagarNota01.RelComissoesNota.Preview;
           RelComissoesPagarNota01.RelComissoesNota.Destroy;
           RelComissoesPagarNota01.Destroy;
        End;

        End
     Else
        Begin
        MSG_Erro('O Período deve ser preenchido corretamente');
        Calculo_Periodo_Inicial.SetFocus;
     End;
end;

end.
