unit Taxas_Impostos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TTaxasImpostos00 = class(TForm)
    Panel1: TPanel;
    lblTaxas_Impostos: TLabel;
    edtPorcentagem: TEdit;
    btnAlterar: TBitBtn;
    btnSair: TBitBtn;
    edtTipo: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPorcentagemKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TaxasImpostos00: TTaxasImpostos00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TTaxasImpostos00.btnSairClick(Sender: TObject);
begin
    TaxasImpostos00.Close;
end;

procedure TTaxasImpostos00.FormShow(Sender: TObject);
var Comando_SQL: String;
begin
    TaxasImpostos00.Caption   := 'Taxas / Impostos - ' + edtTipo.Text;
    lblTaxas_Impostos.Caption := edtTipo.Text + ' - Porcentagem para cálculo';

    ConexaoBD.SQL_FB_Impostos_Taxas.Close;
    ConexaoBD.SQL_FB_Impostos_Taxas.SQL.Clear;
    ConexaoBD.SQL_FB_Impostos_Taxas.SQL.Add('Select * from fb_impostos_taxas Where fb_imposto_taxa_tipo ='+#39+Trim(edtTipo.Text)+#39);
    ConexaoBD.SQL_FB_Impostos_Taxas.Open;

    If ConexaoBD.SQL_FB_Impostos_Taxas.RecordCount = 0 Then Begin
        Comando_SQL := 'Insert into fb_impostos_taxas(fb_imposto_taxa_tipo,fb_imposto_taxa_porcentagem) ';
        Comando_SQL := Comando_SQL + 'values('+#39+Trim(edtTipo.Text)+#39+',0)';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        ConexaoBD.SQL_FB_Impostos_Taxas.Close;
        ConexaoBD.SQL_FB_Impostos_Taxas.SQL.Clear;
        ConexaoBD.SQL_FB_Impostos_Taxas.SQL.Add('Select * from fb_impostos_taxas Where fb_imposto_taxa_tipo ='+#39+Trim(edtTipo.Text)+#39);
        ConexaoBD.SQL_FB_Impostos_Taxas.Open;
    End;

    edtPorcentagem.Text := ConexaoBD.SQL_FB_Impostos_Taxasfb_imposto_taxa_porcentagem.Text;
    ConexaoBD.SQL_FB_Impostos_Taxas.Close;
end;

procedure TTaxasImpostos00.edtPorcentagemKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End
     Else begin
        So_Valor(Sender,Key);
     End;
end;

procedure TTaxasImpostos00.btnAlterarClick(Sender: TObject);
var Comando_SQL: String;
begin
    If Trim(edtPorcentagem.Text)='' Then begin
        MSG_Erro('Antes de prosseguir, preencha'+#13+'o campo de porcentagem para calculo...');
        edtPorcentagem.SetFocus;
    end
    Else begin
        Comando_SQL := 'Update fb_impostos_taxas set ';
        Comando_SQL := Comando_SQL + 'fb_imposto_taxa_porcentagem ='+Virgula_Ponto(edtPorcentagem.Text)+' ';
        Comando_SQL := Comando_SQL + 'Where fb_imposto_taxa_tipo ='+#39+Trim(edtTipo.Text)+#39;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Atualização efetuada...');
        TaxasImpostos00.Close;
    end;
end;

end.
