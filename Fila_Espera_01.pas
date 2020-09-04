unit Fila_Espera_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TFilaEspera01 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Label12: TLabel;
    producao_numero_os: TEdit;
    Label1: TLabel;
    producao_numero: TEdit;
    Label2: TLabel;
    producao_data_os: TEdit;
    Label3: TLabel;
    producao_codigo_produto: TEdit;
    Label4: TLabel;
    producao_descricao_produto: TEdit;
    Label5: TLabel;
    producao_data_inicio: TEdit;
    Label6: TLabel;
    producao_status: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    producao_data_final: TEdit;
    Label24: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label30: TLabel;
    Label34: TLabel;
    Label31: TLabel;
    DBGrid_Custos: TDBGrid;
    Label26: TLabel;
    Qtde_Sequencia_Estrutura: TLabel;
    Label25: TLabel;
    Opcao_Visualizar: TComboBox;
    Label8: TLabel;
    Linhas_Selecionadas: TMemo;
    Label9: TLabel;
    Acao_Producao: TComboBox;
    Opcao_Status: TComboBox;
    Label10: TLabel;
    Acao_Observacao: TEdit;
    Label11: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_CustosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Opcao_VisualizarChange(Sender: TObject);
    procedure DBGrid_CustosCellClick(Column: TColumn);
    procedure Acao_ProducaoChange(Sender: TObject);
    procedure Opcao_StatusChange(Sender: TObject);
  private
    { Private declarations }

    procedure Carrega_Estrutura();
    procedure Executa_Acao();
    procedure Executa_Status();

  public
    { Public declarations }
  end;

var
  FilaEspera01: TFilaEspera01;

implementation

uses Conexao_BD, Rotinas_Gerais, Fila_Espera_00, Requisicao_03, DB;

{$R *.dfm}

procedure TFilaEspera01.Carrega_Estrutura();

var
   Visualizar_Estrutura, Comando_SQL: String;
   
begin
     //*** Obtem a Estrutura dos Produtos ***

     Ampulheta();

     If Trim(Opcao_Status.Text) = '--- Todos ---' Then
        Begin

        If Trim(Opcao_Visualizar.Text) = '--- Todos ---' Then
           Begin
           Visualizar_Estrutura := '';
           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Etapa' Then
           Begin
           Visualizar_Estrutura := 'ET';
           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Processo' Then
           Begin
           Visualizar_Estrutura := 'PR';
           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Sub-Processo' Then
           Begin
           Visualizar_Estrutura := 'SP';
           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Item' Then
           Begin
           Visualizar_Estrutura := 'IT';
           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
        End;

        End
     Else
        Begin

        Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' ';

        If Opcao_Status.Text = 'Aguardando' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Aguardando' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Produzindo' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Produzindo' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Parado' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Parado' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Finalizado' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Finalizado' +#39+ ' ';
        End;

        If Trim(Opcao_Visualizar.Text) = '--- Todos ---' Then
           Begin
           Visualizar_Estrutura := '';
           Comando_SQL := Comando_SQL + ' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Etapa' Then
           Begin
           Visualizar_Estrutura := 'ET';
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Processo' Then
           Begin
           Visualizar_Estrutura := 'PR';
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Sub-Processo' Then
           Begin
           Visualizar_Estrutura := 'SP';
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Item' Then
           Begin
           Visualizar_Estrutura := 'IT';
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
        End;

     End;

     ConexaoBD.SQL_Producao_Estrutura.Close;
     ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
     ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Producao_Estrutura.Open;

     Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Producao_Estrutura.RecordCount);

     Seta();
end;

procedure TFilaEspera01.Executa_Acao();

var
   Comando_SQL, Porcentagem_Resultado: String;
   Linha: Integer;
   Porcentagem_Total, Porcentagem_Obtida: Real;   

begin
     If Trim(Linhas_Selecionadas.Text) <> '' Then
        Begin

        If Trim(Acao_Producao.Text) = 'Gerar Requisição' Then
           Begin

           If (Requisicao03 = Nil) Then
              Begin
              Application.CreateForm(TRequisicao03,Requisicao03);

              //*** Preparação do StringGrid ***

              //*** Quantidade ***
              Requisicao03.SGD_Produtos.Cells[0,0]   := 'Quantidade';
              Requisicao03.SGD_Produtos.ColWidths[0] := 60;

              //*** Código do Produto ***
              Requisicao03.SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
              Requisicao03.SGD_Produtos.ColWidths[1] := 65;

              //*** Referência do Produto ***
              Requisicao03.SGD_Produtos.Cells[2,0]   := 'Referência';
              Requisicao03.SGD_Produtos.ColWidths[2] := -1;

              //*** Descrição do Produto ***
              Requisicao03.SGD_Produtos.Cells[3,0]   := 'Descrição';
              Requisicao03.SGD_Produtos.ColWidths[3] := 200;

              //*** Unidade do Produto ***
              Requisicao03.SGD_Produtos.Cells[4,0]   := 'Unidade';
              Requisicao03.SGD_Produtos.ColWidths[4] := 45;

              //*** Valor Unitário ***
              Requisicao03.SGD_Produtos.Cells[5,0]   := 'Valor (R$)';
              Requisicao03.SGD_Produtos.ColWidths[5] := (-1);

              //*** Valor Total ***
              Requisicao03.SGD_Produtos.Cells[6,0]   := 'Vlr.Total (R$)';
              Requisicao03.SGD_Produtos.ColWidths[6] := (-1);

              //*** Quantidade de Estoque Atual ***
              Requisicao03.SGD_Produtos.Cells[7,0]   := 'Qtde Est.Atual';
              Requisicao03.SGD_Produtos.ColWidths[7] := (-1);

              //*** Porcentagem do IPI ***
              Requisicao03.SGD_Produtos.Cells[8,0]   := 'Porcentagem do IPI';
              Requisicao03.SGD_Produtos.ColWidths[8] := (-1);

              //*** Desenho ***
              Requisicao03.SGD_Produtos.Cells[9,0]   := 'Desenho';
              Requisicao03.SGD_Produtos.ColWidths[9] := 75;

              //*** OS ***
              Requisicao03.SGD_Produtos.Cells[10,0]   := 'OS';
              Requisicao03.SGD_Produtos.ColWidths[10] := 75;

              //*** Equipamento ***
              Requisicao03.SGD_Produtos.Cells[11,0]   := 'Equipamento';
              Requisicao03.SGD_Produtos.ColWidths[11] := 75;

              //*** Material ***
              Requisicao03.SGD_Produtos.Cells[12,0]   := 'Material';
              Requisicao03.SGD_Produtos.ColWidths[12] := 75;

              //*** Adiciona os Itens da Requisição ***

              Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_tipo = '+#39+ 'IT' +#39+' AND producao_estrutura_numero IN (' + Trim(Linhas_Selecionadas.Text) + ') Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

              ConexaoBD.SQL_Producao_Estrutura.Close;
              ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
              ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Producao_Estrutura.Open;

              If ConexaoBD.SQL_Producao_Estrutura.RecordCount > 0 Then
                 Begin

                 Linha := 0;

                 While Not conexaoBD.SQL_Producao_Estrutura.Eof Do
                       Begin

                       ConexaoBD.SQL_Produtos.Close;
                       ConexaoBD.SQL_Produtos.SQL.Clear;
                       ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(conexaoBD.SQL_Producao_Estruturaproducao_estrutura_item_codigo.Text) + #39 );
                       ConexaoBD.SQL_Produtos.Open;

                       If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
                          Begin
                          Linha := Linha + 1;

                          Requisicao03.SGD_Produtos.Cells[0,Linha] := ConexaoBD.SQL_Producao_Estruturaproducao_estrutura_qtde.Text;

                          Requisicao03.SGD_Produtos.Cells[1,Linha] := ConexaoBD.SQL_Producao_Estruturaproducao_estrutura_item_codigo.Text;
                          Requisicao03.SGD_Produtos.Cells[2,Linha] := '';
                          Requisicao03.SGD_Produtos.Cells[3,Linha] := ConexaoBD.SQL_Producao_Estruturaproducao_estrutura_descricao.Text;

                          Requisicao03.SGD_Produtos.Cells[4,Linha] := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;

                          Requisicao03.SGD_Produtos.Cells[7,Linha] := ConexaoBD.SQL_Producao_Estruturaproducao_estrutura_estoque.Text;
                          Requisicao03.SGD_Produtos.Cells[5,Linha] := '0';

                          Requisicao03.SGD_Produtos.Cells[8,Linha] := '0';

                          Requisicao03.SGD_Produtos.Cells[9,Linha]  := ConexaoBD.SQL_Produtosfb_produto_desenho.Text;
                          Requisicao03.SGD_Produtos.Cells[10,Linha] := producao_numero_os.Text;
                          Requisicao03.SGD_Produtos.Cells[11,Linha] := ConexaoBD.SQL_Produtosfb_produto_equipamento.Text;
                          Requisicao03.SGD_Produtos.Cells[12,Linha] := ConexaoBD.SQL_Produtosfb_produto_material.Text;

                          Requisicao03.SGD_Produtos.RowCount := Requisicao03.SGD_Produtos.RowCount + 1;
                       End;

                       conexaoBD.SQL_Producao_Estrutura.Next;
                 End;
              End;
           End;
           Linhas_Selecionadas.Lines.Clear;
           Requisicao03.ShowModal;

           End
        Else
           Begin
           Ampulheta();

           Comando_SQL := 'Update producao_estrutura set ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_status = ' + #39 + Trim(Acao_Producao.Text) + #39 + ', ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_observacao = ' + #39 + Trim(Acao_Observacao.Text) + #39 + ' ';
           Comando_SQL := Comando_SQL + 'Where ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_numero IN (' + Trim(Linhas_Selecionadas.Text) + ')';
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status <> '+#39+ '---' +#39;

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           //*** Atualiza a Porcentagem de Conclusão ***

           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_status <> '+#39+ '---' +#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

           ConexaoBD.SQL_Producao_Estrutura.Close;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Producao_Estrutura.Open;

           Porcentagem_Total := ConexaoBD.SQL_Producao_Estrutura.RecordCount;

           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_status <> '+#39+ '---' +#39+' AND producao_estrutura_status = '+#39+ 'Finalizado' +#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

           ConexaoBD.SQL_Producao_Estrutura.Close;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Producao_Estrutura.Open;

           Porcentagem_Obtida    := ConexaoBD.SQL_Producao_Estrutura.RecordCount;
           Porcentagem_Resultado := FormatFloat('###0,00', ((Porcentagem_Obtida / Porcentagem_Total) * 100) );

           Comando_SQL := 'Update producao set ';
           Comando_SQL := Comando_SQL + 'producao_porcentagem = ' + #39 + Porcentagem_Resultado + '%' + #39 + ' ';
           Comando_SQL := Comando_SQL + 'Where ';
           Comando_SQL := Comando_SQL + 'producao_numero = ' + Trim(Producao_Numero.Text);

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           Linhas_Selecionadas.Lines.Clear;

           //*** Obtem o Status Geral ***

           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_status = '+#39+ 'Produzindo' +#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

           ConexaoBD.SQL_Producao_Estrutura.Close;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Producao_Estrutura.Open;

           If ConexaoBD.SQL_Producao_Estrutura.RecordCount > 0 Then
              Begin
              Comando_SQL := 'Update producao set ';
              Comando_SQL := Comando_SQL + 'producao_status = ' + #39 + 'Produzindo' + #39 + ' ';
              Comando_SQL := Comando_SQL + 'Where ';
              Comando_SQL := Comando_SQL + 'producao_numero = ' + Trim(Producao_Numero.Text);

              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario.ExecSQL;
              End
           Else
              Begin
              Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' AND producao_estrutura_status = '+#39+ 'Parado' +#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

              ConexaoBD.SQL_Producao_Estrutura.Close;
              ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
              ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Producao_Estrutura.Open;

              If ConexaoBD.SQL_Producao_Estrutura.RecordCount > 0 Then
                 Begin
                 Comando_SQL := 'Update producao set ';
                 Comando_SQL := Comando_SQL + 'producao_status = ' + #39 + 'Parado' + #39 + ' ';
                 Comando_SQL := Comando_SQL + 'Where ';
                 Comando_SQL := Comando_SQL + 'producao_numero = ' + Trim(Producao_Numero.Text);

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;
              End;
           End;

           //*** Carrega Grid de Produção ***

           Comando_SQL := 'SELECT * FROM producao ';

           If FilaEspera01.Acao_Producao.Text = 'Aguardando' Then
              Begin
              Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Aguardando'+#39+' Or producao_status = '+#39+#39+' Or producao_status IS NULL) ';
              End
           Else If FilaEspera01.Acao_Producao.Text = 'Produzindo' Then
              Begin
              Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Produzindo'+#39+') ';
              End
           Else If FilaEspera01.Acao_Producao.Text = 'Parado' Then
              Begin
              Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Parado'+#39+') ';
              End
           Else If FilaEspera01.Acao_Producao.Text = 'Finalizado' Then
              Begin
              Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Finalizado'+#39+') ';
           End;

           Comando_SQL := Comando_SQL + ' Order By producao_data_os ASC, producao_numero';

           ConexaoBD.SQL_Producao.Close;
           ConexaoBD.SQL_Producao.SQL.Clear;
           ConexaoBD.SQL_Producao.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Producao.Open;

           Seta();
        End;
     End;

     Acao_Observacao.Text := '';

     //*** Carrega a Estrutura de Produção ***

     Carrega_Estrutura();
end;

procedure TFilaEspera01.Executa_Status();

var
   Comando_SQL: String;

begin
     Ampulheta();
     
     If Trim(Opcao_Visualizar.Text) = '--- Todos ---' Then
        Begin
        Comando_SQL := 'SELECT * FROM producao_estrutura ';
        Comando_SQL := Comando_SQL + 'where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' ';

        If Opcao_Status.Text = 'Aguardando' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Aguardando' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Produzindo' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Produzindo' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Parado' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Parado' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Finalizado' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Finalizado' +#39+ ' ';
        End;

        Comando_SQL := Comando_SQL + ' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
        End
     Else
        Begin
        Comando_SQL := 'SELECT * FROM producao_estrutura ';
        Comando_SQL := Comando_SQL + 'where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' ';

        If Trim(Opcao_Visualizar.Text) = 'Etapa' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND producao_estrutura_tipo = '+#39+'ET'+#39+' ';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Processo' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND producao_estrutura_tipo = '+#39+'PR'+#39+' ';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Sub-Processo' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND producao_estrutura_tipo = '+#39+'SP'+#39+' ';
           End
        Else If Trim(Opcao_Visualizar.Text) = 'Item' Then
           Begin
           Comando_SQL := Comando_SQL + 'AND producao_estrutura_tipo = '+#39+'IT'+#39+' ';
        End;

        If Opcao_Status.Text = 'Aguardando' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Aguardando' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Produzindo' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Produzindo' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Parado' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Parado' +#39+ ' ';
           End
        Else If Opcao_Status.Text = 'Finalizado' Then
           Begin
           Comando_SQL := Comando_SQL + ' AND producao_estrutura_status = ' +#39+ 'Finalizado' +#39+ ' ';
        End;

        Comando_SQL := Comando_SQL + ' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';
     End;

     ConexaoBD.SQL_Producao_Estrutura.Close;
     ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
     ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Producao_Estrutura.Open;

     Seta();
end;

procedure TFilaEspera01.BT_SairClick(Sender: TObject);
begin
     FilaEspera01.Close;
end;

procedure TFilaEspera01.FormShow(Sender: TObject);

var
   Comando_SQL: String;
   
begin
     //*** Seleciona a Estrutura do Produto ***
     
     Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(producao_numero.Text)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

     ConexaoBD.SQL_Producao_Estrutura.Close;
     ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
     ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Producao_Estrutura.Open;
end;

procedure TFilaEspera01.DBGrid_CustosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (DBGrid_Custos.Fields[11].Text = 'Aguardando') Or (DBGrid_Custos.Fields[11].Text = '') Then
        Begin
        DBGrid_Custos.Canvas.Brush.Color := clRed;
        End
     Else If DBGrid_Custos.Fields[11].Text = 'Parado' Then
        Begin
        DBGrid_Custos.Canvas.Brush.Color := clYellow;
        End
     Else If DBGrid_Custos.Fields[11].Text = 'Produzindo' Then
        Begin
        DBGrid_Custos.Canvas.Brush.Color := clSkyBlue;
        End
     Else If DBGrid_Custos.Fields[11].Text = 'Finalizado' Then
        Begin
        DBGrid_Custos.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBGrid_Custos.DefaultDrawDataCell(Rect, DBGrid_Custos.columns[datacol].field, State);
end;

procedure TFilaEspera01.Opcao_VisualizarChange(Sender: TObject);
begin
     Carrega_Estrutura();
end;

procedure TFilaEspera01.DBGrid_CustosCellClick(Column: TColumn);

var
  contador: Integer;
  Linha_Lista : String;

begin
    If DBGrid_Custos.Fields[0].Text <> '' Then begin
        Linha_Lista := '';
        With DBGrid_Custos do Begin
          for contador:= 0 to Pred(SelectedRows.Count) do Begin
            Datasource.Dataset.Bookmark:= SelectedRows[contador]; // posiciona nos registros selecionados do DBGrid
            If (contador > 0) then
               Begin
               Linha_Lista := Trim(Linha_Lista) + ', ' + Trim(Fields[0].Text);
               End
            Else
               Begin
               Linha_Lista := Trim(Fields[0].Text);
            End;
          end;
        end;

        Linha_Lista := Trim(Linha_Lista);

        Linhas_Selecionadas.Lines.Clear;
        Linhas_Selecionadas.Lines.Add(Linha_Lista);
    End;
end;

procedure TFilaEspera01.Acao_ProducaoChange(Sender: TObject);
begin
     Executa_Acao();
end;

procedure TFilaEspera01.Opcao_StatusChange(Sender: TObject);
begin
     Executa_Status();
end;

end.
