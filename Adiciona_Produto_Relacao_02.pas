unit Adiciona_Produto_Relacao_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TAdicionaProdutoRelacao02 = class(TForm)
    Panel2: TPanel;
    DBGrid_FB_Produtos: TDBGrid;
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
    Total_Produtos: TLabel;
    Cliente_Tipo_Tabela: TEdit;
    Programa_Anterior: TEdit;
    Nro_Fornecedor: TEdit;
    Label4: TLabel;
    Produto_Tipo: TComboBox;
    DBG_Produto_Descricao_Detalhada: TDBMemo;
    Exibir_Somente_Produtos_Fornecedor: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure DBGrid_FB_ProdutosCellClick(Column: TColumn);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Verifica_Produto_Adicionado(): Boolean;

    procedure Exibe_Produtos();
    procedure Carrega_Tipo_Produto();

  public
    { Public declarations }
  end;

var
  AdicionaProdutoRelacao02: TAdicionaProdutoRelacao02;

implementation

uses Conexao_BD, Rotinas_Gerais, Pedidos_01, Pedidos_02,
  Notas_Fiscais_Entradas_00, Adiciona_Qtde_Produto_02, Cotacao_03,
  Cotacao_04, Ordem_01, Ordem_02, Adiciona_Qtde_Produto,
  Registro_Notas_Fiscais_Saidas_01, Pedidos_Pendentes_00, Mapa_Producao_00,
  Requisicao_03, Requisicao_04;

var Selecionado: string;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TAdicionaProdutoRelacao02.Verifica_Produto_Adicionado(): Boolean;

var
   Ind: Integer;
   Resultado: Boolean;

begin
     Ampulheta();

     Resultado := True;

     If (Trim(Programa_Anterior.Text) = 'Pedido-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Troca-Produto-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Pedidos-Pendentes') Or (Trim(Programa_Anterior.Text) = 'Mapa-Produção') Then
        Begin

        For Ind := 1 To Pedidos01.SGD_Produtos.RowCount Do
            Begin

            If Trim(Pedidos01.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Pedido-Alteracao' Then
        Begin

        For Ind := 1 To Pedidos02.SGD_Produtos.RowCount Do
            Begin

            If Trim(Pedidos02.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then
        Begin

        For Ind := 1 To Cotacao03.SGD_Produtos.RowCount Do
            Begin

            If Trim(Cotacao03.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then
        Begin

        For Ind := 1 To Cotacao04.SGD_Produtos.RowCount Do
            Begin

            If Trim(Cotacao04.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then
        Begin

        For Ind := 1 To Requisicao03.SGD_Produtos.RowCount Do
            Begin

            If Trim(Requisicao03.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then
        Begin

        For Ind := 1 To Requisicao04.SGD_Produtos.RowCount Do
            Begin

            If Trim(Requisicao04.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then
        Begin

        For Ind := 1 To Ordem01.SGD_Produtos.RowCount Do
            Begin

            If Trim(Ordem01.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then
        Begin

        For Ind := 1 To Ordem02.SGD_Produtos.RowCount Do
            Begin

            If Trim(Ordem02.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then
        Begin

        For Ind := 1 To Pedidos01.SGD_Produtos.RowCount Do
            Begin

            If Trim(Pedidos01.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

        End
     Else
        Begin

        For Ind := 1 To Pedidos02.SGD_Produtos.RowCount Do
            Begin

            If Trim(Pedidos02.SGD_Produtos.Cells[1,Ind]) = Trim(DBGrid_FB_Produtos.Fields[1].Text) Then
               Begin
               Resultado := False;
            End;
        End;

     End;

     Seta();

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TAdicionaProdutoRelacao02.Exibe_Produtos();
var Comando_SQL: string;
begin
    If Exibir_Somente_Produtos_Fornecedor.Checked = True Then
       Begin

        If Trim(Programa_Anterior.Text) = 'Pedido-Inclusao' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then Begin
            if Trim(Nro_Fornecedor.Text) <> '' then
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' Order By fb_produto_codigo'
            else
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then Begin
            if Trim(Nro_Fornecedor.Text) <> '' then
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' Order By fb_produto_codigo'
            else
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else Begin
            Comando_SQL := 'Select * from fb_produtos Order By fb_produto_codigo';
        End;

       End
    Else
       Begin

        If Trim(Programa_Anterior.Text) = 'Pedido-Inclusao' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then Begin
            if Trim(Nro_Fornecedor.Text) <> '' then
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo'
            else
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then Begin
            if Trim(Nro_Fornecedor.Text) <> '' then
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo'
            else
                Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then Begin
            Comando_SQL := 'Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'N'+#39+' Order By fb_produto_codigo';
            End
        Else Begin
            Comando_SQL := 'Select * from fb_produtos Order By fb_produto_codigo';
        End;

    End;

    ConexaoBD.SQL_FB_Produtos.Close;
    ConexaoBD.SQL_FB_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Produtos.Open;

    DBGrid_FB_Produtos.Visible := True;

    Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_FB_Produtos.RecordCount);
end;

procedure TAdicionaProdutoRelacao02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TAdicionaProdutoRelacao02.FormShow(Sender: TObject);
begin
    Ampulheta();

    If (Trim(Programa_Anterior.Text) = 'Cotação-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Cotação-Alteração')
    Or (Trim(Programa_Anterior.Text) = 'Ordem-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Ordem-Alteração')
    Or (Trim(Programa_Anterior.Text) = 'Requisição-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Requisição-Alteração')
    Or (Trim(Programa_Anterior.Text) = 'Pedido-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Pedido-Alteracao')
    Or (Trim(Programa_Anterior.Text) = 'Troca-Produto-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão') Then
        Begin
        Label4.Visible       := True;
        Produto_Tipo.Visible := True;

        Carrega_Tipo_Produto();

        If (Trim(Programa_Anterior.Text) = 'Pedido-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Pedido-Alteracao')
        Or (Trim(Programa_Anterior.Text) = 'Troca-Produto-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão') Then
           Begin
           Produto_Tipo.ItemIndex := Obtem_Nro_Tipo_Produto('1'); // Produto Acabado
        End;
    End;
    Exibe_Produtos();

    Seta();
    Dados_Procura.SetFocus;
end;

procedure TAdicionaProdutoRelacao02.BT_SairClick(Sender: TObject);
begin
     AdicionaProdutoRelacao02.Close;
end;

procedure TAdicionaProdutoRelacao02.BT_ProcurarClick(Sender: TObject);
begin
    Ampulheta();

    ConexaoBD.SQL_FB_Produtos.SQL.Clear;

    If (Trim(Programa_Anterior.Text) = 'Cotação-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Cotação-Alteração')
    Or (Trim(Programa_Anterior.Text) = 'Ordem-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Ordem-Alteração') Then Begin

        If Exibir_Somente_Produtos_Fornecedor.Checked = True Then
           Begin

            If Trim(Dados_Procura.Text) <> '' Then Begin
                If Opcoes_Procura.Text = 'Código' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
                  End
                Else If Opcoes_Procura.Text = 'Referência' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_referencia Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
                  End
                Else If Opcoes_Procura.Text = 'Descrição' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Desenho' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_desenho Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'OS' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_os Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_equipamento Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Material' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_material Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                End;
                End
            Else Begin
                If Opcoes_Procura.Text = 'Código' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
                  End
                Else If Opcoes_Procura.Text = 'Referência' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
                  End
                Else If Opcoes_Procura.Text = 'Descrição' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Desenho' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_desenho');
                  End
                Else If Opcoes_Procura.Text = 'OS' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_os');
                  End
                Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_equipamento');
                  End
                Else If Opcoes_Procura.Text = 'Material' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Trim(Nro_Fornecedor.Text) + ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_material');
                End;
            End;

           End
        Else
           Begin

            If Trim(Dados_Procura.Text) <> '' Then Begin
                If Opcoes_Procura.Text = 'Código' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
                  End
                Else If Opcoes_Procura.Text = 'Referência' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_referencia Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
                  End
                Else If Opcoes_Procura.Text = 'Descrição' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Desenho' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_desenho Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'OS' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_os Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_equipamento Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Material' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_material Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                End;
                End
            Else Begin
                If Opcoes_Procura.Text = 'Código' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
                  End
                Else If Opcoes_Procura.Text = 'Referência' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
                  End
                Else If Opcoes_Procura.Text = 'Descrição' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
                  End
                Else If Opcoes_Procura.Text = 'Desenho' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_desenho');
                  End
                Else If Opcoes_Procura.Text = 'OS' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_os');
                  End
                Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_equipamento');
                  End
                Else If Opcoes_Procura.Text = 'Material' Then Begin
                  ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_material');
                End;
            End;

        End;

        End
    Else If (Trim(Programa_Anterior.Text) = 'Pedido-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Pedido-Alteracao')
    Or (Trim(Programa_Anterior.Text) = 'Troca-Produto-Inclusao') Or (Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão') Then Begin

        If Trim(Dados_Procura.Text) <> '' Then Begin
            If Opcoes_Procura.Text = 'Código' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
              End
            Else If Opcoes_Procura.Text = 'Referência' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_referencia Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
              End
            Else If Opcoes_Procura.Text = 'Descrição' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Desenho' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_desenho Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'OS' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_os Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_equipamento Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Material' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_material Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
            End;
            End
        Else Begin
            If Opcoes_Procura.Text = 'Código' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
              End
            Else If Opcoes_Procura.Text = 'Referência' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
              End
            Else If Opcoes_Procura.Text = 'Descrição' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Desenho' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_desenho');
              End
            Else If Opcoes_Procura.Text = 'OS' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_os');
              End
            Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_equipamento');
              End
            Else If Opcoes_Procura.Text = 'Material' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_material');
            End;
        End;

        End
    Else Begin

        If Trim(Dados_Procura.Text) <> '' Then Begin
            If Opcoes_Procura.Text = 'Código' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
              End
            Else If Opcoes_Procura.Text = 'Referência' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_referencia Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
              End
            Else If Opcoes_Procura.Text = 'Descrição' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Desenho' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_desenho Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'OS' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_os Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_equipamento Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Material' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_material Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' And fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
            End;
            End
        Else Begin
            If Opcoes_Procura.Text = 'Código' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_codigo');
              End
            Else If Opcoes_Procura.Text = 'Referência' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_referencia');
              End
            Else If Opcoes_Procura.Text = 'Descrição' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_descricao');
              End
            Else If Opcoes_Procura.Text = 'Desenho' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_desenho');
              End
            Else If Opcoes_Procura.Text = 'OS' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_os');
              End
            Else If Opcoes_Procura.Text = 'Equipamento' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_equipamento');
              End
            Else If Opcoes_Procura.Text = 'Material' Then Begin
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Obtem_Nro_Antes_Traco(Produto_Tipo.Text) + ' Order By fb_produto_material');
            End;
        End;

     End;
     ConexaoBD.SQL_FB_Produtos.Open;

     Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_FB_Produtos.RecordCount);

     Seta();
end;

procedure TAdicionaProdutoRelacao02.DBGrid_FB_ProdutosCellClick(
  Column: TColumn);
var MSG_Texto: String;
    Checa_Produto: Boolean;
    Ind, Erro: Integer;
    Vlr_Numero: Real;
    Vlr_Exibicao: String;
begin
    If DBGrid_FB_Produtos.Fields[1].Text <> '' Then Begin
        Selecionado := DBGrid_FB_Produtos.Fields[1].Text;

        If Verifica_Produto_Adicionado() Then Begin

            If Trim(Programa_Anterior.Text) = 'Troca-Produto-Inclusao' Then Begin
              AdicionaQtdeProduto.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
              AdicionaQtdeProduto.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
              AdicionaQtdeProduto.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
              AdicionaQtdeProduto.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;
              AdicionaQtdeProduto.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;

              AdicionaQtdeProduto.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
              AdicionaQtdeProduto.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

              AdicionaProdutoRelacao02.Close;
              End
            Else Begin
              Application.CreateForm(TAdicionaQtdeProduto02,AdicionaQtdeProduto02);
              If Trim(Programa_Anterior.Text) = 'Pedido-Inclusao' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Pedidos01.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Pedidos01.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := DBGrid_FB_Produtos.Fields[3].Text;
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);
                End
              Else If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Cotacao03.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Cotacao03.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '1';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Desenho.Text        := DBGrid_FB_Produtos.Fields[8].Text;
                AdicionaQtdeProduto02.Adiciona_OS.Text             := DBGrid_FB_Produtos.Fields[9].Text;
                AdicionaQtdeProduto02.Adiciona_Equipamento.Text    := DBGrid_FB_Produtos.Fields[10].Text;
                AdicionaQtdeProduto02.Adiciona_Material.Text       := DBGrid_FB_Produtos.Fields[11].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

                AdicionaQtdeProduto02.Adiciona_IPI.Enabled := True;
                End
              Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Cotacao04.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Cotacao04.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '1';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Desenho.Text        := DBGrid_FB_Produtos.Fields[8].Text;
                AdicionaQtdeProduto02.Adiciona_OS.Text             := DBGrid_FB_Produtos.Fields[9].Text;
                AdicionaQtdeProduto02.Adiciona_Equipamento.Text    := DBGrid_FB_Produtos.Fields[10].Text;
                AdicionaQtdeProduto02.Adiciona_Material.Text       := DBGrid_FB_Produtos.Fields[11].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

                AdicionaQtdeProduto02.Adiciona_IPI.Enabled := True;
                End
              Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Requisicao03.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Requisicao03.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '1';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Desenho.Text        := DBGrid_FB_Produtos.Fields[8].Text;
                AdicionaQtdeProduto02.Adiciona_OS.Text             := DBGrid_FB_Produtos.Fields[9].Text;
                AdicionaQtdeProduto02.Adiciona_Equipamento.Text    := DBGrid_FB_Produtos.Fields[10].Text;
                AdicionaQtdeProduto02.Adiciona_Material.Text       := DBGrid_FB_Produtos.Fields[11].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

                AdicionaQtdeProduto02.Adiciona_IPI.Enabled := True;
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Visible := False;


                AdicionaQtdeProduto02.Adiciona_IPI.Visible := False;
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Visible := False;
                AdicionaQtdeProduto02.Label2.Visible := False;
                AdicionaQtdeProduto02.Label7.Visible := False;
                End
              Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Requisicao04.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Requisicao04.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '1';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Desenho.Text        := DBGrid_FB_Produtos.Fields[8].Text;
                AdicionaQtdeProduto02.Adiciona_OS.Text             := DBGrid_FB_Produtos.Fields[9].Text;
                AdicionaQtdeProduto02.Adiciona_Equipamento.Text    := DBGrid_FB_Produtos.Fields[10].Text;
                AdicionaQtdeProduto02.Adiciona_Material.Text       := DBGrid_FB_Produtos.Fields[11].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

                AdicionaQtdeProduto02.Adiciona_IPI.Enabled := True;
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Visible := False;


                AdicionaQtdeProduto02.Adiciona_IPI.Visible := False;
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Visible := False;
                AdicionaQtdeProduto02.Label2.Visible := False;
                AdicionaQtdeProduto02.Label7.Visible := False;
                End
              Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Ordem01.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Ordem01.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '1';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Desenho.Text        := DBGrid_FB_Produtos.Fields[8].Text;
                AdicionaQtdeProduto02.Adiciona_OS.Text             := DBGrid_FB_Produtos.Fields[9].Text;
                AdicionaQtdeProduto02.Adiciona_Equipamento.Text    := DBGrid_FB_Produtos.Fields[10].Text;
                AdicionaQtdeProduto02.Adiciona_Material.Text       := DBGrid_FB_Produtos.Fields[11].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

                AdicionaQtdeProduto02.Adiciona_IPI.Enabled := True;
                End
              Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Ordem02.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Ordem02.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '1';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Desenho.Text        := DBGrid_FB_Produtos.Fields[8].Text;
                AdicionaQtdeProduto02.Adiciona_OS.Text             := DBGrid_FB_Produtos.Fields[9].Text;
                AdicionaQtdeProduto02.Adiciona_Equipamento.Text    := DBGrid_FB_Produtos.Fields[10].Text;
                AdicionaQtdeProduto02.Adiciona_Material.Text       := DBGrid_FB_Produtos.Fields[11].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

                AdicionaQtdeProduto02.Adiciona_IPI.Enabled := True;
                End
              Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(RegistroNotasFiscaisSaidas01.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(RegistroNotasFiscaisSaidas01.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := DBGrid_FB_Produtos.Fields[3].Text;
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

                AdicionaQtdeProduto02.Adiciona_IPI.Enabled := True;
                End
              Else If Trim(Programa_Anterior.Text) = 'Pedidos-Pendentes' Then Begin
                PedidosPendentes00.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                PedidosPendentes00.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                PedidosPendentes00.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                End
              Else If Trim(Programa_Anterior.Text) = 'Mapa-Produção' Then Begin
                MapaProducao00.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                MapaProducao00.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                MapaProducao00.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                End
              Else Begin
                AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
                AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Pedidos02.SGD_Produtos.Col);
                AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Pedidos02.SGD_Produtos.RowCount - 1);
                AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_FB_Produtos.Fields[1].Text;
                AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_FB_Produtos.Fields[0].Text;
                AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_FB_Produtos.Fields[2].Text;
                AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '0';
                AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := DBGrid_FB_Produtos.Fields[3].Text;
                AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_FB_Produtos.Fields[4].Text;
                AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_FB_Produtos.Fields[5].Text;

                AdicionaQtdeProduto02.Adiciona_CF.Text             := DBGrid_FB_Produtos.Fields[6].Text;
                AdicionaQtdeProduto02.Adiciona_ST.Text             := DBGrid_FB_Produtos.Fields[7].Text;

                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Clear;
                AdicionaQtdeProduto02.Adiciona_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);
              End;

              If (Trim(Programa_Anterior.Text) <> 'Pedidos-Pendentes') And (Trim(Programa_Anterior.Text) <> 'Mapa-Produção') Then Begin
                AdicionaQtdeProduto02.ShowModal;
                AdicionaQtdeProduto02.Destroy;

                ConexaoBD.SQL_FB_Produtos.Locate('fb_produto_codigo',Trim(Selecionado),[]);
                End
              Else Begin
                AdicionaProdutoRelacao02.Close;
              End;

            End;

            End
        Else Begin
            MSG_Erro('Este Produto já foi Adicionado na relação.')
        End;

    End;
end;

procedure TAdicionaProdutoRelacao02.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaProdutoRelacao02.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaProdutoRelacao02.Carrega_Tipo_Produto();
begin
     // Obtem os Tipos de Produtos

     ConexaoBD.SQL_Tipo_Produto.Close;
     ConexaoBD.SQL_Tipo_Produto.SQL.Clear;
     ConexaoBD.SQL_Tipo_Produto.SQL.Add('Select * from fb_tipos_produtos Order By fb_tipo_produto_descricao');
     ConexaoBD.SQL_Tipo_Produto.Open;

     Produto_Tipo.Items.Clear;

     If conexaoBD.SQL_Tipo_Produto.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Tipo_Produto.First;

        While Not conexaoBD.SQL_Tipo_Produto.Eof Do
              begin
              Produto_Tipo.Items.Add(IntToStr(conexaoBD.SQL_Tipo_Produtofb_tipo_produto_codigo.AsInteger)+' - '+conexaoBD.SQL_Tipo_Produtofb_tipo_produto_descricao.AsString);
              conexaoBD.SQL_Tipo_Produto.Next;
        End;
     end;

     ConexaoBD.SQL_Tipo_Produto.Close;

     Produto_Tipo.ItemIndex := 0;
end;

end.
