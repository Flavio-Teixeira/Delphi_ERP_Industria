unit Ordem_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls;

type
  TOrdem00 = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid_Grupos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    DBG_Fornecedor_Observacao: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Label3: TLabel;
    Lista_Fornecedores: TComboBox;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Label5: TLabel;
    Data_Final: TMaskEdit;
    DBG_Ordem_Observacao: TDBMemo;
    BT_Imprimir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_GruposCellClick(Column: TColumn);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_GruposDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carrega_Fornecedores();

  public
    { Public declarations }
  end;

var
  Ordem00: TOrdem00;
  Selecionado: string;

implementation

uses Conexao_BD, Rotinas_Gerais, Ordem_01, Ordem_02, Ordem_03;

{$R *.dfm}

procedure TOrdem00.BT_SairClick(Sender: TObject);
begin
     Ordem00.Close;
end;

procedure TOrdem00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 D�gitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padr�o Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TOrdem00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***
    Data_Final.Text   := DateToStr(Date());
    Data_Inicial.Text := '01/01/' + Trim(Copy(Data_Final.Text,7,4));

    If (Trim(Lista_Fornecedores.Text) = '') Then
       Begin
       Carrega_Fornecedores();
    End;

    BT_ProcurarClick(Sender);
end;

procedure TOrdem00.BT_IncluirClick(Sender: TObject);
begin
     If (Ordem01 = Nil) Then
        Begin
        Application.CreateForm(TOrdem01,Ordem01);
     End;
     Ordem01.Show;
end;

procedure TOrdem00.DBGrid_GruposCellClick(Column: TColumn);

var
    Nro_Ordem, Codigo_Fornecedor, Vlr_Exibicao, Linha_Lista: String;
    Erro, contador: Integer;
    Vlr_Numero: Real;
begin
    If DBGrid_Grupos.Fields[0].Text <> '' Then Begin

      Selecionado := DBGrid_Grupos.Fields[0].Text;

      If (Ordem02 = Nil) Then Begin
        Ampulheta();
        Application.CreateForm(TOrdem02,Ordem02);

        //*** Obtem os Dados da Cota��o ***

        Nro_Ordem := DBGrid_Grupos.Fields[0].Text;

        ConexaoBD.SQL_Ordem_Rel.Close;
        ConexaoBD.SQL_Ordem_Rel.SQL.Clear;
        ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens Where fb_ordem_nro = ' + Trim(Nro_Ordem) );
        ConexaoBD.SQL_Ordem_Rel.Open;

        //*** Obtem os Dados dos Clientes ***

        Codigo_Fornecedor := ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_fornecedor').Text;

        ConexaoBD.SQL_Fornecedores.Close;
        ConexaoBD.SQL_Fornecedores.SQL.Clear;
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + Trim(Codigo_Fornecedor) );
        ConexaoBD.SQL_Fornecedores.Open;

        //*** Carrega os Dados Obtidos ***

        Ordem02.Nro_Ordem.Text                   := Nro_Ordem;

        Ordem02.Fornecedor_Numero.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

        Ordem02.Fornecedor_Codigo.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text;
        Ordem02.Fornecedor_IE.Text               := conexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_estadual.Text;

        Ordem02.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
        Ordem02.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
        Ordem02.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
        Ordem02.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
        Ordem02.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
        Ordem02.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
        Ordem02.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
        Ordem02.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
        Ordem02.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
        Ordem02.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
        Ordem02.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
        Ordem02.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

        Ordem02.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

        Ordem02.Fornecedor_Observacoes.Lines.Clear;
        Ordem02.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);

        Ordem02.Ordem_Funcionario.Text     := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_funcionario').Text;
        Ordem02.Ordem_Vendedor.Text        := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_vendedor').Text;

        Ordem02.Ordem_Data.Text            := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_data').Text;

        Ordem02.Ordem_Orcamento.Text       := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_orcamento_nro').Text;
        Ordem02.Ordem_Prazo.Text           := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_prazo_entrega').Text;
        Ordem02.Ordem_Condicao_Pgto_1.Text := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_cond_pgto_1').Text;

        Ordem02.Ordem_OBS_1.Text           := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_obs_1').Text;
        Ordem02.Ordem_OBS_2.Text           := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_obs_2').Text;
        Ordem02.Ordem_OBS_3.Text           := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_obs_3').Text;
        Ordem02.Ordem_OBS_4.Text           := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_obs_4').Text;
        Ordem02.Ordem_OBS_5.Text           := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_obs_5').Text;

        Ordem02.Ordem_Status.Text          := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_status').Text;
        Ordem02.Ordem_Entrega.Text         := Trim(conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_entrega').Text);

        Ordem02.Ordem_Utilizacao.Text      := conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_utilizacao').Text;

        If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_utilizacao').Text) = 'Industrializa��o' Then
           Begin
           Ordem02.Ordem_Utilizacao.ItemIndex := 0;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_utilizacao').Text) = 'Consumo' Then
           Begin
           Ordem02.Ordem_Utilizacao.ItemIndex := 1;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_utilizacao').Text) = 'Revenda' Then
           Begin
           Ordem02.Ordem_Utilizacao.ItemIndex := 2;
        End;

        Ordem02.observacao.Lines.Add(conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_observacao').Text);

        Ordem02.observacao.Lines.Clear;
        Ordem02.observacao.Lines.Add(Trim(DBG_Ordem_Observacao.Text));

        If(conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_frete_tipo').Text = 'F') Then
        Begin
            Ordem02.tipo_frete_fornecedor.Checked := True;
        End
        Else
        Begin
            Ordem02.tipo_frete_ibrasmak.Checked := True;
        End;

        If Trim(conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_opcao').Text) = 'MATERIA PRIMA' Then Begin
          Ordem02.Ordem_Opcao.ItemIndex := 0;
          End
        Else If Trim(conexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_opcao').Text) = 'CONSUMO' Then Begin
          Ordem02.Ordem_Opcao.ItemIndex := 1;
          End
        Else Begin
          Ordem02.Ordem_Opcao.ItemIndex := 2;
        End;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_desconto').Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Ordem02.Valor_Desconto.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_frete').Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Ordem02.Valor_Frete.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_vlr_total').Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Ordem02.Valor_Total.Text  := Vlr_Exibicao;

        If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_status').Text) = 'Em Aberto' Then
           Begin
           Ordem02.Ordem_Status.ItemIndex := 0;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_status').Text) = 'Emitida - Aguardando Entrega' Then
           Begin
           Ordem02.Ordem_Status.ItemIndex := 1;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_status').Text) = 'Confer�ncia de Itens' Then
           Begin
           Ordem02.Ordem_Status.ItemIndex := 2;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_status').Text) = 'Entregue' Then
           Begin
           Ordem02.Ordem_Status.ItemIndex := 3;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_status').Text) = 'Entregue Parcial' Then
           Begin
           Ordem02.Ordem_Status.ItemIndex := 4;
        End;

        If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_entrega').Text) = 'Aguardando' Then
           Begin
           Ordem02.Ordem_Entrega.ItemIndex := 0;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_entrega').Text) = 'Retirado' Then
           Begin
           Ordem02.Ordem_Entrega.ItemIndex := 1;
           End
        Else If Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_entrega').Text) = 'Entregue' Then
           Begin
           Ordem02.Ordem_Entrega.ItemIndex := 2;
        End;

        If( Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_empresa').Text) = 'IBRASMAK' ) Then
          Begin
          Ordem02.Ordem_Empresa.ItemIndex := 0;
          End
        Else If( Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_empresa').Text) = 'MONIBRAS' ) Then
          Begin
          Ordem02.Ordem_Empresa.ItemIndex := 1;
          End
        Else If( Trim(ConexaoBD.SQL_Ordem_Rel.FieldByName('fb_ordem_empresa').Text) = 'FERRAMENTARIA' ) Then
          Begin
          Ordem02.Ordem_Empresa.ItemIndex := 2;
        End;

        //*** Fecha SQL ***

        ConexaoBD.SQL_Ordem_Rel.Close;
        ConexaoBD.SQL_Fornecedores.Close;

        Seta();
      End;

      Ordem02.Show;

    End;
end;

procedure TOrdem00.Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TOrdem00.Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TOrdem00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_Ordem_Rel.Close;
     ConexaoBD.SQL_Ordem_Rel.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens Where fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' and fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End
        Else If Opcoes_Procura.Text = 'Nro' Then
           Begin
           ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens Where fb_ordem_nro = ' + Trim(Dados_Procura.Text) + ' and fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End
        Else If Opcoes_Procura.Text = 'Requisi��o' Then
           Begin
           ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens Where fb_ordem_requisicao = ' + Trim(Dados_Procura.Text) + ' and fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End
        Else If Opcoes_Procura.Text = 'C�digo do Produto' Then
           Begin
           ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens, fb_ordens_produtos Where fb_ordem_produto_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' and fb_ordem_nro = fb_ordem_produto_ordem and fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Group by fb_ordem_nro Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End
		    Else If Opcoes_Procura.Text = 'Descri��o do Produto' Then
           Begin
           ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens, fb_ordens_produtos Where fb_ordem_produto_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' and fb_ordem_nro = fb_ordem_produto_ordem and fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Group by fb_ordem_nro Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End
		    Else If Opcoes_Procura.Text = 'Desenho' Then
           Begin
           ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens, fb_ordens_produtos Where fb_ordem_produto_desenho Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' and fb_ordem_nro = fb_ordem_produto_ordem and fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Group by fb_ordem_nro Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End
		    Else If Opcoes_Procura.Text = 'Status' Then
           Begin
           ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens, fb_ordens_produtos Where fb_ordem_status Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' and fb_ordem_nro = fb_ordem_produto_ordem and fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Group by fb_ordem_nro Order By fb_ordem_data Desc, fb_ordem_nro Desc');
        End;

        End
     Else
        Begin

        If (Trim(Lista_Fornecedores.Text) <> '--- FORNECEDORES ---') And (Trim(Lista_Fornecedores.Text) <> '') Then
           Begin

           If Opcoes_Procura.Text = 'Fornecedor' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'Nro' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'Requisi��o' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'C�digo do Produto' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'Descri��o do Produto' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
  		     Else If Opcoes_Procura.Text = 'Desenho' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
    	     Else If Opcoes_Procura.Text = 'Status' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End;

           End
        Else
           Begin

           If Opcoes_Procura.Text = 'Fornecedor' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'Nro' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'Requisi��o' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'C�digo do Produto' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
           Else If Opcoes_Procura.Text = 'Descri��o do Produto' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
  		     Else If Opcoes_Procura.Text = 'Desenho' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' and fb_ordem_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
              End
    	     Else If Opcoes_Procura.Text = 'Status' Then
              Begin
              ConexaoBD.SQL_Ordem_Rel.SQL.Add('Select *, IF( fb_ordem_empresa = '+#39+'IBRASMAK'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ibrasmak, IF( fb_ordem_empresa = '+#39+'MONIBRAS'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_monibras, IF( fb_ordem_empresa = '+#39+'FERRAMENTARIA'+#39+', fb_ordem_vlr_total, 0 ) AS fb_ordem_vlr_total_ferramentaria from fb_ordens where fb_ordem_data >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_ordem_data <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_ordem_data Desc, fb_ordem_nro Desc');
           End;

        End;

     End;

     ConexaoBD.SQL_Ordem_Rel.Open;

     Seta();
end;

procedure TOrdem00.Carrega_Fornecedores();
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

procedure TOrdem00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Ordem00 := Nil;
end;

procedure TOrdem00.DBGrid_GruposDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If DBGrid_Grupos.Fields[4].Text = 'Em Aberto' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clRed;
        End
    Else If DBGrid_Grupos.Fields[4].Text = 'Emitida - Aguardando Entrega' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clOlive;
        End
    Else If DBGrid_Grupos.Fields[4].Text = 'Confer�ncia de Itens' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clGreen;
        End
    Else If DBGrid_Grupos.Fields[4].Text = 'Entregue' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clMoneyGreen;
        End
    Else If DBGrid_Grupos.Fields[4].Text = 'Entregue Parcial' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clTeal;
    End;

    DBGrid_Grupos.DefaultDrawDataCell(Rect, DBGrid_Grupos.columns[datacol].field, State);
end;

procedure TOrdem00.BT_ImprimirClick(Sender: TObject);
begin
    Ampulheta();

    Application.CreateForm(TOrdem03,Ordem03);

    Ordem03.QR_Periodo.Caption := 'Per�odo de ' + Trim(Data_Inicial.Text) + ' a ' + Trim(Data_Final.Text);

    Seta();

    Ordem03.QR_ProdutosComprados.Preview;
    Ordem03.QR_ProdutosComprados.Destroy;
    Ordem03.Destroy;
end;

end.
