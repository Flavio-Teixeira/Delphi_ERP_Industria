unit Cotacao_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls;

type
  TCotacao02 = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid_Grupos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    DBG_Fornecedor_Observacao: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Lista_Fornecedores: TComboBox;
    BT_Atualizar: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_GruposCellClick(Column: TColumn);
    procedure DBGrid_GruposDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Lista_FornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure Lista_FornecedoresChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_AtualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carrega_Fornecedores();
    procedure Obtem_Fornecedor();

  public
    { Public declarations }
  end;

var
  Cotacao02: TCotacao02;
  Selecionado: string;

implementation

uses Conexao_BD, Rotinas_Gerais, Cotacao_03, Cotacao_04;

{$R *.dfm}

procedure TCotacao02.BT_SairClick(Sender: TObject);
begin
     Cotacao02.Close;
end;

procedure TCotacao02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TCotacao02.FormShow(Sender: TObject);
begin
    If Trim(Dados_Procura.Text) <> '' Then
       Begin
       BT_ProcurarClick(Sender);

       If (Trim(Lista_Fornecedores.Text) <> '--- FORNECEDORES ---') And (Trim(Lista_Fornecedores.Text) <> '') Then
          Begin
          Obtem_Fornecedor();
       End;

       End
    Else
       Begin
       ConexaoBD.SQL_Cotacao.Close;
       ConexaoBD.SQL_Cotacao.SQL.Clear;
       ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc, fb_cotacao_nro Desc');
       ConexaoBD.SQL_Cotacao.Open;

       If (Trim(Lista_Fornecedores.Text) <> '--- FORNECEDORES ---') And (Trim(Lista_Fornecedores.Text) <> '') Then
          Begin
          Obtem_Fornecedor();
          End
       Else
          Begin
          Carrega_Fornecedores();
       End;
    End;
end;

procedure TCotacao02.BT_IncluirClick(Sender: TObject);
begin
     If (Cotacao03 = Nil) Then
        Begin
        Application.CreateForm(TCotacao03,Cotacao03);
     End;
     Cotacao03.Show;
end;

procedure TCotacao02.DBGrid_GruposCellClick(Column: TColumn);
var
    Nro_Cotacao, Codigo_Fornecedor, Vlr_Exibicao: String;
    Erro: Integer;
    Vlr_Numero: Real;
begin
    If DBGrid_Grupos.Fields[0].Text <> '' Then Begin
      Ampulheta();

      Selecionado := DBGrid_Grupos.Fields[0].Text;

      If (Cotacao04 = Nil) Then Begin

        Application.CreateForm(TCotacao04,Cotacao04);

        //*** Obtem os Dados da Cotação ***

        Nro_Cotacao := DBGrid_Grupos.Fields[0].Text;

        ConexaoBD.SQL_Cotacao.Close;
        ConexaoBD.SQL_Cotacao.SQL.Clear;
        ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_nro = ' + Trim(Nro_Cotacao) );
        ConexaoBD.SQL_Cotacao.Open;

        //*** Obtem os Dados dos Clientes ***

        Codigo_Fornecedor := ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text;

        ConexaoBD.SQL_Fornecedores.Close;
        ConexaoBD.SQL_Fornecedores.SQL.Clear;
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + Trim(Codigo_Fornecedor) );
        ConexaoBD.SQL_Fornecedores.Open;

        //*** Carrega os Dados Obtidos ***

        Cotacao04.Nro_Cotacao.Text                 := Nro_Cotacao;

        Cotacao04.Fornecedor_Numero.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

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

        Cotacao04.Cotacao_Funcionario.Text     := conexaoBD.SQL_Cotacaofb_cotacao_funcionario.Text;
        Cotacao04.Cotacao_Vendedor.Text        := conexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text;
        Cotacao04.Cotacao_Orcamento.Text       := conexaoBD.SQL_Cotacaofb_cotacao_orcamento_nro.Text;

        Cotacao04.Cotacao_Data.Text           := conexaoBD.SQL_Cotacaofb_cotacao_data.Text;

        Cotacao04.Cotacao_Prazo.Text           := conexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text;
        Cotacao04.Cotacao_Condicao_Pgto_1.Text := conexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text;

        Cotacao04.Cotacao_Status.Text          := conexaoBD.SQL_Cotacaofb_cotacao_status.Text;
        Cotacao04.edNroRequisicao.Text         := conexaoBD.SQL_Cotacaofb_cotacao_requisicao.Text;

        If Trim(conexaoBD.SQL_Cotacaofb_cotacao_opcao.Text) = 'MATERIA PRIMA' Then Begin
          Cotacao04.Cotacao_Opcao.ItemIndex := 0;
          End
        Else If Trim(conexaoBD.SQL_Cotacaofb_cotacao_opcao.Text) = 'CONSUMO' Then Begin
          Cotacao04.Cotacao_Opcao.ItemIndex := 1;
          End
        Else Begin
          Cotacao04.Cotacao_Opcao.ItemIndex := 2;
        End;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacaofb_cotacao_desconto.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Cotacao04.Valor_Desconto.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacaofb_cotacao_frete.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Cotacao04.Valor_Frete.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacaofb_cotacao_vlr_total.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Cotacao04.Valor_Total.Text  := Vlr_Exibicao;

        If Trim(ConexaoBD.SQL_Cotacaofb_cotacao_status.Text) = 'Cotada' Then
           Begin
           Cotacao04.Cotacao_Status.ItemIndex := 0;
           End
        Else If Trim(ConexaoBD.SQL_Cotacaofb_cotacao_status.Text) = 'Entregue' Then
           Begin
           Cotacao04.Cotacao_Status.ItemIndex := 1;
        End;

        If( Trim(ConexaoBD.SQL_Cotacaofb_cotacao_empresa.Text) = 'IBRASMAK' ) Then
          Begin
          Cotacao04.Cotacao_Empresa.ItemIndex := 0;
          End
        Else If( Trim(ConexaoBD.SQL_Cotacaofb_cotacao_empresa.Text) = 'MONIBRAS' ) Then
          Begin
          Cotacao04.Cotacao_Empresa.ItemIndex := 1;
          End
        Else If( Trim(ConexaoBD.SQL_Cotacaofb_cotacao_empresa.Text) = 'FERRAMENTARIA' ) Then
          Begin
          Cotacao04.Cotacao_Empresa.ItemIndex := 2;
        End;

        //*** Fecha SQL ***

        ConexaoBD.SQL_Cotacao.Close;
        ConexaoBD.SQL_Fornecedores.Close;

        Seta();
      End;

      Cotacao04.Show;

    End;
end;

procedure TCotacao02.DBGrid_GruposDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If DBGrid_Grupos.Fields[4].Text <> 'Cotada' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clOlive;
        End
     Else If DBGrid_Grupos.Fields[4].Text <> 'Entregue' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clMoneyGreen;
     End;

     DBGrid_Grupos.DefaultDrawDataCell(Rect, DBGrid_Grupos.columns[datacol].field, State);
end;

procedure TCotacao02.Carrega_Fornecedores();
begin
     // Obtem os Fornecedores

     ConexaoBD.SQL_Fornecedores.Close;
     ConexaoBD.SQL_Fornecedores.SQL.Clear;
     ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_area ='+#39+'Compras'+#39+' Order By fb_fornecedor_nome');
     ConexaoBD.SQL_Fornecedores.Open;

     Lista_Fornecedores.Items.Clear;
     Lista_Fornecedores.Items.Add('--- FORNECEDORES ---');

     If conexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Fornecedores.First;

        While Not conexaoBD.SQL_Fornecedores.Eof Do
              begin
              Lista_Fornecedores.Items.Add(Trim(conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text));
              conexaoBD.SQL_Fornecedores.Next;
        End;
     end;

     ConexaoBD.SQL_Fornecedores.Close;

     Lista_Fornecedores.ItemIndex := 0;
end;

procedure TCotacao02.Obtem_Fornecedor();
begin
     Ampulheta();

     Dados_Procura.Text := '';

     If (Trim(Lista_Fornecedores.Text) <> '--- FORNECEDORES ---') And (Trim(Lista_Fornecedores.Text) <> '') Then
        Begin
        ConexaoBD.SQL_Cotacao.Close;
        ConexaoBD.SQL_Cotacao.SQL.Clear;
        ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_cotacao_data Desc, fb_cotacao_fornecedor_descricao');
        ConexaoBD.SQL_Cotacao.Open;
        End
     Else
        Begin
        ConexaoBD.SQL_Cotacao.Close;
        ConexaoBD.SQL_Cotacao.SQL.Clear;
        ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc, fb_cotacao_fornecedor_descricao');
        ConexaoBD.SQL_Cotacao.Open;
     End;

     Seta();
end;

procedure TCotacao02.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     Lista_Fornecedores.ItemIndex := 0;

     ConexaoBD.SQL_Cotacao.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_fornecedor_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_cotacao_data Desc, fb_cotacao_fornecedor_descricao');
           End
        Else If Opcoes_Procura.Text = 'Nro' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_nro = ' + Trim(Dados_Procura.Text) + ' Order By fb_cotacao_data Desc, fb_cotacao_nro');
           End
        Else If Opcoes_Procura.Text = 'Data da Ordem' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_data = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+' Order fb_cotacao_data Desc');
           End
        Else If Opcoes_Procura.Text = 'Requisição' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_requisicao = '+Trim(Dados_Procura.Text)+' Order By fb_cotacao_requisicao');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc, fb_cotacao_fornecedor_descricao');
           End
        Else If Opcoes_Procura.Text = 'Nro' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc, fb_cotacao_nro');
           End
        Else If Opcoes_Procura.Text = 'Data da Ordem' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc');
           End
        Else If Opcoes_Procura.Text = 'Requisição' Then
           Begin
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_requisicao');
        End;

     End;

     ConexaoBD.SQL_Cotacao.Open;

     Seta();
end;

procedure TCotacao02.Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao02.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao02.Lista_FornecedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao02.Lista_FornecedoresChange(Sender: TObject);
begin
     Obtem_Fornecedor();
end;

procedure TCotacao02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Cotacao02 := Nil;
end;

procedure TCotacao02.BT_AtualizarClick(Sender: TObject);
begin
   ConexaoBD.SQL_Cotacao.Close;
   ConexaoBD.SQL_Cotacao.SQL.Clear;
   ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc, fb_cotacao_nro Desc');
   ConexaoBD.SQL_Cotacao.Open;
end;

end.
