unit Rel_Faturamento_Outras_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelFaturamentoOutrasSaidas00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Acc_Empresa: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFaturamentoOutrasSaidas00: TRelFaturamentoOutrasSaidas00;

implementation

uses Rel_Faturamento_Outras_Saidas_01, Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TRelFaturamentoOutrasSaidas00.BT_SairClick(Sender: TObject);
begin
    RelFaturamentoOutrasSaidas00.Close;
end;

procedure TRelFaturamentoOutrasSaidas00.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelFaturamentoOutrasSaidas00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelFaturamentoOutrasSaidas00.FormShow(Sender: TObject);
begin
    // Carrega data atual nos campos de periodo
    Data_Inicial.Text := DateToStr(Date());
    Data_Final.Text   := DateToStr(Date());
end;

procedure TRelFaturamentoOutrasSaidas00.FormCreate(Sender: TObject);
begin
//*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TRelFaturamentoOutrasSaidas00.BT_ImprimirClick(Sender: TObject);

var
  Comando_SQL : String;
  vlr_faturado1, vlr_a_vista1, vlr_total1,
  vlr_faturado2, vlr_a_vista2, vlr_total2,
  vlr_faturado3, vlr_a_vista3, vlr_total3 : real;
  qtde_faturado1, qtde_a_vista1, qtde_total1,
  qtde_faturado2, qtde_a_vista2, qtde_total2,
  qtde_faturado3, qtde_a_vista3, qtde_total3 : integer;
  Nome_Tabela_Nota, Nome_Tabela_Nota_Produto, Nro_Nota: String;

begin
  if Trim(Data_Inicial.Text) = '/  /' Then
    begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
    Data_Inicial.SetFocus;
    end
  else if Trim(Data_Final.Text) = '/  /' then
    begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
    Data_Final.SetFocus;
    end
  else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
    begin
    MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
    Data_Final.SetFocus;
    end
  else
    begin

    if (Acc_Empresa.Text = 'Monibras') then
        Begin

        Ampulheta();

        Application.CreateForm(TRelFaturamentoOutrasSaidas01,RelFaturamentoOutrasSaidas01);

        Comando_SQL := 'Select ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_numero As fb_nota_fiscal_numero, ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_data_emissao As fb_nota_fiscal_data_emissao, ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_natureza_oper_desc As fb_nota_fiscal_natureza_oper_desc, ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_codigo As fb_nota_fiscal_codigo, ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_nome As fb_nota_fiscal_nome, ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_valor_total As fb_nota_fiscal_valor_total, ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_icms As fb_nota_fiscal_icms, ';
        Comando_SQL := Comando_SQL + 'mb_nota_fiscal_valor_ipi As fb_nota_fiscal_valor_ipi ';
        Comando_SQL := Comando_SQL + 'from mb_notas_fiscais Where ';
        Comando_SQL := Comando_SQL + '((mb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
        Comando_SQL := Comando_SQL + '(mb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) and ';
        Comando_SQL := Comando_SQL + '(mb_nota_fiscal_natureza_oper Not Like '+#39+'%Venda%'+#39+' And mb_nota_fiscal_natureza_oper Not Like '+#39+'%Exporta%'+#39+')';
        Comando_SQL := Comando_SQL + ' Order By mb_nota_fiscal_numero';

        ConexaoBD.SQL_FB_Rel_Faturamento.Close;
        ConexaoBD.SQL_FB_Rel_Faturamento.SQL.Clear;
        ConexaoBD.SQL_FB_Rel_Faturamento.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Rel_Faturamento.Open;

        RelFaturamentoOutrasSaidas01.LBL_Empresa.Caption := 'Monibrás';
        RelFaturamentoOutrasSaidas01.QR_Periodo.Caption  := 'Péríodo de ' + Data_Inicial.Text + ' a ' + Data_Final.Text;

        Seta();

        RelFaturamentoOutrasSaidas01.QR_Faturamento.Preview;
        RelFaturamentoOutrasSaidas01.QR_Faturamento.Destroy;
        RelFaturamentoOutrasSaidas01.Destroy;

        End
    else
        begin

        Ampulheta();

        Application.CreateForm(TRelFaturamentoOutrasSaidas01,RelFaturamentoOutrasSaidas01);

        Comando_SQL := 'Select ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_numero, ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao, ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper_desc, ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo, ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nome, ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_total, ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_icms, ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_ipi ';
        Comando_SQL := Comando_SQL + 'from fb_notas_fiscais Where ';
        Comando_SQL := Comando_SQL + '((fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
        Comando_SQL := Comando_SQL + '(fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) and ';
        Comando_SQL := Comando_SQL + '(fb_nota_fiscal_natureza_oper Not Like '+#39+'%Venda%'+#39+' And fb_nota_fiscal_natureza_oper Not Like '+#39+'%Exporta%'+#39+')';
        Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_numero';

        ConexaoBD.SQL_FB_Rel_Faturamento.Close;
        ConexaoBD.SQL_FB_Rel_Faturamento.SQL.Clear;
        ConexaoBD.SQL_FB_Rel_Faturamento.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Rel_Faturamento.Open;

        RelFaturamentoOutrasSaidas01.LBL_Empresa.Caption := 'Ibrasmak';
        RelFaturamentoOutrasSaidas01.QR_Periodo.Caption  := 'Péríodo de ' + Data_Inicial.Text + ' a ' + Data_Final.Text;

        Seta();

        RelFaturamentoOutrasSaidas01.QR_Faturamento.Preview;
        RelFaturamentoOutrasSaidas01.QR_Faturamento.Destroy;
        RelFaturamentoOutrasSaidas01.Destroy;
    end;
  end;
end;

end.
