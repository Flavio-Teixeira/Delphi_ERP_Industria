unit Codigo_Produto_Nota_Cliente_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCodigoProdutoNotaCliente00 = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Adiciona_Codigo_Produto: TEdit;
    Adiciona_Descricao: TEdit;
    Adiciona_Valor_Unitario: TEdit;
    Adiciona_Quantidade: TEdit;
    Adiciona_Referencia: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Adiciona_Codigo_Cliente: TEdit;
    Panel3: TPanel;
    BT_Adicionar: TBitBtn;
    BT_Sair: TBitBtn;
    Adiciona_ACol: TEdit;
    Adiciona_ARow: TEdit;
    Programa_Anterior: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_AdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodigoProdutoNotaCliente00: TCodigoProdutoNotaCliente00;

implementation

uses Notas_Fiscais_Saidas_01, Registro_Notas_Fiscais_Saidas_01;

{$R *.dfm}

procedure TCodigoProdutoNotaCliente00.BT_SairClick(Sender: TObject);
begin
     CodigoProdutoNotaCliente00.Close;
end;

procedure TCodigoProdutoNotaCliente00.BT_AdicionarClick(Sender: TObject);
begin
     If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then
        Begin
        RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Cliente.Text;
        End
     Else
        Begin
        NotasFiscaisSaidas01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Cliente.Text;
     End;

     CodigoProdutoNotaCliente00.Close;
end;

end.
