unit Adiciona_Fornecedor_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TAdicionaFornecedorPedido = class(TForm)
    Fornecedor_Selecionado: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    BT_Adicionar: TButton;
    BT_Alterar: TButton;
    Programa_Anterior: TEdit;
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdicionaFornecedorPedido: TAdicionaFornecedorPedido;

implementation

uses Fornecedor_00, Ibrasmak_00;

{$R *.dfm}

procedure TAdicionaFornecedorPedido.BT_AdicionarClick(Sender: TObject);
begin
     Fornecedor00.Resultado_Adiciona_Fornecedor_Pedido.Text := '0';
     AdicionaFornecedorPedido.Close;
end;

procedure TAdicionaFornecedorPedido.BT_AlterarClick(Sender: TObject);
begin
     Fornecedor00.Resultado_Adiciona_Fornecedor_Pedido.Text := '1';
     AdicionaFornecedorPedido.Close;
end;

end.
