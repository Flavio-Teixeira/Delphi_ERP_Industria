unit Estoque_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEstoque01 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    GroupBox1: TGroupBox;
    BT_Subtrair: TBitBtn;
    BT_Adicionar: TBitBtn;
    Qtd: TEdit;
    Label1: TLabel;
    Qtd_Inicial: TEdit;
    Qtd_Atual: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Codigo: TEdit;
    Descricao: TEdit;
    Label3: TLabel;
    Desenho: TEdit;
    Label7: TLabel;
    Obs: TEdit;
    Label8: TLabel;
    Fun: TEdit;
    Label40: TLabel;
    Dep: TComboBox;
    Valor_Venda: TEdit;
    Localizacao: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Qtd_Ideal: TEdit;
    Label12: TLabel;
    Qtd_Minima: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure QtdKeyPress(Sender: TObject; var Key: Char);
    procedure Qtd_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_SubtrairClick(Sender: TObject);
    procedure ObsKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DepKeyPress(Sender: TObject; var Key: Char);
    procedure FunKeyPress(Sender: TObject; var Key: Char);
    procedure LocalizacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Estoque01: TEstoque01;

implementation

uses Conexao_BD, Rotinas_Gerais, Estoque_00, Ibrasmak_00;

{$R *.dfm}

procedure TEstoque01.BT_SairClick(Sender: TObject);
begin
  Estoque01.Close;
end;

procedure TEstoque01.QtdKeyPress(Sender: TObject; var Key: Char);
begin
    So_Valor(Sender,Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEstoque01.Qtd_InicialKeyPress(Sender: TObject; var Key: Char);
begin
    So_Numero_Menos(Sender,Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEstoque01.BT_AdicionarClick(Sender: TObject);
var
   Comando_SQL :String;
   Nro_Ctl_Est :String;
   Observacao: String;

begin
     Ampulheta();

     Observacao := '';

     If Trim(Dep.Text) <> '' Then
        Begin
        Observacao := Observacao + Trim(Dep.Text);

        If Trim(Fun.Text) <> '' Then
           Begin
           Observacao := Observacao + ' - ';
        End;
     End;

     If Trim(Fun.Text) <> '' Then
        Begin
        Observacao := Observacao + Trim(Fun.Text);

        If Trim(Obs.Text) <> '' Then
           Begin
           Observacao := Observacao + ' - ';
        End;
     End;

     If Trim(Obs.Text) <> '' Then
        Begin
        Observacao := Observacao + Trim(Obs.Text);
     End;

     If Trim(Qtd_Inicial.Text) = '' Then
        Begin
        Qtd_Inicial.Text := '0';
     End;

     If Trim(Qtd.Text) = '' Then
        Begin
        Qtd.Text := '0';
     End;

     // Insere um Registro Novo em Controle de Estoque-Ibrasmak
     // fb_ctrl_estoque

     Comando_SQL := 'Insert into fb_ctrl_estoque(' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_usuario, ' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_data, ' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_hora,' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_obs)' ;
     Comando_SQL := Comando_SQL + ' Values( ' ;
     Comando_SQL := Comando_SQL +#39+ Numero_HD('C') +#39+ ', ' ;
     Comando_SQL := Comando_SQL +#39+ Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') +#39+ ', ' ;
     Comando_SQL := Comando_SQL +#39+ Trim(TimeToStr(Time())) +#39+ ',' ;
     Comando_SQL := Comando_SQL +#39+ Trim(Observacao) +#39+ ')' ;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     // *** Armazena Código do Ctrl. de Estoque ***

     ConexaoBD.SQL_FB_Ctrl_Estoque.Close;
     ConexaoBD.SQL_FB_Ctrl_Estoque.SQL.Clear;
     ConexaoBD.SQL_FB_Ctrl_Estoque.SQL.Add('Select * from fb_ctrl_estoque Order By fb_ctrl_estoque_numero DESC');
     ConexaoBD.SQL_FB_Ctrl_Estoque.Open;
     Nro_Ctl_Est := ConexaoBD.SQL_FB_Ctrl_Estoquefb_ctrl_estoque_numero.AsString;
     ConexaoBD.SQL_FB_Ctrl_Estoque.Close;

     // Atualiza o Registro do Estoque de Produtos-Ibrasmak

     Comando_SQL := 'Update fb_produtos Set ' ;

     If(Qtd_Ideal.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_estoque_ideal = ' + Virgula_Ponto(Qtd_Ideal.Text) + ', ';
     End;

     If(Qtd_Minima.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_estoque_minimo = ' + Virgula_Ponto(Qtd_Minima.Text) + ', ';
     End;

     If(Valor_Venda.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_preco = ' + Virgula_Ponto(Valor_Venda.Text) + ', ';
     End;

     If(Localizacao.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_localizacao = ' + #39 + Localizacao.Text + #39 + ', ';
     End;

     Comando_SQL := Comando_SQL + 'fb_produto_estoque_inicial = ' + #39 + Trim(Qtd_Inicial.Text)+ #39 + ' ';
     Comando_SQL := Comando_SQL + 'Where fb_produto_codigo = ' + #39 + Trim(Codigo.Text) + #39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Gera o Movimento de Estoque ***

     FB_Registra_Movto_Estoque('49',Trim(Nro_Ctl_Est),'0','-',Trim(Codigo.Text),'0',Trim(Qtd.Text));

     Comando_SQL := 'Update fb_movto_estoque Set ' ;
     Comando_SQL := Comando_SQL + ' fb_movto_estoque_obs = '+ #39 + Trim(Observacao)+ #39;
     Comando_SQL := Comando_SQL + ' Where fb_movto_estoque_cod_registro = 49 AND fb_movto_estoque_pedido = ' + #39 + Trim(Nro_Ctl_Est) +#39 + ' AND fb_movto_estoque_data = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     // *** Mostrar o Produto Alterado no Form Anterior ***

     Estoque00.Tipo_Show.Text:='A';
     ConexaoBD.SQL_FB_Produtos.SQL.Clear;
     ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo=' + #39 + Trim(Codigo.Text)+#39+' Order By fb_produto_codigo');
     ConexaoBD.SQL_FB_Produtos.Open;

     Estoque00.Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_FB_Produtos.RecordCount);

     Seta();

     Msg_Erro('Alteração de Estoque concluída !');
     Estoque01.Close;
end;

procedure TEstoque01.BT_SubtrairClick(Sender: TObject);

var
   Comando_SQL :String;
   Nro_Ctl_Est :String;
   Observacao: String;

begin
     Ampulheta();

     Observacao := '';

     If Trim(Dep.Text) <> '' Then
        Begin
        Observacao := Observacao + Trim(Dep.Text);

        If Trim(Fun.Text) <> '' Then
           Begin
           Observacao := Observacao + ' - ';
        End;
     End;

     If Trim(Fun.Text) <> '' Then
        Begin
        Observacao := Observacao + Trim(Fun.Text);

        If Trim(Obs.Text) <> '' Then
           Begin
           Observacao := Observacao + ' - ';
        End;
     End;

     If Trim(Obs.Text) <> '' Then
        Begin
        Observacao := Observacao + Trim(Obs.Text);
     End;

     If Trim(Qtd_Inicial.Text) = '' Then
        Begin
        Qtd_Inicial.Text := '0';
     End;

     If Trim(Qtd.Text) = '' Then
        Begin
        Qtd.Text := '0';
     End;

     // Insere um Registro Novo em Controle de Estoque-Ibrasmak
     // fb_ctrl_estoque

     Comando_SQL := 'Insert into fb_ctrl_estoque(' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_usuario, ' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_data, ' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_hora, ' ;
     Comando_SQL := Comando_SQL + 'fb_ctrl_estoque_obs)' ;
     Comando_SQL := Comando_SQL + ' Values( ' ;
     Comando_SQL := Comando_SQL +#39+ Numero_HD('C') +#39+ ', ' ;
     Comando_SQL := Comando_SQL +#39+ Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') +#39+ ', ' ;
     Comando_SQL := Comando_SQL +#39+ Trim(TimeToStr(Time())) +#39+ ',' ;
     Comando_SQL := Comando_SQL +#39+ Trim(Observacao) +#39+ ')' ;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     // *** Armazena Código do Ctrl. de Estoque ***
     ConexaoBD.SQL_FB_Ctrl_Estoque.Close;
     ConexaoBD.SQL_FB_Ctrl_Estoque.SQL.Clear;
     ConexaoBD.SQL_FB_Ctrl_Estoque.SQL.Add('Select * from fb_ctrl_estoque Order By fb_ctrl_estoque_numero DESC');
     ConexaoBD.SQL_FB_Ctrl_Estoque.Open;
     Nro_Ctl_Est := ConexaoBD.SQL_FB_Ctrl_Estoquefb_ctrl_estoque_numero.AsString;
     ConexaoBD.SQL_FB_Ctrl_Estoque.Close;

     // Atualiza o Registro do Estoque de Produtos-Ibrasmak
     Comando_SQL := 'Update fb_produtos Set ' ;

     If(Qtd_Ideal.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_estoque_ideal = ' + Virgula_Ponto(Qtd_Ideal.Text) + ', ';
     End;

     If(Qtd_Minima.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_estoque_minimo = ' + Virgula_Ponto(Qtd_Minima.Text) + ', ';
     End;

     If(Valor_Venda.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_preco = ' + Virgula_Ponto(Valor_Venda.Text) + ', ';
     End;

     If(Localizacao.Text <> '') Then
     Begin
        Comando_SQL := Comando_SQL + ' fb_produto_localizacao = ' + #39 + Localizacao.Text + #39 + ', ';
     End;

     Comando_SQL := Comando_SQL + 'fb_produto_estoque_inicial = ' + #39 + Trim(Qtd_Inicial.Text)+ #39 + ' ';
     Comando_SQL := Comando_SQL + 'Where fb_produto_codigo = ' + #39 + Trim(Codigo.Text) + #39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Gera o Movimento de Estoque ***

     FB_Registra_Movto_Estoque('99',Trim(Nro_Ctl_Est),'0','-',Trim(Codigo.Text),'0',Trim(Qtd.Text));

     Comando_SQL := 'Update fb_movto_estoque Set ' ;
     Comando_SQL := Comando_SQL + ' fb_movto_estoque_obs = '+ #39 + Trim(Observacao)+ #39;
     Comando_SQL := Comando_SQL + ' Where fb_movto_estoque_cod_registro = 99 AND fb_movto_estoque_pedido = ' + #39 + Trim(Nro_Ctl_Est) +#39 + ' AND fb_movto_estoque_data = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     // *** Mostrar o Produto Alterado no Form Anterior ***
     Estoque00.Tipo_Show.Text:='A';
     ConexaoBD.SQL_FB_Produtos.SQL.Clear;
     ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo=' + #39 + Trim(Codigo.Text)+#39+' Order By fb_produto_codigo');
     ConexaoBD.SQL_FB_Produtos.Open;

     Estoque00.Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_FB_Produtos.RecordCount);

     Seta();

     Msg_Erro('Alteração de Estoque concluída !');
     Estoque01.Close;
end;

procedure TEstoque01.ObsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoque01.FormShow(Sender: TObject);
begin
     ConexaoBD.SQL_Depto.Close;
     ConexaoBD.SQL_Depto.SQL.Clear;
     ConexaoBD.SQL_Depto.SQL.Add('Select * from fb_depto Order By fb_depto_descricao');
     ConexaoBD.SQL_Depto.Open;

     Dep.Items.Clear;
     Dep.Items.Add('');

     If conexaoBD.SQL_Depto.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Depto.First;

        While Not conexaoBD.SQL_Depto.Eof Do
              begin
              Dep.Items.Add(Trim(ConexaoBD.SQL_Deptofb_depto_descricao.Text));
              conexaoBD.SQL_Depto.Next;
        End;
     end;

     ConexaoBD.SQL_Depto.Close;

     Dep.ItemIndex := 0;
end;

procedure TEstoque01.DepKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEstoque01.FunKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEstoque01.LocalizacaoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

end.
