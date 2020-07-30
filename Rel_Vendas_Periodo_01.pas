unit Rel_Vendas_Periodo_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TRelVendasPeriodo01 = class(TForm)
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Periodo_Relatorio: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DBGrid_Nota: TDBGrid;
    DBGrid_Papeleta: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Total_Qtde_Notas: TLabel;
    Total_Valor_Notas: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Total_Qtde_Papeletas: TLabel;
    Label7: TLabel;
    Total_Valor_Papeletas: TLabel;
    Panel5: TPanel;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Total_Qtde_Geral: TLabel;
    Label10: TLabel;
    Total_Valor_Geral: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure DBGrid_NotaCellClick(Column: TColumn);
    procedure DBGrid_PapeletaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendasPeriodo01: TRelVendasPeriodo01;

implementation

uses Conexao_BD, Rotinas_Gerais, Historico_Clientes_02;

{$R *.dfm}

procedure TRelVendasPeriodo01.BT_SairClick(Sender: TObject);
begin
     RelVendasPeriodo01.Close;
end;

procedure TRelVendasPeriodo01.DBGrid_NotaCellClick(Column: TColumn);
var Selecionado: string;
begin
    If DBGrid_Nota.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Nota.Fields[0].Text;

      Application.CreateForm(THistoricoClientes02,HistoricoClientes02);

      HistoricoClientes02.Nro_Pedido.Text     := Trim(DBGrid_Nota.Fields[0].Text);
      HistoricoClientes02.Tipo_Fatura.Text    := Trim('Nota Fiscal');

      HistoricoClientes02.ShowModal;
      HistoricoClientes02.Destroy;
    End;
end;

procedure TRelVendasPeriodo01.DBGrid_PapeletaCellClick(Column: TColumn);
var Selecionado: string;
begin
    If DBGrid_Papeleta.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Papeleta.Fields[0].Text;

      Application.CreateForm(THistoricoClientes02,HistoricoClientes02);

      HistoricoClientes02.Nro_Pedido.Text     := Trim(DBGrid_Papeleta.Fields[0].Text);
      HistoricoClientes02.Tipo_Fatura.Text    := Trim('Papeleta');

      HistoricoClientes02.ShowModal;
      HistoricoClientes02.Destroy;   

      ConexaoBD.SQL_Venda_Periodo_Papeleta.Locate('fb_papeleta_numero',Trim(Selecionado),[]);
    End;
end;

end.
