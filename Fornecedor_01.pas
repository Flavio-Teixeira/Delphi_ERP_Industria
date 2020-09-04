unit Fornecedor_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFornecedor01 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label36: TLabel;
    Fornecedor_Nome: TEdit;
    Fornecedor_Razao_Social: TEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Fornecedor_Endereco: TEdit;
    Fornecedor_Bairro: TEdit;
    Fornecedor_Cidade: TEdit;
    Fornecedor_Estado: TComboBox;
    Fornecedor_Cep: TMaskEdit;
    Fornecedor_Pais: TComboBox;
    Fornecedor_Fone: TEdit;
    Fornecedor_Fax: TEdit;
    GroupBox4: TGroupBox;
    Label28: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label44: TLabel;
    Label29: TLabel;
    Fornecedor_Contato: TEdit;
    Fornecedor_Fone_Comercial: TEdit;
    Fornecedor_Fone_Celular: TEdit;
    Fornecedor_Fone_Fax: TEdit;
    Fornecedor_Email: TEdit;
    Fornecedor_Site: TEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Fornecedor_Data_Inclusao: TMaskEdit;
    Fornecedor_Data_Alteracao: TMaskEdit;
    Fornecedor_Data_Ultima_Compra: TMaskEdit;
    Fornecedor_Observacoes: TMemo;
    Fornecedor_Codigo_CNPJ: TMaskEdit;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Label8: TLabel;
    Fornecedor_Inscricao_Estadual: TEdit;
    Label7: TLabel;
    Fornecedor_Inscricao_Municipal: TEdit;
    Fornecedor_Area: TComboBox;
    Label2: TLabel;
    Label6: TLabel;
    Fornecedor_Email_NFe: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Fornecedor_Codigo_CNPJKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Inscricao_EstadualKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Inscricao_MunicipalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Data_InclusaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Data_AlteracaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Data_Ultima_CompraKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Razao_SocialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_BairroKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_EstadoKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_CepKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_FoneKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_ContatoKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_Fone_ComercialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Fone_CelularKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fornecedor_Fone_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_EmailKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor_SiteKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Fornecedor_Email_NFeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
    function Valida_Codigo(Codigo:String): Boolean;

  public
    { Public declarations }
  end;

var
  Fornecedor01: TFornecedor01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TFornecedor01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     Ampulheta();

     If Trim(Fornecedor_Codigo_CNPJ.Text) = '.   .   /    -' Then
        Begin
        Erro          := 'O CNPJ do Fornecedor não foi informado';
        Campo_Retorno := 'Fornecedor_Codigo_CNPJ';
        End
     Else If Not Valida_Codigo(Fornecedor_Codigo_CNPJ.Text) Then
        Begin
        Erro          := 'O CNPJ ou CPF do Fornecedor não está correto';
        Campo_Retorno := 'Fornecedor_Codigo_CNPJ';
        End
     Else If Trim(Fornecedor_Razao_Social.Text) = '' Then
        Begin
        Erro          := 'A Razão Social do Fornecedor não foi informada';
        Campo_Retorno := 'Fornecedor_Razao_Social';
        End
     Else If Trim(Fornecedor_Data_Inclusao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data de Inclusão não foi informada';
        Campo_Retorno := 'Fornecedor_Data_Inclusao';
        End
     Else If Trim(Fornecedor_Data_Alteracao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data da Última Alteração não foi informada';
        Campo_Retorno := 'Fornecedor_Data_Alteracao';
        End
     Else If Trim(Fornecedor_Data_Ultima_Compra.Text) = '/  /' Then
        Begin
        Erro          := 'A Data da Última Compra não foi informada';
        Campo_Retorno := 'Fornecedor_Data_Ultima_Compra';
        End
     Else
        Begin
        ConexaoBD.SQL_Fornecedores.SQL.Clear;
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_codigo = ' + #39 + Trim(Fornecedor_Codigo_CNPJ.Text) + #39 );
        ConexaoBD.SQL_Fornecedores.Open;

        If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
           Begin
           Erro          := 'O Código do Fornecedor Já existe';
           Campo_Retorno := 'Fornecedor_Codigo_CNPJ';
        End;
     End;

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Fornecedor_Razao_Social' Then
           Begin
           Fornecedor_Razao_Social.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Codigo_CNPJ' Then
           Begin
           Fornecedor_Codigo_CNPJ.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Endereco' Then
           Begin
           Fornecedor_Endereco.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Bairro' Then
           Begin
           Fornecedor_Bairro.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Cidade' Then
           Begin
           Fornecedor_Cidade.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Cep' Then
           Begin
           Fornecedor_Cep.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Fone_Comercial' Then
           Begin
           Fornecedor_Fone_Comercial.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Data_Inclusao' Then
           Begin
           Fornecedor_Data_Inclusao.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Data_Alteracao' Then
           Begin
           Fornecedor_Data_Alteracao.SetFocus;
           End
        Else If Campo_Retorno = 'Fornecedor_Data_Ultima_Compra' Then
           Begin
           Fornecedor_Data_Ultima_Compra.SetFocus;
        End;
     End;

     Result := Resultado;

end;

function TFornecedor01.Valida_Codigo(Codigo:String): Boolean;

var
   Resultado: Boolean;

begin
     Resultado := True;

     Codigo := Retira_Caracter(Codigo,'.');
     Codigo := Retira_Caracter(Codigo,'/');
     Codigo := Retira_Caracter(Codigo,'-');

     If Length(Trim(codigo)) < 14 Then
        Begin
        Resultado := Valida_CPF(Codigo);
        End
     Else
        Begin
        Resultado := Valida_CNPJ(Codigo);
     End;

     Result := Resultado;
end;

//*****************
//*** Procedure ***
//*****************

procedure TFornecedor01.BT_SairClick(Sender: TObject);
begin
     Fornecedor01.Close;
end;

procedure TFornecedor01.Fornecedor_Codigo_CNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Inscricao_EstadualKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Inscricao_MunicipalKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Data_InclusaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Data_AlteracaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Data_Ultima_CompraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Razao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_CepKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_FoneKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_FaxKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_ContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Fone_ComercialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Fone_CelularKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_Fone_FaxKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_EmailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.Fornecedor_SiteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Valida_Dados() Then
        Begin

        //*** Efetua a Inserção ***

        Comando_SQL := 'Insert Into fb_fornecedores(';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_codigo, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_nome, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_razao_social, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_inscricao_municipal, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_inscricao_estadual, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_endereco, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_bairro, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_cidade, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_estado, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_cep, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_contato, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone_comercial, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone_celular, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone_fax, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_data_inclusao, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_data_alteracao, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_data_ultima_compra, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_observacoes, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_pais, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_email, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_email_nfe, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_site, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fax, ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_area) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Codigo_CNPJ.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Razao_Social.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Inscricao_Municipal.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Inscricao_Estadual.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Endereco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Bairro.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Cidade.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Estado.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Cep.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Contato.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Fone_Comercial.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Fone_Celular.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Fone_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Fornecedor_Data_Inclusao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Fornecedor_Data_Alteracao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Fornecedor_Data_Ultima_Compra.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Observacoes.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Pais.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Email.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Email_NFe.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Site.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Fone.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Area.Text) + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Cliente?') = 6 Then
           Begin
           Fornecedor_Codigo_CNPJ.Text         := '';
           Fornecedor_Nome.Text                := '';
           Fornecedor_Razao_Social.Text        := '';
           Fornecedor_Inscricao_Municipal.Text := '';
           Fornecedor_Inscricao_Estadual.Text  := '';
           Fornecedor_Endereco.Text            := '';
           Fornecedor_Bairro.Text              := '';
           Fornecedor_Cidade.Text              := '';
           Fornecedor_Estado.Text              := '';
           Fornecedor_Cep.Text                 := '';
           Fornecedor_Contato.Text             := '';
           Fornecedor_Fone_Comercial.Text      := '';
           Fornecedor_Fone_Celular.Text        := '';
           Fornecedor_Fone_Fax.Text            := '';
           Fornecedor_Data_Inclusao.Text       := DateToStr(Date());
           Fornecedor_Data_Alteracao.Text      := DateToStr(Date());
           Fornecedor_Data_Ultima_Compra.Text  := DateToStr(Date());
           Fornecedor_Observacoes.Lines.Clear;
           Fornecedor_Pais.ItemIndex           := 0;
           Fornecedor_Email.Text               := '';
           Fornecedor_Email_NFe.Text           := '';
           Fornecedor_Site.Text                := '';
           Fornecedor_Fone.Text                := '';
           Fornecedor_Fax.Text                 := '';

           Fornecedor_Codigo_CNPJ.SetFocus;
           End
        Else
           Begin
           Fornecedor01.Close;
        End;
     End;
end;

procedure TFornecedor01.FormShow(Sender: TObject);
begin
     //*** Carrega as Datas ***

     Fornecedor_Data_Inclusao.Text      := DateToStr(Date());
     Fornecedor_Data_Alteracao.Text     := DateToStr(Date());
     Fornecedor_Data_Ultima_Compra.Text := DateToStr(Date());
end;

procedure TFornecedor01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TFornecedor01.Fornecedor_Email_NFeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
