unit Rel_Fornecedores_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TRelFornecedores00 = class(TForm)
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFornecedores00: TRelFornecedores00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Cliente_Representante_01, Ibrasmak_00,
  Rel_Cliente_Representante_00, Rel_Fornecedores_01;

{$R *.dfm}

procedure TRelFornecedores00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelFornecedores00.BT_SairClick(Sender: TObject);
begin
     RelFornecedores00.Close;
end;

procedure TRelFornecedores00.BT_ImprimirClick(Sender: TObject);

var
   Nro_Representante, Comando_SQL: String;

begin
     Ampulheta();

     Comando_SQL := 'select * from fb_fornecedores order by fb_fornecedor_nome';

     ConexaoBD.SQL_Fornecedores.Close;
     ConexaoBD.SQL_Fornecedores.SQL.Clear;
     ConexaoBD.SQL_Fornecedores.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Fornecedores.Open;

     Application.CreateForm(TRelFornecedores01,RelFornecedores01);

     Seta();

     RelFornecedores01.RelFichasVisitas.Preview;
     RelFornecedores01.RelFichasVisitas.Destroy;
     RelFornecedores01.Destroy;
end;

end.
