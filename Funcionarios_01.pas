unit Funcionarios_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls, ExtDlgs, Grids,
  DBGrids;

type
  TFuncionarios01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    ED_Funcionario_Nome: TEdit;
    Label7: TLabel;
    ED_Funcionario_Rg: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ED_Funcionario_Data_Admissao: TMaskEdit;
    ED_Funcionario_Data_Rescisao: TMaskEdit;
    GroupBox3: TGroupBox;
    ED_Funcionario_Te_Zona_Eleitoral: TEdit;
    Label6: TLabel;
    ED_Funcionario_Te_n: TEdit;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    ED_Funcionario_Ctps_n: TEdit;
    ED_Funcionario_Ctps_Serie: TEdit;
    Label3: TLabel;
    ED_Funcionario_Cargo: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    ED_Funcionario_Funcao: TEdit;
    Label12: TLabel;
    ED_Funcionario_Salario: TEdit;
    ED_Funcionario_Horario_F: TMaskEdit;
    ED_Funcionario_Horario_I: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ED_Funcionario_Intervalo: TEdit;
    GroupBox5: TGroupBox;
    ED_Funcionario_Cabelo: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    ED_Funcionario_Olhos: TEdit;
    Label19: TLabel;
    ED_Funcionario_Altura: TEdit;
    Label20: TLabel;
    ED_Funcionario_Peso: TEdit;
    Label21: TLabel;
    ED_Funcionario_Sinais: TEdit;
    GroupBox8: TGroupBox;
    ED_Funcionario_Nome_Mae: TEdit;
    Label34: TLabel;
    ED_Funcionario_Nome_Pai: TEdit;
    Label33: TLabel;
    ED_Funcionario_Nacionalidade: TEdit;
    Label32: TLabel;
    ED_Funcionario_Data_Nascimento: TMaskEdit;
    Label35: TLabel;
    Label36: TLabel;
    ED_Funcionario_Estado_Civil: TEdit;
    Label37: TLabel;
    ED_Funcionario_Nome_Conjuge: TEdit;
    Label38: TLabel;
    ED_Funcionario_Grau_Instrucao: TEdit;
    Label39: TLabel;
    ED_Funcionario_Residencia: TEdit;
    Label40: TLabel;
    ED_Funcionario_Carteira_Habilitacao_n: TEdit;
    ED_Funcionario_Certidao_Militar_n: TEdit;
    Label41: TLabel;
    ED_Funcionario_Certidao_Militar_Serie: TEdit;
    Label42: TLabel;
    ED_Funcionario_Certidao_Militar_Categoria: TEdit;
    Label43: TLabel;
    GroupBox9: TGroupBox;
    Label44: TLabel;
    ED_Funcionario_Estrangeiro_Carteira_19_n: TEdit;
    ED_Funcionario_Estrangeiro_rg: TEdit;
    Label45: TLabel;
    Label50: TLabel;
    ED_Funcionario_Estrangeiro_Data_Chegada: TMaskEdit;
    Label52: TLabel;
    ED_Funcionario_Estrangeiro_Decreto_n: TEdit;
    ED_Funcionario_Local_Nascimento: TEdit;
    Label54: TLabel;
    GroupBox10: TGroupBox;
    Label62: TLabel;
    ED_Funcionario_Pis_Data_Cadastramento: TMaskEdit;
    Label56: TLabel;
    ED_Funcionario_Pis_Sob_n: TEdit;
    ED_Funcionario_Pis_Dep_Banco: TEdit;
    Label57: TLabel;
    ED_Funcionario_Pis_Endereco: TEdit;
    Label58: TLabel;
    ED_Funcionario_Pis_Cod_Banco: TEdit;
    Label59: TLabel;
    Label60: TLabel;
    ED_Funcionario_Pis_Cod_Agencia: TEdit;
    Label61: TLabel;
    ED_Funcionario_Pis_Endereco_Agencia: TEdit;
    Label63: TLabel;
    ED_Funcionario_Pis_Obs: TEdit;
    Label47: TLabel;
    ED_Funcionario_Beneficiarios: TMemo;
    GroupBox17: TGroupBox;
    ED_Funcionario_Fax: TEdit;
    Label70: TLabel;
    ED_Funcionario_Fone: TEdit;
    Label69: TLabel;
    ED_Funcionario_Cpf: TMaskEdit;
    ED_Funcionario_Estrangeiro_Casado_Brasileiros: TRadioGroup;
    ED_Funcionario_Estrangeiro_Filhos_b: TRadioGroup;
    ED_Funcionario_Estrangeiro_Naturalizado: TRadioGroup;
    ED_Funcionario_Estrangeiro_Quantos_Filhos: TEdit;
    ED_Funcionario_Salario_Periodo: TRadioGroup;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    ED_Funcionario_Endereco: TEdit;
    ED_Funcionario_Bairro: TEdit;
    ED_Funcionario_Cidade: TEdit;
    CB_Funcionario_Estado: TComboBox;
    ED_Funcionario_Cep: TMaskEdit;
    GroupBox6: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    ED_Funcionario_Fgts_Data_Retratacao: TMaskEdit;
    ED_Funcionario_Fgts_Data_Opcao: TMaskEdit;
    ED_Funcionario_Fgts_Banco: TEdit;
    ED_Funcionario_Fgts_Optante: TRadioGroup;
    Pag2: TEdit;
    Fechar: TEdit;
    GroupBox11: TGroupBox;
    CB_Funcionario_Empresa: TComboBox;
    TabSheet3: TTabSheet;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    Label13: TLabel;
    Funcionario_Banco_Nome: TEdit;
    Label22: TLabel;
    Funcionario_Banco_Agencia: TEdit;
    Funcionario_Banco_Conta: TEdit;
    Label23: TLabel;
    Funcionario_Banco_Titular: TEdit;
    Label46: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure ED_Funcionario_Estrangeiro_Quantos_FilhosKeyPress(
      Sender: TObject; var Key: Char);
    procedure ED_Funcionario_SalarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure ED_Funcionario_Estrangeiro_NaturalizadoClick(
      Sender: TObject);
    procedure ED_Funcionario_Estrangeiro_Filhos_bClick(Sender: TObject);
    procedure ED_Funcionario_Fgts_OptanteClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FecharChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Valida_Funcionario();
  public
    { Public declarations }
  end;

var
  Funcionarios01: TFuncionarios01;
  incluir: Boolean;

implementation

uses Conexao_BD, Rotinas_Gerais, Funcionarios_02, Funcionarios_00;

{$R *.dfm}

procedure TFuncionarios01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ConexaoBD.SQL_Funcionarios.Close;
     ConexaoBD.SQL_Funcionarios.SQL.Clear;
     ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_data_rescisao <= '+#39+'0000-00-00'+#39+' Order By funcionario_numero Asc');
     ConexaoBD.SQL_Funcionarios.Open;

     Action := caFree;
     Release;
     Funcionarios01 := Nil;
end;

procedure TFuncionarios01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFuncionarios01.FormShow(Sender: TObject);
begin
{
     Exibe_Exemplo_Codigo();
     Carrega_Bancos();
     Carrega_Representantes();
     Carrega_Transportadoras();

     //*** Carrega as Datas ***

     Cliente_Data_Inclusao.Text      := DateToStr(Date());
     Cliente_Data_Visita.Text        := DateToStr(Date());
     Cliente_Data_Ultima_Compra.Text := DateToStr(Date());
     Cliente_Data_Alteracao.Text     := DateToStr(Date());
}
end;

procedure TFuncionarios01.BT_SairClick(Sender: TObject);
begin
    Funcionarios01.Close;
end;

procedure TFuncionarios01.Valida_Funcionario;
var
   Erro: String;
begin
    Ampulheta();

    Erro    := '';

    If Trim(ED_Funcionario_Nome.Text) = '' Then
    Begin
        incluir := false;
        Erro    := 'O Nome do Funcionário não foi informado';
        TabSheet1.SetFocus;
        ED_Funcionario_Nome.SetFocus;
    End
    Else If Trim(ED_Funcionario_Cpf.Text) = '.   .   -' Then
    Begin
        incluir := false;
        Erro    := 'O CPF do Funcionário não foi informado';
        TabSheet1.SetFocus;
        ED_Funcionario_Cpf.SetFocus;
        End
    Else If Trim(ED_Funcionario_Cpf.Text) <> '.   .   -' Then
    Begin
        ConexaoBD.SQL_Funcionarios.Close;
        ConexaoBD.SQL_Funcionarios.SQL.Clear;
        ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_empresa = '+#39+Trim(CB_Funcionario_Empresa.Text)+#39+' and funcionario_cpf = '+#39+Trim(ED_Funcionario_Cpf.Text)+#39);
        ConexaoBD.SQL_Funcionarios.Open;

        If ConexaoBD.SQL_Funcionarios.RecordCount > 0 Then
        Begin
            incluir := false;
            Erro    := 'O CPF do Funcionário já está cadastrado na empresa selecionada';
            TabSheet1.SetFocus;
            ED_Funcionario_Cpf.SetFocus;
        End
        Else Begin
            incluir := true;
            Erro    := '';
        End;
    End
    Else Begin
        incluir := true;
        Erro    := '';
    End;
    
    Seta();

    If Trim(Erro) <> '' Then Begin
        MSG_Erro(Erro);
    End;

end;

procedure TFuncionarios01.BT_IncluirClick(Sender: TObject);
var
    Comando_SQL, Codigo_Funcionario: String;
begin
    Valida_Funcionario();

    If incluir = True Then Begin

        //*** Efetua a Inserção ***

        Comando_SQL := 'Insert Into funcionarios(';
        Comando_SQL := Comando_SQL + 'funcionario_cpf, ';
        Comando_SQL := Comando_SQL + 'funcionario_nome, ';
        Comando_SQL := Comando_SQL + 'funcionario_rg, ';
        Comando_SQL := Comando_SQL + 'funcionario_ctps_n, ';
        Comando_SQL := Comando_SQL + 'funcionario_ctps_serie, ';
        Comando_SQL := Comando_SQL + 'funcionario_te_n, ';
        Comando_SQL := Comando_SQL + 'funcionario_te_zona_eleitoral, ';
        Comando_SQL := Comando_SQL + 'funcionario_endereco, ';
        Comando_SQL := Comando_SQL + 'funcionario_bairro, ';
        Comando_SQL := Comando_SQL + 'funcionario_cidade, ';
        Comando_SQL := Comando_SQL + 'funcionario_estado, ';
        Comando_SQL := Comando_SQL + 'funcionario_cep, ';
        Comando_SQL := Comando_SQL + 'funcionario_fone, ';
        Comando_SQL := Comando_SQL + 'funcionario_fax, ';
        Comando_SQL := Comando_SQL + 'funcionario_cabelo, ';
        Comando_SQL := Comando_SQL + 'funcionario_olhos, ';
        Comando_SQL := Comando_SQL + 'funcionario_altura, ';
        Comando_SQL := Comando_SQL + 'funcionario_peso, ';
        Comando_SQL := Comando_SQL + 'funcionario_sinais, ';
        Comando_SQL := Comando_SQL + 'funcionario_fgts_optante, ';
        Comando_SQL := Comando_SQL + 'funcionario_fgts_data_opcao, ';
        Comando_SQL := Comando_SQL + 'funcionario_fgts_data_retratacao, ';
        Comando_SQL := Comando_SQL + 'funcionario_fgts_banco, ';
        Comando_SQL := Comando_SQL + 'funcionario_data_admissao, ';
        Comando_SQL := Comando_SQL + 'funcionario_data_rescisao, ';
        Comando_SQL := Comando_SQL + 'funcionario_horario_i, ';
        Comando_SQL := Comando_SQL + 'funcionario_horario_f, ';
        Comando_SQL := Comando_SQL + 'funcionario_cargo, ';
        Comando_SQL := Comando_SQL + 'funcionario_funcao, ';
        Comando_SQL := Comando_SQL + 'funcionario_intervalo, ';
        Comando_SQL := Comando_SQL + 'funcionario_salario, ';
        Comando_SQL := Comando_SQL + 'funcionario_salario_periodo, ';
        Comando_SQL := Comando_SQL + 'funcionario_nascionalidade, ';
        Comando_SQL := Comando_SQL + 'funcionario_nome_pai, ';
        Comando_SQL := Comando_SQL + 'funcionario_nome_mae, ';
        Comando_SQL := Comando_SQL + 'funcionario_local_nascimento, ';
        Comando_SQL := Comando_SQL + 'funcionario_data_nascimento, ';
        Comando_SQL := Comando_SQL + 'funcionario_estado_civil, ';
        Comando_SQL := Comando_SQL + 'funcionario_nome_conjuge, ';
        Comando_SQL := Comando_SQL + 'funcionario_grau_instrucao, ';
        Comando_SQL := Comando_SQL + 'funcionario_residencia, ';
        Comando_SQL := Comando_SQL + 'funcionario_carteira_habilitacao_n, ';
        Comando_SQL := Comando_SQL + 'funcionario_certidao_militar_n, ';
        Comando_SQL := Comando_SQL + 'funcionario_certidao_militar_serie, ';
        Comando_SQL := Comando_SQL + 'funcionario_certidao_militar_categoria, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_carteira_19_n, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_rg, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_casado_brasileiro, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_filhos_b, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_quantos_filhos, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_data_chegada, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_naturalizado, ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_decreto_n, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_data_cadastramento, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_sob_n, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_dep_banco, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_endereço, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_cod_banco, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_cod_agencia, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_endereco_agencia, ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_obs, ';
        Comando_SQL := Comando_SQL + 'funcionario_beneficiarios, ';
        Comando_SQL := Comando_SQL + 'funcionario_empresa, ';
        Comando_SQL := Comando_SQL + 'funcionario_banco_nome, ';
        Comando_SQL := Comando_SQL + 'funcionario_banco_agencia, ';
        Comando_SQL := Comando_SQL + 'funcionario_banco_conta, ';
        Comando_SQL := Comando_SQL + 'funcionario_banco_titular) ';

        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Cpf.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Rg.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Ctps_n.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Ctps_Serie.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Te_n.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Te_Zona_Eleitoral.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Endereco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Bairro.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Cidade.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(CB_Funcionario_Estado.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Cep.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Fone.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Fax.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Cabelo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Olhos.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Altura.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Peso.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Sinais.Text) + #39 + ',';

        if(ED_Funcionario_Fgts_Optante.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ','
        else
            Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';

        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Fgts_Data_Opcao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Fgts_Data_Retratacao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Fgts_Banco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Data_Admissao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Data_Rescisao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Horario_I.Text)+':00' + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Horario_F.Text)+':00' + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Cargo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Funcao.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Intervalo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ED_Funcionario_Salario.Text) + #39 + ',';

        if(ED_Funcionario_Salario_Periodo.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + #39 + 'M' + #39 + ','
        else if(ED_Funcionario_Salario_Periodo.ItemIndex = 1) Then
            Comando_SQL := Comando_SQL + #39 + 'D' + #39 + ','
        else
            Comando_SQL := Comando_SQL + #39 + 'H' + #39 + ',';

        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Nacionalidade.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Nome_Pai.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Nome_Mae.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Local_Nascimento.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Data_Nascimento.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Estado_Civil.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Nome_Conjuge.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Grau_Instrucao.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Residencia.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Carteira_Habilitacao_n.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Certidao_Militar_n.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Certidao_Militar_Serie.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Certidao_Militar_Categoria.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Estrangeiro_Carteira_19_n.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Estrangeiro_rg.Text) + #39 + ',';

        if(ED_Funcionario_Estrangeiro_Casado_Brasileiros.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ','
        else
            Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';

        if(ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ','
        else
            Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';

        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Estrangeiro_Quantos_Filhos.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Estrangeiro_Data_Chegada.Text),'amd','/') + #39 + ',';

        if(ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ','
        else
            Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';

        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Estrangeiro_Decreto_n.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Pis_Data_Cadastramento.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Pis_Sob_n.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Pis_Dep_Banco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Pis_Endereco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Pis_Cod_Banco.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Pis_Cod_Agencia.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Pis_Endereco_Agencia.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Pis_Obs.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(ED_Funcionario_Beneficiarios.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(CB_Funcionario_Empresa.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Funcionario_Banco_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Funcionario_Banco_Agencia.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Funcionario_Banco_Conta.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Funcionario_Banco_Titular.Text) + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Deseja preencher agora os dados referentes a alterações '+#13+'no salário, cargo, férias e etc?') = 6 Then Begin
            If (Funcionarios02 = Nil) Then Begin

                Ampulheta();
                Application.CreateForm(TFuncionarios02,Funcionarios02);

                //*** Obtem os Dados do Cliente ***
                ConexaoBD.SQL_Funcionarios.Close;
                ConexaoBD.SQL_Funcionarios.SQL.Clear;
                ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Order by funcionario_numero Desc');
                ConexaoBD.SQL_Funcionarios.Open;

                Codigo_Funcionario := ConexaoBD.SQL_Funcionariosfuncionario_numero.Text;

                ConexaoBD.SQL_Funcionarios.Close;
                ConexaoBD.SQL_Funcionarios.SQL.Clear;
                ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_numero = ' + #39 + Trim(Codigo_Funcionario) + #39 );
                ConexaoBD.SQL_Funcionarios.Open;

                //*** Carrega os Dados Obtidos ***

                Funcionarios02.ED_Funcionario_Numero.Text                         := Codigo_Funcionario;
                Funcionarios02.ED_Funcionario_Cpf.Text                            := ConexaoBD.SQL_Funcionariosfuncionario_cpf.AsString;
                Funcionarios02.ED_Funcionario_Nome.Text                           := ConexaoBD.SQL_Funcionariosfuncionario_nome.AsString;
                Funcionarios02.ED_Funcionario_Rg.Text                             := ConexaoBD.SQL_Funcionariosfuncionario_rg.AsString;
                Funcionarios02.ED_Funcionario_Ctps_n.Text                         := ConexaoBD.SQL_Funcionariosfuncionario_ctps_n.AsString;
                Funcionarios02.ED_Funcionario_Ctps_Serie.Text                     := ConexaoBD.SQL_Funcionariosfuncionario_ctps_serie.AsString;
                Funcionarios02.ED_Funcionario_Te_n.Text                           := ConexaoBD.SQL_Funcionariosfuncionario_te_n.AsString;
                Funcionarios02.ED_Funcionario_Te_Zona_Eleitoral.Text              := ConexaoBD.SQL_Funcionariosfuncionario_te_zona_eleitoral.AsString;
                Funcionarios02.ED_Funcionario_Endereco.Text                       := ConexaoBD.SQL_Funcionariosfuncionario_endereco.AsString;
                Funcionarios02.ED_Funcionario_Bairro.Text                         := ConexaoBD.SQL_Funcionariosfuncionario_bairro.AsString;
                Funcionarios02.ED_Funcionario_Cidade.Text                         := ConexaoBD.SQL_Funcionariosfuncionario_cidade.AsString;
                Funcionarios02.CB_Funcionario_Estado.ItemIndex                    := Obtem_Nro_Estado(ConexaoBD.SQL_Funcionariosfuncionario_estado.AsString);
                Funcionarios02.ED_Funcionario_Cep.Text                            := ConexaoBD.SQL_Funcionariosfuncionario_cep.AsString;
                Funcionarios02.ED_Funcionario_Fone.Text                           := ConexaoBD.SQL_Funcionariosfuncionario_fone.AsString;
                Funcionarios02.ED_Funcionario_Fax.Text                            := ConexaoBD.SQL_Funcionariosfuncionario_fax.AsString;
                Funcionarios02.ED_Funcionario_Cabelo.Text                         := ConexaoBD.SQL_Funcionariosfuncionario_cabelo.AsString;
                Funcionarios02.ED_Funcionario_Olhos.Text                          := ConexaoBD.SQL_Funcionariosfuncionario_olhos.AsString;
                Funcionarios02.ED_Funcionario_Altura.Text                         := ConexaoBD.SQL_Funcionariosfuncionario_altura.AsString;
                Funcionarios02.ED_Funcionario_Peso.Text                           := ConexaoBD.SQL_Funcionariosfuncionario_peso.AsString;
                Funcionarios02.ED_Funcionario_Sinais.Text                         := ConexaoBD.SQL_Funcionariosfuncionario_sinais.AsString;

                if(ConexaoBD.SQL_Funcionariosfuncionario_fgts_optante.AsString = 'S') Then
                  Funcionarios02.ED_Funcionario_Fgts_Optante.ItemIndex          := 0
                else
                  Funcionarios02.ED_Funcionario_Fgts_Optante.ItemIndex          := 1;

                Funcionarios02.ED_Funcionario_Fgts_Data_Opcao.Text                := ConexaoBD.SQL_Funcionariosfuncionario_fgts_data_opcao.AsString;
                Funcionarios02.ED_Funcionario_Fgts_Data_Retratacao.Text           := ConexaoBD.SQL_Funcionariosfuncionario_fgts_data_retratacao.AsString;
                Funcionarios02.ED_Funcionario_Fgts_Banco.Text                     := ConexaoBD.SQL_Funcionariosfuncionario_fgts_banco.AsString;
                Funcionarios02.ED_Funcionario_Data_Admissao.Text                  := ConexaoBD.SQL_Funcionariosfuncionario_data_admissao.AsString;
                Funcionarios02.ED_Funcionario_Data_Rescisao.Text                  := ConexaoBD.SQL_Funcionariosfuncionario_data_rescisao.AsString;
                Funcionarios02.ED_Funcionario_Horario_I.Text                      := ConexaoBD.SQL_Funcionariosfuncionario_horario_i.AsString;
                Funcionarios02.ED_Funcionario_Horario_F.Text                      := ConexaoBD.SQL_Funcionariosfuncionario_horario_f.AsString;
                Funcionarios02.ED_Funcionario_Cargo.Text                          := ConexaoBD.SQL_Funcionariosfuncionario_cargo.AsString;
                Funcionarios02.ED_Funcionario_Funcao.Text                         := ConexaoBD.SQL_Funcionariosfuncionario_funcao.AsString;
                Funcionarios02.ED_Funcionario_Intervalo.Text                      := ConexaoBD.SQL_Funcionariosfuncionario_intervalo.AsString;
                Funcionarios02.ED_Funcionario_Salario.Text                        := ConexaoBD.SQL_Funcionariosfuncionario_salario.AsString;

                if(ConexaoBD.SQL_Funcionariosfuncionario_salario_periodo.AsString = 'M') Then
                  Funcionarios02.ED_Funcionario_Salario_Periodo.ItemIndex          := 0
                else if(ConexaoBD.SQL_Funcionariosfuncionario_salario_periodo.AsString = 'D') Then
                  Funcionarios02.ED_Funcionario_Salario_Periodo.ItemIndex          := 1
                else
                  Funcionarios02.ED_Funcionario_Salario_Periodo.ItemIndex          := 2;

                Funcionarios02.ED_Funcionario_Nacionalidade.Text                  := ConexaoBD.SQL_Funcionariosfuncionario_nascionalidade.AsString;
                Funcionarios02.ED_Funcionario_Nome_Pai.Text                       := ConexaoBD.SQL_Funcionariosfuncionario_nome_pai.AsString;
                Funcionarios02.ED_Funcionario_Nome_Mae.Text                       := ConexaoBD.SQL_Funcionariosfuncionario_nome_mae.AsString;
                Funcionarios02.ED_Funcionario_Local_Nascimento.Text               := ConexaoBD.SQL_Funcionariosfuncionario_local_nascimento.AsString;
                Funcionarios02.ED_Funcionario_Data_Nascimento.Text                := ConexaoBD.SQL_Funcionariosfuncionario_data_nascimento.AsString;
                Funcionarios02.ED_Funcionario_Estado_Civil.Text                   := ConexaoBD.SQL_Funcionariosfuncionario_estado_civil.AsString;
                Funcionarios02.ED_Funcionario_Nome_Conjuge.Text                   := ConexaoBD.SQL_Funcionariosfuncionario_nome_conjuge.AsString;
                Funcionarios02.ED_Funcionario_Grau_Instrucao.Text                 := ConexaoBD.SQL_Funcionariosfuncionario_grau_instrucao.AsString;
                Funcionarios02.ED_Funcionario_Residencia.Text                     := ConexaoBD.SQL_Funcionariosfuncionario_residencia.AsString;
                Funcionarios02.ED_Funcionario_Carteira_Habilitacao_n.Text         := ConexaoBD.SQL_Funcionariosfuncionario_carteira_habilitacao_n.AsString;
                Funcionarios02.ED_Funcionario_Certidao_Militar_n.Text             := ConexaoBD.SQL_Funcionariosfuncionario_certidao_militar_n.AsString;
                Funcionarios02.ED_Funcionario_Certidao_Militar_Serie.Text         := ConexaoBD.SQL_Funcionariosfuncionario_certidao_militar_serie.AsString;
                Funcionarios02.ED_Funcionario_Certidao_Militar_Categoria.Text     := ConexaoBD.SQL_Funcionariosfuncionario_certidao_militar_categoria.AsString;
                Funcionarios02.ED_Funcionario_Estrangeiro_Carteira_19_n.Text      := ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_carteira_19_n.AsString;
                Funcionarios02.ED_Funcionario_Estrangeiro_rg.Text                 := ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_rg.AsString;

                if(ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_casado_brasileiro.AsString = 'S') Then
                  Funcionarios02.ED_Funcionario_Estrangeiro_Casado_Brasileiros.ItemIndex := 0
                else
                  Funcionarios02.ED_Funcionario_Estrangeiro_Casado_Brasileiros.ItemIndex := 1;

                if(ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_filhos_b.AsString = 'S') Then
                  Funcionarios02.ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex := 0
                else
                  Funcionarios02.ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex := 1;


                Funcionarios02.ED_Funcionario_Estrangeiro_Quantos_Filhos.Text     := ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_quantos_filhos.AsString;
                Funcionarios02.ED_Funcionario_Estrangeiro_Data_Chegada.Text       := ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_data_chegada.AsString;

                if(ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_naturalizado.AsString = 'S') Then
                  Funcionarios02.ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex := 0
                else
                  Funcionarios02.ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex := 1;

                Funcionarios02.ED_Funcionario_Estrangeiro_Decreto_n.Text          := ConexaoBD.SQL_Funcionariosfuncionario_estrangeiro_decreto_n.AsString;
                Funcionarios02.ED_Funcionario_Pis_Data_Cadastramento.Text         := ConexaoBD.SQL_Funcionariosfuncionario_pis_data_cadastramento.AsString;
                Funcionarios02.ED_Funcionario_Pis_Sob_n.Text                      := ConexaoBD.SQL_Funcionariosfuncionario_pis_sob_n.AsString;
                Funcionarios02.ED_Funcionario_Pis_Dep_Banco.Text                  := ConexaoBD.SQL_Funcionariosfuncionario_pis_dep_banco.AsString;
                Funcionarios02.ED_Funcionario_Pis_Endereco.Text                   := ConexaoBD.SQL_Funcionariosfuncionario_pis_endereo.AsString;
                Funcionarios02.ED_Funcionario_Pis_Cod_Banco.Text                  := ConexaoBD.SQL_Funcionariosfuncionario_pis_cod_banco.AsString;
                Funcionarios02.ED_Funcionario_Pis_Cod_Agencia.Text                := ConexaoBD.SQL_Funcionariosfuncionario_pis_cod_agencia.AsString;
                Funcionarios02.ED_Funcionario_Pis_Endereco_Agencia.Text           := ConexaoBD.SQL_Funcionariosfuncionario_pis_endereco_agencia.AsString;
                Funcionarios02.ED_Funcionario_Pis_Obs.Text                        := ConexaoBD.SQL_Funcionariosfuncionario_pis_obs.AsString;

                Funcionarios02.Funcionario_Banco_Nome.Text                        := ConexaoBD.SQL_Funcionariosfuncionario_banco_nome.AsString;
                Funcionarios02.Funcionario_Banco_Agencia.Text                     := ConexaoBD.SQL_Funcionariosfuncionario_banco_agencia.AsString;
                Funcionarios02.Funcionario_Banco_Conta.Text                       := ConexaoBD.SQL_Funcionariosfuncionario_banco_conta.AsString;
                Funcionarios02.Funcionario_Banco_Titular.Text                     := ConexaoBD.SQL_Funcionariosfuncionario_banco_titular.AsString;

                Funcionarios02.ED_Funcionario_Beneficiarios.Lines.Clear;
                Funcionarios02.ED_Funcionario_Beneficiarios.Lines.Add(Funcionarios00.DBG_Funcionarios_Beneficiarios.Text);

                //*** Fecha SQL ***

                ConexaoBD.SQL_Funcionarios.Close;

                Seta();

            End;
            Funcionarios02.PageControl1.TabIndex := 3;
            Funcionarios02.PagAnterior.Text := 'Funcionarios01';
            Funcionarios02.BT_Excluir.Enabled    := False;
            Funcionarios02.Show;
            End
        Else If Confirma('Incluir Outro Funcionário?') = 6 Then Begin
            ED_Funcionario_Cpf.Text                                   := '';
            ED_Funcionario_Nome.Text                                  := '';
            ED_Funcionario_Rg.Text                                    := '';
            ED_Funcionario_Ctps_n.Text                                := '';
            ED_Funcionario_Ctps_Serie.Text                            := '';
            ED_Funcionario_Te_n.Text                                  := '';
            ED_Funcionario_Te_Zona_Eleitoral.Text                     := '';
            ED_Funcionario_Endereco.Text                              := '';
            ED_Funcionario_Bairro.Text                                := '';
            ED_Funcionario_Cidade.Text                                := '';
            CB_Funcionario_Estado.Text                                := '';
            ED_Funcionario_Cep.Text                                   := '';
            ED_Funcionario_Fone.Text                                  := '';
            ED_Funcionario_Fax.Text                                   := '';
            ED_Funcionario_Cabelo.Text                                := '';
            ED_Funcionario_Olhos.Text                                 := '';
            ED_Funcionario_Altura.Text                                := '';
            ED_Funcionario_Peso.Text                                  := '';
            ED_Funcionario_Sinais.Text                                := '';

            ED_Funcionario_Fgts_Optante.ItemIndex                     := 0;
            ED_Funcionario_Fgts_Data_Opcao.Text                       := '';
            ED_Funcionario_Fgts_Data_Retratacao.Text                  := '';
            ED_Funcionario_Fgts_Banco.Text                            := '';
            ED_Funcionario_Data_Admissao.Text                         := '';
            ED_Funcionario_Data_Rescisao.Text                         := '';
            ED_Funcionario_Horario_I.Text                             := '';
            ED_Funcionario_Horario_F.Text                             := '';
            ED_Funcionario_Cargo.Text                                 := '';
            ED_Funcionario_Funcao.Text                                := '';
            ED_Funcionario_Intervalo.Text                             := '';
            ED_Funcionario_Salario.Text                               := '';

            ED_Funcionario_Salario_Periodo.ItemIndex                  := 0;

            ED_Funcionario_Nacionalidade.Text                         := '';
            ED_Funcionario_Nome_Pai.Text                              := '';
            ED_Funcionario_Nome_Mae.Text                              := '';
            ED_Funcionario_Local_Nascimento.Text                      := '';
            ED_Funcionario_Data_Nascimento.Text                       := '';
            ED_Funcionario_Estado_Civil.Text                          := '';
            ED_Funcionario_Nome_Conjuge.Text                          := '';
            ED_Funcionario_Grau_Instrucao.Text                        := '';
            ED_Funcionario_Residencia.Text                            := '';
            ED_Funcionario_Carteira_Habilitacao_n.Text                := '';
            ED_Funcionario_Certidao_Militar_n.Text                    := '';
            ED_Funcionario_Certidao_Militar_Serie.Text                := '';
            ED_Funcionario_Certidao_Militar_Categoria.Text            := '';
            ED_Funcionario_Estrangeiro_Carteira_19_n.Text             := '';
            ED_Funcionario_Estrangeiro_rg.Text                        := '';

            ED_Funcionario_Estrangeiro_Casado_Brasileiros.ItemIndex   := 1;

            ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex             := 1;

            ED_Funcionario_Estrangeiro_Quantos_Filhos.Text            := '';
            ED_Funcionario_Estrangeiro_Data_Chegada.Text              := '';

            ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex         := 1;

            ED_Funcionario_Estrangeiro_Decreto_n.Text                 := '';
            ED_Funcionario_Pis_Data_Cadastramento.Text                := '';
            ED_Funcionario_Pis_Sob_n.Text                             := '';
            ED_Funcionario_Pis_Dep_Banco.Text                         := '';
            ED_Funcionario_Pis_Endereco.Text                          := '';
            ED_Funcionario_Pis_Cod_Banco.Text                         := '';
            ED_Funcionario_Pis_Cod_Agencia.Text                       := '';
            ED_Funcionario_Pis_Endereco_Agencia.Text                  := '';
            ED_Funcionario_Pis_Obs.Text                               := '';
            ED_Funcionario_Beneficiarios.Text                         := '';

            Funcionario_Banco_Nome.Text                               := '';
            Funcionario_Banco_Agencia.Text                            := '';
            Funcionario_Banco_Conta.Text                              := '';
            Funcionario_Banco_Titular.Text                            := '';

            Pag2.Text := '';

            PageControl1.TabIndex := 0;
            ED_Funcionario_Nome.SetFocus;
            End
        Else Begin
            Funcionarios01.Close;
        End;
    End;
end;

procedure TFuncionarios01.ED_Funcionario_Estrangeiro_Quantos_FilhosKeyPress(
  Sender: TObject; var Key: Char);
begin
    So_Numero(Sender,Key);
end;

procedure TFuncionarios01.ED_Funcionario_SalarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Valor(Sender,Key);
end;

procedure TFuncionarios01.ED_Funcionario_Estrangeiro_NaturalizadoClick(
  Sender: TObject);
begin
  if(ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex = 0)then begin
    ED_Funcionario_Estrangeiro_Decreto_n.Enabled := True;
    end
  else begin
    ED_Funcionario_Estrangeiro_Decreto_n.Enabled := False;
  end;
end;

procedure TFuncionarios01.ED_Funcionario_Estrangeiro_Filhos_bClick(
  Sender: TObject);
begin
  if(ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex = 0)then begin
    ED_Funcionario_Estrangeiro_Quantos_Filhos.Enabled := True;
    end
  else begin
    ED_Funcionario_Estrangeiro_Quantos_Filhos.Enabled := False;
  end;
end;

procedure TFuncionarios01.ED_Funcionario_Fgts_OptanteClick(
  Sender: TObject);
begin
    if ED_Funcionario_Fgts_Optante.ItemIndex = 0 then begin
      ED_Funcionario_Fgts_Data_Opcao.Enabled      := True;
      ED_Funcionario_Fgts_Data_Retratacao.Enabled := True;
      ED_Funcionario_Fgts_Banco.Enabled           := True;
      end
    else begin
      ED_Funcionario_Fgts_Data_Opcao.Enabled      := False;
      ED_Funcionario_Fgts_Data_Retratacao.Enabled := False;
      ED_Funcionario_Fgts_Banco.Enabled           := False;
    end;
end;

procedure TFuncionarios01.PageControl1Change(Sender: TObject);
begin
    if (PageControl1.ActivePage = TabSheet2) then begin
        Pag2.Text := 'S';
    end;
end;

procedure TFuncionarios01.FecharChange(Sender: TObject);
begin
    Sleep(1000);
    if (Fechar.Text = 'S') then begin
        Funcionarios01.Close;
        end
    else begin
        ED_Funcionario_Nome.SetFocus;
    end;
end;

procedure TFuncionarios01.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

initialization

incluir := true;


end.
