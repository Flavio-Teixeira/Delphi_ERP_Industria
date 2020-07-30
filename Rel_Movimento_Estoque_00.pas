unit Rel_Movimento_Estoque_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TRelMovimentoEstoque00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Produto: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    BT_Buscar: TBitBtn;
    Label40: TLabel;
    Dep: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_BuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelMovimentoEstoque00: TRelMovimentoEstoque00;

implementation

uses Rotinas_Gerais, Conexao_BD, Rel_Movimento_Estoque_01, Ibrasmak_00,
  Adiciona_Produto_01;

{$R *.dfm}

procedure TRelMovimentoEstoque00.FormShow(Sender: TObject);
begin
     // Carrega data atual nos campos de periodo
     Data_Inicial.Text := DateToStr(Date());
     Data_Final.Text   := DateToStr(Date());

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

procedure TRelMovimentoEstoque00.BT_ImprimirClick(Sender: TObject);
var
  Comando_SQL : String;
begin
  if Trim(Data_Inicial.Text) = '/  /' Then
    begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
    Data_Inicial.SetFocus;
    end
  else if Trim(Data_Final.Text) = '/  /' then
    begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
    Data_Final.SetFocus;
    end
  else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
    begin
    MSG_Erro('A Data Inicial Está Maior do que a Data Final...');
    Data_Inicial.SetFocus;
    end
  else
    begin
    Ampulheta();

    Application.CreateForm(TRelMovimentoEstoque01,RelMovimentoEstoque01);
    Comando_SQL := '';

    if Trim(Produto.Text) = '' Then
      Begin
      Comando_SQL := 'Select * from fb_movto_estoque Where (fb_movto_estoque_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/') +#39+') and (fb_movto_estoque_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/') +#39+') ';
      End
    Else
      Begin
      Comando_SQL := 'Select * from fb_movto_estoque Where (fb_movto_estoque_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+') and ((fb_movto_estoque_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/') +#39+') and (fb_movto_estoque_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/') +#39+')) ';
    End;

    If Trim(Dep.Text) <> '' Then
       Begin
       Comando_SQL := Comando_SQL + ' and fb_movto_estoque_obs Like ' +#39+ Trim(Dep.Text) + '%' + #39;
    End;

    Comando_SQL := Comando_SQL + ' Order By fb_movto_estoque_codigo, fb_movto_estoque_data, fb_movto_estoque_numero';

    ConexaoBD.SQL_FB_Movto_Estoque.Close;
    ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
    ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Movto_Estoque.Open;

    RelMovimentoEstoque01.QR_Titulo.Caption := 'Movimentação Dos Estoques No Periodo De ';
    RelMovimentoEstoque01.QR_Titulo.Caption := RelMovimentoEstoque01.QR_Titulo.Caption + Data_Inicial.Text;
    RelMovimentoEstoque01.QR_Titulo.Caption := RelMovimentoEstoque01.QR_Titulo.Caption + ' a ';
    RelMovimentoEstoque01.QR_Titulo.Caption := RelMovimentoEstoque01.QR_Titulo.Caption + Data_Final.Text;

    Seta();

    RelMovimentoEstoque01.QR_MovEstoque.Preview;
    RelMovimentoEstoque01.Destroy;

    ConexaoBD.SQL_FB_Movto_Estoque.Close;
  end;
end;

procedure TRelMovimentoEstoque00.BT_SairClick(Sender: TObject);
begin
  RelMovimentoEstoque00.Close;
end;

procedure TRelMovimentoEstoque00.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelMovimentoEstoque00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelMovimentoEstoque00.ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelMovimentoEstoque00.BT_BuscarClick(Sender: TObject);
begin
    Application.CreateForm(TAdicionaProduto01,AdicionaProduto01);
    AdicionaProduto01.Programa_Anterior.Text := 'RelMovimentoEstoque00';
    AdicionaProduto01.ShowModal;
    AdicionaProduto01.Destroy;
end;

end.
