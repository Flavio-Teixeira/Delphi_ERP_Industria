unit Funcionarios_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  TFuncionarios00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Funcionarios: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    DBG_Funcionarios_Beneficiarios: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Empresa_Procura: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Funcionarios: TLabel;
    Select_Primeira_Vez: TEdit;
    Opcoes_Procura: TComboBox;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Empresa_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure DBGrid_FuncionariosCellClick(Column: TColumn);
  private
    { Private declarations }
    procedure Procura_Funcionarios();
  public
    { Public declarations }
  end;

var
  Funcionarios00: TFuncionarios00;
  Selecionado: string;
  
implementation

uses Conexao_BD, Rotinas_Gerais, Funcionarios_01, Funcionarios_02,
  StrUtils;

{$R *.dfm}

{ TFuncionarios00 }

procedure TFuncionarios00.Procura_Funcionarios;
begin
    Ampulheta();

    ConexaoBD.SQL_Funcionarios.SQL.Clear;

    If Trim(Dados_Procura.Text) <> '' Then Begin

      If Empresa_Procura.Text = 'Todas' Then Begin
        If Opcoes_Procura.Text = 'Nome' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_nome Like '+#39+'%'+Trim(Dados_Procura.Text)+'%'+#39+' Order By funcionario_nome');
        End

        Else If Opcoes_Procura.Text = 'CPF' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_cpf Like '+#39+'%'+Trim(Dados_Procura.Text)+'%'+#39+' Order By funcionario_cpf');
        End

        Else If Opcoes_Procura.Text = 'Numero' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_numero = '+#39+Trim(Dados_Procura.Text)+#39+' Order By funcionario_numero');
        End

        Else If Opcoes_Procura.Text = 'Rescisão' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_data_rescisao = '+#39+Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-')+#39+' Order By funcionario_numero');
        End;
      End

      Else Begin
        If Opcoes_Procura.Text = 'Nome' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_nome Like '+#39+'%'+Trim(Dados_Procura.Text)+'%'+#39+' and funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_nome');
        End

        Else If Opcoes_Procura.Text = 'CPF' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_cpf Like '+#39+'%'+Trim(Dados_Procura.Text)+'%'+#39+' and funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_cpf');
        End

        Else If Opcoes_Procura.Text = 'Numero' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_numero = '+#39+Trim(Dados_Procura.Text)+#39+' and funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_numero');
        End

        Else If Opcoes_Procura.Text = 'Rescisão' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_data_rescisao = '+#39+Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-')+#39+' and funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_numero');
        End;
      End;

    End

    Else Begin

      If Empresa_Procura.Text = 'Todas' Then Begin
        If Opcoes_Procura.Text = 'Nome' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Order By funcionario_nome');
        End

        Else If Opcoes_Procura.Text = 'CPF' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Order By funcionario_cpf');
        End

        Else If Opcoes_Procura.Text = 'Numero' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Order By funcionario_numero');
        End

        Else If Opcoes_Procura.Text = 'Rescisão' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Order By funcionario_numero');
        End;
      End

      Else Begin
        If Opcoes_Procura.Text = 'Nome' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_nome');
        End

        Else If Opcoes_Procura.Text = 'CPF' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_cpf');
        End

        Else If Opcoes_Procura.Text = 'Numero' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_numero');
        End

        Else If Opcoes_Procura.Text = 'Rescisão' Then Begin
          ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_empresa = '+#39+Empresa_Procura.Text+#39+' Order By funcionario_numero');
        End;
      End;

    End;

    ConexaoBD.SQL_Funcionarios.Open;

    Total_Funcionarios.Caption := IntToStr(ConexaoBD.SQL_Funcionarios.RecordCount);

    Seta();
end;

procedure TFuncionarios00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Funcionarios00 := Nil;
end;

procedure TFuncionarios00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFuncionarios00.FormShow(Sender: TObject);
begin
    If Trim(Select_Primeira_Vez.Text) <> '' Then
       Begin
       Procura_Funcionarios();
    End;
    Select_Primeira_Vez.Text := 'NÃO';

    Dados_Procura.SetFocus;
end;

procedure TFuncionarios00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFuncionarios00.Empresa_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFuncionarios00.BT_SairClick(Sender: TObject);
begin
    Funcionarios00.Close;
end;

procedure TFuncionarios00.BT_IncluirClick(Sender: TObject);
begin
     If (Funcionarios01 = Nil) Then
        Begin
        Application.CreateForm(TFuncionarios01,Funcionarios01);
     End;
     Funcionarios01.PageControl1.TabIndex := 0;
     Funcionarios01.Pag2.Text             := '';
     Funcionarios01.ShowModal;

     Procura_Funcionarios();
end;

procedure TFuncionarios00.BT_ProcurarClick(Sender: TObject);
begin
    Procura_Funcionarios();
end;

procedure TFuncionarios00.DBGrid_FuncionariosCellClick(Column: TColumn);
var
    Codigo_Funcionario: String;
begin
    If DBGrid_Funcionarios.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Funcionarios.Fields[0].Text;

      If (Funcionarios02 = Nil) Then Begin

        Ampulheta();
        Application.CreateForm(TFuncionarios02,Funcionarios02);

        //*** Obtem os Dados do Cliente ***

        Codigo_Funcionario := DBGrid_Funcionarios.Fields[0].Text;

        ConexaoBD.SQL_Funcionarios.Close;
        ConexaoBD.SQL_Funcionarios.SQL.Clear;
        ConexaoBD.SQL_Funcionarios.SQL.Add('Select * from funcionarios Where funcionario_numero = ' + #39 + Trim(Codigo_Funcionario) + #39);
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

        Funcionarios02.CB_Funcionario_Empresa.ItemIndex                   := Obtem_Nro_Empresa(ConexaoBD.SQL_Funcionariosfuncionario_empresa.AsString);

        Funcionarios02.Funcionario_Banco_Nome.Text                        := ConexaoBD.SQL_Funcionariosfuncionario_banco_nome.AsString;
        Funcionarios02.Funcionario_Banco_Agencia.Text                     := ConexaoBD.SQL_Funcionariosfuncionario_banco_agencia.AsString;
        Funcionarios02.Funcionario_Banco_Conta.Text                       := ConexaoBD.SQL_Funcionariosfuncionario_banco_conta.AsString;
        Funcionarios02.Funcionario_Banco_Titular.Text                     := ConexaoBD.SQL_Funcionariosfuncionario_banco_titular.AsString;

        Funcionarios02.ED_Funcionario_Beneficiarios.Lines.Clear;
        Funcionarios02.ED_Funcionario_Beneficiarios.Lines.Add(DBG_Funcionarios_Beneficiarios.Text);

        //*** Fecha SQL ***

        ConexaoBD.SQL_Funcionarios.Close;

        Seta();

      End;
      Funcionarios02.PageControl1.TabIndex := 0;
      Funcionarios02.PagAnterior.Text      := '';
      Funcionarios02.BT_Excluir.Enabled    := True;
      Funcionarios02.ShowModal;

      Procura_Funcionarios();
    End;
end;

end.
