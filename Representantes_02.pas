unit Representantes_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TRepresentantes02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Representante_Codigo: TEdit;
    Representante_Nome: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Representante_Endereco: TEdit;
    Representante_Bairro: TEdit;
    Representante_Cidade: TEdit;
    Representante_Complemento: TEdit;
    Representante_Cep: TMaskEdit;
    Representante_Estado: TComboBox;
    Representante_Pais: TComboBox;
    Representante_Contato: TEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    Representante_DDD: TEdit;
    Representante_Fone_Comercial: TEdit;
    Representante_Fone_Residencial: TEdit;
    Representante_Fone_Celular: TEdit;
    Representante_Ramal: TEdit;
    Representante_EMail: TEdit;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Representante_Observacao: TMemo;
    Representante_2_Porcentagem: TEdit;
    Representante_1_Porcentagem: TEdit;
    Representante_ICMS_Grupo: TGroupBox;
    Representante_ICMS_Sim: TRadioButton;
    Representante_ICMS_Nao: TRadioButton;
    Representante_Relatorio_Grupo: TGroupBox;
    Representante_Relatorio_Sim: TRadioButton;
    Representante_Relatorio_Nao: TRadioButton;
    BT_Excluir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Representante_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_ContatoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_EnderecoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_ComplementoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_BairroKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_EstadoKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_CepKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_DDDKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_RamalKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_Fone_ComercialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_Fone_ResidencialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_EMailKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_Fone_CelularKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_1_PorcentagemKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_2_PorcentagemKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Representantes02: TRepresentantes02;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TRepresentantes02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Representante_Nome.Text) = '' Then
        Begin
        Erro          := 'O Nome/Razão Social do Representante não foi informado';
        Campo_Retorno := 'Representante_Nome';
        End
     Else If Trim(Representante_Endereco.Text) = '' Then
        Begin
        Erro          := 'O Endereço do Representante não foi informado';
        Campo_Retorno := 'Representante_Endereco';
        End
     Else If Trim(Representante_Bairro.Text) = '' Then
        Begin
        Erro          := 'O Bairro do Representante não foi informado';
        Campo_Retorno := 'Representante_Bairro';
        End
     Else If Trim(Representante_Cidade.Text) = '' Then
        Begin
        Erro          := 'A Cidade do Representante não foi informada';
        Campo_Retorno := 'Representante_Cidade';
        End
     Else If Trim(Representante_Cep.Text) = '-' Then
        Begin
        Erro          := 'O CEP do Representante não foi informado';
        Campo_Retorno := 'Representante_Cep';
        End
     Else If Trim(Representante_Fone_Comercial.Text) = '' Then
        Begin
        Erro          := 'O Telefone Comercial do Representante não foi informado';
        Campo_Retorno := 'Representante_Fone_Comercial';
        End
     Else If Trim(Representante_1_Porcentagem.Text) = '' Then
        Begin
        Erro          := 'A Primeira Porcentagem do Representante não foi informada';
        Campo_Retorno := 'Representante_1_Porcentagem';
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Representante_Nome' Then
           Begin
           Representante_Nome.SetFocus;
           End
        Else If Campo_Retorno = 'Representante_Endereco' Then
           Begin
           Representante_Endereco.SetFocus;
           End
        Else If Campo_Retorno = 'Representante_Bairro' Then
           Begin
           Representante_Bairro.SetFocus;
           End
        Else If Campo_Retorno = 'Representante_Cidade' Then
           Begin
           Representante_Cidade.SetFocus;
           End
        Else If Campo_Retorno = 'Representante_Cep' Then
           Begin
           Representante_Cep.SetFocus;
           End
        Else If Campo_Retorno = 'Representante_Fone_Comercial' Then
           Begin
           Representante_Fone_Comercial.SetFocus;
           End
        Else If Campo_Retorno = 'Representante_1_Porcentagem' Then
           Begin
           Representante_1_Porcentagem.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TRepresentantes02.BT_SairClick(Sender: TObject);
begin
     Representantes02.Close;
end;

procedure TRepresentantes02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_representantes Where fb_representante_codigo = ' +  Trim(Representante_Codigo.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Representantes02.Close;
     End;
end;

procedure TRepresentantes02.BT_AlterarClick(Sender: TObject);

var
   Opcao_Icms, Opcao_Relatorio, Comando_SQL, Valor_1_Porcentagem, Valor_2_Porcentagem: String;

begin
     If Valida_Dados() Then
        Begin

        If Representante_ICMS_Sim.Checked Then
           Begin
           Opcao_Icms := 'S';
           End
        Else
           Begin
           Opcao_Icms := 'N';
        End;

        If Representante_Relatorio_Sim.Checked Then
           Begin
           Opcao_Relatorio := 'S';
           End
        Else
           Begin
           Opcao_Relatorio := 'N';
        End;

        Valor_1_Porcentagem := Trim(Virgula_Ponto(Representante_1_Porcentagem.Text));
        Valor_2_Porcentagem := Trim(Virgula_Ponto(Representante_2_Porcentagem.Text));

        If Trim(Valor_1_Porcentagem) = '' Then
           Begin
           Valor_1_Porcentagem := '0';
        End;

        If Trim(Valor_2_Porcentagem) = '' Then
           Begin
           Valor_2_Porcentagem := '0';
        End;

        Comando_SQL := 'Update fb_representantes Set ';
        Comando_SQL := Comando_SQL + 'fb_representante_nome = ' +#39+ Trim(Representante_Nome.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_endereco = ' +#39+ Trim(Representante_Endereco.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_complemento = ' +#39+ Trim(Representante_Complemento.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_bairro = ' +#39+ Trim(Representante_Bairro.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_cidade = ' +#39+ Trim(Representante_Cidade.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_estado = ' +#39+ Trim(Representante_Estado.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_cep = ' +#39+ Trim(Representante_Cep.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_pais = ' +#39+ Trim(Representante_Pais.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_contato = ' +#39+ Trim(Representante_Contato.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_ddd = ' +#39+ Trim(Representante_DDD.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_ramal = ' +#39+ Trim(Representante_Ramal.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_com = ' +#39+ Trim(Representante_Fone_Comercial.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_res = ' +#39+ Trim(Representante_Fone_Residencial.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_cel = ' +#39+ Trim(Representante_Fone_Celular.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_email = ' +#39+ Trim(Representante_Email.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_1_porcentagem = ' + Trim(Valor_1_Porcentagem) + ',';
        Comando_SQL := Comando_SQL + 'fb_representante_2_porcentagem = ' + Trim(Valor_2_Porcentagem) + ',';
        Comando_SQL := Comando_SQL + 'fb_representante_icms = ' +#39+ Trim(Opcao_Icms) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_relatorio = ' +#39+ Trim(Opcao_Relatorio) +#39+ ',';
        Comando_SQL := Comando_SQL + 'fb_representante_observacao = ' +#39+ Trim(Representante_Observacao.Text) +#39;
        Comando_SQL := Comando_SQL + ' Where fb_representante_codigo = ' +#39+ Trim(Representante_Codigo.Text) +#39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Representantes02.Close;
     End;
end;

procedure TRepresentantes02.Representante_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_ContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_ComplementoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_CepKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_DDDKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_RamalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_Fone_ComercialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_Fone_ResidencialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_EMailKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_Fone_CelularKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_1_PorcentagemKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes02.Representante_2_PorcentagemKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
