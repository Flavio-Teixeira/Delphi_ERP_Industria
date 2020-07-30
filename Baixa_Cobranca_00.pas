unit Baixa_Cobranca_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TBaixaCobranca00 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    RB_Nota_Fiscal: TRadioButton;
    RB_Papeleta: TRadioButton;
    Label1: TLabel;
    Edit_Numero_Documento: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit_Codigo: TEdit;
    Label3: TLabel;
    Edit_Nome: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Edit_Codigo_Bancario: TEdit;
    Label5: TLabel;
    Edit_Banco: TEdit;
    Label6: TLabel;
    Edit_DT_Vencimento: TMaskEdit;
    Label7: TLabel;
    Edit_DT_Pagamento: TMaskEdit;
    Label8: TLabel;
    Edit_Vlr_Juros: TEdit;
    Label9: TLabel;
    Edit_Vlr_Pagamento: TEdit;
    Edit_Vlr: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Natureza_Operacao: TComboBox;
    Nro_Natureza_Operacao: TEdit;
    Label12: TLabel;
    Edit_Obs: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit_Codigo_BancarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_DT_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Vlr_JurosKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Vlr_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Numero_DocumentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Edit_Numero_DocumentoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_ObsKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_DT_VencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_VlrKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Vlr_JurosExit(Sender: TObject);
  private
    Procedure Obtem_Dados_Baixa(var Nro: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaixaCobranca00: TBaixaCobranca00;
  Documento, Nro_Documento, Baixa: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TBaixaCobranca00.BT_SairClick(Sender: TObject);
begin
     BaixaCobranca00.Close;
end;

procedure TBaixaCobranca00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TBaixaCobranca00.Edit_Codigo_BancarioKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBaixaCobranca00.Edit_DT_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TBaixaCobranca00.Edit_Vlr_JurosKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBaixaCobranca00.Edit_Vlr_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

Procedure TBaixaCobranca00.Obtem_Dados_Baixa(var Nro: String);
Begin

  Ampulheta();
  Baixa                       := '';
  Edit_Codigo.Text            := '';
  Edit_Nome.Text              := '';
  Edit_Codigo_Bancario.Text   := '';
  Edit_Banco.Text             := '';
  Edit_DT_Vencimento.Text     := '';
  Edit_DT_Pagamento.Text      := '';
  Edit_Vlr.Text               := '';
  Edit_Vlr_Juros.Text         := '';
  Edit_Vlr_Pagamento.Text     := '';
  Nro_Natureza_Operacao.Text  := '';
  Edit_Obs.Text               := '';

  // Verifica se o número do documento foi digitado

  If Trim(Nro) = '' Then
    Begin
    MSG_Erro('Preencha o Campo ' + #39 + 'Nro Documento' + #39 + ' Antes de Prosseguir...');
    Edit_Numero_Documento.SetFocus;
    End

  // Procura o número do documento

  Else
    Begin

    if RB_Nota_Fiscal.Checked = True Then
      Begin
      Documento := 'Nota Fiscal';

      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * From fb_notas_fiscais Where ((fb_nota_fiscal_dup_nro_1 = '+#39+Trim(Nro)+#39+') Or (fb_nota_fiscal_dup_nro_2 = '+#39+Trim(Nro)+#39+') Or (fb_nota_fiscal_dup_nro_3 = '+#39+Trim(Nro)+#39+') Or (fb_nota_fiscal_dup_nro_4 = '+#39+Trim(Nro)+#39+')) And (fb_nota_fiscal_tipo_fatura ='+#39+ Documento +#39+')');
      ConexaoBD.SQL_FB_Nota_Fiscal.Open;
      end
    Else
      Begin
      Documento := 'Orçamento';

      ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
      ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * From fb_papeletas Where ((fb_papeleta_dup_nro_1 = '+#39+Trim(Nro)+#39+') Or (fb_papeleta_dup_nro_2 = '+#39+Trim(Nro)+#39+') Or (fb_papeleta_dup_nro_3 = '+#39+Trim(Nro)+#39+') Or (fb_papeleta_dup_nro_4 = '+#39+Trim(Nro)+#39+')) And (fb_papeleta_tipo_fatura ='+#39+ Documento +#39+')');
      ConexaoBD.SQL_FB_Papeletas.Open;
    End;

    If Trim(Documento) = 'Nota Fiscal' Then
       Begin
       // Verifica se o número da nota existe
       If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount <= 0 Then
          Begin
          MSG_Erro('Documento Não Encontrado...');
          End
       Else
          Begin
          // Encontra nome do Banco
          ConexaoBD.SQL_FB_Bancos.SQL.Clear;
          ConexaoBD.SQL_FB_Bancos.SQL.Add('Select * from fb_bancos Where fb_banco_codigo='+ ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);
          ConexaoBD.SQL_FB_Bancos.Open;

          // Descobre em qual dos três campos está o documento procurado
          Baixa := '';
          If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text = Nro Then
             Begin
             Baixa := '1';
             End
          Else If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text = Nro Then
             Begin
             Baixa := '2';
             End
          Else If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text = Nro Then
             Begin
             Baixa := '3';
             End
          Else
             Begin
             Baixa := '4';
          End;

          // Carrega na Tela
          Edit_Codigo.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
          Edit_Nome.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;
          Edit_Banco.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text + ' - ' + ConexaoBD.SQL_FB_Bancosfb_banco_descricao.Text;

          If Baixa ='1' Then
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_1.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_1.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_1.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_1.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_1.Text;
             End
          Else If Baixa ='2' Then
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_2.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_2.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_2.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_2.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_2.Text;
             End
          Else If Baixa ='3' Then
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_3.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_3.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_3.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_3.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_3.Text;
             End
          Else
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_4.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_4.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_4.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_4.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_4.Text;
          End;

          Nro_Natureza_Operacao.Text   := IntToStr(Obtem_Nro_Natureza_Operacao(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text,conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text));
          Natureza_Operacao.ItemIndex  := StrToInt(Nro_Natureza_Operacao.Text);

          // Fecha os RecordSets
          ConexaoBD.SQL_FB_Bancos.Close;
          ConexaoBD.SQL_FB_Nota_Fiscal.Close;

          // Abilita Campo Para edição
          Edit_Codigo_Bancario.Enabled  := True;
          Edit_DT_Pagamento.Enabled     := True;
          Edit_Vlr.Enabled              := True;
          Edit_DT_Vencimento.Enabled    := True;
          Edit_Vlr_Juros.Enabled        := True;
          Edit_Vlr_Pagamento.Enabled    := True;
          BT_Alterar.Enabled            := True;

          Edit_Codigo_Bancario.SetFocus;
       End;
       End
    Else
       Begin
       // Verifica se o número da nota existe
       If ConexaoBD.SQL_FB_Papeletas.RecordCount <= 0 Then
          Begin
          MSG_Erro('Documento Não Encontrado...');
          End
       Else
          Begin
          // Encontra nome do Banco
          ConexaoBD.SQL_FB_Bancos.SQL.Clear;
          ConexaoBD.SQL_FB_Bancos.SQL.Add('Select * from fb_bancos Where fb_banco_codigo='+ ConexaoBD.SQL_FB_Papeletasfb_papeleta_banco.Text);
          ConexaoBD.SQL_FB_Bancos.Open;

          // Descobre em qual dos três campos está o documento procurado
          Baixa := '';
          If ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_1.Text = Nro Then
             Begin
             Baixa := '1';
             End
          Else If ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_2.Text = Nro Then
             Begin
             Baixa := '2';
             End
          Else
             Begin
             Baixa := '3';
          End;

          // Carrega na Tela
          Edit_Codigo.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text;
          Edit_Nome.Text    := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text;
          Edit_Banco.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_banco.Text + ' - ' + ConexaoBD.SQL_FB_Bancosfb_banco_descricao.Text;

          If Baixa ='1' Then
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_1.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_1.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_1.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_1.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_1.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_1.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_obs_1.Text;
             End
          Else If Baixa ='2' Then
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_2.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_2.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_2.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_2.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_2.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_2.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_obs_2.Text;
             End
          Else If Baixa ='3' Then
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_3.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_3.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_3.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_3.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_3.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_3.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_obs_3.Text;
             End
          Else
             Begin
             Edit_Codigo_Bancario.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_4.Text;
             Edit_DT_Vencimento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_4.Text;
             Edit_DT_Pagamento.Text    := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_4.Text;
             Edit_Vlr.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_4.Text;
             Edit_Vlr_Juros.Text       := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_4.Text;
             Edit_Vlr_Pagamento.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_4.Text;
             Edit_Obs.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_obs_4.Text;
          End;

          Nro_Natureza_Operacao.Text   := IntToStr(Obtem_Nro_Natureza_Operacao(conexaoBD.SQL_FB_Papeletasfb_papeleta_natureza_oper.Text,conexaoBD.SQL_FB_Papeletasfb_papeleta_cfop.Text));
          Natureza_Operacao.ItemIndex  := StrToInt(Nro_Natureza_Operacao.Text);

          // Fecha os RecordSets
          ConexaoBD.SQL_FB_Bancos.Close;
          ConexaoBD.SQL_FB_Papeletas.Close;

          // Abilita Campo Para edição
          Edit_Codigo_Bancario.Enabled  := True;
          Edit_DT_Pagamento.Enabled     := True;
          Edit_Vlr.Enabled              := True;
          Edit_DT_Vencimento.Enabled    := True;
          Edit_Vlr_Juros.Enabled        := True;
          Edit_Vlr_Pagamento.Enabled    := True;
          BT_Alterar.Enabled            := True;

          Edit_Codigo_Bancario.SetFocus;
       End;
    End;
  End;
  Seta();
End;

procedure TBaixaCobranca00.Edit_Numero_DocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Nro_Documento := Edit_Numero_Documento.Text;
    Obtem_Dados_Baixa(Nro_Documento);
  End;
end;

procedure TBaixaCobranca00.BT_AlterarClick(Sender: TObject);
var
  Comando_SQL : String;
begin
  if Trim(Edit_DT_Pagamento.Text) = '/  /' Then
    Begin
    MSG_Erro('Preencha o campo Data de Pagamento antes de prosseguir...');
    Edit_DT_Pagamento.SetFocus;
    End
  Else if Trim(Edit_Vlr_Pagamento.Text)='' Then
    Begin
    MSG_Erro('Preencha o campo Valor de Pagamento antes de prosseguir...');
    Edit_Vlr_Pagamento.SetFocus;
    End
  Else
    Begin
    if Baixa = '1' Then
      Begin
      If Trim(Documento) = 'Nota Fiscal' Then
         Begin
         Comando_SQL := 'Update fb_notas_fiscais Set ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_obs_1 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_1 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ Documento +#39+')';
         End
      Else
         Begin
         Comando_SQL := 'Update fb_papeletas Set ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_cod_bco_1 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_vcto_1 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_1 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_pgto_1 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_juros_1 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_pgto_1 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_obs_1 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_papeleta_dup_nro_1 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_papeleta_tipo_fatura ='+#39+ Documento +#39+')';
      End;
      End
    Else if Baixa = '2' Then
      Begin
      If Trim(Documento) = 'Nota Fiscal' Then
         Begin
         Comando_SQL := 'Update fb_notas_fiscais Set ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_obs_2 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_2 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ Documento +#39+')';
         End
      Else
         Begin
         Comando_SQL := 'Update fb_papeletas Set ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_cod_bco_2 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_vcto_2 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_2 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_pgto_2 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_juros_2 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_pgto_2 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_obs_2 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_papeleta_dup_nro_2 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_papeleta_tipo_fatura ='+#39+ Documento +#39+')';
      End;
      End
    Else if Baixa = '3' Then
      Begin
      If Trim(Documento) = 'Nota Fiscal' Then
         Begin
         Comando_SQL := 'Update fb_notas_fiscais Set ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_obs_3 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_3 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ Documento +#39+')';
         End
      Else
         Begin
         Comando_SQL := 'Update fb_papeletas Set ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_cod_bco_3 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_vcto_3 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_3 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_pgto_3 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_juros_3 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_pgto_3 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_obs_3 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_papeleta_dup_nro_3 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_papeleta_tipo_fatura ='+#39+ Documento +#39+')';
      End;
      End
    Else
      Begin
      If Trim(Documento) = 'Nota Fiscal' Then
         Begin
         Comando_SQL := 'Update fb_notas_fiscais Set ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_4 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_4 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_4 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_4 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_4 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_4 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_obs_4 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_4 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ Documento +#39+')';
         End
      Else
         Begin
         Comando_SQL := 'Update fb_papeletas Set ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_cod_bco_4 ='+#39+Trim(Edit_Codigo_Bancario.Text)+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_vcto_1 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Vencimento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_1 ='+Virgula_Ponto(Edit_Vlr.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_dt_pgto_4 ='+#39+Inverte_Data_Plus(Trim(Edit_DT_Pagamento.Text),'amd','/')+#39+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_juros_4 ='+Virgula_Ponto(Edit_Vlr_Juros.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_vlr_pgto_4 ='+Virgula_Ponto(Edit_Vlr_Pagamento.Text)+', ';
         Comando_SQL := Comando_SQL + 'fb_papeleta_dup_obs_4 ='+#39+Trim(Edit_Obs.Text)+#39+' ';
         Comando_SQL := Comando_SQL + 'Where (fb_papeleta_dup_nro_4 = '+#39+Trim(Edit_Numero_Documento.Text)+#39+') And (fb_papeleta_tipo_fatura ='+#39+ Documento +#39+')';
      End;
    End;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //Atualiza o Cadastro de Clientes
    If Trim(Edit_DT_Pagamento.Text) <> '/  /' Then
       Begin
       Comando_SQL := 'Update fb_clientes Set ';
       Comando_SQL := Comando_SQL + 'fb_cliente_status_credito ='+#39+'N'+#39+' ';
       Comando_SQL := Comando_SQL + 'Where fb_cliente_codigo = '+#39+Trim(Edit_Codigo.Text)+#39;

       ConexaoBD.SQL_Comunitario.Close;
       ConexaoBD.SQL_Comunitario.SQL.Clear;
       ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_Comunitario.ExecSQL;
    End;

    // Desabilita Campo Para edição
    Edit_Codigo_Bancario.Enabled  := False;
    Edit_DT_Pagamento.Enabled     := False;
    Edit_Vlr.Enabled              := False;
    Edit_DT_Vencimento.Enabled    := False;
    Edit_Vlr_Juros.Enabled        := False;
    Edit_Vlr_Pagamento.Enabled    := False;
    BT_Alterar.Enabled            := False;

    // Apaga comteúdo dos Texts
    Edit_Numero_Documento.Text  := '';
    Edit_Codigo.Text            := '';
    Edit_Nome.Text              := '';
    Edit_Banco.Text             := '';
    Edit_Codigo_Bancario.Text   := '';
    Edit_DT_Vencimento.Text     := '';
    Edit_DT_Pagamento.Text      := '';
    Edit_Vlr.Text               := '';
    Edit_Vlr_Juros.Text         := '';
    Edit_Vlr_Pagamento.Text     := '';
    Edit_Obs.Text               := '';

    MSG_Erro('Baixa executada com sucesso...');
    Edit_Numero_Documento.SetFocus;
  End;
end;

procedure TBaixaCobranca00.Edit_Numero_DocumentoChange(Sender: TObject);
begin

    Edit_Codigo.Text            := '';
    Edit_Nome.Text              := '';
    Edit_Banco.Text             := '';
    Edit_Codigo_Bancario.Text   := '';
    Edit_DT_Vencimento.Text     := '';
    Edit_DT_Pagamento.Text      := '';
    Edit_Vlr.Text               := '';
    Edit_Vlr_Juros.Text         := '';
    Edit_Vlr_Pagamento.Text     := '';
    Edit_Obs.Text               := '';

    Edit_Codigo_Bancario.Enabled  := False;
    Edit_DT_Pagamento.Enabled     := False;
    Edit_Vlr.Enabled              := False;
    Edit_DT_Vencimento.Enabled    := False;
    Edit_Vlr_Juros.Enabled        := False;
    Edit_Vlr_Pagamento.Enabled    := False;
    BT_Alterar.Enabled            := False;
end;

procedure TBaixaCobranca00.FormClose(Sender: TObject;
  var Action: TCloseAction);

var
   Comando_SQL, Cod_Cliente, Nro_Documento: String;

begin
    Ampulheta();

    Label1.Visible                := False;
    Edit_Numero_Documento.Visible := False;
    GroupBox1.Visible             := False;
    GroupBox2.Visible             := False;
    RB_Nota_Fiscal.Visible        := False;
    RB_Papeleta.Visible           := False;

    Label11.Visible               := False;
    Natureza_Operacao.Visible     := False;

    //*** Verifica Valores Pagos com Zero ***

    //*** Ibrasmak ***

    //*** Baixa 1 ***

    Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 1';
    Panel1.Refresh;

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_1 <> '+#39+#39+' And fb_nota_fiscal_dup_dt_pgto_1 <> '+#39+'0000-00-00'+#39+' And fb_nota_fiscal_dup_dt_pgto_1 <> '+#39+'0'+#39+') And fb_nota_fiscal_dup_vlr_pgto_1 <= 0)';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
             Begin
             Nro_Documento := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

             Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 1 - Nro.: '+Trim(Nro_Documento);
             Panel1.Refresh;

             Comando_SQL := 'Update fb_notas_fiscais Set ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1 ='+#39+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1 ='+#39+'0000-00-00'+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1 = 0.00, ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1 = 0.00 ';
             Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = '+Trim(Nro_Documento);

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End
    End;

    //*** Baixa 2 ***

    Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 2';
    Panel1.Refresh;

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_2 <> '+#39+#39+' And fb_nota_fiscal_dup_dt_pgto_2 <> '+#39+'0000-00-00'+#39+' And fb_nota_fiscal_dup_dt_pgto_2 <> '+#39+'0'+#39+') And fb_nota_fiscal_dup_vlr_pgto_2 <= 0)';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
             Begin
             Nro_Documento := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

             Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 2 - Nro.: '+Trim(Nro_Documento);
             Panel1.Refresh;

             Comando_SQL := 'Update fb_notas_fiscais Set ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2 ='+#39+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2 ='+#39+'0000-00-00'+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2 = 0.00, ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2 = 0.00 ';
             Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = '+Trim(Nro_Documento);

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End
    End;

    //*** Baixa 3 ***

    Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 3';
    Panel1.Refresh;

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_3 <> '+#39+#39+' And fb_nota_fiscal_dup_dt_pgto_3 <> '+#39+'0000-00-00'+#39+' And fb_nota_fiscal_dup_dt_pgto_3 <> '+#39+'0'+#39+') And fb_nota_fiscal_dup_vlr_pgto_3 <= 0)';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
             Begin
             Nro_Documento := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

             Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 3 - Nro.: '+Trim(Nro_Documento);
             Panel1.Refresh;

             Comando_SQL := 'Update fb_notas_fiscais Set ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3 ='+#39+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3 ='+#39+'0000-00-00'+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3 = 0.00, ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3 = 0.00 ';
             Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = '+Trim(Nro_Documento);

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End
    End;

    //*** Baixa 4 ***

    Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 4';
    Panel1.Refresh;

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_4 <> '+#39+#39+' And fb_nota_fiscal_dup_dt_pgto_4 <> '+#39+'0000-00-00'+#39+' And fb_nota_fiscal_dup_dt_pgto_4 <> '+#39+'0'+#39+') And fb_nota_fiscal_dup_vlr_pgto_4 <= 0)';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
             Begin
             Nro_Documento := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

             Panel1.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 4 - Nro.: '+Trim(Nro_Documento);
             Panel1.Refresh;

             Comando_SQL := 'Update fb_notas_fiscais Set ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_4 ='+#39+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_4 ='+#39+'0000-00-00'+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_4 = 0.00, ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_4 = 0.00 ';
             Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = '+Trim(Nro_Documento);

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End
    End;

    //*** Atualiza Cadastro ***

    Panel1.Caption                := 'Aguarde... Atualizando Cadastros...';
    Panel1.Refresh;

    //*** Verifica as Notas Fiscais ***

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '(((((fb_nota_fiscal_dup_dt_vcto_1 + 5) <= CURDATE()) and (fb_nota_fiscal_dup_dt_pgto_1 = '+#39+#39+' Or fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+' Or fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0'+#39+') and (fb_nota_fiscal_dup_forma_1 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_1 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_nota_fiscal_dup_dt_vcto_2 + 5) <= CURDATE()) and (fb_nota_fiscal_dup_dt_pgto_2 = '+#39+#39+' Or fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+' Or fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0'+#39+') and (fb_nota_fiscal_dup_forma_2 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_2 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_nota_fiscal_dup_dt_vcto_3 + 5) <= CURDATE()) and (fb_nota_fiscal_dup_dt_pgto_3 = '+#39+#39+' Or fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+' Or fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0'+#39+') and (fb_nota_fiscal_dup_forma_3 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_3 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_nota_fiscal_dup_dt_vcto_4 + 5) <= CURDATE()) and (fb_nota_fiscal_dup_dt_pgto_4 = '+#39+#39+' Or fb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0000-00-00'+#39+' Or fb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0'+#39+') and (fb_nota_fiscal_dup_forma_4 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_4 <> '+#39+'0'+#39+'))) and ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_natureza_oper = '+#39+'Vendas'+#39+' Or fb_nota_fiscal_natureza_oper = '+#39+'Exportação'+#39+'))';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
      Begin
      ConexaoBD.SQL_FB_Nota_Fiscal.First;

      While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
        Begin
        Cod_Cliente := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);

        Comando_SQL := 'Update fb_clientes Set ';
        Comando_SQL := Comando_SQL + 'fb_cliente_status_credito ='+#39+'S'+#39+' ';
        Comando_SQL := Comando_SQL + 'Where fb_cliente_codigo = '+#39+Trim(Cod_Cliente)+#39;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        ConexaoBD.SQL_FB_Nota_Fiscal.Next;

        Panel1.Caption := 'Nota Fiscal - Código do Cliente: '+Trim(Cod_Cliente);
        Panel1.Refresh;
      End;
    End;

    //*** Verifica os Orçamentos ***

    Comando_SQL := 'Select * From fb_papeletas Where ';
    Comando_SQL := Comando_SQL + '(((((fb_papeleta_dup_dt_vcto_1 + 5) <= CURDATE()) and (fb_papeleta_dup_dt_pgto_1 = '+#39+#39+' Or fb_papeleta_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+' Or fb_papeleta_dup_dt_pgto_1 = '+#39+'0'+#39+') and (fb_papeleta_dup_forma_1 <> '+#39+#39+' and fb_papeleta_dup_forma_1 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_papeleta_dup_dt_vcto_2 + 5) <= CURDATE()) and (fb_papeleta_dup_dt_pgto_2 = '+#39+#39+' Or fb_papeleta_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+' Or fb_papeleta_dup_dt_pgto_2 = '+#39+'0'+#39+') and (fb_papeleta_dup_forma_2 <> '+#39+#39+' and fb_papeleta_dup_forma_2 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_papeleta_dup_dt_vcto_3 + 5) <= CURDATE()) and (fb_papeleta_dup_dt_pgto_3 = '+#39+#39+' Or fb_papeleta_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+' Or fb_papeleta_dup_dt_pgto_3 = '+#39+'0'+#39+') and (fb_papeleta_dup_forma_3 <> '+#39+#39+' and fb_papeleta_dup_forma_3 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_papeleta_dup_dt_vcto_4 + 5) <= CURDATE()) and (fb_papeleta_dup_dt_pgto_4 = '+#39+#39+' Or fb_papeleta_dup_dt_pgto_4 = '+#39+'0000-00-00'+#39+' Or fb_papeleta_dup_dt_pgto_4 = '+#39+'0'+#39+') and (fb_papeleta_dup_forma_4 <> '+#39+#39+' and fb_papeleta_dup_forma_4 <> '+#39+'0'+#39+'))) and ';
    Comando_SQL := Comando_SQL + '(fb_papeleta_natureza_oper = '+#39+'Vendas'+#39+' Or fb_papeleta_natureza_oper = '+#39+'Exportação'+#39+'))';

    ConexaoBD.SQL_FB_Papeletas.Close;
    ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Papeletas.Open;

    If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
      Begin
      ConexaoBD.SQL_FB_Papeletas.First;

      While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
            Begin
            Cod_Cliente := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text);

            Comando_SQL := 'Update fb_clientes Set ';
            Comando_SQL := Comando_SQL + 'fb_cliente_status_credito ='+#39+'S'+#39+' ';
            Comando_SQL := Comando_SQL + 'Where fb_cliente_codigo = '+#39+Trim(Cod_Cliente)+#39;

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            ConexaoBD.SQL_FB_Papeletas.Next;

            Panel1.Caption := 'Papeleta - Código do Cliente: '+Trim(Cod_Cliente);
            Panel1.Refresh;
      End;
    End;

    Seta();

    Action := caFree;
    Release;
    BaixaCobranca00 := Nil;
end;

procedure TBaixaCobranca00.Edit_ObsKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBaixaCobranca00.Edit_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBaixaCobranca00.Edit_DT_VencimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBaixaCobranca00.Edit_VlrKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBaixaCobranca00.Edit_Vlr_JurosExit(Sender: TObject);

var
   Vlr_Exibicao: String;

begin
     If Trim(Edit_Vlr_Juros.Text) = '' Then
        Begin
        Edit_Vlr_Juros.Text := '0';
     End;

     If StrToFloat(Ponto_Virgula(Edit_Vlr_Juros.Text)) > 0 Then
        Begin
        Edit_Vlr_Pagamento.Text := FloatToStr(StrToFloat(Ponto_Virgula(Edit_Vlr.Text)) + StrToFloat(Ponto_Virgula(Edit_Vlr_Juros.Text)));
     End;

     Str(StrToFloat(Ponto_Virgula(Edit_Vlr_Pagamento.Text)):13:2,Vlr_Exibicao);

     Edit_Vlr_Pagamento.Text := Ponto_Virgula(Trim(Vlr_Exibicao));
end;

end.
