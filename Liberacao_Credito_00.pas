unit Liberacao_Credito_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TLiberacaoCredito00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Clientes: TDBGrid;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Clientes: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_ClientesCellClick(Column: TColumn);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure Procura_Cliente();
  public
    { Public declarations }
  end;

var
  LiberacaoCredito00: TLiberacaoCredito00;

implementation

uses Conexao_BD, Rotinas_Gerais, Liberacao_Credito_01;

{$R *.dfm}

procedure TLiberacaoCredito00.BT_SairClick(Sender: TObject);
begin
     LiberacaoCredito00.Close;
end;

procedure TLiberacaoCredito00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TLiberacaoCredito00.FormShow(Sender: TObject);
begin
     Procura_Cliente();

     Dados_Procura.SetFocus;
end;

procedure TLiberacaoCredito00.Procura_Cliente();
begin
     Ampulheta();

     ConexaoBD.SQL_Clientes.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Nome' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_nome Like ' +#39+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_cliente_nome');
           End
        Else If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_codigo');
           End
        Else If Opcoes_Procura.Text = 'Tipo do Código' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo_tipo = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_codigo_tipo');
           End
        Else If Opcoes_Procura.Text = 'Razão Social' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_razao_social Like ' +#39+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_razao_social');
           End
        Else If Opcoes_Procura.Text = 'Inscrição Municipal' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_inscricao_municipal Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_inscricao_municipal');
           End
        Else If Opcoes_Procura.Text = 'Inscrição Estadual' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_inscricao_estadual Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_inscricao_estadual');
           End
        Else If Opcoes_Procura.Text = 'Endereço' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_endereco Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_endereco');
           End
        Else If Opcoes_Procura.Text = 'Bairro' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_bairro Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_bairro');
           End
        Else If Opcoes_Procura.Text = 'Cidade' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_cidade Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_cidade');
           End
        Else If Opcoes_Procura.Text = 'Estado' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_estado = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_estado');
           End
        Else If Opcoes_Procura.Text = 'CEP' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_cep Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_cep');
           End
        Else If Opcoes_Procura.Text = 'Endereço (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_endereco_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_endereco_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Bairro (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_bairro_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_bairro_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Cidade (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_cidade_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_cidade_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Estado (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_estado_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_estado_cobranca');
           End
        Else If Opcoes_Procura.Text = 'CEP (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_cep_cobranca Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_cep_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Contato' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_contato Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_contato');
           End
        Else If Opcoes_Procura.Text = 'DDD' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_ddd = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_ddd');
           End
        Else If Opcoes_Procura.Text = 'Ramal' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_fone_ramal = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_fone_ramal');
           End
        Else If Opcoes_Procura.Text = 'Fone Comercial' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_fone_comercial Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_fone_comercial');
           End
        Else If Opcoes_Procura.Text = 'Fone Residencial' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_fone_residencial Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_fone_residencial');
           End
        Else If Opcoes_Procura.Text = 'Fone Celular' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_fone_celular');
           End
        Else If Opcoes_Procura.Text = 'Fone Fax' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_fone_celular Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_cliente_fone_celular');
           End
        Else If Opcoes_Procura.Text = 'Valor do Crédito' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_valor_credito = ' + Trim(Dados_Procura.Text) + ' Order By fb_cliente_valor_credito');
           End
        Else If Opcoes_Procura.Text = 'Status do Crédito' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_status_credito = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_status_credito');
           End
        Else If Opcoes_Procura.Text = 'Banco' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_banco = ' + Trim(Dados_Procura.Text) + ' Order By fb_cliente_banco');
           End
        Else If Opcoes_Procura.Text = 'Tipo do Cliente' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_tipo = ' + Trim(Dados_Procura.Text) + ' Order By fb_cliente_tipo');
           End
        Else If Opcoes_Procura.Text = 'Representante' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_vendedor = ' + Trim(Dados_Procura.Text) + ' Order By fb_cliente_vendedor');
           End
        Else If Opcoes_Procura.Text = 'Tipo da Pessoa' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_tipo_pessoa = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_tipo_pessoa');
           End
        Else If Opcoes_Procura.Text = 'Consignação' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_consignacao = ' +#39+ Trim(Dados_Procura.Text) +#39+ ' Order By fb_cliente_consignacao');
           End
        Else If Opcoes_Procura.Text = 'Zona' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_zona = ' + Trim(Dados_Procura.Text) + ' Order By fb_cliente_zona');
           End
        Else If Opcoes_Procura.Text = 'Data da Visita' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_data_visita = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By fb_cliente_data_visita');
           End
        Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By fb_cliente_data_inclusao');
           End
        Else If Opcoes_Procura.Text = 'Data de Alteração' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_data_alteracao = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By fb_cliente_data_alteracao');
           End
        Else If Opcoes_Procura.Text = 'Data da Última Compra' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_data_ultima_compra = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+ ' Order By fb_cliente_data_ultima_compra');
           End
        Else If Opcoes_Procura.Text = 'Último Valor' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_ultimo_valor = ' + Trim(Dados_Procura.Text) + ' Order By fb_cliente_ultimo_valor');
           End
        Else If Opcoes_Procura.Text = 'País' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_pais = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By fb_cliente_pais');
           End
        Else If Opcoes_Procura.Text = 'País (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_pais_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By fb_cliente_pais_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Opção de Cobrança' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_opcao_cobranca = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By fb_cliente_opcao_cobranca');
           End
        Else If Opcoes_Procura.Text = 'E-Mail' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_email = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By fb_cliente_email');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Nome' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_nome');
           End
        Else If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_codigo');
           End
        Else If Opcoes_Procura.Text = 'Tipo do Código' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_codigo_tipo');
           End
        Else If Opcoes_Procura.Text = 'Razão Social' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_razao_social');
           End
        Else If Opcoes_Procura.Text = 'Inscrição Municipal' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_inscricao_municipal');
           End
        Else If Opcoes_Procura.Text = 'Inscrição Estadual' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_inscricao_estadual');
           End
        Else If Opcoes_Procura.Text = 'Endereço' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_endereco');
           End
        Else If Opcoes_Procura.Text = 'Bairro' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_bairro');
           End
        Else If Opcoes_Procura.Text = 'Cidade' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_cidade');
           End
        Else If Opcoes_Procura.Text = 'Estado' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_estado');
           End
        Else If Opcoes_Procura.Text = 'CEP' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_cep');
           End
        Else If Opcoes_Procura.Text = 'Endereço (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_endereco_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Bairro (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_bairro_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Cidade (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_cidade_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Estado (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_estado_cobranca');
           End
        Else If Opcoes_Procura.Text = 'CEP (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_cep_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Contato' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_contato');
           End
        Else If Opcoes_Procura.Text = 'DDD' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_ddd');
           End
        Else If Opcoes_Procura.Text = 'Ramal' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_fone_ramal');
           End
        Else If Opcoes_Procura.Text = 'Fone Comercial' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_fone_comercial');
           End
        Else If Opcoes_Procura.Text = 'Fone Residencial' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_fone_residencial');
           End
        Else If Opcoes_Procura.Text = 'Fone Celular' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_fone_celular');
           End
        Else If Opcoes_Procura.Text = 'Fone Fax' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_fone_celular');
           End
        Else If Opcoes_Procura.Text = 'Valor do Crédito' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_valor_credito');
           End
        Else If Opcoes_Procura.Text = 'Status do Crédito' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_status_credito');
           End
        Else If Opcoes_Procura.Text = 'Banco' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_banco');
           End
        Else If Opcoes_Procura.Text = 'Tipo do Cliente' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_tipo');
           End
        Else If Opcoes_Procura.Text = 'Representante' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_vendedor');
           End
        Else If Opcoes_Procura.Text = 'Tipo da Pessoa' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_tipo_pessoa');
           End
        Else If Opcoes_Procura.Text = 'Consignação' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_consignacao');
           End
        Else If Opcoes_Procura.Text = 'Zona' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_zona');
           End
        Else If Opcoes_Procura.Text = 'Data da Visita' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_data_visita');
           End
        Else If Opcoes_Procura.Text = 'Data de Inclusão' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_data_inclusao');
           End
        Else If Opcoes_Procura.Text = 'Data de Alteração' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_data_alteracao');
           End
        Else If Opcoes_Procura.Text = 'Data da Última Compra' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_data_ultima_compra');
           End
        Else If Opcoes_Procura.Text = 'Último Valor' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_ultimo_valor');
           End
        Else If Opcoes_Procura.Text = 'País' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_pais');
           End
        Else If Opcoes_Procura.Text = 'País (Cobrança)' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_pais_cobranca');
           End
        Else If Opcoes_Procura.Text = 'Opção de Cobrança' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_opcao_cobranca');
           End
        Else If Opcoes_Procura.Text = 'E-Mail' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Order By fb_cliente_email');
        End;

     End;

     ConexaoBD.SQL_Clientes.Open;

     Total_Clientes.Caption := IntToStr(ConexaoBD.SQL_Clientes.RecordCount);

     Seta();
end;

procedure TLiberacaoCredito00.DBGrid_ClientesCellClick(Column: TColumn);
var
    Codigo_Cliente, Tipo_Codigo_Cliente: String;
    Selecionado: string;
begin
    If DBGrid_Clientes.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Clientes.Fields[0].Text;

      LiberacaoCredito00.Visible := False;

      Ampulheta();
      Application.CreateForm(TLiberacaoCredito01,LiberacaoCredito01);

      //*** Obtem os Dados do Cliente ***

      Codigo_Cliente      := DBGrid_Clientes.Fields[0].Text;
      Tipo_Codigo_Cliente := DBGrid_Clientes.Fields[1].Text;

      ConexaoBD.SQL_Clientes.Close;
      ConexaoBD.SQL_Clientes.SQL.Clear;

      If Tipo_Codigo_Cliente = 'CNPJ' Then Begin
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End
      Else If Tipo_Codigo_Cliente = 'CPF' Then Begin
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End
      Else If Tipo_Codigo_Cliente = 'RG' Then Begin
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End
      Else If Tipo_Codigo_Cliente = 'E-Mail' Then Begin
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
      End;

      ConexaoBD.SQL_Clientes.Open;

      //*** Carrega os Dados Obtidos ***

      If Tipo_Codigo_Cliente = 'CNPJ' Then Begin
        LiberacaoCredito01.Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
        End
      Else If Tipo_Codigo_Cliente = 'CPF' Then Begin
        LiberacaoCredito01.Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
        End
      Else If Tipo_Codigo_Cliente = 'RG' Then Begin
        LiberacaoCredito01.Cliente_Codigo_RG.Text    := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
        End
      Else If Tipo_Codigo_Cliente = 'E-Mail' Then Begin
        LiberacaoCredito01.Cliente_Codigo_EMail.Text := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
      End;

      LiberacaoCredito01.Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text);
      LiberacaoCredito01.Cliente_Nome.Text                 := ConexaoBD.SQL_Clientesfb_cliente_nome.Text;
      LiberacaoCredito01.Cliente_Razao_Social.Text         := ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text;
      LiberacaoCredito01.Cliente_Endereco.Text             := ConexaoBD.SQL_Clientesfb_cliente_endereco.Text;
      LiberacaoCredito01.Cliente_Complemento.Text          := ConexaoBD.SQL_Clientesfb_cliente_complemento.Text;
      LiberacaoCredito01.Cliente_Bairro.Text               := ConexaoBD.SQL_Clientesfb_cliente_bairro.Text;
      LiberacaoCredito01.Cliente_Cidade.Text               := ConexaoBD.SQL_Clientesfb_cliente_cidade.Text;
      LiberacaoCredito01.Cliente_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_Clientesfb_cliente_estado.Text);
      LiberacaoCredito01.Cliente_Cep.Text                  := ConexaoBD.SQL_Clientesfb_cliente_cep.Text;
      LiberacaoCredito01.Cliente_Valor_Credito.Text        := ConexaoBD.SQL_Clientesfb_cliente_valor_credito.Text;
      LiberacaoCredito01.Cliente_Status_Credito.ItemIndex  := Obtem_Nro_Status_Credito(ConexaoBD.SQL_Clientesfb_cliente_status_credito.Text);
      LiberacaoCredito01.Cliente_Tipo_Pessoa.ItemIndex     := Obtem_Nro_Tipo_Pessoa(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text);
      LiberacaoCredito01.Cliente_Ultimo_Valor.Text         := ConexaoBD.SQL_Clientesfb_cliente_ultimo_valor.Text;

      LiberacaoCredito01.Cliente_Pais.ItemIndex := Obtem_Nro_Pais(ConexaoBD.SQL_Clientesfb_cliente_pais.Text);

      //*** Fecha SQL ***

      ConexaoBD.SQL_Clientes.Close;

      Seta();

      LiberacaoCredito01.ShowModal;
      LiberacaoCredito01.Destroy;

      LiberacaoCredito00.Visible := True; 

      ConexaoBD.SQL_Clientes.Locate('fb_cliente_codigo',Trim(Selecionado),[]);
    End;
end;

procedure TLiberacaoCredito00.BT_ProcurarClick(Sender: TObject);
begin
     Procura_Cliente();
end;

procedure TLiberacaoCredito00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TLiberacaoCredito00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
