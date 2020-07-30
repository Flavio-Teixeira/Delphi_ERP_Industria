unit Representantes_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRepresentantes01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Representante_Codigo: TEdit;
    Representante_Nome: TEdit;
    GroupBox2: TGroupBox;
    Representante_Endereco: TEdit;
    Representante_Bairro: TEdit;
    Representante_Cidade: TEdit;
    Representante_Complemento: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Representante_Contato: TEdit;
    GroupBox3: TGroupBox;
    Representante_DDD: TEdit;
    Label11: TLabel;
    Representante_Fone_Comercial: TEdit;
    Label13: TLabel;
    Representante_Fone_Residencial: TEdit;
    Label14: TLabel;
    Representante_Fone_Celular: TEdit;
    Label15: TLabel;
    Representante_Ramal: TEdit;
    Label16: TLabel;
    Label10: TLabel;
    Representante_EMail: TEdit;
    GroupBox4: TGroupBox;
    Representante_Observacao: TMemo;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Representante_2_Porcentagem: TEdit;
    Representante_1_Porcentagem: TEdit;
    Representante_ICMS_Grupo: TGroupBox;
    Representante_ICMS_Sim: TRadioButton;
    Representante_ICMS_Nao: TRadioButton;
    Representante_Relatorio_Grupo: TGroupBox;
    Representante_Relatorio_Sim: TRadioButton;
    Representante_Relatorio_Nao: TRadioButton;
    Representante_Cep: TMaskEdit;
    Representante_Pais: TComboBox;
    Representante_Estado: TComboBox;
    procedure BT_SairClick(Sender: TObject);
    procedure Representante_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_DDDKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_RamalKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_1_PorcentagemKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_2_PorcentagemKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_ContatoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_EnderecoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_ComplementoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_BairroKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_CepKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_Fone_ComercialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_Fone_ResidencialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_EMailKeyPress(Sender: TObject;
      var Key: Char);
    procedure Representante_Fone_CelularKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Representante_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure Representante_EstadoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Representantes01: TRepresentantes01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TRepresentantes01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Representante_Codigo.Text) = '' Then
        Begin
        Erro          := 'O Código do Representante não foi informado';
        Campo_Retorno := 'Representante_Codigo';
        End
     Else If Trim(Representante_Nome.Text) = '' Then
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
        End
     Else
        Begin
        ConexaoBD.SQL_Representantes.SQL.Clear;
        ConexaoBD.SQL_Representantes.SQL.Add('Select * from fb_representantes Where fb_representante_codigo = ' + Trim(Representante_Codigo.Text));
        ConexaoBD.SQL_Representantes.Open;

        If ConexaoBD.SQL_Representantes.RecordCount > 0 Then
           Begin
           Erro          := 'O Código do Representante Já existe';
           Campo_Retorno := 'Representante_Codigo';
        End;
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Representante_Codigo' Then
           Begin
           Representante_Codigo.SetFocus;
           End
        Else If Campo_Retorno = 'Representante_Nome' Then
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

procedure TRepresentantes01.BT_SairClick(Sender: TObject);
begin
     Representantes01.Close;
end;

procedure TRepresentantes01.Representante_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_DDDKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_RamalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_1_PorcentagemKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_2_PorcentagemKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_ContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_ComplementoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_BairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_CepKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key); 

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_Fone_ComercialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_Fone_ResidencialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_EMailKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_Fone_CelularKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.BT_IncluirClick(Sender: TObject);

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

        Comando_SQL := 'Insert Into fb_representantes(';
        Comando_SQL := Comando_SQL + 'fb_representante_codigo,';
        Comando_SQL := Comando_SQL + 'fb_representante_nome,';
        Comando_SQL := Comando_SQL + 'fb_representante_endereco,';
        Comando_SQL := Comando_SQL + 'fb_representante_complemento,';
        Comando_SQL := Comando_SQL + 'fb_representante_bairro,';
        Comando_SQL := Comando_SQL + 'fb_representante_cidade,';
        Comando_SQL := Comando_SQL + 'fb_representante_estado,';
        Comando_SQL := Comando_SQL + 'fb_representante_cep,';
        Comando_SQL := Comando_SQL + 'fb_representante_pais,';
        Comando_SQL := Comando_SQL + 'fb_representante_contato,';
        Comando_SQL := Comando_SQL + 'fb_representante_ddd,';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_ramal,';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_com,';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_res,';
        Comando_SQL := Comando_SQL + 'fb_representante_fone_cel,';
        Comando_SQL := Comando_SQL + 'fb_representante_email,';
        Comando_SQL := Comando_SQL + 'fb_representante_1_porcentagem,';
        Comando_SQL := Comando_SQL + 'fb_representante_2_porcentagem,';
        Comando_SQL := Comando_SQL + 'fb_representante_icms,';
        Comando_SQL := Comando_SQL + 'fb_representante_relatorio,';
        Comando_SQL := Comando_SQL + 'fb_representante_observacao) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + Trim(Representante_Codigo.Text) + ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Nome.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Endereco.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Complemento.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Bairro.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Cidade.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Estado.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Cep.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Pais.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Contato.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_DDD.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Ramal.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Fone_Comercial.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Fone_Residencial.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Fone_Celular.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Email.Text) +#39+ ',';
        Comando_SQL := Comando_SQL + Trim(Valor_1_Porcentagem) + ',';
        Comando_SQL := Comando_SQL + Trim(Valor_2_Porcentagem) + ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Opcao_Icms) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Opcao_Relatorio) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Representante_Observacao.Text) +#39+ ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Representante?') = 6 Then
           Begin
           Representante_Codigo.Text           := '';
           Representante_Nome.Text             := '';
           Representante_Contato.Text          := '';
           Representante_Endereco.Text         := '';
           Representante_Complemento.Text      := '';
           Representante_Bairro.Text           := '';
           Representante_Cidade.Text           := '';
           Representante_Estado.ItemIndex      := 0;
           Representante_Cep.Text              := '';
           Representante_Pais.ItemIndex        := 0;
           Representante_DDD.Text              := '';
           Representante_Ramal.Text            := '';
           Representante_Fone_Comercial.Text   := '';
           Representante_Fone_Residencial.Text := '';
           Representante_Fone_Celular.Text     := '';
           Representante_Email.Text            := '';
           Representante_1_Porcentagem.Text    := '';
           Representante_2_Porcentagem.Text    := '';
           Representante_Icms_Nao.Checked      := True;
           Representante_Relatorio_Nao.Checked := True;
           Representante_Observacao.Text       := '';

           Representante_Codigo.SetFocus;
           End
        Else
           Begin
           Representantes01.Close;
        End;
     End;
end;

procedure TRepresentantes01.FormShow(Sender: TObject);
begin
     Representante_Codigo.SetFocus;
end;

procedure TRepresentantes01.Representante_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRepresentantes01.Representante_EstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
