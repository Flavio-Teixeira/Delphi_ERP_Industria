unit Funcionarios_Acidentes_Doencas_Profissionais_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TFuncionariosAcidentesDoencasProfissionais00 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    ED_Codigo: TEdit;
    ED_Funcionario: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    ED_Acidente_Doenca_Profissional_Titulo: TEdit;
    ED_Acidente_Doenca_Profissional_Ocorrido: TMaskEdit;
    Label1: TLabel;
    ED_Acidente_Doenca_Profissional_Alta: TMaskEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuncionariosAcidentesDoencasProfissionais00: TFuncionariosAcidentesDoencasProfissionais00;

implementation

uses Conexao_BD, Rotinas_Gerais, Funcionarios_02;

{$R *.dfm}

procedure TFuncionariosAcidentesDoencasProfissionais00.BT_SairClick(
  Sender: TObject);
begin
    FuncionariosAcidentesDoencasProfissionais00.Close;
end;

procedure TFuncionariosAcidentesDoencasProfissionais00.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
    Funcionarios02.Carrega_Acidentes_Doencas_Profissionais();

    Action := caFree;
    Release;
    FuncionariosAcidentesDoencasProfissionais00 := Nil;
end;

procedure TFuncionariosAcidentesDoencasProfissionais00.FormCreate(
  Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFuncionariosAcidentesDoencasProfissionais00.BT_IncluirClick(
  Sender: TObject);
var
    Comando_SQL : string;
begin
    Comando_SQL := '';
    if(ED_Codigo.Text <> '')then begin
        Comando_SQL := 'update acidentes_doencas_profissionais set ';
        Comando_SQL := Comando_SQL + 'acidente_doenca_profissional_data_ocorrido = '     +#39+Inverte_Data_Plus(ED_Acidente_Doenca_Profissional_Ocorrido.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + 'acidente_doenca_profissional_data_alta = '         +#39+Inverte_Data_Plus(ED_Acidente_Doenca_Profissional_Alta.Text,'amd','/')      +#39+', ';
        Comando_SQL := Comando_SQL + 'acidente_doenca_profissional_titulo = '            +#39+Trim(ED_Acidente_Doenca_Profissional_Titulo.Text)                           +#39+' ';
        Comando_SQL := Comando_SQL + 'where (acidente_doenca_profissional_funcionario = '+#39+Trim(ED_Funcionario.Text)                                                   +#39+')';
        Comando_SQL := Comando_SQL + ' and (acidente_doenca_profissional_codigo = '      +#39+Trim(ED_Codigo.Text)                                                        +#39+')';
        end
    else begin
        Comando_SQL := 'insert into acidentes_doencas_profissionais(';
        Comando_SQL := Comando_SQL + 'acidente_doenca_profissional_data_ocorrido, ';
        Comando_SQL := Comando_SQL + 'acidente_doenca_profissional_data_alta, ';
        Comando_SQL := Comando_SQL + 'acidente_doenca_profissional_titulo, ';
        Comando_SQL := Comando_SQL + 'acidente_doenca_profissional_funcionario)';
        Comando_SQL := Comando_SQL + ' values(';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Acidente_Doenca_Profissional_Ocorrido.Text,'amd','/') +#39+', ';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Acidente_Doenca_Profissional_Alta.Text,'amd','/')     +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Acidente_Doenca_Profissional_Titulo.Text)                          +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Funcionario.Text)                                                  +#39+')';
    end;
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Adição Efetuada...');

    FuncionariosAcidentesDoencasProfissionais00.Close;
end;

end.
