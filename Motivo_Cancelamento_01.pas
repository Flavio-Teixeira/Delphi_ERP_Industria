unit Motivo_Cancelamento_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TMotivoCancelamento01 = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Edit_Motivo: TEdit;
    Edit_Operador: TEdit;
    BT_OK: TBitBtn;
    OS_Numero: TEdit;
    OS_CNPJ: TEdit;
    OS_Titulo: TEdit;
    OS_DataCriacao: TEdit;
    OS_Tipo_os: TEdit;
    procedure BT_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MotivoCancelamento01: TMotivoCancelamento01;

implementation

uses Adiciona_Fornecedor_Pedido, Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TMotivoCancelamento01.BT_OKClick(Sender: TObject);
var Comando_SQL, Data_atual: string;
begin
    if (Trim(Edit_Operador.Text) = '') then begin
      MSG_Erro('Para prosseguir preencha o campo Operador...');
      Edit_Operador.SetFocus;
      end
    else if (Trim(Edit_Motivo.Text) = '') Then begin
      MSG_Erro('Para prosseguir preencha o campo Motivo...');
      Edit_Motivo.SetFocus;
      end
    else begin
      Data_atual := DateToStr(Date());

      Comando_SQL := 'Insert cancelamento_orcamento(';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_nro, ';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_tipo_os, ';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_cliente_codigo, ';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_titulo, ';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_data_criacao, ';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_data_cancelamento, ';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_operador, ';
      Comando_SQL := Comando_SQL + 'cancelamento_orcamento_motivo) ';
      Comando_SQL := Comando_SQL + 'values(';
      Comando_SQL := Comando_SQL + #39+ OS_Numero.Text +#39+', ';
      Comando_SQL := Comando_SQL + #39+ OS_Tipo_os.Text +#39+', ';      
      Comando_SQL := Comando_SQL + #39+ OS_CNPJ.Text +#39+', ';
      Comando_SQL := Comando_SQL + #39+ OS_Titulo.Text +#39+', ';
      Comando_SQL := Comando_SQL + #39+ Inverte_Data_Plus(OS_DataCriacao.Text,'amd','-') +#39+', ';
      Comando_SQL := Comando_SQL + #39+ Inverte_Data_Plus(Data_atual,'amd','-') +#39+', ';
      Comando_SQL := Comando_SQL + #39+ Edit_Operador.Text  +#39+', ';
      Comando_SQL := Comando_SQL + #39+ Edit_Motivo.Text    +#39+')';

      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MotivoCancelamento01.Close;
    end;
end;

procedure TMotivoCancelamento01.FormClose(Sender: TObject;
  var Action: TCloseAction);

var
   Comando_SQL, Data_atual: String;
  
begin
     If Trim(Edit_Motivo.Text) = '' Then
        Begin
        Data_atual := DateToStr(Date());

        Comando_SQL := 'Insert cancelamento_os(';
        Comando_SQL := Comando_SQL + 'cancelamento_os_nro, ';
        Comando_SQL := Comando_SQL + 'cancelamento_os_tipo_os, ';
        Comando_SQL := Comando_SQL + 'cancelamento_os_cliente_codigo, ';
        Comando_SQL := Comando_SQL + 'cancelamento_os_titulo, ';
        Comando_SQL := Comando_SQL + 'cancelamento_os_data_criacao, ';
        Comando_SQL := Comando_SQL + 'cancelamento_os_data_cancelamento, ';
        Comando_SQL := Comando_SQL + 'cancelamento_os_operador, ';
        Comando_SQL := Comando_SQL + 'cancelamento_os_motivo) ';
        Comando_SQL := Comando_SQL + 'values(';
        Comando_SQL := Comando_SQL + #39+ OS_Numero.Text +#39+', ';
        Comando_SQL := Comando_SQL + #39+ OS_Tipo_os.Text +#39+', ';
        Comando_SQL := Comando_SQL + #39+ OS_CNPJ.Text +#39+', ';
        Comando_SQL := Comando_SQL + #39+ OS_Titulo.Text +#39+', ';
        Comando_SQL := Comando_SQL + #39+ Inverte_Data_Plus(OS_DataCriacao.Text,'amd','-') +#39+', ';
        Comando_SQL := Comando_SQL + #39+ Inverte_Data_Plus(Data_atual,'amd','-') +#39+', ';
        Comando_SQL := Comando_SQL + #39+ Edit_Operador.Text  +#39+', ';
        Comando_SQL := Comando_SQL + #39+ 'Sem Motivo - Operador Não Informou.' +#39+')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Operador fechou a Janela Sem Informar o Motivo, O Sistema registrou a Operação.');
     End;
end;

end.
