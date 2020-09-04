unit Adiciona_Lote_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAdicionaLoteProduto = class(TForm)
    Panel3: TPanel;
    BT_Adicionar: TBitBtn;
    BT_Sair: TBitBtn;
    Adiciona_ACol: TEdit;
    Adiciona_ARow: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Adiciona_Codigo_Produto: TEdit;
    Adiciona_Descricao: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Adiciona_Lote: TEdit;
    Label4: TLabel;
    Adiciona_Referencia: TEdit;
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Adiciona_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdicionaLoteProduto: TAdicionaLoteProduto;

implementation

uses Notas_Fiscais_Saidas_01, Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TAdicionaLoteProduto.BT_AdicionarClick(Sender: TObject);
begin
     If Trim(Adiciona_Lote.Text) <> '' Then
        Begin
        NotasFiscaisSaidas01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Lote.Text;
        AdicionaLoteProduto.Close;
        End
     Else
        Begin
        Adiciona_Lote.SetFocus;
     End;
end;

procedure TAdicionaLoteProduto.BT_SairClick(Sender: TObject);
begin
     AdicionaLoteProduto.Close;
end;

procedure TAdicionaLoteProduto.Adiciona_LoteKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaLoteProduto.FormShow(Sender: TObject);
begin
    Adiciona_Lote.SetFocus;
end;

end.
