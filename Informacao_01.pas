unit Informacao_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls;

type
  TInformacao01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Sac_Pergunta: TMemo;
    Sac_Resposta: TMemo;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Cliente_Endereco: TEdit;
    Cliente_Complemento: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Cidade: TEdit;
    Label19: TLabel;
    Cliente_Estado: TComboBox;
    Label17: TLabel;
    Cliente_Cep: TMaskEdit;
    Label20: TLabel;
    Cliente_Pais: TComboBox;
    Label3: TLabel;
    Cliente_Nome: TEdit;
    Informacao_Cliente_Existe: TEdit;
    Cliente_Codigo: TEdit;
    Label1: TLabel;
    Cliente_Empresa: TEdit;
    Cliente_Codigo_Tipo: TEdit;
    Panel2: TPanel;
    Sac_Status: TComboBox;
    Label2: TLabel;
    Label28: TLabel;
    Cliente_Contato: TEdit;
    Label35: TLabel;
    Cliente_DDD: TEdit;
    Label29: TLabel;
    Label34: TLabel;
    Cliente_Fone_Ramal: TEdit;
    Label30: TLabel;
    Cliente_Fone_Comercial: TEdit;
    Label31: TLabel;
    Cliente_Fone_Residencial: TEdit;
    Label32: TLabel;
    Cliente_Fone_Celular: TEdit;
    Label33: TLabel;
    Cliente_Fone_Fax: TEdit;
    Label44: TLabel;
    Cliente_Email: TEdit;
    DBG_FB_Cliente_Observacao: TDBMemo;
    DBG_VT_Cliente_Observacao: TDBMemo;
    BT_Procurar: TBitBtn;
    BT_Alterar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Informacao01: TInformacao01;

implementation

uses Clientes_02, Conexao_BD, Rotinas_Gerais, Clientes_00, Clientes_01;

{$R *.dfm}

procedure TInformacao01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TInformacao01.BT_SairClick(Sender: TObject);
begin
     Informacao01.Close;
end;

procedure TInformacao01.FormShow(Sender: TObject);
begin
     If Informacao_Cliente_Existe.Text = 'Sim' Then
        Begin
        BT_Procurar.Enabled := False;
        BT_Alterar.Enabled  := False;
     End;

     Sac_Pergunta.SetFocus;
end;

procedure TInformacao01.BT_IncluirClick(Sender: TObject);

var
   Tipo_Empresa, Comando_SQL: String;

begin
     If Informacao_Cliente_Existe.Text = 'Sim' Then
        Begin

        //*** Efetua a Inserção ***

        Comando_SQL := 'Update sac Set ';
        Comando_SQL := Comando_SQL + 'sac_empresa_tipo = ' + #39 + Trim(Tipo_Empresa) + #39 + ',';
        Comando_SQL := Comando_SQL + 'sac_nome_cliente = ' + #39 + Trim(Cliente_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'sac_pergunta_cliente = ' + #39 + Trim(Sac_Pergunta.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'sac_resposta_cliente = ' + #39 + Trim(Sac_Resposta.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'sac_data_alteracao = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'sac_hora_alteracao = ' + #39 + Trim(TimeToStr(Time())) + #39 + ',';
        Comando_SQL := Comando_SQL + 'sac_status = ' + #39 + Trim(Sac_Status.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'sac_cliente_tipo_codigo = ' + #39 + Trim(Cliente_Codigo_Tipo.Text) + #39;
        Comando_SQL := Comando_SQL + ' Where sac_cliente_codigo = ' + #39 + Trim(Cliente_Codigo.Text) + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
        End
     Else
        Begin

        //*** Efetua a Inserção ***

        Comando_SQL := 'Insert Into sac(';
        Comando_SQL := Comando_SQL + 'sac_cliente_codigo,';
        Comando_SQL := Comando_SQL + 'sac_empresa_tipo,';
        Comando_SQL := Comando_SQL + 'sac_nome_cliente,';
        Comando_SQL := Comando_SQL + 'sac_pergunta_cliente,';
        Comando_SQL := Comando_SQL + 'sac_resposta_cliente,';
        Comando_SQL := Comando_SQL + 'sac_data_contato,';
        Comando_SQL := Comando_SQL + 'sac_data_alteracao,';
        Comando_SQL := Comando_SQL + 'sac_hora_contato,';
        Comando_SQL := Comando_SQL + 'sac_hora_alteracao,';
        Comando_SQL := Comando_SQL + 'sac_status,';
        Comando_SQL := Comando_SQL + 'sac_cliente_tipo_codigo) Values(';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Tipo_Empresa) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Sac_Pergunta.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Sac_Resposta.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(TimeToStr(Time())) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(TimeToStr(Time())) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Sac_Status.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_Tipo.Text) + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;

     MSG_Erro('Inclusão Efetuada...');

     Informacao01.Close;
end;

procedure TInformacao01.BT_ProcurarClick(Sender: TObject);
begin
     Informacao01.Visible := False;

     Ampulheta();
     Application.CreateForm(TClientes00,Clientes00);

     Clientes00.Programa_Anterior.Text := 'SAC';

     Seta();
     Clientes00.ShowModal;
     Clientes00.Destroy;

     Informacao01.Visible := True;
end;

procedure TInformacao01.BT_AlterarClick(Sender: TObject);

var
   Codigo_Cliente, Tipo_Codigo_Cliente, Tipo_Empresa_Cliente: String;

begin
     If Trim(Cliente_Nome.Text) <> '' Then
        Begin
        Informacao01.Visible := False;

        Ampulheta();
        Application.CreateForm(TClientes02,Clientes02);

        Clientes02.Programa_Anterior.Text := 'SAC';

        //*** Obtem os Dados do Cliente ***
        Codigo_Cliente       := Cliente_Codigo.Text;
        Tipo_Codigo_Cliente  := Cliente_Codigo_Tipo.Text;
        Tipo_Empresa_Cliente := '0';

        ConexaoBD.SQL_FB_Clientes.Close;
        ConexaoBD.SQL_FB_Clientes.SQL.Clear;

        If Tipo_Codigo_Cliente = 'CNPJ' Then
           Begin
           ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
           End
        Else If Tipo_Codigo_Cliente = 'CPF' Then
           Begin
           ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
           End
        Else If Tipo_Codigo_Cliente = 'RG' Then
           Begin
           ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
           End
        Else If Tipo_Codigo_Cliente = 'E-Mail' Then
           Begin
           ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End;

        ConexaoBD.SQL_FB_Clientes.Open;

        //*** Carrega os Dados Obtidos ***

        If Tipo_Codigo_Cliente = 'CNPJ' Then
           Begin
           Clientes02.Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
           End
        Else If Tipo_Codigo_Cliente = 'CPF' Then
           Begin
           Clientes02.Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
           End
        Else If Tipo_Codigo_Cliente = 'RG' Then
           Begin
           Clientes02.Cliente_Codigo_RG.Text    := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
           End
        Else If Tipo_Codigo_Cliente = 'E-Mail' Then
           Begin
           Clientes02.Cliente_Codigo_EMail.Text := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
        End;

        Clientes02.Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_FB_Clientesfb_cliente_codigo_tipo.Text);
        Clientes02.Cliente_Nome.Text                 := ConexaoBD.SQL_FB_Clientesfb_cliente_nome.Text;
        Clientes02.Cliente_Razao_Social.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text;
        Clientes02.Cliente_Inscricao_Municipal.Text  := ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_municipal.Text;
        Clientes02.Cliente_Inscricao_Estadual.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text;
        Clientes02.Cliente_Endereco.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_endereco.Text;
        Clientes02.Cliente_Bairro.Text               := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text;
        Clientes02.Cliente_Cidade.Text               := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text;
        Clientes02.Cliente_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text);
        Clientes02.Cliente_Cep.Text                  := ConexaoBD.SQL_FB_Clientesfb_cliente_cep.Text;
        Clientes02.Cliente_Contato.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_contato.Text;
        Clientes02.Cliente_Fone_Comercial.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
        Clientes02.Cliente_Fone_Celular.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_celular.Text;
        Clientes02.Cliente_Fone_Fax.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_fax.Text;
        Clientes02.Cliente_Endereco_Cobranca.Text    := ConexaoBD.SQL_FB_Clientesfb_cliente_endereco_cobranca.Text;
        Clientes02.Cliente_Bairro_Cobranca.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro_cobranca.Text;
        Clientes02.Cliente_Cidade_Cobranca.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade_cobranca.Text;
        Clientes02.Cliente_Estado_Cobranca.ItemIndex := Obtem_Nro_Estado(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_cobranca.Text);
        Clientes02.Cliente_Cep_Cobranca.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_cep_cobranca.Text;
        Clientes02.Cliente_Status_Credito.ItemIndex  := Obtem_Nro_Status_Credito(ConexaoBD.SQL_FB_Clientesfb_cliente_status_credito.Text);
        Clientes02.Nro_Cliente_Tipo_Empresa.Text     := Tipo_Empresa_Cliente;
        Clientes02.Nro_Banco.Text                    := IntToStr(Obtem_Nro_Banco_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_banco.Text));
        Clientes02.Nro_Representante.Text            := IntToStr(Obtem_Nro_Representante_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_vendedor.Text));
        Clientes02.Cliente_Tipo_Pessoa.ItemIndex     := Obtem_Nro_Tipo_Pessoa(ConexaoBD.SQL_FB_Clientesfb_cliente_tipo_pessoa.Text);
        Clientes02.Cliente_Data_Inclusao.Text        := ConexaoBD.SQL_FB_Clientesfb_cliente_data_inclusao.Text;
        Clientes02.Cliente_Data_Visita.Text          := ConexaoBD.SQL_FB_Clientesfb_cliente_data_visita.Text;
        Clientes02.Cliente_Data_Alteracao.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_data_alteracao.Text;
        Clientes02.Cliente_Data_Ultima_Compra.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_data_ultima_compra.Text;
        Clientes02.Cliente_Ultimo_Valor.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_ultimo_valor.Text;

        Clientes02.Cliente_Pais.ItemIndex             := Obtem_Nro_Pais(ConexaoBD.SQL_FB_Clientesfb_cliente_pais.Text);

        Clientes02.Cliente_Opcao_Cobranca.ItemIndex   := Obtem_Nro_Opcao_Cobranca(ConexaoBD.SQL_FB_Clientesfb_cliente_opcao_cobranca.Text);

        Clientes02.Cliente_Email.Text := ConexaoBD.SQL_FB_Clientesfb_cliente_email.Text;

        Clientes02.Cliente_Desconto.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_desconto.Text;
        Clientes02.Cliente_Condicao_Pgto_1.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_condicao_pgto_1.Text;
        Clientes02.Cliente_Condicao_Pgto_2.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_condicao_pgto_2.Text;
        Clientes02.Cliente_Condicao_Pgto_3.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_condicao_pgto_3.Text;
        Clientes02.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Clientesfb_cliente_tipo_transporte.Text);
        Clientes02.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_transportadora.Text));

        Clientes02.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(ConexaoBD.SQL_FB_Clientesfb_cliente_emite_lote.Text);
        Clientes02.Cliente_Transportadora.ItemIndex   := Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Clientesfb_cliente_transportadora.Text);
        Clientes02.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_pgto_frete.Text));

        //*** Fecha SQL ***

        ConexaoBD.SQL_FB_Clientes.Close;

        Seta();

        Clientes02.ShowModal;
        Clientes02.Destroy;

        Informacao01.Visible := True;
        End
     Else
        Begin
        MSG_Erro('É Necessário informar um cliente antes de alterar os dados cadastrais do mesmo');
     End;
end;

end.
