unit Fornecedor_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TFornecedor00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Panel2: TPanel;
    DBGrid_Fornecedores: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Fornecedores: TLabel;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    DBG_Fornecedor_Observacao: TDBMemo;
    Programa_Anterior: TEdit;
    Resultado_Adiciona_Fornecedor_Pedido: TEdit;
    Fornecedor_Area: TComboBox;
    Label4: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_FornecedoresCellClick(Column: TColumn);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function Adiciona_Fornecedor_Pedido():Integer;

    procedure Procura_Fornecedor();

  public
    { Public declarations }
  end;

var
  Fornecedor00: TFornecedor00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, Fornecedor_01, Fornecedor_02,
  Adiciona_Fornecedor_Pedido, Cotacao_03, Cotacao_04, Ordem_01, Ordem_02,
  Notas_Fiscais_Entradas_01, Notas_Fiscais_Entradas_02, Fixo_01, Fixo_02,
  Fixo_00, Avulso_00, Avulso_01, Avulso_02, Rel_Contas_Pagar_00,
  Requisicao_03, Requisicao_04, Registro_Notas_Fiscais_Saidas_01,
  Registro_Papeletas_Saidas_01, Registro_Notas_Fiscais_Saidas_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TFornecedor00.Adiciona_Fornecedor_Pedido():Integer;
begin
     If Trim(Programa_Anterior.Text) <> '' Then
        Begin
        Application.CreateForm(TAdicionaFornecedorPedido,AdicionaFornecedorPedido);

        AdicionaFornecedorPedido.Fornecedor_Selecionado.Caption := DBGrid_Fornecedores.Fields[2].Text;
        AdicionaFornecedorPedido.Programa_Anterior.Text      := Programa_Anterior.Text;

        AdicionaFornecedorPedido.ShowModal;
        AdicionaFornecedorPedido.Destroy;

        Result := StrToInt(Resultado_Adiciona_Fornecedor_Pedido.Text);
        End
     Else
        Begin
        Result := 1;
     End;
end;

//******************
//*** Procedures ***
//******************

procedure TFornecedor00.BT_SairClick(Sender: TObject);
begin
     Fornecedor00.Close;
end;

procedure TFornecedor00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TFornecedor00.FormShow(Sender: TObject);
begin
    Procura_Fornecedor();
    Dados_Procura.SetFocus;
end;

procedure TFornecedor00.Procura_Fornecedor();
var Area: String;
begin
     Ampulheta();

     ConexaoBD.SQL_Fornecedores.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If (Trim(Fornecedor_Area.Text) = 'Compras') then begin
          Area := ' and fb_fornecedor_area = '+#39+ 'Compras' +#39+ ' ';
          end
        else If (Trim(Fornecedor_Area.Text) = 'Contas a Receber') then begin
          Area := ' and fb_fornecedor_area = '+#39+ 'Contas a Receber' +#39+ ' ';
          end
        else begin
          Area := '';
        end;

        If Opcoes_Procura.Text = 'Nro' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + Trim(Dados_Procura.Text) + Area+' Order By fb_fornecedor_numero');
           End
        Else If Opcoes_Procura.Text = 'Nome Fantasia' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_nome Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+Area+' Order By fb_fornecedor_nome');
           End
        Else If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+Area+' Order By fb_fornecedor_codigo');
           End
        Else If Opcoes_Procura.Text = 'Razão Social' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_razao_social Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+Area+' Order By fb_fornecedor_razao_social');
           End
        Else If Opcoes_Procura.Text = 'Endereço' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_endereco Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+Area+' Order By fb_fornecedor_endereco');
           End
        Else If Opcoes_Procura.Text = 'Bairro' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_bairro Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+Area+' Order By fb_fornecedor_bairro');
           End
        Else If Opcoes_Procura.Text = 'Cidade' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_cidade Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+Area+' Order By fb_fornecedor_cidade');
           End
        Else If Opcoes_Procura.Text = 'Estado' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_estado = ' +#39+ Trim(Dados_Procura.Text) +#39+Area+' Order By fb_fornecedor_estado');
           End
        Else If Opcoes_Procura.Text = 'CEP' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_cep Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+Area+' Order By fb_fornecedor_cep');
        End;

        End
     Else
        Begin

        If (Trim(Fornecedor_Area.Text) = 'Compras') then begin
          Area := ' where fb_fornecedor_area = '+#39+ 'Compras' +#39+ ' ';
          end
        else If (Trim(Fornecedor_Area.Text) = 'Contas a Receber') then begin
          Area := ' where fb_fornecedor_area = '+#39+ 'Contas a Receber' +#39+ ' ';
          end
        else begin
          Area := '';
        end;

        If Opcoes_Procura.Text = 'Nro' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_numero');
           End
        Else If Opcoes_Procura.Text = 'Nome Fantasia' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_nome');
           End
        Else If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_codigo');
           End
        Else If Opcoes_Procura.Text = 'Razão Social' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_razao_social');
           End
        Else If Opcoes_Procura.Text = 'Endereço' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_endereco');
           End
        Else If Opcoes_Procura.Text = 'Bairro' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_bairro');
           End
        Else If Opcoes_Procura.Text = 'Cidade' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_cidade');
           End
        Else If Opcoes_Procura.Text = 'Estado' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_estado');
           End
        Else If Opcoes_Procura.Text = 'CEP' Then
           Begin
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores '+Area+' Order By fb_fornecedor_cep');
        End;

     End;

     ConexaoBD.SQL_Fornecedores.Open;

     Total_Fornecedores.Caption := IntToStr(ConexaoBD.SQL_Fornecedores.RecordCount);

     Seta();
end;

procedure TFornecedor00.BT_ProcurarClick(Sender: TObject);
begin
     Procura_Fornecedor();
end;

procedure TFornecedor00.BT_IncluirClick(Sender: TObject);
begin
     Fornecedor00.Visible := False;

     Application.CreateForm(TFornecedor01,Fornecedor01);
     Fornecedor01.ShowModal;
     Fornecedor01.Destroy;

     Fornecedor00.Visible := True;
end;

procedure TFornecedor00.DBGrid_FornecedoresCellClick(Column: TColumn);
var
    Codigo_Fornecedor: String;
    Selecionado: string;
begin
     If DBGrid_Fornecedores.Fields[0].Text <> '' Then Begin
        Selecionado := DBGrid_Fornecedores.Fields[0].Text;

        If Adiciona_Fornecedor_Pedido() = 0 Then
           Begin

           Codigo_Fornecedor := DBGrid_Fornecedores.Fields[0].Text;

           conexaoBD.SQL_Fornecedores.Close;
           conexaoBD.SQL_Fornecedores.SQL.Clear;
           conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ Codigo_Fornecedor );
           conexaoBD.SQL_Fornecedores.Open;

           If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then
              Begin
              Cotacao03.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

              Cotacao03.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
              Cotacao03.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
              Cotacao03.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
              Cotacao03.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
              Cotacao03.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
              Cotacao03.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
              Cotacao03.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
              Cotacao03.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
              Cotacao03.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
              Cotacao03.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
              Cotacao03.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
              Cotacao03.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;
              Cotacao03.Cotacao_Vendedor.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;

              Cotacao03.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

              Cotacao03.Fornecedor_Observacoes.Lines.Clear;
              Cotacao03.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
              End
           Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then
              Begin
              Cotacao04.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

              Cotacao04.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
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
              Cotacao04.Cotacao_Vendedor.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;

              Cotacao04.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

              Cotacao04.Fornecedor_Observacoes.Lines.Clear;
              Cotacao04.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
              End
           Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then
              Begin
              Requisicao03.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

              Requisicao03.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
              Requisicao03.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
              Requisicao03.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
              Requisicao03.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
              Requisicao03.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
              Requisicao03.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
              Requisicao03.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
              Requisicao03.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
              Requisicao03.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
              Requisicao03.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
              Requisicao03.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
              Requisicao03.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

              Requisicao03.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

              Requisicao03.Fornecedor_Observacoes.Lines.Clear;
              Requisicao03.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
              End
           Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then
              Begin
              Requisicao04.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

              Requisicao04.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
              Requisicao04.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
              Requisicao04.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
              Requisicao04.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
              Requisicao04.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
              Requisicao04.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
              Requisicao04.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
              Requisicao04.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
              Requisicao04.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
              Requisicao04.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
              Requisicao04.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
              Requisicao04.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

              Requisicao04.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

              Requisicao04.Fornecedor_Observacoes.Lines.Clear;
              Requisicao04.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
              End
           Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then
              Begin
              Ordem01.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

              Ordem01.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
              Ordem01.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
              Ordem01.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
              Ordem01.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
              Ordem01.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
              Ordem01.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
              Ordem01.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
              Ordem01.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
              Ordem01.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
              Ordem01.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
              Ordem01.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
              Ordem01.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;
              Ordem01.Ordem_Vendedor.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;

              Ordem01.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

              Ordem01.Fornecedor_Observacoes.Lines.Clear;
              Ordem01.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
              End
           Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then
              Begin
              Ordem02.Fornecedor_Numero.Text      := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

              Ordem02.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
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
              Ordem02.Ordem_Vendedor.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;

              Ordem02.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

              Ordem02.Fornecedor_Observacoes.Lines.Clear;
              Ordem02.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);
              End
           Else If Trim(Programa_Anterior.Text) = 'Entrada-Inclusao' Then
              Begin
              NotasFiscaisEntradas01.Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              NotasFiscaisEntradas01.Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Entrada-Alteracao' Then
              Begin
              NotasFiscaisEntradas02.Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              NotasFiscaisEntradas02.Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Titulo_Fixo_Inclusao' Then
              Begin
              Fixo01.Fixo_Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              Fixo01.Fixo_Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Titulo_Fixo_Alteracao' Then
              Begin
              Fixo02.Fixo_Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              Fixo02.Fixo_Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Titulo_Fixo' Then
              Begin
              Fixo00.Fixo_Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              Fixo00.Fixo_Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Avulso' Then
              Begin
              Avulso00.Avulso_Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              Avulso00.Avulso_Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Avulso_Inclusao' Then
              Begin
              Avulso01.Avulso_Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              Avulso01.Avulso_Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Avulso_Alteracao' Then
              Begin
              Avulso02.Avulso_Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              Avulso02.Avulso_Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Rel_Contas_Pagar' Then
              Begin
              RelContasPagar00.Avulso_Fornecedor_Numero.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
              RelContasPagar00.Avulso_Fornecedor_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then
              Begin
              RegistroNotasFiscaisSaidas01.Cliente_Codigo.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text;
              RegistroNotasFiscaisSaidas01.Cliente_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão-MB' Then
              Begin
              RegistroNotasFiscaisSaidas02.Cliente_Codigo.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text;
              RegistroNotasFiscaisSaidas02.Cliente_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
              End
           Else If Trim(Programa_Anterior.Text) = 'Papeletas-Inclusão' Then
              Begin
              RegistroPapeletasSaidas01.Cliente_Codigo.Text := conexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text;
              RegistroPapeletasSaidas01.Cliente_Nome.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           End; 

           Fornecedor00.Close;

           End
        Else
           Begin
           Fornecedor00.Visible := False;

           Ampulheta();
           Application.CreateForm(TFornecedor02,Fornecedor02);

           //*** Obtem os Dados do Cliente ***

           Codigo_Fornecedor := DBGrid_Fornecedores.Fields[0].Text;

           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Codigo_Fornecedor) + #39 );
           ConexaoBD.SQL_Fornecedores.Open;

           //*** Carrega os Dados Obtidos ***

           Fornecedor02.Fornecedor_Numero.Text       := ConexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
           Fornecedor02.Fornecedor_Codigo_CNPJ.Text  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.AsString;

           Fornecedor02.Fornecedor_Nome.Text                 := ConexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
           Fornecedor02.Fornecedor_Razao_Social.Text         := ConexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Fornecedor02.Fornecedor_Inscricao_Municipal.Text  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_municipal.Text;
           Fornecedor02.Fornecedor_Inscricao_Estadual.Text   := ConexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_estadual.Text;
           Fornecedor02.Fornecedor_Endereco.Text             := ConexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Fornecedor02.Fornecedor_Bairro.Text               := ConexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Fornecedor02.Fornecedor_Cidade.Text               := ConexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Fornecedor02.Fornecedor_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Fornecedor02.Fornecedor_Cep.Text                  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Fornecedor02.Fornecedor_Fone.Text                 := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone.Text;
           Fornecedor02.Fornecedor_Fax.Text                  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fax.Text;
           Fornecedor02.Fornecedor_Contato.Text              := ConexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Fornecedor02.Fornecedor_Fone_Comercial.Text       := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Fornecedor02.Fornecedor_Fone_Celular.Text         := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Fornecedor02.Fornecedor_Fone_Fax.Text             := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Fornecedor02.Fornecedor_Data_Inclusao.Text        := ConexaoBD.SQL_Fornecedoresfb_fornecedor_data_inclusao.Text;
           Fornecedor02.Fornecedor_Data_Alteracao.Text       := ConexaoBD.SQL_Fornecedoresfb_fornecedor_data_alteracao.Text;
           Fornecedor02.Fornecedor_Data_Ultima_Compra.Text   := ConexaoBD.SQL_Fornecedoresfb_fornecedor_data_ultima_compra.Text;

           if(ConexaoBD.SQL_Fornecedoresfb_fornecedor_area.Text = 'Contas a Receber' )then begin
             Fornecedor02.Fornecedor_Area.ItemIndex := 1;
             end
           else begin
             Fornecedor02.Fornecedor_Area.ItemIndex := 0;
           end;

           Fornecedor02.Fornecedor_Observacoes.Lines.Clear;
           Fornecedor02.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);

           Fornecedor02.Fornecedor_Pais.ItemIndex := Obtem_Nro_Pais(ConexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);

           Fornecedor02.Fornecedor_Email.Text                := ConexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;
           Fornecedor02.Fornecedor_Email_NFe.Text            := ConexaoBD.SQL_Fornecedoresfb_fornecedor_email_nfe.Text;
           Fornecedor02.Fornecedor_Site.Text                 := ConexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           //*** Fecha SQL ***

           ConexaoBD.SQL_Fornecedores.Close;

           Seta();

           Fornecedor02.ShowModal;
           Fornecedor02.Destroy;

           Fornecedor00.Visible := True;   

           ConexaoBD.SQL_Fornecedores.Locate('fb_fornecedor_numero',Trim(Selecionado),[]);
        End;

     End;
end;

procedure TFornecedor00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFornecedor00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Fornecedor00 := Nil;
end;

end.
