unit Rel_Funcionarios_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TRelFuncionarios00 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    GroupBox1: TGroupBox;
    empresa: TComboBox;
    status: TComboBox;
    Label2: TLabel;
    Label1: TLabel;
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFuncionarios00: TRelFuncionarios00;

implementation

uses Rotinas_Gerais, Conexao_BD, Rel_Movimento_Estoque_01, Ibrasmak_00,
  Adiciona_Produto_01, Rel_Funcionarios_01;

{$R *.dfm}

procedure TRelFuncionarios00.BT_ImprimirClick(Sender: TObject);
var
  Comando_SQL : String;
begin
    Ampulheta();

    Application.CreateForm(TRelFuncionarios01,RelFuncionarios01);

    Comando_SQL := 'Select * from funcionarios where ';

    If empresa.ItemIndex = 1 Then
    begin
        Comando_SQL := Comando_SQL + 'funcionario_empresa = '+#39+'Ibrasmak'+#39+' and ';
    end
    Else If empresa.ItemIndex = 2 Then
    begin
        Comando_SQL := Comando_SQL + 'funcionario_empresa = '+#39+'Monibras'+#39+' and ';
    end
    Else If empresa.ItemIndex = 3 Then
    begin
        Comando_SQL := Comando_SQL + 'funcionario_empresa = '+#39+'Autônomo'+#39+' and ';
    end
    Else If empresa.ItemIndex = 4 Then
    begin
        Comando_SQL := Comando_SQL + 'funcionario_empresa = '+#39+'Terceirizado'+#39+' and ';
    End;

    If status.ItemIndex = 1 Then
    begin
        Comando_SQL := Comando_SQL + 'funcionario_data_rescisao = '+#39+'0000-00-00'+#39+' and ';
    end
    Else If status.ItemIndex = 2 Then
    begin
        Comando_SQL := Comando_SQL + 'funcionario_data_rescisao <> '+#39+'0000-00-00'+#39+' and ';
    End;

    Comando_SQL := Comando_SQL + '1=1 ';

    Comando_SQL := Comando_SQL + 'Order By funcionario_nome';

    ConexaoBD.SQL_Funcionarios.Close;
    ConexaoBD.SQL_Funcionarios.SQL.Clear;
    ConexaoBD.SQL_Funcionarios.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Funcionarios.Open;

    RelFuncionarios01.empresa.Caption := empresa.Text;
    RelFuncionarios01.status.Caption  := status.Text;

    Seta();

    RelFuncionarios01.QR_MovEstoque.Preview;
    RelFuncionarios01.Destroy;

    ConexaoBD.SQL_Funcionarios.Close;

end;

procedure TRelFuncionarios00.BT_SairClick(Sender: TObject);
begin
  RelFuncionarios00.Close;
end;

end.
