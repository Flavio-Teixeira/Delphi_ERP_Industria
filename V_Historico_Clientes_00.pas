unit V_Historico_Clientes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TVHistoricoClientes00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Clientes: TDBGrid;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    DBG_Cliente_Observacao: TDBMemo;
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
    Select_Primeira_Vez: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure DBGrid_ClientesCellClick(Column: TColumn);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    procedure Procura_Cliente();
  public
    { Public declarations }
  end;

var
  VHistoricoClientes00: TVHistoricoClientes00;

implementation

uses Conexao_BD, Rotinas_Gerais, V_Historico_Clientes_01; 

var Selecionado: string;

{$R *.dfm}

procedure TVHistoricoClientes00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat  := 'dd/mm/yyyy';
end;

procedure TVHistoricoClientes00.BT_SairClick(Sender: TObject);
begin
     VHistoricoClientes00.Close;
end;

procedure TVHistoricoClientes00.FormShow(Sender: TObject);
begin
     If Trim(Select_Primeira_Vez.Text) <> '' Then
        Begin
        Procura_Cliente();
     End;
     Select_Primeira_Vez.Text := 'NÃO';

     Dados_Procura.SetFocus;
end;

procedure TVHistoricoClientes00.BT_ProcurarClick(Sender: TObject);
begin
     Procura_Cliente();
end;

procedure TVHistoricoClientes00.DBGrid_ClientesCellClick(Column: TColumn);
var
    Codigo_Cliente, Tipo_Codigo_Cliente: String;
begin
    If DBGrid_Clientes.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Clientes.Fields[0].Text;

      If (VHistoricoClientes01 = Nil) Then Begin

         Ampulheta();
         Application.CreateForm(TVHistoricoClientes01,VHistoricoClientes01);

         //*** Obtem os Dados do Cliente ***

         Codigo_Cliente      := DBGrid_Clientes.Fields[0].Text;
         Tipo_Codigo_Cliente := DBGrid_Clientes.Fields[1].Text;

         ConexaoBD.SQL_Clientes.Close;
         ConexaoBD.SQL_Clientes.SQL.Clear;

         If Tipo_Codigo_Cliente = 'CNPJ' Then
            Begin
            ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
            End
         Else If Tipo_Codigo_Cliente = 'CPF' Then
            Begin
            ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
            End
         Else If Tipo_Codigo_Cliente = 'RG' Then
            Begin
            ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
            End
         Else If Tipo_Codigo_Cliente = 'E-Mail' Then
            Begin
            ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
         End;

         ConexaoBD.SQL_Clientes.Open;

         //*** Carrega os Dados Obtidos ***

         If Tipo_Codigo_Cliente = 'CNPJ' Then
            Begin
            VHistoricoClientes01.Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
            End
         Else If Tipo_Codigo_Cliente = 'CPF' Then
            Begin
            VHistoricoClientes01.Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
            End
         Else If Tipo_Codigo_Cliente = 'RG' Then
            Begin
            VHistoricoClientes01.Cliente_Codigo_RG.Text    := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
            End
         Else If Tipo_Codigo_Cliente = 'E-Mail' Then
            Begin
            VHistoricoClientes01.Cliente_Codigo_EMail.Text := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
         End;

         VHistoricoClientes01.Nro_Codigo_Cliente.Text           := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;

         VHistoricoClientes01.Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text);
         VHistoricoClientes01.Cliente_Razao_Social.Text         := ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

         //*** Fecha SQL ***

         ConexaoBD.SQL_Clientes.Close;

         Seta();

      End;

      VHistoricoClientes01.Show;
    End;
end;

procedure TVHistoricoClientes00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TVHistoricoClientes00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TVHistoricoClientes00.Procura_Cliente();
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
     ConexaoBD.SQL_Clientes.Locate('fb_cliente_codigo',Trim(Selecionado),[]);

     Total_Clientes.Caption := IntToStr(ConexaoBD.SQL_Clientes.RecordCount);

     Seta();
end;

procedure TVHistoricoClientes00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     VHistoricoClientes00 := Nil;
end;

end.
