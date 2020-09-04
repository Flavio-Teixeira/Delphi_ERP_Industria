unit Funcionarios_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ComCtrls;

type
  TFuncionarios02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    BT_Alterar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    ED_Funcionario_Nome: TEdit;
    ED_Funcionario_Rg: TEdit;
    ED_Funcionario_Cpf: TMaskEdit;
    TabSheet2: TTabSheet;
    GroupBox8: TGroupBox;
    Label34: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label54: TLabel;
    Label47: TLabel;
    ED_Funcionario_Nome_Mae: TEdit;
    ED_Funcionario_Nome_Pai: TEdit;
    ED_Funcionario_Nacionalidade: TEdit;
    ED_Funcionario_Data_Nascimento: TMaskEdit;
    ED_Funcionario_Estado_Civil: TEdit;
    ED_Funcionario_Nome_Conjuge: TEdit;
    ED_Funcionario_Grau_Instrucao: TEdit;
    ED_Funcionario_Residencia: TEdit;
    ED_Funcionario_Carteira_Habilitacao_n: TEdit;
    ED_Funcionario_Certidao_Militar_n: TEdit;
    ED_Funcionario_Certidao_Militar_Serie: TEdit;
    ED_Funcionario_Certidao_Militar_Categoria: TEdit;
    GroupBox9: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    ED_Funcionario_Estrangeiro_Carteira_19_n: TEdit;
    ED_Funcionario_Estrangeiro_rg: TEdit;
    ED_Funcionario_Estrangeiro_Data_Chegada: TMaskEdit;
    ED_Funcionario_Estrangeiro_Decreto_n: TEdit;
    ED_Funcionario_Estrangeiro_Casado_Brasileiros: TRadioGroup;
    ED_Funcionario_Estrangeiro_Filhos_b: TRadioGroup;
    ED_Funcionario_Estrangeiro_Naturalizado: TRadioGroup;
    ED_Funcionario_Estrangeiro_Quantos_Filhos: TEdit;
    ED_Funcionario_Local_Nascimento: TEdit;
    GroupBox10: TGroupBox;
    Label62: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label63: TLabel;
    ED_Funcionario_Pis_Data_Cadastramento: TMaskEdit;
    ED_Funcionario_Pis_Sob_n: TEdit;
    ED_Funcionario_Pis_Dep_Banco: TEdit;
    ED_Funcionario_Pis_Endereco: TEdit;
    ED_Funcionario_Pis_Cod_Banco: TEdit;
    ED_Funcionario_Pis_Cod_Agencia: TEdit;
    ED_Funcionario_Pis_Endereco_Agencia: TEdit;
    ED_Funcionario_Pis_Obs: TEdit;
    ED_Funcionario_Beneficiarios: TMemo;
    TabSheet3: TTabSheet;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    DBG_Alteracao_Salario: TDBGrid;
    BT_Incluir_Alteracao_Salario: TBitBtn;
    GroupBox13: TGroupBox;
    DBG_Alteracao_Cargo: TDBGrid;
    BT_Incluir_Alteracao_Cargo: TBitBtn;
    GroupBox14: TGroupBox;
    DBG_Acidentes_Doencas_Profissionais: TDBGrid;
    BT_Incluir_Acidentes_Doencas_Profissionais: TBitBtn;
    GroupBox15: TGroupBox;
    DBG_Contribuicao_Sindical: TDBGrid;
    BT_Incluir_Contribuicao_Sindical: TBitBtn;
    GroupBox16: TGroupBox;
    DBG_Ferias_Concedidas: TDBGrid;
    BT_Incluir_Ferias_Concedidas: TBitBtn;
    PagAnterior: TEdit;
    GroupBox6: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    ED_Funcionario_Fgts_Data_Retratacao: TMaskEdit;
    ED_Funcionario_Fgts_Data_Opcao: TMaskEdit;
    ED_Funcionario_Fgts_Banco: TEdit;
    ED_Funcionario_Fgts_Optante: TRadioGroup;
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
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ED_Funcionario_Data_Admissao: TMaskEdit;
    ED_Funcionario_Data_Rescisao: TMaskEdit;
    ED_Funcionario_Cargo: TEdit;
    ED_Funcionario_Funcao: TEdit;
    ED_Funcionario_Salario: TEdit;
    ED_Funcionario_Horario_F: TMaskEdit;
    ED_Funcionario_Horario_I: TMaskEdit;
    ED_Funcionario_Intervalo: TEdit;
    ED_Funcionario_Salario_Periodo: TRadioGroup;
    GroupBox17: TGroupBox;
    Label70: TLabel;
    Label69: TLabel;
    ED_Funcionario_Fax: TEdit;
    ED_Funcionario_Fone: TEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ED_Funcionario_Ctps_n: TEdit;
    ED_Funcionario_Ctps_Serie: TEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    ED_Funcionario_Te_Zona_Eleitoral: TEdit;
    ED_Funcionario_Te_n: TEdit;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ED_Funcionario_Cabelo: TEdit;
    ED_Funcionario_Olhos: TEdit;
    ED_Funcionario_Altura: TEdit;
    ED_Funcionario_Peso: TEdit;
    ED_Funcionario_Sinais: TEdit;
    Label13: TLabel;
    ED_Funcionario_Numero: TEdit;
    GroupBox18: TGroupBox;
    CB_Funcionario_Empresa: TComboBox;
    TabSheet4: TTabSheet;
    GroupBox19: TGroupBox;
    GroupBox20: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Funcionario_Banco_Nome: TEdit;
    Funcionario_Banco_Agencia: TEdit;
    Funcionario_Banco_Conta: TEdit;
    Funcionario_Banco_Titular: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure ED_Funcionario_Estrangeiro_Quantos_FilhosKeyPress(
      Sender: TObject; var Key: Char);
    procedure ED_Funcionario_SalarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure ED_Funcionario_Estrangeiro_NaturalizadoClick(
      Sender: TObject);
    procedure ED_Funcionario_Estrangeiro_Filhos_bClick(Sender: TObject);
    procedure ED_Funcionario_Fgts_OptanteClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_Incluir_Alteracao_SalarioClick(Sender: TObject);
    procedure DBG_Alteracao_SalarioCellClick(Column: TColumn);
    procedure BT_Incluir_Alteracao_CargoClick(Sender: TObject);
    procedure BT_Incluir_Contribuicao_SindicalClick(Sender: TObject);
    procedure BT_Incluir_Acidentes_Doencas_ProfissionaisClick(
      Sender: TObject);
    procedure DBG_Alteracao_CargoCellClick(Column: TColumn);
    procedure DBG_Contribuicao_SindicalCellClick(Column: TColumn);
    procedure DBG_Acidentes_Doencas_ProfissionaisCellClick(
      Column: TColumn);
    procedure DBG_Ferias_ConcedidasCellClick(Column: TColumn);
    procedure BT_Incluir_Ferias_ConcedidasClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Valida_Funcionario();
  public
    procedure Carrega_Alteracao_Salario();
    procedure Carrega_Alteracao_Cargo();
    procedure Carrega_Contibuicao_Sindical();
    procedure Carrega_Acidentes_Doencas_Profissionais();
    procedure Carrega_Ferias_Concedidas();
    { Public declarations }
  end;

var
  Funcionarios02: TFuncionarios02;
  alterar: Boolean;

implementation

uses Conexao_BD, Rotinas_Gerais, Math, Faturamento_01, Funcionarios_01,
  Funcionarios_Alteracao_Salario_00,
  Funcionarios_Acidentes_Doencas_Profissionais_00,
  Funcionarios_Alteracao_Cargo_00, Funcionarios_Contribuicoes_Sindicais_00,
  Funcionarios_Ferias_Concedidas_00, Funcionarios_00;

{$R *.dfm}

procedure TFuncionarios02.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    if (PagAnterior.Text = 'Funcionarios01') Then begin
        If Confirma('Incluir Outro Funcionário?') = 6 Then Begin
            Funcionarios01.ED_Funcionario_Cpf.Text                                   := '';
            Funcionarios01.ED_Funcionario_Nome.Text                                  := '';
            Funcionarios01.ED_Funcionario_Rg.Text                                    := '';
            Funcionarios01.ED_Funcionario_Ctps_n.Text                                := '';
            Funcionarios01.ED_Funcionario_Ctps_Serie.Text                            := '';
            Funcionarios01.ED_Funcionario_Te_n.Text                                  := '';
            Funcionarios01.ED_Funcionario_Te_Zona_Eleitoral.Text                     := '';
            Funcionarios01.ED_Funcionario_Endereco.Text                              := '';
            Funcionarios01.ED_Funcionario_Bairro.Text                                := '';
            Funcionarios01.ED_Funcionario_Cidade.Text                                := '';
            Funcionarios01.CB_Funcionario_Estado.Text                                := '';
            Funcionarios01.ED_Funcionario_Cep.Text                                   := '';
            Funcionarios01.ED_Funcionario_Fone.Text                                  := '';
            Funcionarios01.ED_Funcionario_Fax.Text                                   := '';
            Funcionarios01.ED_Funcionario_Cabelo.Text                                := '';
            Funcionarios01.ED_Funcionario_Olhos.Text                                 := '';
            Funcionarios01.ED_Funcionario_Altura.Text                                := '';
            Funcionarios01.ED_Funcionario_Peso.Text                                  := '';
            Funcionarios01.ED_Funcionario_Sinais.Text                                := '';

            Funcionarios01.ED_Funcionario_Fgts_Optante.ItemIndex                     := 0;
            Funcionarios01.ED_Funcionario_Fgts_Data_Opcao.Text                       := '';
            Funcionarios01.ED_Funcionario_Fgts_Data_Retratacao.Text                  := '';
            Funcionarios01.ED_Funcionario_Fgts_Banco.Text                            := '';
            Funcionarios01.ED_Funcionario_Data_Admissao.Text                         := '';
            Funcionarios01.ED_Funcionario_Data_Rescisao.Text                         := '';
            Funcionarios01.ED_Funcionario_Horario_I.Text                             := '';
            Funcionarios01.ED_Funcionario_Horario_F.Text                             := '';
            Funcionarios01.ED_Funcionario_Cargo.Text                                 := '';
            Funcionarios01.ED_Funcionario_Funcao.Text                                := '';
            Funcionarios01.ED_Funcionario_Intervalo.Text                             := '';
            Funcionarios01.ED_Funcionario_Salario.Text                               := '';

            Funcionarios01.ED_Funcionario_Salario_Periodo.ItemIndex                  := 0;

            Funcionarios01.ED_Funcionario_Nacionalidade.Text                         := '';
            Funcionarios01.ED_Funcionario_Nome_Pai.Text                              := '';
            Funcionarios01.ED_Funcionario_Nome_Mae.Text                              := '';
            Funcionarios01.ED_Funcionario_Local_Nascimento.Text                      := '';
            Funcionarios01.ED_Funcionario_Data_Nascimento.Text                       := '';
            Funcionarios01.ED_Funcionario_Estado_Civil.Text                          := '';
            Funcionarios01.ED_Funcionario_Nome_Conjuge.Text                          := '';
            Funcionarios01.ED_Funcionario_Grau_Instrucao.Text                        := '';
            Funcionarios01.ED_Funcionario_Residencia.Text                            := '';
            Funcionarios01.ED_Funcionario_Carteira_Habilitacao_n.Text                := '';
            Funcionarios01.ED_Funcionario_Certidao_Militar_n.Text                    := '';
            Funcionarios01.ED_Funcionario_Certidao_Militar_Serie.Text                := '';
            Funcionarios01.ED_Funcionario_Certidao_Militar_Categoria.Text            := '';
            Funcionarios01.ED_Funcionario_Estrangeiro_Carteira_19_n.Text             := '';
            Funcionarios01.ED_Funcionario_Estrangeiro_rg.Text                        := '';

            Funcionarios01.ED_Funcionario_Estrangeiro_Casado_Brasileiros.ItemIndex   := 1;

            Funcionarios01.ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex             := 1;

            Funcionarios01.ED_Funcionario_Estrangeiro_Quantos_Filhos.Text            := '';
            Funcionarios01.ED_Funcionario_Estrangeiro_Data_Chegada.Text              := '';

            Funcionarios01.ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex         := 1;

            Funcionarios01.ED_Funcionario_Estrangeiro_Decreto_n.Text                 := '';
            Funcionarios01.ED_Funcionario_Pis_Data_Cadastramento.Text                := '';
            Funcionarios01.ED_Funcionario_Pis_Sob_n.Text                             := '';
            Funcionarios01.ED_Funcionario_Pis_Dep_Banco.Text                         := '';
            Funcionarios01.ED_Funcionario_Pis_Endereco.Text                          := '';
            Funcionarios01.ED_Funcionario_Pis_Cod_Banco.Text                         := '';
            Funcionarios01.ED_Funcionario_Pis_Cod_Agencia.Text                       := '';
            Funcionarios01.ED_Funcionario_Pis_Endereco_Agencia.Text                  := '';
            Funcionarios01.ED_Funcionario_Pis_Obs.Text                               := '';
            Funcionarios01.ED_Funcionario_Beneficiarios.Text                         := '';

            Funcionarios01.Funcionario_Banco_Nome.Text                               := '';
            Funcionarios01.Funcionario_Banco_Agencia.Text                            := '';
            Funcionarios01.Funcionario_Banco_Conta.Text                              := '';
            Funcionarios01.Funcionario_Banco_Titular.Text                            := '';

            Funcionarios01.Pag2.Text := '';
            Funcionarios01.Fechar.Text := '';
            Funcionarios01.PageControl1.TabIndex := 0;
            Funcionarios01.Fechar.Text := 'N';
            End
        Else Begin
            Funcionarios01.Fechar.Text := 'S';
        End;
    End;

    ConexaoBD.SQL_Funcionarios.Close;
    ConexaoBD.SQL_Funcionarios.SQL.Clear;
    ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_data_rescisao <= '+#39+'0000-00-00'+#39+' Order By funcionario_numero Asc');
    ConexaoBD.SQL_Funcionarios.Open;

    //ConexaoBD.SQL_Funcionarios.Locate('funcionario_numero',Trim(Selecionado),[]);

    Action := caFree;
    Release;
    Funcionarios02 := Nil;
end;

procedure TFuncionarios02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFuncionarios02.FormShow(Sender: TObject);
begin
    Carrega_Alteracao_Salario();
    Carrega_Alteracao_Cargo();
    Carrega_Contibuicao_Sindical();
    Carrega_Acidentes_Doencas_Profissionais();
    Carrega_Ferias_Concedidas();
end;

procedure TFuncionarios02.BT_SairClick(Sender: TObject);
begin

    Funcionarios02.Close;
end;

procedure TFuncionarios02.Valida_Funcionario;
var
   Erro: String;
begin
    Ampulheta();

    Erro := '';

    if Trim(ED_Funcionario_Nome.Text) = '' Then Begin
        alterar := false;
        Erro    := 'O Nome do Funcionário não foi informado';
        TabSheet1.SetFocus;
        ED_Funcionario_Nome.SetFocus;
        End
    Else If Trim(ED_Funcionario_Cpf.Text) = '.   .   -' Then
    Begin
        alterar := false;
        Erro    := 'O CPF do Funcionário não foi informado';
        TabSheet1.SetFocus;
        ED_Funcionario_Cpf.SetFocus;
        End
    Else If Trim(ED_Funcionario_Cpf.Text) <> '.   .   -' Then
    Begin
        ConexaoBD.SQL_Funcionarios.Close;
        ConexaoBD.SQL_Funcionarios.SQL.Clear;
        ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_empresa = '+#39+Trim(CB_Funcionario_Empresa.Text)+#39+' and funcionario_cpf = '+#39+Trim(ED_Funcionario_Cpf.Text)+#39+' and funcionario_numero != '+Trim(ED_Funcionario_Numero.Text));
        ConexaoBD.SQL_Funcionarios.Open;

        If ConexaoBD.SQL_Funcionarios.RecordCount > 0 Then
        Begin
            alterar := false;
            Erro    := 'O CPF do Funcionário já está cadastrado na empresa selecionada';
            TabSheet1.SetFocus;
            ED_Funcionario_Cpf.SetFocus;
        End
        Else Begin
            alterar := true;
            Erro    := '';
        End;
    End
    Else Begin
        alterar := true;
        Erro    := '';
    End;

    Seta();

    If Trim(Erro) <> '' Then Begin
        MSG_Erro(Erro);
    End;

end;

procedure TFuncionarios02.BT_AlterarClick(Sender: TObject);
var
    Comando_SQL: String;
begin
    Valida_Funcionario();
    If alterar = True Then Begin

        //*** Efetua a Inserção ***

        Comando_SQL := 'Update funcionarios set ';
        Comando_SQL := Comando_SQL + 'funcionario_nome ='                               + #39 + Trim(ED_Funcionario_Nome.Text)                                                  + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_cpf ='                                + #39 + Trim(ED_Funcionario_Cpf.Text)                                                   + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_rg ='                                 + #39 + Trim(ED_Funcionario_Rg.Text)                                                    + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_ctps_n ='                             + #39 + Trim(ED_Funcionario_Ctps_n.Text)                                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_ctps_serie ='                         + #39 + Trim(ED_Funcionario_Ctps_Serie.Text)                                            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_te_n ='                               + #39 + Trim(ED_Funcionario_Te_n.Text)                                                  + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_te_zona_eleitoral ='                  + #39 + Trim(ED_Funcionario_Te_Zona_Eleitoral.Text)                                     + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_endereco ='                           + #39 + Trim(ED_Funcionario_Endereco.Text)                                              + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_bairro ='                             + #39 + Trim(ED_Funcionario_Bairro.Text)                                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_cidade ='                             + #39 + Trim(ED_Funcionario_Cidade.Text)                                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_estado ='                             + #39 + Trim(CB_Funcionario_Estado.Text)                                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_cep ='                                + #39 + Trim(ED_Funcionario_Cep.Text)                                                   + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_fone ='                               + #39 + Trim(ED_Funcionario_Fone.Text)                                                  + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_fax ='                                + #39 + Trim(ED_Funcionario_Fax.Text)                                                   + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_cabelo ='                             + #39 + Trim(ED_Funcionario_Cabelo.Text)                                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_olhos ='                              + #39 + Trim(ED_Funcionario_Olhos.Text)                                                 + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_altura ='                             + #39 + Trim(ED_Funcionario_Altura.Text)                                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_peso ='                               + #39 + Trim(ED_Funcionario_Peso.Text)                                                  + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_sinais ='                             + #39 + Trim(ED_Funcionario_Sinais.Text)                                                + #39 + ', ';

        if(ED_Funcionario_Fgts_Optante.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + 'funcionario_fgts_optante ='                   + #39 + 'S'                                                                             + #39 + ', '
        else
            Comando_SQL := Comando_SQL + 'funcionario_fgts_optante ='                   + #39 + 'N'                                                                             + #39 + ', ';

        Comando_SQL := Comando_SQL + 'funcionario_fgts_data_opcao ='                    + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Fgts_Data_Opcao.Text),'amd','/')          + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_fgts_data_retratacao ='               + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Fgts_Data_Retratacao.Text),'amd','/')     + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_fgts_banco ='                         + #39 + Trim(ED_Funcionario_Fgts_Banco.Text)                                            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_data_admissao ='                      + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Data_Admissao.Text),'amd','/')            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_data_rescisao ='                      + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Data_Rescisao.Text),'amd','/')            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_horario_i ='                          + #39 + Trim(ED_Funcionario_Horario_I.Text)+':00'                                       + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_horario_f ='                          + #39 + Trim(ED_Funcionario_Horario_F.Text)+':00'                                       + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_cargo ='                              + #39 + Trim(ED_Funcionario_Cargo.Text)                                                 + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_funcao ='                             + #39 + Trim(ED_Funcionario_Funcao.Text)                                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_intervalo ='                          + #39 + Trim(ED_Funcionario_Intervalo.Text)                                             + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_salario ='                            + #39 + Virgula_Ponto(ED_Funcionario_Salario.Text)                                      + #39 + ', ';

        if(ED_Funcionario_Salario_Periodo.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + 'funcionario_salario_periodo ='                + #39 + 'M'                                                                             + #39 + ', '
        else if(ED_Funcionario_Salario_Periodo.ItemIndex = 1) Then
            Comando_SQL := Comando_SQL + 'funcionario_salario_periodo ='                + #39 + 'D'                                                                             + #39 + ', '
        else
            Comando_SQL := Comando_SQL + 'funcionario_salario_periodo ='                + #39 + 'H'                                                                             + #39 + ', ';

        Comando_SQL := Comando_SQL + 'funcionario_nascionalidade ='                     + #39 + Trim(ED_Funcionario_Nacionalidade.Text)                                         + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_nome_pai ='                           + #39 + Trim(ED_Funcionario_Nome_Pai.Text)                                              + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_nome_mae ='                           + #39 + Trim(ED_Funcionario_Nome_Mae.Text)                                              + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_local_nascimento ='                   + #39 + Trim(ED_Funcionario_Local_Nascimento.Text)                                      + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_data_nascimento ='                    + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Data_Nascimento.Text),'amd','/')          + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_estado_civil ='                       + #39 + Trim(ED_Funcionario_Estado_Civil.Text)                                          + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_nome_conjuge ='                       + #39 + Trim(ED_Funcionario_Nome_Conjuge.Text)                                          + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_grau_instrucao ='                     + #39 + Trim(ED_Funcionario_Grau_Instrucao.Text)                                        + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_residencia ='                         + #39 + Trim(ED_Funcionario_Residencia.Text)                                            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_carteira_habilitacao_n ='             + #39 + Trim(ED_Funcionario_Carteira_Habilitacao_n.Text)                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_certidao_militar_n ='                 + #39 + Trim(ED_Funcionario_Certidao_Militar_n.Text)                                    + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_certidao_militar_serie ='             + #39 + Trim(ED_Funcionario_Certidao_Militar_Serie.Text)                                + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_certidao_militar_categoria ='         + #39 + Trim(ED_Funcionario_Certidao_Militar_Categoria.Text)                            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_carteira_19_n ='          + #39 + Trim(ED_Funcionario_Estrangeiro_Carteira_19_n.Text)                             + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_rg ='                     + #39 + Trim(ED_Funcionario_Estrangeiro_rg.Text)                                        + #39 + ', ';

        if(ED_Funcionario_Estrangeiro_Casado_Brasileiros.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_casado_brasileiro ='  + #39 + 'S'                                                                             + #39 + ', '
        else
            Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_casado_brasileiro ='  + #39 + 'N'                                                                             + #39 + ', ';

        if(ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_filhos_b ='           + #39 + 'S'                                                                             + #39 + ', '
        else
            Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_filhos_b ='           + #39 + 'N'                                                                             + #39 + ', ';

        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_quantos_filhos ='         + #39 + Trim(ED_Funcionario_Estrangeiro_Quantos_Filhos.Text)                            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_data_chegada ='           + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Estrangeiro_Data_Chegada.Text),'amd','/') + #39 + ', ';
        if(ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex = 0) Then
            Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_naturalizado ='       + #39 + 'S'                                                                             + #39 + ', '
        else
            Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_naturalizado ='       + #39 + 'N'                                                                             + #39 + ', ';

        Comando_SQL := Comando_SQL + 'funcionario_estrangeiro_decreto_n ='              + #39 + Trim(ED_Funcionario_Estrangeiro_Decreto_n.Text)                                 + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_data_cadastramento ='             + #39 + Inverte_Data_Plus(Trim(ED_Funcionario_Pis_Data_Cadastramento.Text),'amd','/')   + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_sob_n ='                          + #39 + Trim(ED_Funcionario_Pis_Sob_n.Text)                                             + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_dep_banco ='                      + #39 + Trim(ED_Funcionario_Pis_Dep_Banco.Text)                                         + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_endereço ='                       + #39 + Trim(ED_Funcionario_Pis_Endereco.Text)                                          + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_cod_banco ='                      + #39 + Trim(ED_Funcionario_Pis_Cod_Banco.Text)                                         + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_cod_agencia ='                    + #39 + Trim(ED_Funcionario_Pis_Cod_Agencia.Text)                                       + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_endereco_agencia ='               + #39 + Trim(ED_Funcionario_Pis_Endereco_Agencia.Text)                                  + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_pis_obs ='                            + #39 + Trim(ED_Funcionario_Pis_Obs.Text)                                               + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_beneficiarios ='                      + #39 + Trim(ED_Funcionario_Beneficiarios.Text)                                         + #39 + ', ';

        Comando_SQL := Comando_SQL + 'funcionario_banco_nome ='                         + #39 + Trim(Funcionario_Banco_Nome.Text)                                               + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_banco_agencia ='                      + #39 + Trim(Funcionario_Banco_Agencia.Text)                                            + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_banco_conta ='                        + #39 + Trim(Funcionario_Banco_Conta.Text)                                              + #39 + ', ';
        Comando_SQL := Comando_SQL + 'funcionario_banco_titular ='                      + #39 + Trim(Funcionario_Banco_Titular.Text)                                            + #39 + ', ';

        Comando_SQL := Comando_SQL + 'funcionario_empresa ='                            + #39 + Trim(CB_Funcionario_Empresa.Text)                                               + #39 + ' ';

        Comando_SQL := Comando_SQL + 'Where funcionario_numero = '                      + #39 + Trim(ED_Funcionario_Numero.Text)                                                + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Funcionarios02.Close;
    End;
end;

procedure TFuncionarios02.ED_Funcionario_Estrangeiro_Quantos_FilhosKeyPress(
  Sender: TObject; var Key: Char);
begin
    So_Numero(Sender,Key);
end;

procedure TFuncionarios02.ED_Funcionario_SalarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Valor(Sender,Key);
end;

procedure TFuncionarios02.ED_Funcionario_Estrangeiro_NaturalizadoClick(
  Sender: TObject);
begin
  if(ED_Funcionario_Estrangeiro_Naturalizado.ItemIndex = 0)then begin
    ED_Funcionario_Estrangeiro_Decreto_n.Enabled := True;
    end
  else begin
    ED_Funcionario_Estrangeiro_Decreto_n.Enabled := False;
  end;
end;

procedure TFuncionarios02.ED_Funcionario_Estrangeiro_Filhos_bClick(
  Sender: TObject);
begin
  if(ED_Funcionario_Estrangeiro_Filhos_b.ItemIndex = 0)then begin
    ED_Funcionario_Estrangeiro_Quantos_Filhos.Enabled := True;
    end
  else begin
    ED_Funcionario_Estrangeiro_Quantos_Filhos.Enabled := False;
  end;
end;

procedure TFuncionarios02.ED_Funcionario_Fgts_OptanteClick(
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

procedure TFuncionarios02.BT_ExcluirClick(Sender: TObject);
var
    Comando_SQL: String;
begin
    If Confirma('Deseja realmente excluir ') = 6 then begin
        Comando_SQL := 'Delete from funcionarios Where funcionario_numero = ' + #39 + Trim(ED_Funcionario_Numero.Text) + #39;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Exclusão Efetuada...');

        Funcionarios02.Close;
    End;
end;

procedure TFuncionarios02.BT_Incluir_Alteracao_SalarioClick(
  Sender: TObject);
begin
    If (FuncionariosAlteracaoSalario00 = Nil) Then Begin
        Application.CreateForm(TFuncionariosAlteracaoSalario00,FuncionariosAlteracaoSalario00);
    End;
    FuncionariosAlteracaoSalario00.ED_Funcionario.Text := ED_Funcionario_Numero.Text;
    FuncionariosAlteracaoSalario00.Show;
end;

procedure TFuncionarios02.Carrega_Acidentes_Doencas_Profissionais;
begin
    ConexaoBD.SQL_Acidentes_Doencas_Profissionais.Close;
    ConexaoBD.SQL_Acidentes_Doencas_Profissionais.SQL.Clear;
    ConexaoBD.SQL_Acidentes_Doencas_Profissionais.SQL.Add('select * from acidentes_doencas_profissionais where acidente_doenca_profissional_funcionario = '+#39+ ED_Funcionario_Numero.Text +#39+' order by acidente_doenca_profissional_data_ocorrido');
    ConexaoBD.SQL_Acidentes_Doencas_Profissionais.Open;
end;

procedure TFuncionarios02.Carrega_Alteracao_Cargo;
begin
    ConexaoBD.SQL_Alteracoes_Cargos.Close;
    ConexaoBD.SQL_Alteracoes_Cargos.SQL.Clear;
    ConexaoBD.SQL_Alteracoes_Cargos.SQL.Add('select * from alteracoes_cargos where alteracao_cargo_funcionario = '+#39+ ED_Funcionario_Numero.Text +#39+' order by alteracao_cargo_data');
    ConexaoBD.SQL_Alteracoes_Cargos.Open;
end;

procedure TFuncionarios02.Carrega_Alteracao_Salario;
begin
    ConexaoBD.SQL_Alteracoes_Salarios.Close;
    ConexaoBD.SQL_Alteracoes_Salarios.SQL.Clear;
    ConexaoBD.SQL_Alteracoes_Salarios.SQL.Add('select * from alteracoes_salarios where alteracao_salario_funcionario = '+#39+ ED_Funcionario_Numero.Text +#39+' order by alteracao_salario_data');
    ConexaoBD.SQL_Alteracoes_Salarios.Open;
end;

procedure TFuncionarios02.Carrega_Contibuicao_Sindical;
begin
    ConexaoBD.SQL_Contribuicoes_Sindicais.Close;
    ConexaoBD.SQL_Contribuicoes_Sindicais.SQL.Clear;
    ConexaoBD.SQL_Contribuicoes_Sindicais.SQL.Add('select * from contribuicoes_sindicais where contribuicao_sindical_funcionario = '+#39+ ED_Funcionario_Numero.Text +#39+' order by contribuicao_sindical_data');
    ConexaoBD.SQL_Contribuicoes_Sindicais.Open;
end;

procedure TFuncionarios02.Carrega_Ferias_Concedidas;
begin
    ConexaoBD.SQL_Ferias_Concedidas.Close;
    ConexaoBD.SQL_Ferias_Concedidas.SQL.Clear;
    ConexaoBD.SQL_Ferias_Concedidas.SQL.Add('select * from ferias_concedidas where ferias_concedida_funcionario = '+#39+ ED_Funcionario_Numero.Text +#39+' order by ferias_concedida_data_i');
    ConexaoBD.SQL_Ferias_Concedidas.Open;
end;

procedure TFuncionarios02.DBG_Alteracao_SalarioCellClick(Column: TColumn);
var Selecionado: string;
begin
    if((DBG_Alteracao_Salario.Fields[3].Text <> '')) then begin
        Selecionado := DBG_Alteracao_Salario.Fields[3].Text;
        If (FuncionariosAlteracaoSalario00 = Nil) Then Begin
            Application.CreateForm(TFuncionariosAlteracaoSalario00,FuncionariosAlteracaoSalario00);
        End;
        FuncionariosAlteracaoSalario00.ED_Codigo.Text                     := DBG_Alteracao_Salario.Fields[3].Text;
        FuncionariosAlteracaoSalario00.ED_Funcionario.Text                := ED_Funcionario_Numero.Text;
        FuncionariosAlteracaoSalario00.ED_Alteracao_Salario_Motivo.Text   := DBG_Alteracao_Salario.Fields[2].Text;
        FuncionariosAlteracaoSalario00.ED_Alteracao_Salario_Valor.Text    := DBG_Alteracao_Salario.Fields[1].Text;
        FuncionariosAlteracaoSalario00.ED_Alteracao_Salario_Data.Text     := DBG_Alteracao_Salario.Fields[0].Text;

        FuncionariosAlteracaoSalario00.Show;

        ConexaoBD.SQL_Alteracoes_Salarios.Locate('alteracao_salario_codigo',Trim(Selecionado),[]);
    end;
end;

procedure TFuncionarios02.BT_Incluir_Alteracao_CargoClick(Sender: TObject);
begin
    If (FuncionariosAlteracaoCargo00 = Nil) Then Begin
        Application.CreateForm(TFuncionariosAlteracaoCargo00,FuncionariosAlteracaoCargo00);
    End;
    FuncionariosAlteracaoCargo00.ED_Funcionario.Text := ED_Funcionario_Numero.Text;
    FuncionariosAlteracaoCargo00.Show;
end;

procedure TFuncionarios02.BT_Incluir_Contribuicao_SindicalClick(
  Sender: TObject);
begin
    If (FuncionariosContribuicoesSindicais00 = Nil) Then Begin
        Application.CreateForm(TFuncionariosContribuicoesSindicais00,FuncionariosContribuicoesSindicais00);
    End;
    FuncionariosContribuicoesSindicais00.ED_Funcionario.Text := ED_Funcionario_Numero.Text;
    FuncionariosContribuicoesSindicais00.Show;
end;

procedure TFuncionarios02.BT_Incluir_Acidentes_Doencas_ProfissionaisClick(
  Sender: TObject);
begin
    If (FuncionariosAcidentesDoencasProfissionais00 = Nil) Then Begin
        Application.CreateForm(TFuncionariosAcidentesDoencasProfissionais00,FuncionariosAcidentesDoencasProfissionais00);
    End;
    FuncionariosAcidentesDoencasProfissionais00.ED_Funcionario.Text := ED_Funcionario_Numero.Text;
    FuncionariosAcidentesDoencasProfissionais00.Show;
end;

procedure TFuncionarios02.DBG_Alteracao_CargoCellClick(Column: TColumn);
var Selecionado: string;
begin
    if((DBG_Alteracao_Cargo.Fields[2].Text <> '')) then begin
        Selecionado := DBG_Alteracao_Cargo.Fields[2].Text;
        If (FuncionariosAlteracaoCargo00 = Nil) Then Begin
            Application.CreateForm(TFuncionariosAlteracaoCargo00,FuncionariosAlteracaoCargo00);
        End;
        FuncionariosAlteracaoCargo00.ED_Codigo.Text                     := DBG_Alteracao_Cargo.Fields[2].Text;
        FuncionariosAlteracaoCargo00.ED_Funcionario.Text                := ED_Funcionario_Numero.Text;
        FuncionariosAlteracaoCargo00.ED_Alteracao_Cargo_Descricao.Text  := DBG_Alteracao_Cargo.Fields[1].Text;
        FuncionariosAlteracaoCargo00.ED_Alteracao_Cargo_Data.Text       := DBG_Alteracao_Cargo.Fields[0].Text;

        FuncionariosAlteracaoCargo00.Show;    

        ConexaoBD.SQL_Alteracoes_Cargos.Locate('alteracao_cargo_codigo',Trim(Selecionado),[]);
    end;
end;

procedure TFuncionarios02.DBG_Contribuicao_SindicalCellClick(
  Column: TColumn);
var Selecionado: string;
begin
    if((DBG_Contribuicao_Sindical.Fields[3].Text <> '')) then begin
        Selecionado := DBG_Contribuicao_Sindical.Fields[3].Text;
        If (FuncionariosContribuicoesSindicais00 = Nil) Then Begin
            Application.CreateForm(TFuncionariosContribuicoesSindicais00,FuncionariosContribuicoesSindicais00);
        End;
        FuncionariosContribuicoesSindicais00.ED_Codigo.Text                           := DBG_Contribuicao_Sindical.Fields[3].Text;
        FuncionariosContribuicoesSindicais00.ED_Funcionario.Text                      := ED_Funcionario_Numero.Text;
        FuncionariosContribuicoesSindicais00.ED_Contribuicao_Sindical_Sindicato.Text  := DBG_Contribuicao_Sindical.Fields[2].Text;
        FuncionariosContribuicoesSindicais00.ED_Contribuicao_Sindical_Guia_N.Text     := DBG_Contribuicao_Sindical.Fields[1].Text;
        FuncionariosContribuicoesSindicais00.ED_Contribuicao_Sindical_Data.Text       := DBG_Contribuicao_Sindical.Fields[0].Text;

        FuncionariosContribuicoesSindicais00.Show;      

        ConexaoBD.SQL_Contribuicoes_Sindicais.Locate('contribuicao_sindical_codigo',Trim(Selecionado),[]);
    end;
end;

procedure TFuncionarios02.DBG_Acidentes_Doencas_ProfissionaisCellClick(
  Column: TColumn);
var Selecionado: string;
begin
    if((DBG_Acidentes_Doencas_Profissionais.Fields[3].Text <> '')) then begin
        Selecionado := DBG_Acidentes_Doencas_Profissionais.Fields[3].Text;
        If (FuncionariosAcidentesDoencasProfissionais00 = Nil) Then Begin
            Application.CreateForm(TFuncionariosAcidentesDoencasProfissionais00,FuncionariosAcidentesDoencasProfissionais00);
        End;
        FuncionariosAcidentesDoencasProfissionais00.ED_Codigo.Text                                := DBG_Acidentes_Doencas_Profissionais.Fields[3].Text;
        FuncionariosAcidentesDoencasProfissionais00.ED_Funcionario.Text                           := ED_Funcionario_Numero.Text;
        FuncionariosAcidentesDoencasProfissionais00.ED_Acidente_Doenca_Profissional_Titulo.Text   := DBG_Acidentes_Doencas_Profissionais.Fields[2].Text;
        FuncionariosAcidentesDoencasProfissionais00.ED_Acidente_Doenca_Profissional_Alta.Text     := DBG_Acidentes_Doencas_Profissionais.Fields[1].Text;
        FuncionariosAcidentesDoencasProfissionais00.ED_Acidente_Doenca_Profissional_Ocorrido.Text := DBG_Acidentes_Doencas_Profissionais.Fields[0].Text;

        FuncionariosAcidentesDoencasProfissionais00.Show;   

        ConexaoBD.SQL_Acidentes_Doencas_Profissionais.Locate('acidente_doenca_profissional_codigo',Trim(Selecionado),[]);
    end;
end;

procedure TFuncionarios02.DBG_Ferias_ConcedidasCellClick(Column: TColumn);
var Selecionado: string;
begin
    if((DBG_Ferias_Concedidas.Fields[5].Text <> '')) then begin
        Selecionado := DBG_Ferias_Concedidas.Fields[5].Text;
        If (FuncionariosFeriasConcedidas00 = Nil) Then Begin
            Application.CreateForm(TFuncionariosFeriasConcedidas00,FuncionariosFeriasConcedidas00);
        End;
        FuncionariosFeriasConcedidas00.ED_Codigo.Text           := DBG_Ferias_Concedidas.Fields[5].Text;
        FuncionariosFeriasConcedidas00.ED_Funcionario.Text      := ED_Funcionario_Numero.Text;
        FuncionariosFeriasConcedidas00.ED_Referente_Data_F.Text := DBG_Ferias_Concedidas.Fields[4].Text;
        FuncionariosFeriasConcedidas00.ED_Referente_Data_I.Text := DBG_Ferias_Concedidas.Fields[3].Text;
        FuncionariosFeriasConcedidas00.ED_Data_F.Text           := DBG_Ferias_Concedidas.Fields[1].Text;
        FuncionariosFeriasConcedidas00.ED_Data_I.Text           := DBG_Ferias_Concedidas.Fields[0].Text;

        FuncionariosFeriasConcedidas00.Show;

        ConexaoBD.SQL_Ferias_Concedidas.Locate('ferias_concedida_codigo',Trim(Selecionado),[]);
    end;
end;

procedure TFuncionarios02.BT_Incluir_Ferias_ConcedidasClick(
  Sender: TObject);
begin
    If (FuncionariosFeriasConcedidas00 = Nil) Then Begin
        Application.CreateForm(TFuncionariosFeriasConcedidas00,FuncionariosFeriasConcedidas00);
    End;
    FuncionariosFeriasConcedidas00.ED_Funcionario.Text := ED_Funcionario_Numero.Text;
    FuncionariosFeriasConcedidas00.Show;
end;

procedure TFuncionarios02.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

initialization

alterar := true;

end.

