unit Fila_Producao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, ADODB, DB, DBCtrls;

type
  TFilaProducao00 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid_Producao: TDBGrid;
    Opcao_Producao: TComboBox;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    DBG_Cliente_Observacao: TDBMemo;
    DBG_Observacao_Nota: TDBMemo;
    DBG_Observacao_Fabrica: TDBMemo;
    DBG_Observacao_Faturamento: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure DBGrid_ProducaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Opcao_ProducaoChange(Sender: TObject);
    procedure DBGrid_ProducaoCellClick(Column: TColumn);
  private
    { Private declarations }

    procedure Localizar_Producao();
    procedure Prepara_Estrutura(Codigo_Produto: String);

  public
    { Public declarations }
  end;

var
  FilaProducao00: TFilaProducao00;
  Nro_Recursiva: Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Fila_Espera_01, Pedidos_02;

{$R *.dfm}

procedure TFilaProducao00.Localizar_Producao();

var
   Comando_SQL: String;

begin
     Comando_SQL := 'SELECT * FROM producao ';

     If Opcao_Producao.Text = 'Aguardando' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Aguardando'+#39+' Or producao_status = '+#39+#39+' Or producao_status IS NULL) ';
        End
     Else If Opcao_Producao.Text = 'Produzindo' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Produzindo'+#39+') ';
        End
     Else If Opcao_Producao.Text = 'Parado' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Parado'+#39+') ';
        End
     Else If Opcao_Producao.Text = 'Finalizado' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Finalizado'+#39+') ';
     End;

     Comando_SQL := Comando_SQL + ' Order By producao_data_os ASC, producao_numero';

     ConexaoBD.SQL_Producao.Close;
     ConexaoBD.SQL_Producao.SQL.Clear;
     ConexaoBD.SQL_Producao.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Producao.Open;
end;

procedure TFilaProducao00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFilaProducao00.FormShow(Sender: TObject);
begin
     Localizar_Producao();
end;

procedure TFilaProducao00.BT_SairClick(Sender: TObject);
begin
     FilaProducao00.Close;
end;

procedure TFilaProducao00.DBGrid_ProducaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (DBGrid_Producao.Fields[6].Text = 'Aguardando') Or (DBGrid_Producao.Fields[6].Text = '') Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clRed;
        End
     Else If DBGrid_Producao.Fields[6].Text = 'Parado' Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clYellow;
        End
     Else If DBGrid_Producao.Fields[6].Text = 'Produzindo' Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clSkyBlue;
        End
     Else If DBGrid_Producao.Fields[6].Text = 'Finalizado' Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBGrid_Producao.DefaultDrawDataCell(Rect, DBGrid_Producao.columns[datacol].field, State);
end;

procedure TFilaProducao00.Opcao_ProducaoChange(Sender: TObject);
begin
     Localizar_Producao();
end;

procedure TFilaProducao00.DBGrid_ProducaoCellClick(Column: TColumn);

var
   Comando_SQL, Estoque_Produto: String;

begin
     Nro_Recursiva := 0;

     If DBGrid_Producao.Fields[0].Text <> '' Then
        Begin
        Ampulheta();
        
        Application.CreateForm(TFilaEspera01,FilaEspera01);

	      FilaEspera01.producao_numero.Text            := DBGrid_Producao.Fields[0].Text;
	      FilaEspera01.producao_numero_os.Text         := DBGrid_Producao.Fields[1].Text;
	      FilaEspera01.producao_data_os.Text           := DBGrid_Producao.Fields[2].Text;
	      FilaEspera01.producao_codigo_produto.Text    := DBGrid_Producao.Fields[3].Text;
	      FilaEspera01.producao_descricao_produto.Text := DBGrid_Producao.Fields[4].Text;
	      FilaEspera01.producao_status.Text            := DBGrid_Producao.Fields[6].Text;
	      FilaEspera01.producao_data_inicio.Text       := DBGrid_Producao.Fields[5].Text;
	      FilaEspera01.producao_data_final.Text        := DBGrid_Producao.Fields[7].Text;

        //*** Prepara a Estrutura da Produção ***

        Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(DBGrid_Producao.Fields[0].Text)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

        ConexaoBD.SQL_Producao_Estrutura.Close;
        ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
        ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Producao_Estrutura.Open;

        If conexaoBD.SQL_Producao_Estrutura.RecordCount > 0 Then
           Begin
           FilaEspera01.Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Producao_Estrutura.RecordCount);

           While Not conexaoBD.SQL_Producao_Estrutura.Eof Do
                 Begin

                 //*** INICIO - Estoque do Produto ***

                 ConexaoBD.SQL_Produtos.Close;
                 ConexaoBD.SQL_Produtos.SQL.Clear;
                 ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(conexaoBD.SQL_Producao_Estruturaproducao_estrutura_item_codigo.Text) + #39 );
                 ConexaoBD.SQL_Produtos.Open;

                 If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
                    Begin
                    Estoque_Produto := ConexaoBD.SQL_Produtosfb_produto_estoque_atual.Text;
                    End
                 Else
                    Begin
                    Estoque_Produto := '-';
                 End;

                 Comando_SQL := 'Update producao_estrutura set ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_estoque = ' + #39 + Trim(Estoque_Produto) + #39 + ' ';
                 Comando_SQL := Comando_SQL + 'Where ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_numero = ' + Trim(conexaoBD.SQL_Producao_Estruturaproducao_estrutura_numero.Text);

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 //*** FINAL - Estoque do Produto ***

                 conexaoBD.SQL_Producao_Estrutura.Next;
           End;

           End
        Else
           Begin
           Nro_Recursiva := Nro_Recursiva + 1;
           Prepara_Estrutura(Trim(DBGrid_Producao.Fields[3].Text));
           Nro_Recursiva := Nro_Recursiva - 1;           

           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(DBGrid_Producao.Fields[0].Text)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

           ConexaoBD.SQL_Producao_Estrutura.Close;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Producao_Estrutura.Open;

           FilaEspera01.Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Producao_Estrutura.RecordCount);
        End;

        Seta();

        FilaEspera01.ShowModal;
        FilaEspera01.Destroy;
     End;
end;

procedure TFilaProducao00.Prepara_Estrutura(Codigo_Produto: String);

var
   Comando_SQL: String;
   SQL_Recursiva: TADOQuery;
   DS_Recursiva: TDataSource;
   Retorno_Recursiva: Boolean;
   Estoque_Produto: String;

begin
     Retorno_Recursiva := False;
     
     SQL_Recursiva            := TADOQuery.Create(nil);
     SQL_Recursiva.Connection := ConexaoBD.Conexao_Principal;
     
     DS_Recursiva             := TDataSource.Create(nil);
     DS_Recursiva.DataSet     := SQL_Recursiva;

     Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Codigo_Produto)+#39+' Order By fb_produto_estrutura_sequencia';

     SQL_Recursiva.Close;
     SQL_Recursiva.SQL.Clear;
     SQL_Recursiva.SQL.Add(Comando_SQL);
     SQL_Recursiva.Open;

     //*** Insere a Estrutura ***

     If SQL_Recursiva.RecordCount > 0 Then
        Begin

        While Not SQL_Recursiva.Eof Do
              Begin

              If (SQL_Recursiva.FieldByName('fb_produto_estrutura_sequencia').AsInteger <= 1) And (Nro_Recursiva > 1)  Then
                 Begin
                 Comando_SQL := 'Insert into producao_estrutura(';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_numero_producao, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_item, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_codigo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_item_codigo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_descricao, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_sequencia, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_qtde, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_medida, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_tipo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_custo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_vlr_custo_unitario, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_status, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_estoque) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + Trim(DBGrid_Producao.Fields[0].Text) + ', ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '          >>> INICIO DA ESTRUTURA DE: ' + Trim(Codigo_Produto) + ' <<<' + #39 + ', ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + #39 + '---' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '0' + #39 + ')';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 Retorno_Recursiva := True;
              End;

              //*** INICIO - Estoque do Produto ***

              ConexaoBD.SQL_Produtos.Close;
              ConexaoBD.SQL_Produtos.SQL.Clear;
              ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_item_codigo').Text) + #39 );
              ConexaoBD.SQL_Produtos.Open;

              If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
                 Begin
                 Estoque_Produto := ConexaoBD.SQL_Produtosfb_produto_estoque_atual.Text;
                 End
              Else
                 Begin
                 Estoque_Produto := '-';
              End;

              //*** FINAL - Estoque do Produto ***

              Comando_SQL := 'Insert into producao_estrutura(';
              Comando_SQL := Comando_SQL + 'producao_estrutura_numero_producao, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_item, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_codigo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_item_codigo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_descricao, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_sequencia, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_qtde, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_medida, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_tipo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_custo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_vlr_custo_unitario, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_status, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_estoque) ';
              Comando_SQL := Comando_SQL + 'Values(';
              Comando_SQL := Comando_SQL + Trim(DBGrid_Producao.Fields[0].Text) + ', ';
              Comando_SQL := Comando_SQL + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_numero').Text) + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_codigo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_item_codigo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_descricao').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_sequencia').Text) + ', ';
              Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_qtde').Text)) + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_medida').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_tipo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_custo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_vlr_custo_unitario').Text)) + ', ';
              Comando_SQL := Comando_SQL + #39 + 'Aguardando' + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(Estoque_Produto) + #39 + ')';

              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario.ExecSQL;

              If Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_tipo').Text) = 'IT' Then
                 Begin
                 Nro_Recursiva := Nro_Recursiva + 1;
                 Prepara_Estrutura(Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_item_codigo').Text));
                 Nro_Recursiva := Nro_Recursiva - 1;
              End;

              SQL_Recursiva.Next;
        End;

        If Retorno_Recursiva Then
           Begin
           Comando_SQL := 'Insert into producao_estrutura(';
           Comando_SQL := Comando_SQL + 'producao_estrutura_numero_producao, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_item, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_codigo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_item_codigo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_descricao, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_sequencia, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_qtde, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_medida, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_tipo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_custo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_vlr_custo_unitario, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_status, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_estoque) ';
           Comando_SQL := Comando_SQL + 'Values(';
           Comando_SQL := Comando_SQL + Trim(DBGrid_Producao.Fields[0].Text) + ', ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '          >>> FINAL DA ESTRUTURA DE: ' + Trim(Codigo_Produto) + ' <<<' + #39 + ', ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + #39 + '---' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '0' + #39 + ')';

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           Retorno_Recursiva := False;
        End;
     End;
end;

end.
