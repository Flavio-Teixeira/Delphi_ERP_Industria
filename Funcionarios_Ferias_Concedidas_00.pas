unit Funcionarios_Ferias_Concedidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFuncionariosFeriasConcedidas00 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    ED_Codigo: TEdit;
    ED_Funcionario: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ED_Data_F: TMaskEdit;
    Label1: TLabel;
    ED_Data_I: TMaskEdit;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ED_Referente_Data_F: TMaskEdit;
    ED_Referente_Data_I: TMaskEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuncionariosFeriasConcedidas00: TFuncionariosFeriasConcedidas00;

implementation

uses Conexao_BD, Funcionarios_02, Rotinas_Gerais;

{$R *.dfm}

procedure TFuncionariosFeriasConcedidas00.BT_SairClick(Sender: TObject);
begin
    FuncionariosFeriasConcedidas00.Close;
end;

procedure TFuncionariosFeriasConcedidas00.BT_IncluirClick(Sender: TObject);
var
    Comando_SQL : string;
begin
    Comando_SQL := '';
    if(ED_Codigo.Text <> '')then begin
        Comando_SQL := 'update ferias_concedidas set ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_data_i = '             +#39+Inverte_Data_Plus(ED_Data_I.Text,'amd','/')           +#39+', ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_data_f = '             +#39+Inverte_Data_Plus(ED_Data_F.Text,'amd','/')           +#39+', ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_referente_data_i = '   +#39+Inverte_Data_Plus(ED_Referente_Data_I.Text,'amd','/') +#39+', ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_referente_data_f = '   +#39+Inverte_Data_Plus(ED_Referente_Data_F.Text,'amd','/') +#39+' ';
        Comando_SQL := Comando_SQL + 'where (ferias_concedida_funcionario = ' +#39+Trim(ED_Funcionario.Text)                             +#39+')';
        Comando_SQL := Comando_SQL + ' and (ferias_concedida_codigo = '       +#39+Trim(ED_Codigo.Text)                                  +#39+')';
        end
    else begin
        Comando_SQL := 'insert into ferias_concedidas(';
        Comando_SQL := Comando_SQL + 'ferias_concedida_data_i, ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_data_f, ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_referente_data_i, ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_referente_data_f, ';
        Comando_SQL := Comando_SQL + 'ferias_concedida_funcionario)';
        Comando_SQL := Comando_SQL + ' values(';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Data_I.Text,'amd','/')            +#39+', ';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Data_F.Text,'amd','/')            +#39+', ';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Referente_Data_I.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + #39+Inverte_Data_Plus(ED_Referente_Data_F.Text,'amd','/')  +#39+', ';
        Comando_SQL := Comando_SQL + #39+Trim(ED_Funcionario.Text)                              +#39+')';
    end;
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Adição Efetuada...');

    FuncionariosFeriasConcedidas00.Close;
end;

procedure TFuncionariosFeriasConcedidas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Funcionarios02.Carrega_Ferias_Concedidas();

    Action := caFree;
    Release;
    FuncionariosFeriasConcedidas00 := Nil;
end;

procedure TFuncionariosFeriasConcedidas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

end.
