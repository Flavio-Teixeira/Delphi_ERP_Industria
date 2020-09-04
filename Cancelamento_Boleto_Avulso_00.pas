unit Cancelamento_Boleto_Avulso_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCancelamentoBoletoAvulso00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Nro_Boleto_Avulso: TEdit;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Cancelar: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure Nro_Boleto_AvulsoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelamentoBoletoAvulso00: TCancelamentoBoletoAvulso00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TCancelamentoBoletoAvulso00.BT_SairClick(Sender: TObject);
begin
     CancelamentoBoletoAvulso00.Close;
end;

procedure TCancelamentoBoletoAvulso00.Nro_Boleto_AvulsoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCancelamentoBoletoAvulso00.BT_CancelarClick(Sender: TObject);

var
   Nro_Nota, Comando_SQL, Posicao: String;

begin
     If Trim(Nro_Boleto_Avulso.Text) <> '' Then
        Begin
        Ampulheta();

        Nro_Nota := Trim(Nro_Boleto_Avulso.Text);

        Nro_Nota := Retira_Caracter(Nro_Nota,'A');
        Nro_Nota := Retira_Caracter(Nro_Nota,'B');
        Nro_Nota := Retira_Caracter(Nro_Nota,'C');
        Nro_Nota := Retira_Caracter(Nro_Nota,'D');
        Nro_Nota := Retira_Caracter(Nro_Nota,'E');

        If Localiza_Caracter(Trim(Nro_Boleto_Avulso.Text),'C') Then
           Begin
           Comando_SQL := 'Update fb_notas_fiscais Set ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_imp_3 = ' +#39 + 'N' + #39+ ', ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_cart_3 = ' +#39 + 'N' + #39+ ' ';
           Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(Nro_Nota);
           End
        Else If Localiza_Caracter(Trim(Nro_Boleto_Avulso.Text),'B') Then
           Begin
           Comando_SQL := 'Update fb_notas_fiscais Set ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_imp_2 = ' +#39 + 'N' + #39+ ', ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_cart_2 = ' +#39 + 'N' + #39+ ' ';
           Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(Nro_Nota);
           End
        Else
           Begin
           Comando_SQL := 'Update fb_notas_fiscais Set ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_imp_1 = ' +#39 + 'N' + #39+ ', ';
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_cart_1 = ' +#39 + 'N' + #39+ ' ';
           Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(Nro_Nota);
        End;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Boleto Avulso Cancelado.');

        Nro_Boleto_Avulso.Text := '';
        Nro_Boleto_Avulso.SetFocus;

        End
     Else
        Begin
        MSG_Erro('Por Favor, Informar o Número do Boleto Avulso a Ser Cancelado.');

        Nro_Boleto_Avulso.SetFocus;
     End;
end;

end.
