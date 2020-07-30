unit Funcionarios_Alteracao_Cargo_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TFuncionariosAlteracaoCargo00 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    ED_Codigo: TEdit;
    ED_Funcionario: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    ED_Alteracao_Cargo_Descricao: TEdit;
    ED_Alteracao_Cargo_Data: TMaskEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuncionariosAlteracaoCargo00: TFuncionariosAlteracaoCargo00;

implementation

uses Conexao_BD, Funcionarios_02, Rotinas_Gerais;

{$R *.dfm}

procedure TFuncionariosAlteracaoCargo00.BT_SairClick(Sender: TObject);
begin
    FuncionariosAlteracaoCargo00.Close;
end;

procedure TFuncionariosAlteracaoCargo00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFuncionariosAlteracaoCargo00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Funcionarios02.Carrega_Alteracao_Cargo();

    Action := caFree;
    Release;
    FuncionariosAlteracaoCargo00 := Nil;
end;

procedure TFuncionariosAlteracaoCargo00.BT_IncluirClick(Sender: TObject);
var
    Comando_SQL : string;
begin
    Comando_SQL := '';
    if(ED_Codigo.Text <> '')then begin
        Comando_SQL := 'update alteracoes_cargos set ';
        Comando_SQL := Comando_SQL + 'alteracao_cargo_data = '              +#39+Inverte_Data_Plus(ED_Alteracao_Cargo_Data.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + 'alteracao_cargo_descricao = '         +#39+Trim(ED_Alteracao_Cargo_Descricao.Text)                    +#39+' ';
        Comando_SQL := Comando_SQL + 'where (alteracao_cargo_funcionario = '+#39+Trim(ED_Funcionario.Text)                                  +#39+')';
        Comando_SQL := Comando_SQL + ' and (alteracao_cargo_codigo = '      +#39+Trim(ED_Codigo.Text)                                       +#39+')';
        end
    else begin
        Comando_SQL := 'insert into alteracoes_cargos(';
        Comando_SQL := Comando_SQL + 'alteracao_cargo_data, ';
        Comando_SQL := Comando_SQL + 'alteracao_cargo_descricao, ';
        Comando_SQL := Comando_SQL + 'alteracao_cargo_funcionario)';
        Comando_SQL := Comando_SQL + ' values(';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Alteracao_Cargo_Data.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Alteracao_Cargo_Descricao.Text)                    +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Funcionario.Text)                                  +#39+')';
    end;
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Adição Efetuada...');

    FuncionariosAlteracaoCargo00.Close;
end;

end.
