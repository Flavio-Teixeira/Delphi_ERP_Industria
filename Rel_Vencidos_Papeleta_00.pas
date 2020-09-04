unit Rel_Vencidos_Papeleta_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelVencidosPapeleta00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Data_Vencimento: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure Panel2Click(Sender: TObject);
    procedure Data_VencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVencidosPapeleta00: TRelVencidosPapeleta00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Vencidos_Papeleta_01, Ibrasmak_00;

{$R *.dfm}

procedure TRelVencidosPapeleta00.Panel2Click(Sender: TObject);
begin
    RelVencidosPapeleta00.Close;
end;

procedure TRelVencidosPapeleta00.Data_VencimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVencidosPapeleta00.FormCreate(Sender: TObject);
begin
//*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TRelVencidosPapeleta00.FormShow(Sender: TObject);
begin
    // Carrega data atual no campo Data de Emissão
    Data_Vencimento.Text := DateToStr(Date());
end;

procedure TRelVencidosPapeleta00.BT_SairClick(Sender: TObject);
begin
  RelVencidosPapeleta00.Close;
end;

procedure TRelVencidosPapeleta00.BT_ImprimirClick(Sender: TObject);
var
  Comando_SQL,Vencimento : String;
begin
  if Trim(Data_Vencimento.Text) = '/  /' Then
    begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data de Emissão...');
    Data_Vencimento.SetFocus;
    end
  else
    begin
    Vencimento  := Inverte_Data_Plus(Data_Vencimento.Text,'amd','/');

    Application.CreateForm(TRelVencidosPapeleta01,RelVencidosPapeleta01);

    Comando_SQL := 'Select ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_numero, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo_tipo, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nome, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_desconto, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_fatura, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_tabela, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_emite_lote, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_transp, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_transporta, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_desc, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_pedido, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_total, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_pgto_frete, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_estado, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_faturado, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_vendedor, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_banco, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1, ';
    Comando_SQL := Comando_SQL + '(if(fb_nota_fiscal_dup_dt_vcto_1 >='+#39+Vencimento+#39+','+#39+#39+',date_format(fb_nota_fiscal_dup_dt_vcto_1,'+#39+'%d/%m/%Y'+#39+'))) as fb_nota_fiscal_dup_dt_vcto_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2, ';
    Comando_SQL := Comando_SQL + '(if(fb_nota_fiscal_dup_dt_vcto_2 >='+#39+Vencimento+#39+','+#39+#39+',date_format(fb_nota_fiscal_dup_dt_vcto_2,'+#39+'%d/%m/%Y'+#39+'))) as fb_nota_fiscal_dup_dt_vcto_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3, ';
    Comando_SQL := Comando_SQL + '(if(fb_nota_fiscal_dup_dt_vcto_3 >='+#39+Vencimento+#39+','+#39+#39+',date_format(fb_nota_fiscal_dup_dt_vcto_3,'+#39+'%d/%m/%Y'+#39+'))) as fb_nota_fiscal_dup_dt_vcto_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_volume, ';
    Comando_SQL := Comando_SQL + 'format((To_Days('+#39+Vencimento+#39+') - To_Days(fb_nota_fiscal_dup_dt_vcto_1)),0) as fb_nota_fiscal_dup_atraso_1, ';
    Comando_SQL := Comando_SQL + 'format((To_Days('+#39+Vencimento+#39+') - To_Days(fb_nota_fiscal_dup_dt_vcto_2)),0) as fb_nota_fiscal_dup_atraso_2, ';
    Comando_SQL := Comando_SQL + 'format((To_Days('+#39+Vencimento+#39+') - To_Days(fb_nota_fiscal_dup_dt_vcto_3)),0) as fb_nota_fiscal_dup_atraso_3, ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao_log ';
    Comando_SQL := Comando_SQL + 'from fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '(((fb_nota_fiscal_dup_dt_vcto_1 < '+#39+Vencimento+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+''+#39+')) or ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_vcto_1 < '+#39+Vencimento+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+''+#39+')) or ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_vcto_1 < '+#39+Vencimento+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+''+#39+'))) and ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_1 ='+#39+''+#39+') or ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_2 ='+#39+''+#39+') or ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_dup_dt_pgto_3 ='+#39+''+#39+')) and ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_natureza_oper ='+#39+'Vendas'+#39+' Or fb_nota_fiscal_natureza_oper ='+#39+'Exportação'+#39+') and ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_tipo_fatura ='+#39+'Papeleta'+#39+') ';
    Comando_SQL := Comando_SQL + 'Order By fb_nota_fiscal_vendedor, fb_nota_fiscal_numero';

    ConexaoBD.SQL_Rel_Vencidos.Close;
    ConexaoBD.SQL_Rel_Vencidos.SQL.Clear;
    ConexaoBD.SQL_Rel_Vencidos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Rel_Vencidos.Open;

    RelVencidosPapeleta01.QR_Emissao.Caption := 'Vencimento: ' + Data_Vencimento.Text;
// Preenche Campos de Expressão
    RelVencidosPapeleta01.QRE_Banco1.Expression         := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),fb_nota_fiscal_dup_cod_bco_1,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Banco2.Expression         := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),fb_nota_fiscal_dup_cod_bco_2,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Banco3.Expression         := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),fb_nota_fiscal_dup_cod_bco_3,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Codigo1.Expression        := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),fb_nota_fiscal_codigo,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Codigo2.Expression        := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),fb_nota_fiscal_codigo,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Codigo3.Expression        := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),fb_nota_fiscal_codigo,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Nome1.Expression          := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),fb_nota_fiscal_nome,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Nome2.Expression          := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),fb_nota_fiscal_nome,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Nome3.Expression          := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),fb_nota_fiscal_nome,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Duplicata1.Expression     := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),fb_nota_fiscal_dup_nro_1,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Duplicata2.Expression     := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),fb_nota_fiscal_dup_nro_2,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Duplicata3.Expression     := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),fb_nota_fiscal_dup_nro_3,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Emissao1.Expression       := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),fb_nota_fiscal_data_emissao,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Emissao2.Expression       := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),fb_nota_fiscal_data_emissao,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Emissao3.Expression       := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),fb_nota_fiscal_data_emissao,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Vencimento1.Expression    := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),fb_nota_fiscal_dup_dt_vcto_1,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Vencimento2.Expression    := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),fb_nota_fiscal_dup_dt_vcto_2,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Vencimento3.Expression    := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),fb_nota_fiscal_dup_dt_vcto_3,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Vlr_Duplicata1.Expression := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),formatnumeric('+#39+'0.00'+#39+',fb_nota_fiscal_dup_vlr_1),'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Vlr_Duplicata2.Expression := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),formatnumeric('+#39+'0.00'+#39+',fb_nota_fiscal_dup_vlr_2),'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Vlr_Duplicata3.Expression := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),formatnumeric('+#39+'0.00'+#39+',fb_nota_fiscal_dup_vlr_3),'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Atraso1.Expression        := 'if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <> '+#39+#39+'),fb_nota_fiscal_dup_atraso_1,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Atraso2.Expression        := 'if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <> '+#39+#39+'),fb_nota_fiscal_dup_atraso_2,'+#39+#39+')';
    RelVencidosPapeleta01.QRE_Atraso3.Expression        := 'if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <> '+#39+#39+'),fb_nota_fiscal_dup_atraso_3,'+#39+#39+')';

    RelVencidosPapeleta01.QRE_Total.Expression          := 'SUM((if((fb_nota_fiscal_dup_nro_1 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <>'+#39+#39+'),fb_nota_fiscal_dup_vlr_1,0))+(if((fb_nota_fiscal_dup_nro_2 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <>'+#39+#39+'),fb_nota_fiscal_dup_vlr_2,0))+(if((fb_nota_fiscal_dup_nro_3 <> '+#39+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <>'+#39+#39+'),fb_nota_fiscal_dup_vlr_3,0)))';

    RelVencidosPapeleta01.QR_Vencidos.Preview;
    RelVencidosPapeleta01.Destroy;
  end;
end;

end.
