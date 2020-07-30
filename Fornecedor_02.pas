unit Fornecedor_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TFornecedor02 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label36: TLabel;
    Label8: TLabel;
    Label7: TLabel;
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
    Fornecedor_Inscricao_Estadual: TEdit;
    Fornecedor_Inscricao_Municipal: TEdit;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Label2: TLabel;
    Fornecedor_Numero: TEdit;
    Programa_Anterior: TEdit;
    DBG_Fornecedor_Observacao: TDBMemo;
    Label5: TLabel;
    Fornecedor_Area: TComboBox;
    Label6: TLabel;
    Fornecedor_Email_NFe: TEdit;
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Fornecedor_NumeroKeyPress(Sender: TObject; var Key: Char);
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
    procedure Fornecedor_Email_NFeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
    function Valida_Codigo(Codigo:String): Boolean;

  public
    { Public declarations }
  end;

var
  Fornecedor02: TFornecedor02;

implementation

uses Conexao_BD, Rotinas_Gerais, Cotacao_03, Cotacao_04, Ordem_01,
  Ordem_02, Requisicao_03, Requisicao_04;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TFornecedor02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     Ampulheta();

     If Trim(Fornecedor_Data_Inclusao.Text) = '/  /' Then
        Begin
        Fornecedor_Data_Inclusao.Text := DateToStr(Date());
     End;

     If Trim(Fornecedor_Data_Alteracao.Text) = '/  /' Then
        Begin
        Fornecedor_Data_Alteracao.Text := DateToStr(Date());
     End;

     If Trim(Fornecedor_Data_Ultima_Compra.Text) = '/  /' Then
        Begin
        Fornecedor_Data_Ultima_Compra.Text := DateToStr(Date());
     End;

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

function TFornecedor02.Valida_Codigo(Codigo:String): Boolean;

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

//******************
//*** Procedures ***
//******************

procedure TFornecedor02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Fornecedor02.Close;
     End;
end;

procedure TFornecedor02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Valida_Dados() Then
        Begin

        //*** Efetua a Inserção ***

        Comando_SQL := 'Update fb_fornecedores Set ';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_codigo = ' + #39 + Trim(Fornecedor_Codigo_CNPJ.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_nome = ' + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_razao_social = ' + #39 + Trim(Fornecedor_Razao_Social.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_inscricao_municipal = ' + #39 + Trim(Fornecedor_Inscricao_Municipal.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_inscricao_estadual = ' + #39 + Trim(Fornecedor_Inscricao_Estadual.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_endereco = ' + #39 + Trim(Fornecedor_Endereco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_bairro = ' + #39 + Trim(Fornecedor_Bairro.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_cidade = ' + #39 + Trim(Fornecedor_Cidade.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_estado = ' + #39 + Trim(Fornecedor_Estado.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_cep = ' + #39 + Trim(Fornecedor_Cep.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_contato = ' + #39 + Trim(Fornecedor_Contato.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone_comercial = ' + #39 + Trim(Fornecedor_Fone_Comercial.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone_celular = ' + #39 + Trim(Fornecedor_Fone_Celular.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone_fax = ' + #39 + Trim(Fornecedor_Fone_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_data_inclusao = ' + #39 + Inverte_Data_Plus(Trim(Fornecedor_Data_Inclusao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_data_alteracao = ' + #39 + Inverte_Data_Plus(Trim(Fornecedor_Data_Alteracao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_data_ultima_compra = ' + #39 + Inverte_Data_Plus(Trim(Fornecedor_Data_Ultima_Compra.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_observacoes = ' + #39 + Trim(Fornecedor_Observacoes.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_pais = ' + #39 + Trim(Fornecedor_Pais.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_email = ' + #39 + Trim(Fornecedor_Email.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_email_nfe = ' + #39 + Trim(Fornecedor_Email_NFe.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_site = ' + #39 + Trim(Fornecedor_Site.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fone = ' + #39 + Trim(Fornecedor_Fone.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_fax = '+ #39 + Trim(Fornecedor_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_fornecedor_area = '+ #39 + Trim(Fornecedor_Area.Text) + #39 + ' ';
        Comando_SQL := Comando_SQL + 'Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then
           Begin
           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 );
           ConexaoBD.SQL_Fornecedores.Open;

           Cotacao03.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Cotacao03.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Cotacao03.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Cotacao03.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Cotacao03.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Cotacao03.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Cotacao03.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Cotacao03.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Cotacao03.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Cotacao03.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Cotacao03.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Cotacao03.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Cotacao03.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Cotacao03.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Cotacao03.Fornecedor_Observacoes.Lines.Clear;
           Cotacao03.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
           End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then
           Begin
           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 );
           ConexaoBD.SQL_Fornecedores.Open;

           Cotacao04.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Cotacao04.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Cotacao04.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Cotacao04.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Cotacao04.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Cotacao04.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Cotacao04.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Cotacao04.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Cotacao04.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Cotacao04.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Cotacao04.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Cotacao04.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Cotacao04.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Cotacao04.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Cotacao04.Fornecedor_Observacoes.Lines.Clear;
           Cotacao04.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
           End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then
           Begin
           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 );
           ConexaoBD.SQL_Fornecedores.Open;

           Requisicao03.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Requisicao03.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Requisicao03.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Requisicao03.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Requisicao03.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Requisicao03.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Requisicao03.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Requisicao03.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Requisicao03.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Requisicao03.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Requisicao03.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Requisicao03.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Requisicao03.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Requisicao03.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Requisicao03.Fornecedor_Observacoes.Lines.Clear;
           Requisicao03.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
           End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then
           Begin
           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 );
           ConexaoBD.SQL_Fornecedores.Open;

           Requisicao04.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Requisicao04.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Requisicao04.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Requisicao04.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Requisicao04.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Requisicao04.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Requisicao04.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Requisicao04.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Requisicao04.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Requisicao04.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Requisicao04.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Requisicao04.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Requisicao04.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Requisicao04.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Requisicao04.Fornecedor_Observacoes.Lines.Clear;
           Requisicao04.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
           End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then
           Begin
           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 );
           ConexaoBD.SQL_Fornecedores.Open;

           Ordem01.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Ordem01.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Ordem01.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Ordem01.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Ordem01.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Ordem01.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Ordem01.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Ordem01.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Ordem01.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Ordem01.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Ordem01.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Ordem01.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Ordem01.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Ordem01.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Ordem01.Fornecedor_Observacoes.Lines.Clear;
           Ordem01.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
           End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then
           Begin
           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 );
           ConexaoBD.SQL_Fornecedores.Open;

           Ordem02.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Ordem02.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Ordem02.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Ordem02.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Ordem02.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Ordem02.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Ordem02.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Ordem02.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Ordem02.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Ordem02.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Ordem02.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Ordem02.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Ordem02.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Ordem02.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Ordem02.Fornecedor_Observacoes.Lines.Clear;
           Ordem02.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
        End;

        MSG_Erro('Alteração Efetuada...');

        Fornecedor02.Close;
     End;
end;

procedure TFornecedor02.BT_SairClick(Sender: TObject);
begin
     Fornecedor02.Close;
end;

procedure TFornecedor02.FormShow(Sender: TObject);
begin
     //*** Carrega as Datas ***

     Fornecedor_Data_Alteracao.Text     := DateToStr(Date());
end;

procedure TFornecedor02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TFornecedor02.Fornecedor_NumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Codigo_CNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Inscricao_EstadualKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Inscricao_MunicipalKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Data_InclusaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Data_AlteracaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Data_Ultima_CompraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Razao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_CepKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_FoneKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_FaxKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_ContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Fone_ComercialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Fone_CelularKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Fone_FaxKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_EmailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_SiteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor02.Fornecedor_Email_NFeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
