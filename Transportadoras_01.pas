unit Transportadoras_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TTransportadoras01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
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
    Transportadora_DDD: TEdit;
    Transportadora_Comercial: TEdit;
    Transportadora_Ramal: TEdit;
    Transportadora_EMail: TEdit;
    Transportadora_CNPJ: TMaskEdit;
    Label12: TLabel;
    Transportadora_Contato: TEdit;
    Label14: TLabel;
    Transportadora_Razao_Social: TEdit;
    Label15: TLabel;
    Transportadora_Inscricao_Estadual: TEdit;
    Label17: TLabel;
    Transportadora_Inscricao_Municipal: TEdit;
    Transportadora_Observacao: TMemo;
    Label18: TLabel;
    procedure BT_IncluirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Transportadora_CNPJKeyPress(Sender: TObject; var Key: Char);
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
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Transportadoras01: TTransportadoras01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TTransportadoras01.Valida_Dados(): Boolean;

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

procedure TTransportadoras01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Valida_Dados() Then
        Begin

        Comando_SQL := 'Insert Into fb_transportadoras(';
        Comando_SQL := Comando_SQL + 'fb_transportadora_cnpj,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_nome,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_razao_social,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_endereco,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_complemento,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_bairro,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_cidade,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_estado,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_cep,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_ddd,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_fone,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_ramal,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_contato,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_email,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_insc_est,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_insc_mun,';
        Comando_SQL := Comando_SQL + 'fb_transportadora_pais, ';
        Comando_SQL := Comando_SQL + 'fb_transportadora_observacao) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_CNPJ.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Nome.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Razao_Social.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Endereco.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Complemento.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Bairro.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Cidade.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Estado.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Cep.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_DDD.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Comercial.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Ramal.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Contato.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_EMail.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Inscricao_Estadual.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Inscricao_Municipal.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Pais.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Transportadora_Observacao.Text) +#39+ ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outra Transportadora?') = 6 Then
           Begin
           Transportadora_CNPJ.Text                := '';
           Transportadora_Nome.Text                := '';
           Transportadora_Razao_Social.Text        := '';
           Transportadora_Endereco.Text            := '';
           Transportadora_Complemento.Text         := '';
           Transportadora_Bairro.Text              := '';
           Transportadora_Cidade.Text              := '';
           Transportadora_Estado.ItemIndex         := 0;
           Transportadora_Cep.Text                 := '';
           Transportadora_DDD.Text                 := '';
           Transportadora_Comercial.Text           := '';
           Transportadora_Ramal.Text               := '';
           Transportadora_Contato.Text             := '';
           Transportadora_EMail.Text               := '';
           Transportadora_Inscricao_Estadual.Text  := '';
           Transportadora_Inscricao_Municipal.Text := '';
           Transportadora_Pais.ItemIndex           := 0;
           Transportadora_Observacao.Lines.Clear;

           Transportadora_CNPJ.SetFocus;
           End
        Else
           Begin
           Transportadoras01.Close;
        End;
     End;
end;

procedure TTransportadoras01.BT_SairClick(Sender: TObject);
begin
     Transportadoras01.Close;
end;

procedure TTransportadoras01.Transportadora_CNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_Inscricao_EstadualKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_Razao_SocialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_Inscricao_MunicipalKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_EnderecoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_ComplementoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_CepKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key); 

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_DDDKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key); 

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_RamalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key); 

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_ComercialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_ContatoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTransportadoras01.Transportadora_EMailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
