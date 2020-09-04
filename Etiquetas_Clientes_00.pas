unit Etiquetas_Clientes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ImpMat;

type
  TEtiquetasClientes00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Clientes: TDBGrid;
    Panel3: TPanel;
    BT_Imprimir: TBitBtn;
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
    Panel6: TPanel;
    Panel7: TPanel;
    Cliente_Codigo: TEdit;
    Cliente_Nome: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Cliente_Qtde: TEdit;
    Imprimir: TImpMat;
    Cliente_Endereco_Normal: TRadioButton;
    Cliente_Endereco_Cobranca: TRadioButton;
    Label7: TLabel;
    Verificar_Posicionamento: TCheckBox;
    procedure DBGrid_ClientesCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Cliente_Endereco_NormalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Endereco_CobrancaKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    procedure Procura_Cliente();

  public
    { Public declarations }
  end;

var
  EtiquetasClientes00: TEtiquetasClientes00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TEtiquetasClientes00.DBGrid_ClientesCellClick(Column: TColumn);

var
   Codigo_Cliente, Tipo_Codigo_Cliente: String;

begin
     If DBGrid_Clientes.Fields[0].Text <> '' Then
        Begin
        Cliente_Codigo.Text := DBGrid_Clientes.Fields[0].Text;
        Cliente_Nome.Text   := DBGrid_Clientes.Fields[2].Text;
        Cliente_Qtde.Text   := '1';

        Cliente_Qtde.SetFocus;
     End;
end;

procedure TEtiquetasClientes00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TEtiquetasClientes00.FormShow(Sender: TObject);
begin
    Procura_Cliente();
    Dados_Procura.SetFocus;
end;

procedure TEtiquetasClientes00.Procura_Cliente();
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

procedure TEtiquetasClientes00.BT_ProcurarClick(Sender: TObject);
begin
     Procura_Cliente();
end;

procedure TEtiquetasClientes00.BT_SairClick(Sender: TObject);
begin
     EtiquetasClientes00.Close;
end;

procedure TEtiquetasClientes00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasClientes00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasClientes00.Cliente_QtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasClientes00.BT_ImprimirClick(Sender: TObject);

var
   Linha, Posicao_Inicial, Posicao_Final: Integer;

begin
     If ((Trim(Cliente_Codigo.Text) <> '') And (Trim(Cliente_Nome.Text) <> '') And (Trim(Cliente_Qtde.Text) <> '')) Then
        Begin

        If Verificar_Posicionamento.Checked = True Then
           Begin
           //*** Posiciona da Etiqueta ***

           Ampulheta();

           Linha := 1;
           Imprimir.PoeStr(Linha,001, #27#15 + '***********************************************************************');

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, '**********************************************************************');

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, '**********************************************************************');

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, '**********************************************************************');

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, '**********************************************************************');

           Imprimir.ImprimeJob;
           Imprimir.LimpaBuffer;

           Seta();

           While Confirma('A Posição está Correta ?') <> 6 Do
                 Begin
                 Ampulheta();

                 Linha := 1;
                 Imprimir.PoeStr(Linha,001, #27#15 + '***********************************************************************');

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,001, '**********************************************************************');

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,001, '**********************************************************************');

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,001, '**********************************************************************');

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,001, '**********************************************************************');

                 Imprimir.ImprimeJob;
                 Imprimir.LimpaBuffer;

                 Seta();
           End;
        End;

        Ampulheta();

        //*** Impressão da Etiqueta ***

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39);
        ConexaoBD.SQL_Clientes.Open;

        If ConexaoBD.SQL_Clientes.RecordCount > 0 Then
           Begin
           ConexaoBD.SQL_Clientes.First;

           Posicao_Final := StrToInt(Cliente_Qtde.Text);

           For Posicao_Inicial := 1 To Posicao_Final do
               Begin
               Linha := 1;
               Imprimir.PoeStr(Linha,001, #27#15 + Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text),1,70)) );

               Linha := Linha + 1;

               If Cliente_Endereco_Normal.Checked = True Then
                  Begin

                  If Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento.Text) <> '' Then
                     Begin
                     Linha := Linha + 1;
                     Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento.Text),1,70)) );
                     End
                  Else
                     Begin
                     Linha := Linha + 1;
                     Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text),1,70)) );
                  End;

                  Linha := Linha + 1;
                  Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Clientesfb_cliente_bairro.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text),1,70)) );

                  Linha := Linha + 1;
                  Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy('CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text),1,70)) );

                  End
               Else
                  Begin

                  If Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text) <> '' Then
                     Begin
                     Linha := Linha + 1;
                     Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text),1,70)) );
                     End
                  Else
                     Begin
                     Linha := Linha + 1;
                     Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text),1,70)) );
                  End;

                  Linha := Linha + 1;
                  Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text),1,70)) );

                  Linha := Linha + 1;
                  Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy('CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text),1,70)) );

               End;

               Imprimir.ImprimeJob;
               Imprimir.LimpaBuffer;
           End;
        End;

        Seta();

        End
     Else
        Begin
        MSG_Erro('Dados para impressão não foram preenchidos');

        Dados_Procura.SetFocus;
     End;
end;

procedure TEtiquetasClientes00.Cliente_Endereco_NormalKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasClientes00.Cliente_Endereco_CobrancaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
