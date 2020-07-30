unit Avulso_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TAvulso01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label37: TLabel;
    Avulso_Valor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Avulso_Descricao: TEdit;
    Avulso_Data: TMaskEdit;
    Avulso_Conta: TComboBox;
    Label4: TLabel;
    Avulso_Status: TComboBox;
    Posicao_Nro_Conta: TEdit;
    Label5: TLabel;
    Avulso_Desconto: TEdit;
    Label6: TLabel;
    Avulso_Juros: TEdit;
    Label7: TLabel;
    Avulso_Ser_Pago: TEdit;
    Label8: TLabel;
    Avulso_Observacao: TEdit;
    Label9: TLabel;
    Avulso_Pagto: TMaskEdit;
    Label10: TLabel;
    Avulso_Saldo: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Avulso_Fornecedor_Numero: TEdit;
    Avulso_Fornecedor_Nome: TEdit;
    BT_Procurar: TBitBtn;
    BT_Excluir: TBitBtn;
    Label13: TLabel;
    Avulso_Emissao: TMaskEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure Avulso_ValorKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Avulso_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_DataKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_StatusKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_Ser_PagoExit(Sender: TObject);
    procedure Avulso_Ser_PagoKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_JurosKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_JurosExit(Sender: TObject);
    procedure Avulso_DescontoExit(Sender: TObject);
    procedure Avulso_ValorExit(Sender: TObject);
    procedure Avulso_ObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_PagtoKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_SaldoKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_SaldoExit(Sender: TObject);
    procedure Avulso_PagtoExit(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Avulso_EmissaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
    procedure Totaliza();
    procedure Totaliza_Saldo();

  public
    { Public declarations }
  end;

var
  Avulso01: TAvulso01;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, Fornecedor_00;

{$R *.dfm}

function TAvulso01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Avulso_Data.Text) = '/  /' Then
        Begin
        Erro          := 'A Data não foi informada';
        Campo_Retorno := 'Avulso_Data';
        End
     Else If Trim(Avulso_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição não foi informada';
        Campo_Retorno := 'Avulso_Descricao';
        End
     Else If Trim(Avulso_Valor.Text) = '' Then
        Begin
        Erro          := 'O Valor não foi informado';
        Campo_Retorno := 'Avulso_Valor';
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Avulso_Data' Then
           Begin
           Avulso_Data.SetFocus;
           End
        Else If Campo_Retorno = 'Avulso_Descricao' Then
           Begin
           Avulso_Descricao.SetFocus;
           End
        Else If Campo_Retorno = 'Avulso_Valor' Then
           Begin
           Avulso_Valor.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TAvulso01.BT_SairClick(Sender: TObject);
begin
     Avulso01.Close;
end;

procedure TAvulso01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Nro_Conta: String;

begin
     If Valida_Dados() Then
        Begin
        Nro_Conta := Obtem_Nro_Antes_Traco(Avulso_Conta.Text);

        Comando_SQL := 'Insert into fb_contas_pagar(';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_data, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_data_pagto, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_descricao, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_conta, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_status, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_posicao, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_fixo, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor_ser_pago, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor_juros, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor_desconto, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_observacao, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_saldo, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_fornecedor_numero, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_fornecedor_nome, ';
        Comando_SQL := Comando_SQL + 'fb_conta_pagar_data_emissao) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Avulso_Data.Text),'amd','/') + #39 + ', ';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Avulso_Pagto.Text),'amd','/') + #39 + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Avulso_Descricao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Avulso_Valor.Text) + ', ';
        Comando_SQL := Comando_SQL + Trim(Nro_Conta) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Avulso_Status.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + '2' + ',';
        Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ', ';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Avulso_Ser_Pago.Text) + ', ';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Avulso_Juros.Text) + ', ';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Avulso_Desconto.Text) + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Avulso_Observacao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Avulso_Saldo.Text) + ', ';
        Comando_SQL := Comando_SQL + Trim(Avulso_Fornecedor_Numero.Text) + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Avulso_Fornecedor_Nome.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Avulso_Emissao.Text),'amd','/') + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Localiza o Titulo Incluído ***

        Comando_SQL := 'Select * from fb_contas_pagar Order By fb_conta_pagar_nro Desc';

        ConexaoBD.SQL_FB_Conta_Pagar.Close;
        ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
        ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Conta_Pagar.Open;

        MSG_Erro('Inclusão Efetuada...'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'O Número Sequencial é o: ' + Trim(ConexaoBD.SQL_FB_Conta_Pagarfb_conta_pagar_nro.Text) );

        ConexaoBD.SQL_FB_Conta_Pagar.Close;

        Avulso01.Close;
     End;
end;

procedure TAvulso01.Avulso_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.FormShow(Sender: TObject);

var
   Ind, Posicao: Integer;

begin
    If Trim(Avulso_Conta.Text) = '' Then
       Begin
       ConexaoBD.SQL_FB_Conta_Bancaria.Close;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
       ConexaoBD.SQL_FB_Conta_Bancaria.Open;

       Avulso_Conta.Items.Clear;

       Ind     := 0;
       Posicao := 0;

       If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
          Begin
          ConexaoBD.SQL_FB_Conta_Bancaria.First;

          While Not ConexaoBD.SQL_FB_Conta_Bancaria.Eof Do
                begin
                Avulso_Conta.Items.Add(Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_banco.Text) + ' - AG: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_agencia.Text) + ' - CC: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_conta.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_titular.Text));

                If Trim(Posicao_Nro_Conta.Text) = Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) Then
                   Begin
                   Posicao := Ind;
                End;

                Ind := Ind + 1;

                ConexaoBD.SQL_FB_Conta_Bancaria.Next;
          End;
       End;

       ConexaoBD.SQL_FB_Conta_Bancaria.Close;

       Avulso_Conta.ItemIndex := Posicao;
       Avulso_Data.Text       := DateToStr(Date());
       Avulso_Pagto.Text      := DateToStr(Date());
    End;

    Avulso_Data.SetFocus;
end;

procedure TAvulso01.Avulso_DescricaoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_DataKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_ContaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_StatusKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_Ser_PagoExit(Sender: TObject);
begin
     If Trim(Avulso_Ser_Pago.Text) = '' Then
        Begin
        Avulso_Ser_Pago.Text := '0,00';
     End;

     Totaliza();     
end;

procedure TAvulso01.Avulso_Ser_PagoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_JurosKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_JurosExit(Sender: TObject);
begin
     If Trim(Avulso_Juros.Text) = '' Then
        Begin
        Avulso_Juros.Text := '0,00';
     End;

     Totaliza();     
end;

procedure TAvulso01.Avulso_DescontoExit(Sender: TObject);
begin
     If Trim(Avulso_Desconto.Text) = '' Then
        Begin
        Avulso_Desconto.Text := '0,00';
     End;

     Totaliza();
end;

procedure TAvulso01.Avulso_ValorExit(Sender: TObject);
begin
     Totaliza_Saldo();
end;

procedure TAvulso01.Totaliza();

var
   Valor_Total: Real;

begin
     Valor_Total := (StrToFloat(Avulso_Ser_Pago.Text) + StrToFloat(Avulso_Juros.Text)) - StrToFloat(Avulso_Desconto.Text);
     Avulso_Valor.Text := Trim(FloatToStr(Valor_Total));
end;

procedure TAvulso01.Totaliza_Saldo();

var
   Valor_Total: Real;
   Vlr_Exibicao_Str: String;

begin
     Valor_Total := ((StrToFloat(Avulso_Ser_Pago.Text) + StrToFloat(Avulso_Juros.Text)) - StrToFloat(Avulso_Desconto.Text)  - StrToFloat(Avulso_Valor.Text));

     Str(Valor_Total:13:2,Vlr_Exibicao_Str);
     Vlr_Exibicao_Str  := Ponto_Virgula(Trim(Vlr_Exibicao_Str));
     Avulso_Saldo.Text := Vlr_Exibicao_Str;
end;

procedure TAvulso01.Avulso_ObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_PagtoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_SaldoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso01.Avulso_SaldoExit(Sender: TObject);
begin
     If Trim(Avulso_Saldo.Text) = '' Then
        Begin
        Avulso_Saldo.Text := '0,00';
     End;

     If StrToFloat(Avulso_Saldo.Text) > 0 Then
        Begin
        Avulso_Status.ItemIndex := 2;
     End;
end;

procedure TAvulso01.Avulso_PagtoExit(Sender: TObject);
begin
     If Trim(Avulso_Pagto.Text) <> '/  /' Then
        Begin
        Avulso_Status.ItemIndex := 1;
     End;
end;

procedure TAvulso01.BT_ExcluirClick(Sender: TObject);
begin
     Avulso_Fornecedor_Numero.Text := '0';
     Avulso_Fornecedor_Nome.Text   := '--- Sem Fornecedor ---';
end;

procedure TAvulso01.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Avulso_Inclusao';
     Fornecedor00.Fornecedor_Area.ItemIndex := 0;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
end;

procedure TAvulso01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TAvulso01.Avulso_EmissaoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
