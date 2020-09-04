unit Transportadoras_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TTransportadoras02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Transportadora_Nome: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Transportadora_Endereco: TEdit;
    Transportadora_Bairro: TEdit;
    Transportadora_Cidade: TEdit;
    Transportadora_Complemento: TEdit;
    Transportadora_Cep: TMaskEdit;
    Transportadora_Pais: TComboBox;
    Transportadora_Estado: TComboBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Transportadora_DDD: TEdit;
    Transportadora_Comercial: TEdit;
    Transportadora_Ramal: TEdit;
    Transportadora_EMail: TEdit;
    Transportadora_Contato: TEdit;
    Transportadora_CNPJ: TMaskEdit;
    Transportadora_Razao_Social: TEdit;
    Transportadora_Inscricao_Estadual: TEdit;
    Transportadora_Inscricao_Municipal: TEdit;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Label18: TLabel;
    Transportadora_Numero: TEdit;
    Label19: TLabel;
    Transportadora_Observacao: TMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Transportadora_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_Inscricao_EstadualKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_Razao_SocialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_Inscricao_MunicipalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_EnderecoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_ComplementoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_BairroKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_CidadeKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_EstadoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_CepKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_DDDKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_RamalKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_ComercialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_ContatoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Transportadora_EMailKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_CNPJKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Transportadoras02: TTransportadoras02;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TTransportadoras02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Transportadora_CNPJ.Text) = '.   .   /    -' Then
        Begin
        Erro          := 'O CNPJ da Transportadora não foi informado';
        Campo_Retorno := 'Transportadora_CNPJ';
        End
     Else If Not Valida_CNPJ(Transportadora_CNPJ.Text) Then
        Begin
        Erro          := 'O CNPJ da Transportadora não está correto';
        Campo_Retorno := 'Transportadora_CNPJ';
        End
     Else If Trim(Transportadora_Nome.Text) = '' Then
        Begin
        Erro          := 'O Nome da Transportadora não foi informado';
        Campo_Retorno := 'Transportadora_Nome';
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Transportadora_Nome' Then
           Begin
           Transportadora_Nome.SetFocus;
           End
        Else If Campo_Retorno = 'Transportadora_CNPJ' Then
           Begin
           Transportadora_CNPJ.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TTransportadoras02.BT_SairClick(Sender: TObject);
begin
     Transportadoras02.Close;
end;

procedure TTransportadoras02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_transportadoras Where fb_transportadora_numero = ' + Trim(Transportadora_Numero.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Transportadoras02.Close;
     End;
end;

procedure TTransportadoras02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Valida_Dados() Then
        Begin

        Comando_SQL := 'Update fb_transportadoras Set ';
        Comando_SQL := Comando_SQL + 'fb_transportadora_cnpj = ' +#39+ Trim(Transportadora_CNPJ.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_nome = ' +#39+ Trim(Transportadora_Nome.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_razao_social = ' +#39+ Trim(Transportadora_Razao_Social.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_endereco = ' +#39+ Trim(Transportadora_Endereco.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_complemento = ' +#39+ Trim(Transportadora_Complemento.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_bairro = ' +#39+ Trim(Transportadora_Bairro.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_cidade = ' +#39+ Trim(Transportadora_Cidade.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_estado = ' +#39+ Trim(Transportadora_Estado.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_cep = ' +#39+ Trim(Transportadora_Cep.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_ddd = ' +#39+ Trim(Transportadora_DDD.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_fone = ' +#39+ Trim(Transportadora_Comercial.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_ramal = ' +#39+ Trim(Transportadora_Ramal.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_contato = ' +#39+ Trim(Transportadora_Contato.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_email = ' +#39+ Trim(Transportadora_EMail.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_insc_est = ' +#39+ Trim(Transportadora_Inscricao_Estadual.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_insc_mun = ' +#39+ Trim(Transportadora_Inscricao_Municipal.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_pais = ' +#39+ Trim(Transportadora_Pais.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_transportadora_observacao = ' +#39+ Trim(Transportadora_Observacao.Text) +#39+ ' ';
        Comando_SQL := Comando_SQL + ' Where fb_transportadora_numero = ' +#39+ Trim(Transportadora_Numero.Text) +#39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Transportadoras02.Close;
     End;
end;

procedure TTransportadoras02.Transportadora_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_Inscricao_EstadualKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_Razao_SocialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_Inscricao_MunicipalKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_EnderecoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_ComplementoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_CepKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_DDDKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key); 

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_RamalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key); 

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_ComercialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_ContatoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_EMailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras02.Transportadora_CNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
