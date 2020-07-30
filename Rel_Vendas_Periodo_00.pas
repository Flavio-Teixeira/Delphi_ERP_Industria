unit Rel_Vendas_Periodo_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelVendasPeriodo00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Acc_Empresa: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendasPeriodo00: TRelVendasPeriodo00;

implementation

uses Ibrasmak_00, Conexao_BD, Rotinas_Gerais, Rel_Vendas_Periodo_01;

{$R *.dfm}

procedure TRelVendasPeriodo00.BT_SairClick(Sender: TObject);
begin
     RelVendasPeriodo00.Close;
end;

procedure TRelVendasPeriodo00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     
     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TRelVendasPeriodo00.FormShow(Sender: TObject);
begin
    // Carrega data atual nos campos de periodo
    Data_Inicial.Text := DateToStr(Date());
    Data_Final.Text   := DateToStr(Date());
end;

procedure TRelVendasPeriodo00.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasPeriodo00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasPeriodo00.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL: String;
   Qtde_Notas, Qtde_Papeletas: Integer;
   Vlr_Notas, Vlr_Papeletas: Real;

begin
     If Trim(Data_Inicial.Text) = '/  /' Then
        Begin
        MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
        Data_Inicial.SetFocus;
        End
     Else If Trim(Data_Final.Text) = '/  /' then
        Begin
        MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
        Data_Final.SetFocus;
        End
     Else If StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
        Begin
        MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
        Data_Final.SetFocus;
        End
     Else
        Begin

        if (Acc_Empresa.Text = 'Monibras') then begin

            Ampulheta();
            //*** Prepara a Seleção das Notas ***

            Comando_SQL := 'Select * from mb_notas_fiscais Where ';
            Comando_SQL := Comando_SQL + '((mb_nota_fiscal_data_emissao >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and mb_nota_fiscal_data_emissao <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') and (mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+')) ';
            Comando_SQL := Comando_SQL + 'Order By mb_nota_fiscal_data_emissao, mb_nota_fiscal_numero';

            ConexaoBD.SQL_MB_Venda_Periodo_Nota.Close;
            ConexaoBD.SQL_MB_Venda_Periodo_Nota.SQL.Clear;
            ConexaoBD.SQL_MB_Venda_Periodo_Nota.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_MB_Venda_Periodo_Nota.Open;

            Qtde_Notas := 0;
            Vlr_Notas  := 0;

            If ConexaoBD.SQL_MB_Venda_Periodo_Nota.RecordCount > 0 Then
               Begin
               ConexaoBD.SQL_MB_Venda_Periodo_Nota.First;

               While Not ConexaoBD.SQL_MB_Venda_Periodo_Nota.Eof Do
                     Begin
                     Qtde_Notas := Qtde_Notas + 1;
                     Vlr_Notas  := Vlr_Notas + ConexaoBD.SQL_MB_Venda_Periodo_Notamb_nota_fiscal_valor_total.AsFloat;

                     ConexaoBD.SQL_MB_Venda_Periodo_Nota.Next;
               End;
            End;

            ConexaoBD.SQL_MB_Venda_Periodo_Nota.First;

            //*** Prepara a Seleção das Papeletas ***

            Comando_SQL := 'Select * from mb_papeletas Where ';
            Comando_SQL := Comando_SQL + '((mb_papeleta_data_emissao >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and mb_papeleta_data_emissao <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') and (mb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+')) ';
            Comando_SQL := Comando_SQL + 'Order By mb_papeleta_data_emissao, mb_papeleta_numero';

            ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.Close;
            ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.SQL.Clear;
            ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.Open;

            Qtde_Papeletas := 0;
            Vlr_Papeletas  := 0;

            If ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.RecordCount > 0 Then
               Begin
               ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.First;

               While Not ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.Eof Do
                     Begin
                     Qtde_Papeletas := Qtde_Papeletas + 1;
                     Vlr_Papeletas  := Vlr_Papeletas + ConexaoBD.SQL_MB_Venda_Periodo_Papeletamb_papeleta_valor_total.AsFloat;

                     ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.Next;
               End;
            End;

            ConexaoBD.SQL_MB_Venda_Periodo_Papeleta.First;

            Seta();

            //*** Abre a Tela do Relatório ***

            Application.CreateForm(TRelVendasPeriodo01,RelVendasPeriodo01);

            RelVendasPeriodo01.Periodo_Relatorio.Caption := 'Período De ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text);
            RelVendasPeriodo01.Total_Qtde_Notas.Caption  := IntToStr(Qtde_Notas);
            RelVendasPeriodo01.Total_Valor_Notas.Caption := FloatToStr(Vlr_Notas);

            RelVendasPeriodo01.Total_Qtde_Papeletas.Caption  := IntToStr(Qtde_Papeletas);
            RelVendasPeriodo01.Total_Valor_Papeletas.Caption := FloatToStr(Vlr_Papeletas);

            RelVendasPeriodo01.Total_Qtde_Geral.Caption  := IntToStr(Qtde_Notas + Qtde_Papeletas);
            RelVendasPeriodo01.Total_Valor_Geral.Caption := FloatToStr(Vlr_Notas + Vlr_Papeletas);

            RelVendasPeriodo01.ShowModal;
            RelVendasPeriodo01.Destroy;


            End
        Else
            begin
            Ampulheta();
            //*** Prepara a Seleção das Notas ***

            Comando_SQL := 'Select * from fb_notas_fiscais Where ';
            Comando_SQL := Comando_SQL + '((fb_nota_fiscal_data_emissao >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_data_emissao <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') and (fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+')) ';
            Comando_SQL := Comando_SQL + 'Order By fb_nota_fiscal_data_emissao, fb_nota_fiscal_numero';

            ConexaoBD.SQL_Venda_Periodo_Nota.Close;
            ConexaoBD.SQL_Venda_Periodo_Nota.SQL.Clear;
            ConexaoBD.SQL_Venda_Periodo_Nota.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Venda_Periodo_Nota.Open;

            Qtde_Notas := 0;
            Vlr_Notas  := 0;

            If ConexaoBD.SQL_Venda_Periodo_Nota.RecordCount > 0 Then
               Begin
               ConexaoBD.SQL_Venda_Periodo_Nota.First;

               While Not ConexaoBD.SQL_Venda_Periodo_Nota.Eof Do
                     Begin
                     Qtde_Notas := Qtde_Notas + 1;
                     Vlr_Notas  := Vlr_Notas + ConexaoBD.SQL_Venda_Periodo_Notafb_nota_fiscal_valor_total.AsFloat;

                     ConexaoBD.SQL_Venda_Periodo_Nota.Next;
               End;
            End;

            ConexaoBD.SQL_Venda_Periodo_Nota.First;

            //*** Prepara a Seleção das Papeletas ***

            Comando_SQL := 'Select * from fb_papeletas Where ';
            Comando_SQL := Comando_SQL + '((fb_papeleta_data_emissao >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and fb_papeleta_data_emissao <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') and (fb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+')) ';
            Comando_SQL := Comando_SQL + 'Order By fb_papeleta_data_emissao, fb_papeleta_numero';

            ConexaoBD.SQL_Venda_Periodo_Papeleta.Close;
            ConexaoBD.SQL_Venda_Periodo_Papeleta.SQL.Clear;
            ConexaoBD.SQL_Venda_Periodo_Papeleta.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Venda_Periodo_Papeleta.Open;

            Qtde_Papeletas := 0;
            Vlr_Papeletas  := 0;

            If ConexaoBD.SQL_Venda_Periodo_Papeleta.RecordCount > 0 Then
               Begin
               ConexaoBD.SQL_Venda_Periodo_Papeleta.First;

               While Not ConexaoBD.SQL_Venda_Periodo_Papeleta.Eof Do
                     Begin
                     Qtde_Papeletas := Qtde_Papeletas + 1;
                     Vlr_Papeletas  := Vlr_Papeletas + ConexaoBD.SQL_Venda_Periodo_Papeletafb_papeleta_valor_total.AsFloat;

                     ConexaoBD.SQL_Venda_Periodo_Papeleta.Next;
               End;
            End;

            ConexaoBD.SQL_Venda_Periodo_Papeleta.First;

            Seta();

            //*** Abre a Tela do Relatório ***

            Application.CreateForm(TRelVendasPeriodo01,RelVendasPeriodo01);

            RelVendasPeriodo01.Periodo_Relatorio.Caption := 'Período De ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text);
            RelVendasPeriodo01.Total_Qtde_Notas.Caption  := IntToStr(Qtde_Notas);
            RelVendasPeriodo01.Total_Valor_Notas.Caption := FloatToStr(Vlr_Notas);

            RelVendasPeriodo01.Total_Qtde_Papeletas.Caption  := IntToStr(Qtde_Papeletas);
            RelVendasPeriodo01.Total_Valor_Papeletas.Caption := FloatToStr(Vlr_Papeletas);

            RelVendasPeriodo01.Total_Qtde_Geral.Caption  := IntToStr(Qtde_Notas + Qtde_Papeletas);
            RelVendasPeriodo01.Total_Valor_Geral.Caption := FloatToStr(Vlr_Notas + Vlr_Papeletas);

            RelVendasPeriodo01.ShowModal;
            RelVendasPeriodo01.Destroy;
        End;
    End;
end;

end.
