unit Adiciona_Estrutura_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpDefine, RpCon, RpConDS, RpConBDE, StdCtrls, ExtCtrls, Buttons;

type
  TAdicionaEstrutura00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    fb_produto_estrutura_item_codigo: TEdit;
    fb_produto_estrutura_descricao: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    fb_produto_estrutura_qtde: TEdit;
    Panel2: TPanel;
    BT_Incluir: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    BT_Sair: TBitBtn;
    fb_produto_estrutura_numero: TEdit;
    Label2: TLabel;
    fb_produto_estrutura_medida: TEdit;
    Label4: TLabel;
    fb_produto_estrutura_sequencia: TEdit;
    Label5: TLabel;
    fb_produto_estrutura_tipo: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    fb_produto_estrutura_vlr_custo_unitario: TEdit;
    fb_produto_estrutura_custo: TComboBox;
    fb_produto_estrutura_codigo: TEdit;
    procedure fb_produto_estrutura_qtdeKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure fb_produto_estrutura_item_codigoKeyPress(Sender: TObject;
      var Key: Char);
    procedure fb_produto_estrutura_descricaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure fb_produto_estrutura_medidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure fb_produto_estrutura_sequenciaKeyPress(Sender: TObject;
      var Key: Char);
    procedure fb_produto_estrutura_tipoKeyPress(Sender: TObject;
      var Key: Char);
    procedure fb_produto_estrutura_custoKeyPress(Sender: TObject;
      var Key: Char);
    procedure fb_produto_estrutura_vlr_custo_unitarioKeyPress(
      Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdicionaEstrutura00: TAdicionaEstrutura00;

implementation

uses Conexao_BD, Rotinas_Gerais, Produtos_02;

{$R *.dfm}

procedure TAdicionaEstrutura00.fb_produto_estrutura_qtdeKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaEstrutura00.BT_SairClick(Sender: TObject);
begin
     AdicionaEstrutura00.Close;
end;

procedure TAdicionaEstrutura00.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL: String;
   Nro_Sequencia: Integer;

begin
     Ampulheta();

     If (Trim(fb_produto_estrutura_qtde.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_qtde.Text))) <= 0) Then
        Begin
        fb_produto_estrutura_qtde.Text := '1';
     End;

     If (Trim(fb_produto_estrutura_sequencia.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_sequencia.Text))) <= 0) Then
        Begin
        fb_produto_estrutura_sequencia.Text := '1';
     End;

     If (Trim(fb_produto_estrutura_vlr_custo_unitario.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_vlr_custo_unitario.Text))) <= 0) Then
        Begin
        fb_produto_estrutura_vlr_custo_unitario.Text := '0';
     End;

     //*** Acerta a Sequência de Exibição ***

     ConexaoBD.SQL_Produtos_Estruturas.Close;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Add('Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(fb_produto_estrutura_codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia');
     ConexaoBD.SQL_Produtos_Estruturas.Open;

     If conexaoBD.SQL_Produtos_Estruturas.RecordCount > 0 Then
        Begin
        conexaoBD.SQL_Produtos_Estruturas.First;

        Nro_Sequencia := 0;

        While Not conexaoBD.SQL_Produtos_Estruturas.Eof Do
           Begin

           If conexaoBD.SQL_Produtos_Estruturasfb_produto_estrutura_sequencia.AsInteger >= StrToInt(fb_produto_estrutura_sequencia.Text) Then
              Begin
              Comando_SQL := 'Update fb_produtos_estruturas Set ';
              Comando_SQL := Comando_SQL + 'fb_produto_estrutura_sequencia = '+IntToStr((Nro_Sequencia + 2))+' ';
              Comando_SQL := Comando_SQL + 'Where ';
              Comando_SQL := Comando_SQL + 'fb_produto_estrutura_numero = '+Trim(conexaoBD.SQL_Produtos_Estruturasfb_produto_estrutura_numero.Text)+' And ';
              Comando_SQL := Comando_SQL + 'fb_produto_estrutura_codigo = '+ #39 + Trim(fb_produto_estrutura_codigo.Text) + #39;

              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario.ExecSQL;
           End;

           conexaoBD.SQL_Produtos_Estruturas.Next;

           Nro_Sequencia := Nro_Sequencia + 1;

        End;
     End;

     //*** Insere o Novo Item de Estrutura ***

     Comando_SQL := 'Insert into fb_produtos_estruturas(';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_codigo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_item_codigo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_descricao, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_sequencia, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_qtde, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_medida, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_tipo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_custo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_vlr_custo_unitario) ';
     Comando_SQL := Comando_SQL + 'Values(';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_codigo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_item_codigo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_descricao.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + Trim(fb_produto_estrutura_sequencia.Text) + ', ';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(fb_produto_estrutura_qtde.Text)) + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_medida.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_tipo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_custo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(fb_produto_estrutura_vlr_custo_unitario.Text)) + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(fb_produto_estrutura_codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia';

     ConexaoBD.SQL_Produtos_Estruturas.Close;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Produtos_Estruturas.Open;

     Produtos02.Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Produtos_Estruturas.RecordCount);
     Produtos02.Qtde_Sequencia_Estrutura.Refresh;
     Produtos02.DBGrid_Custos.Refresh;

     Seta();
     
     MSG_Erro('Adição Efetuada...');

     AdicionaEstrutura00.Close; 
end;

procedure TAdicionaEstrutura00.BT_ExcluirClick(Sender: TObject);

var
   Comando_SQL: String;
   Nro_Sequencia: Integer;
   
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin

        Ampulheta();

        If (Trim(fb_produto_estrutura_qtde.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_qtde.Text))) <= 0) Then
           Begin
           fb_produto_estrutura_qtde.Text := '1';
        End;

        If (Trim(fb_produto_estrutura_sequencia.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_sequencia.Text))) <= 0) Then
           Begin
           fb_produto_estrutura_sequencia.Text := '1';
        End;

        If (Trim(fb_produto_estrutura_vlr_custo_unitario.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_vlr_custo_unitario.Text))) <= 0) Then
           Begin
           fb_produto_estrutura_vlr_custo_unitario.Text := '0';
        End;

        //*** Exclui o Item para Alteração ***

        Comando_SQL := 'Delete from fb_produtos_estruturas ';
        Comando_SQL := Comando_SQL + 'Where ';
        Comando_SQL := Comando_SQL + 'fb_produto_estrutura_numero = '+Trim(fb_produto_estrutura_numero.Text)+' And ';
        Comando_SQL := Comando_SQL + 'fb_produto_estrutura_codigo = '+ #39 + Trim(fb_produto_estrutura_codigo.Text) + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Acerta a Sequência de Exibição ***

        ConexaoBD.SQL_Produtos_Estruturas.Close;
        ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
        ConexaoBD.SQL_Produtos_Estruturas.SQL.Add('Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(fb_produto_estrutura_codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia');
        ConexaoBD.SQL_Produtos_Estruturas.Open;

        If conexaoBD.SQL_Produtos_Estruturas.RecordCount > 0 Then
           Begin
           conexaoBD.SQL_Produtos_Estruturas.First;

           Nro_Sequencia := 0;

           While Not conexaoBD.SQL_Produtos_Estruturas.Eof Do
              Begin

              If conexaoBD.SQL_Produtos_Estruturasfb_produto_estrutura_sequencia.AsInteger >= StrToInt(fb_produto_estrutura_sequencia.Text) Then
                 Begin
                 Comando_SQL := 'Update fb_produtos_estruturas Set ';
                 Comando_SQL := Comando_SQL + 'fb_produto_estrutura_sequencia = '+IntToStr((Nro_Sequencia + 1))+' ';
                 Comando_SQL := Comando_SQL + 'Where ';
                 Comando_SQL := Comando_SQL + 'fb_produto_estrutura_numero = '+Trim(conexaoBD.SQL_Produtos_Estruturasfb_produto_estrutura_numero.Text)+' And ';
                 Comando_SQL := Comando_SQL + 'fb_produto_estrutura_codigo = '+ #39 + Trim(fb_produto_estrutura_codigo.Text) + #39;

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;
              End;

              conexaoBD.SQL_Produtos_Estruturas.Next;

              Nro_Sequencia := Nro_Sequencia + 1;

           End;
        End;

        Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(fb_produto_estrutura_codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia';

        ConexaoBD.SQL_Produtos_Estruturas.Close;
        ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
        ConexaoBD.SQL_Produtos_Estruturas.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Produtos_Estruturas.Open;

        Produtos02.Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Produtos_Estruturas.RecordCount);
        Produtos02.Qtde_Sequencia_Estrutura.Refresh;
        Produtos02.DBGrid_Custos.Refresh;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        AdicionaEstrutura00.Close;
     End;
end;

procedure TAdicionaEstrutura00.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL: String;
   Nro_Sequencia: Integer;

begin
     Ampulheta();

     If (Trim(fb_produto_estrutura_qtde.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_qtde.Text))) <= 0) Then
        Begin
        fb_produto_estrutura_qtde.Text := '1';
     End;

     If (Trim(fb_produto_estrutura_sequencia.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_sequencia.Text))) <= 0) Then
        Begin
        fb_produto_estrutura_sequencia.Text := '1';
     End;

     If (Trim(fb_produto_estrutura_vlr_custo_unitario.Text) = '') Or (StrToFloat(Ponto_Virgula(Trim(fb_produto_estrutura_vlr_custo_unitario.Text))) <= 0) Then
        Begin
        fb_produto_estrutura_vlr_custo_unitario.Text := '0';
     End;

     //*** Exclui o Item para Alteração ***

     Comando_SQL := 'Delete from fb_produtos_estruturas ';
     Comando_SQL := Comando_SQL + 'Where ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_numero = '+Trim(fb_produto_estrutura_numero.Text)+' And ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_codigo = '+ #39 + Trim(fb_produto_estrutura_codigo.Text) + #39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Acerta a Sequência de Exibição ***

     ConexaoBD.SQL_Produtos_Estruturas.Close;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Add('Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(fb_produto_estrutura_codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia');
     ConexaoBD.SQL_Produtos_Estruturas.Open;

     If conexaoBD.SQL_Produtos_Estruturas.RecordCount > 0 Then
        Begin
        conexaoBD.SQL_Produtos_Estruturas.First;

        Nro_Sequencia := 0;

        While Not conexaoBD.SQL_Produtos_Estruturas.Eof Do
           Begin

           If conexaoBD.SQL_Produtos_Estruturasfb_produto_estrutura_sequencia.AsInteger >= StrToInt(fb_produto_estrutura_sequencia.Text) Then
              Begin
              Comando_SQL := 'Update fb_produtos_estruturas Set ';
              Comando_SQL := Comando_SQL + 'fb_produto_estrutura_sequencia = '+IntToStr((Nro_Sequencia + 2))+' ';
              Comando_SQL := Comando_SQL + 'Where ';
              Comando_SQL := Comando_SQL + 'fb_produto_estrutura_numero = '+Trim(conexaoBD.SQL_Produtos_Estruturasfb_produto_estrutura_numero.Text)+' And ';
              Comando_SQL := Comando_SQL + 'fb_produto_estrutura_codigo = '+ #39 + Trim(fb_produto_estrutura_codigo.Text) + #39;

              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario.ExecSQL;
           End;

           conexaoBD.SQL_Produtos_Estruturas.Next;

           Nro_Sequencia := Nro_Sequencia + 1;

        End;
     End;

     //*** Insere o Novo Item de Estrutura ***

     Comando_SQL := 'Insert into fb_produtos_estruturas(';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_codigo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_item_codigo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_descricao, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_sequencia, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_qtde, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_medida, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_tipo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_custo, ';
     Comando_SQL := Comando_SQL + 'fb_produto_estrutura_vlr_custo_unitario) ';
     Comando_SQL := Comando_SQL + 'Values(';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_codigo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_item_codigo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_descricao.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + Trim(fb_produto_estrutura_sequencia.Text) + ', ';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(fb_produto_estrutura_qtde.Text)) + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_medida.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_tipo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(fb_produto_estrutura_custo.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(fb_produto_estrutura_vlr_custo_unitario.Text)) + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(fb_produto_estrutura_codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia';

     ConexaoBD.SQL_Produtos_Estruturas.Close;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Produtos_Estruturas.Open;

     Produtos02.Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Produtos_Estruturas.RecordCount);
     Produtos02.Qtde_Sequencia_Estrutura.Refresh;     
     Produtos02.DBGrid_Custos.Refresh;

     Seta();
     
     MSG_Erro('Alteração Efetuada...');

     AdicionaEstrutura00.Close; 
end;

procedure TAdicionaEstrutura00.fb_produto_estrutura_item_codigoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaEstrutura00.fb_produto_estrutura_descricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaEstrutura00.fb_produto_estrutura_medidaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaEstrutura00.fb_produto_estrutura_sequenciaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaEstrutura00.fb_produto_estrutura_tipoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaEstrutura00.fb_produto_estrutura_custoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaEstrutura00.fb_produto_estrutura_vlr_custo_unitarioKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
