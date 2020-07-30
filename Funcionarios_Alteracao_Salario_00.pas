unit Funcionarios_Alteracao_Salario_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFuncionariosAlteracaoSalario00 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    ED_Codigo: TEdit;
    ED_Funcionario: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ED_Alteracao_Salario_Motivo: TEdit;
    Label3: TLabel;
    ED_Alteracao_Salario_Valor: TEdit;
    Label1: TLabel;
    ED_Alteracao_Salario_Data: TMaskEdit;
    Label8: TLabel;
    procedure ED_Alteracao_Salario_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuncionariosAlteracaoSalario00: TFuncionariosAlteracaoSalario00;

implementation

uses Conexao_BD, Rotinas_Gerais, Funcionarios_02;

{$R *.dfm}

procedure TFuncionariosAlteracaoSalario00.ED_Alteracao_Salario_ValorKeyPress(
  Sender: TObject; var Key: Char);
begin
    So_Valor(Sender,Key);
end;

procedure TFuncionariosAlteracaoSalario00.BT_IncluirClick(Sender: TObject);
var
    Comando_SQL : string;
begin
    Comando_SQL := '';
    if(ED_Codigo.Text <> '')then begin
        Comando_SQL := 'update alteracoes_salarios set ';
        Comando_SQL := Comando_SQL + 'alteracao_salario_data = '              +#39+Inverte_Data_Plus(ED_Alteracao_Salario_Data.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + 'alteracao_salario_valor = '             +#39+Virgula_Ponto(ED_Alteracao_Salario_Valor.Text)               +#39+', ';
        Comando_SQL := Comando_SQL + 'alteracao_salario_motivo = '            +#39+Trim(ED_Alteracao_Salario_Motivo.Text)                       +#39+' ';
        Comando_SQL := Comando_SQL + 'where (alteracao_salario_funcionario = '+#39+Trim(ED_Funcionario.Text)                                    +#39+')';
        Comando_SQL := Comando_SQL + ' and (alteracao_salario_codigo = '      +#39+Trim(ED_Codigo.Text)                                         +#39+')';
        end
    else begin
        Comando_SQL := 'insert into alteracoes_salarios(';
        Comando_SQL := Comando_SQL + 'alteracao_salario_data, ';
        Comando_SQL := Comando_SQL + 'alteracao_salario_valor, ';
        Comando_SQL := Comando_SQL + 'alteracao_salario_motivo, ';
        Comando_SQL := Comando_SQL + 'alteracao_salario_funcionario)';
        Comando_SQL := Comando_SQL + ' values(';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Alteracao_Salario_Data.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + #39+Virgula_Ponto(ED_Alteracao_Salario_Valor.Text)               +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Alteracao_Salario_Motivo.Text)                       +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Funcionario.Text)                                    +#39+')';
    end;
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Adição Efetuada...');

    FuncionariosAlteracaoSalario00.Close;
end;

procedure TFuncionariosAlteracaoSalario00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Funcionarios02.Carrega_Alteracao_Salario();

    Action := caFree;
    Release;
    FuncionariosAlteracaoSalario00 := Nil;    
end;

procedure TFuncionariosAlteracaoSalario00.BT_SairClick(Sender: TObject);
begin
    FuncionariosAlteracaoSalario00.Close;
end;

procedure TFuncionariosAlteracaoSalario00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

end.
