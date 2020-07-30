unit Liberacao_Credito_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TLiberacaoCredito01 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    Nro_Tipo_Cliente: TEdit;
    Nro_Cliente_Tipo_Empresa: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Cliente_Mensagem_Mascara: TLabel;
    Cliente_Codigo_Tipo: TComboBox;
    Cliente_Nome: TEdit;
    Cliente_Razao_Social: TEdit;
    Cliente_Tipo_Pessoa: TComboBox;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Cliente_Endereco: TEdit;
    Cliente_Complemento: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Cidade: TEdit;
    Cliente_Estado: TComboBox;
    Cliente_Cep: TMaskEdit;
    Cliente_Pais: TComboBox;
    GroupBox6: TGroupBox;
    Cliente_Codigo_CNPJ: TMaskEdit;
    Cliente_Codigo_CPF: TMaskEdit;
    Cliente_Codigo_RG: TEdit;
    Cliente_Codigo_EMail: TEdit;
    Label38: TLabel;
    Cliente_Status_Credito: TComboBox;
    Label37: TLabel;
    Cliente_Valor_Credito: TEdit;
    Label39: TLabel;
    Cliente_Ultimo_Valor: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Cliente_Valor_CreditoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Ultimo_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Status_CreditoKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }

    procedure Exibe_Exemplo_Codigo();
  public
    { Public declarations }
  end;

var
  LiberacaoCredito01: TLiberacaoCredito01;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TLiberacaoCredito01.BT_SairClick(Sender: TObject);
begin
     LiberacaoCredito01.Close;
end;

procedure TLiberacaoCredito01.FormShow(Sender: TObject);
begin
    Exibe_Exemplo_Codigo();
    Cliente_Status_Credito.SetFocus;
end;

procedure TLiberacaoCredito01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TLiberacaoCredito01.Exibe_Exemplo_Codigo();
begin
     If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 99.999.999/9999-99)';
        Cliente_Codigo_CNPJ.Visible  := True;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 999.999.999-99)';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := True;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'RG' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := True;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := True;
        End
     Else
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
     End;
end;

procedure TLiberacaoCredito01.BT_AlterarClick(Sender: TObject);

var
   Status_Credito, Vlr_Credito, Vlr_Ultima_Compra, Comando_SQL: String;

begin
     //*** Obtem o Status do Crédito ***

     If Cliente_Status_Credito.Text = 'Sim' Then
        Begin
        Status_Credito := 'S';
        End
     Else
        Begin
        Status_Credito := 'N';
     End;

     Vlr_Credito       := Trim(Virgula_Ponto(Cliente_Valor_Credito.Text));
     Vlr_Ultima_Compra := Trim(Virgula_Ponto(Cliente_Ultimo_Valor.Text));

     If Trim(Vlr_Credito) = '' Then
        Begin
        Vlr_Credito := '0';
     End;

     If Trim(Vlr_Ultima_Compra) = '' Then
        Begin
        Vlr_Ultima_Compra := '0';
     End;

     //*** Efetua a Inserção ***

     Comando_SQL := 'Update fb_clientes Set ';
     Comando_SQL := Comando_SQL + 'fb_cliente_valor_credito = ' + Trim(Vlr_Credito) + ',';
     Comando_SQL := Comando_SQL + 'fb_cliente_status_credito = ' + #39 + Trim(Status_Credito) + #39 + ',';
     Comando_SQL := Comando_SQL + 'fb_cliente_ultimo_valor = ' + Trim(Vlr_Ultima_Compra) + ' ';

     If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
        Begin
        Comando_SQL := Comando_SQL + ' Where fb_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CNPJ.Text) + #39;
        End
     Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
        Begin
        Comando_SQL := Comando_SQL + ' Where fb_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_CPF.Text) + #39;
        End
     Else If Cliente_Codigo_Tipo.Text = 'RG' Then
        Begin
        Comando_SQL := Comando_SQL + ' Where fb_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_RG.Text) + #39;
        End
     Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
        Begin
        Comando_SQL := Comando_SQL + ' Where fb_cliente_codigo = ' + #39 + Trim(Cliente_Codigo_EMail.Text) + #39;
     End;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     MSG_Erro('Liberação de Crédito Efetuada...');

     LiberacaoCredito01.Close;
end;

procedure TLiberacaoCredito01.Cliente_Valor_CreditoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TLiberacaoCredito01.Cliente_Ultimo_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TLiberacaoCredito01.Cliente_Status_CreditoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
