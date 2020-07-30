unit Funcionarios_Contribuicoes_Sindicais_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TFuncionariosContribuicoesSindicais00 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    ED_Codigo: TEdit;
    ED_Funcionario: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    ED_Contribuicao_Sindical_Sindicato: TEdit;
    ED_Contribuicao_Sindical_Guia_N: TEdit;
    ED_Contribuicao_Sindical_Data: TMaskEdit;
    procedure BT_IncluirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuncionariosContribuicoesSindicais00: TFuncionariosContribuicoesSindicais00;

implementation

uses Conexao_BD, Rotinas_Gerais, Funcionarios_02;

{$R *.dfm}

procedure TFuncionariosContribuicoesSindicais00.BT_IncluirClick(
  Sender: TObject);
var
    Comando_SQL : string;
begin
    Comando_SQL := '';
    if(ED_Codigo.Text <> '')then begin
        Comando_SQL := 'update contribuicoes_sindicais set ';
        Comando_SQL := Comando_SQL + 'contribuicao_sindical_data = '              +#39+Inverte_Data_Plus(ED_Contribuicao_Sindical_Data.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + 'contribuicao_sindical_guia_n = '            +#39+Trim(ED_Contribuicao_Sindical_Guia_N.Text)                       +#39+', ';
        Comando_SQL := Comando_SQL + 'contribuicao_sindical_sindicato = '         +#39+Trim(ED_Contribuicao_Sindical_Sindicato.Text)                    +#39+' ';
        Comando_SQL := Comando_SQL + 'where (contribuicao_sindical_funcionario = '+#39+Trim(ED_Funcionario.Text)                                        +#39+')';
        Comando_SQL := Comando_SQL + ' and (contribuicao_sindical_codigo = '      +#39+Trim(ED_Codigo.Text)                                             +#39+')';
        end
    else begin
        Comando_SQL := 'insert into contribuicoes_sindicais(';
        Comando_SQL := Comando_SQL + 'contribuicao_sindical_data, ';
        Comando_SQL := Comando_SQL + 'contribuicao_sindical_guia_n, ';
        Comando_SQL := Comando_SQL + 'contribuicao_sindical_sindicato, ';
        Comando_SQL := Comando_SQL + 'contribuicao_sindical_funcionario)';
        Comando_SQL := Comando_SQL + ' values(';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Contribuicao_Sindical_Data.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Contribuicao_Sindical_Guia_N.Text)                       +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Contribuicao_Sindical_Sindicato.Text)                    +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Funcionario.Text)                                        +#39+')';
    end;
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Adição Efetuada...');

    FuncionariosContribuicoesSindicais00.Close;
end;

procedure TFuncionariosContribuicoesSindicais00.BT_SairClick(
  Sender: TObject);
begin
    FuncionariosContribuicoesSindicais00.Close;
end;

procedure TFuncionariosContribuicoesSindicais00.FormCreate(
  Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFuncionariosContribuicoesSindicais00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Funcionarios02.Carrega_Contibuicao_Sindical();

    Action := caFree;
    Release;
    FuncionariosContribuicoesSindicais00 := Nil;
end;

end.
