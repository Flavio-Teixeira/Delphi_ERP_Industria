unit Alteracao_Notas_Fiscais_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAlteracaoNotasFiscaisSaidas00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit_nro_nota_fiscal: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    CMB_Transportadora: TComboBox;
    CMB_Representante: TComboBox;
    Edit_Volume: TEdit;
    Edit_Valor_Pedido: TEdit;
    Edit_Valor_Desconto: TEdit;
    Edit_Valor_Total: TEdit;
    Edit_Desdobramento_1: TEdit;
    Edit_Desdobramento_2: TEdit;
    Edit_Desdobramento_3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CMB_Banco: TComboBox;
    Label12: TLabel;
    Natureza_Operacao: TComboBox;
    Nro_Natureza_Operacao: TEdit;
    procedure Edit_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure CMB_TransportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit_Valor_PedidoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_nro_nota_fiscalKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Valor_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Valor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Desdobramento_1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Desdobramento_2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Desdobramento_3KeyPress(Sender: TObject; var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
  private
    Procedure Obtem_Dados_Nota(var Nro: String);
    Procedure Valida_Dados();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlteracaoNotasFiscaisSaidas00: TAlteracaoNotasFiscaisSaidas00;
  Nro_Nota, Altera: String;
  tranporte_index, vendedor_index: Integer;
implementation

uses Rotinas_Gerais, Conexao_BD, Ibrasmak_00;

{$R *.dfm}

procedure TAlteracaoNotasFiscaisSaidas00.Edit_VolumeKeyPress(Sender: TObject; var Key: Char);
begin
  So_Numero(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.CMB_TransportadoraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
    Begin
    key := #9;
  End;
end;

procedure TAlteracaoNotasFiscaisSaidas00.BT_SairClick(Sender: TObject);
begin
  AlteracaoNotasFiscaisSaidas00.Close;
end;

procedure TAlteracaoNotasFiscaisSaidas00.BT_ProcurarClick(Sender: TObject);
begin
  Nro_Nota := Edit_nro_nota_fiscal.Text;
  Obtem_Dados_Nota(Nro_Nota);
end;

Procedure TAlteracaoNotasFiscaisSaidas00.Obtem_Dados_Nota(var Nro: String);
Begin
    Ampulheta();
    CMB_Transportadora.ItemIndex := 0;
    CMB_Representante.ItemIndex  := 0;
    CMB_Banco.ItemIndex          := 0;
    Natureza_Operacao.ItemIndex  := 0;

    Edit_Volume.Text             := '';
    Edit_Valor_Pedido.Text       := '';
    Edit_Valor_Desconto.Text     := '';
    Edit_Valor_Total.Text        := '';
    Edit_Desdobramento_1.Text    := '';
    Edit_Desdobramento_2.Text    := '';
    Edit_Desdobramento_3.Text    := '';
    Nro_Natureza_Operacao.Text   := '';

    // Verifica se o número da nota foi digitado
    If Trim(Nro) = '' Then
      Begin
      MSG_Erro('Preencha o Campo ' + #39 + 'Nro Nota Fiscal' + #39 + ' Antes de Prosseguir...');
      End
    // Procura a nota
    Else
      Begin
      // Verifica se o número da nota existe
      ConexaoBD.SQL_FB_Nota_Fiscal.Close;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Nro);
      ConexaoBD.SQL_FB_Nota_Fiscal.Open;

      If (ConexaoBD.SQL_FB_Nota_Fiscal.Eof=True) And (ConexaoBD.SQL_FB_Nota_Fiscal.Bof=True) Then
        Begin
        CMB_Transportadora.Enabled   := False;
        CMB_Representante.Enabled    := False;
        CMB_Banco.Enabled            := False;
        Natureza_Operacao.Enabled    := False;

        Edit_Volume.Enabled          := False;
        Edit_Valor_Pedido.Enabled    := False;
        Edit_Valor_Desconto.Enabled  := False;
        Edit_Valor_Total.Enabled     := False;
        Edit_Desdobramento_1.Enabled := False;
        Edit_Desdobramento_2.Enabled := False;
        Edit_Desdobramento_3.Enabled := False;
        BT_Alterar.Enabled           := False;

        MSG_Erro('Nota Não Encontrada...');
        Edit_nro_nota_fiscal.SetFocus;
        End
      Else
        Begin
        If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_fatura.Text <> 'Nota Fiscal' Then
          begin
          MSG_Erro('Não é Possível alterar esse item, pois não se trata de uma nota fiscal...');
          end
        Else
          begin
          CMB_Transportadora.ItemIndex  := Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text);
          CMB_Representante.ItemIndex   := Obtem_Nro_Representante(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_vendedor.Text);
          CMB_Banco.ItemIndex           := Obtem_Nro_Banco(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);

          Nro_Natureza_Operacao.Text   := IntToStr(Obtem_Nro_Natureza_Operacao(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text,ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text));
          Natureza_Operacao.ItemIndex  := StrToInt(Nro_Natureza_Operacao.Text);

          Edit_Volume.Text              := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_volume.Text;
          Edit_Valor_Pedido.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_pedido.Text;
          Edit_Valor_Desconto.Text      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_desc.Text;
          Edit_Valor_Total.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
          Edit_Desdobramento_1.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
          Edit_Desdobramento_2.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
          Edit_Desdobramento_3.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;

          CMB_Transportadora.Enabled    := True;
          CMB_Representante.Enabled     := True;
          CMB_Banco.Enabled             := True;
          Natureza_Operacao.Enabled     := True;

          Edit_Volume.Enabled           := True;
          Edit_Valor_Pedido.Enabled     := True;
          Edit_Valor_Desconto.Enabled   := True;
          Edit_Valor_Total.Enabled      := True;
          BT_Alterar.Enabled            := True;

          If (Trim(Edit_Desdobramento_1.Text) <> '0') And (Trim(Edit_Desdobramento_1.Text) <> '') Then
            begin
            Edit_Desdobramento_1.Enabled := True;
          end;

          If (Trim(Edit_Desdobramento_2.Text) <> '0') And (Trim(Edit_Desdobramento_2.Text) <> '') Then
            begin
            Edit_Desdobramento_2.Enabled := True;
          end;

          If (Trim(Edit_Desdobramento_3.Text) <> '0') And (Trim(Edit_Desdobramento_3.Text) <> '') Then
            begin
            Edit_Desdobramento_3.Enabled := True;
          end;
        end;
      end;
    End;
    If Trim(Ibrasmak00.Tipo_Acesso.Text) = 'L' Then BT_Alterar.Enabled := False;    
    Seta();
End;

procedure TAlteracaoNotasFiscaisSaidas00.FormShow(Sender: TObject);
begin
    Ampulheta();

    // Obtem as Transportadoras
    ConexaoBD.SQL_FB_Transportadoras.Close;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Clear;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Add('Select * from fb_transportadoras Order By fb_transportadora_nome');
    ConexaoBD.SQL_FB_Transportadoras.Open;

    CMB_Transportadora.Items.Clear;
    If ConexaoBD.SQL_FB_Transportadoras.RecordCount > 0 Then
      begin
      ConexaoBD.SQL_FB_Transportadoras.First;

      While Not ConexaoBD.SQL_FB_Transportadoras.Eof Do
        begin
        CMB_Transportadora.Items.Add(IntToStr(ConexaoBD.SQL_FB_Transportadorasfb_transportadora_numero.AsInteger)+' - '+ConexaoBD.SQL_FB_Transportadorasfb_transportadora_nome.AsString);
        ConexaoBD.SQL_FB_Transportadoras.Next;
      End;
    end;

    ConexaoBD.SQL_FB_Transportadoras.Close;
    CMB_Transportadora.ItemIndex := 0;


    // Obtem os Representantes
    ConexaoBD.SQL_FB_Representantes.Close;
    ConexaoBD.SQL_FB_Representantes.SQL.Clear;
    ConexaoBD.SQL_FB_Representantes.SQL.Add('Select * from fb_representantes Order By fb_representante_nome');
    ConexaoBD.SQL_FB_Representantes.Open;

    CMB_Representante.Items.Clear;

    If conexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
      begin
      conexaoBD.SQL_FB_Representantes.First;

      While Not conexaoBD.SQL_FB_Representantes.Eof Do
        begin
        CMB_Representante.Items.Add(IntToStr(conexaoBD.SQL_FB_Representantesfb_representante_codigo.AsInteger)+' - '+conexaoBD.SQL_FB_Representantesfb_representante_nome.AsString);
        conexaoBD.SQL_FB_Representantes.Next;
      End;
    end;

    ConexaoBD.SQL_FB_Representantes.Close;
    CMB_Representante.ItemIndex := 0;

    // Obtem os Bancos
    ConexaoBD.SQL_FB_Bancos.Close;
    ConexaoBD.SQL_FB_Bancos.SQL.Clear;
    ConexaoBD.SQL_FB_Bancos.SQL.Add('Select * from fb_bancos Order By fb_banco_descricao');
    ConexaoBD.SQL_FB_Bancos.Open;

    CMB_Banco.Items.Clear;

    If conexaoBD.SQL_FB_Bancos.RecordCount > 0 Then
      begin
      conexaoBD.SQL_FB_Bancos.First;
      While Not conexaoBD.SQL_FB_Bancos.Eof Do
        begin
        CMB_Banco.Items.Add(IntToStr(conexaoBD.SQL_FB_Bancosfb_banco_codigo.AsInteger)+' - '+conexaoBD.SQL_FB_Bancosfb_banco_descricao.AsString);
        conexaoBD.SQL_FB_Bancos.Next;
      End;
    end;

    ConexaoBD.SQL_FB_Bancos.Close;
    CMB_Banco.ItemIndex := 0;

    If Trim(Ibrasmak00.Tipo_Acesso.Text) = 'L' Then BT_Alterar.Enabled := False;

    Seta();
end;

procedure TAlteracaoNotasFiscaisSaidas00.Edit_Valor_PedidoKeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.Edit_nro_nota_fiscalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 Then
    Begin
    Nro_Nota := Edit_nro_nota_fiscal.Text;
    Obtem_Dados_Nota(Nro_Nota);
  End;
  So_Numero(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.Edit_Valor_DescontoKeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.Edit_Valor_TotalKeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.Edit_Desdobramento_1KeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.Edit_Desdobramento_2KeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.Edit_Desdobramento_3KeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoNotasFiscaisSaidas00.Valida_Dados();
begin
  Altera := '';
  If Trim(Edit_nro_nota_fiscal.Text) = '' Then
    begin
    MSG_Erro('Antes de prosseguir selecione uma nota fiscal...');
    Edit_nro_nota_fiscal.SetFocus;
    end
  Else If Trim(Edit_Volume.Text) = '' Then
    begin
    MSG_Erro('Antes de prosseguir preencha o campo Volume...');
    Edit_Volume.SetFocus;
    end
  Else If StrToInt(Edit_Volume.Text) = 0 Then
    begin
    MSG_Erro('Antes de prosseguir modifique o valor do campo Volume ele é inferior a 1...');
    Edit_Volume.SetFocus;
    end
  Else If Trim(Edit_Valor_Pedido.Text) = '' Then
    begin
    MSG_Erro('Antes de prosseguir preencha o campo Valor do Pedido...');
    Edit_Valor_Pedido.SetFocus;
    end
  Else If StrToFloat(Edit_Valor_Pedido.Text) = 0 Then
    begin
    MSG_Erro('Antes de prosseguir modifique o valor do campo Valor do Pedido ele é inferior a 1...');
    Edit_Valor_Pedido.SetFocus;
    end
  Else If Trim(Edit_Valor_Desconto.Text) = '' Then
    begin
    MSG_Erro('Antes de prosseguir preencha o campo Valor do Desconto...');
    Edit_Valor_Desconto.SetFocus;
    end
  Else If Trim(Edit_Valor_Total.Text) = '' Then
    begin
    MSG_Erro('Antes de prosseguir preencha o campo Valor Total...');
    Edit_Valor_Total.SetFocus;
    end
  Else If StrToFloat(Edit_Valor_Total.Text) = 0 Then
    begin
    MSG_Erro('Antes de prosseguir modifique o valor do campo Valor Total ele é inferior a 1...');
    Edit_Valor_Total.SetFocus;
    end
  Else If Trim(Edit_Desdobramento_1.Text) = '' Then
    begin
    Edit_Desdobramento_1.Text := '0';
    end
  Else If Trim(Edit_Desdobramento_2.Text) = '' Then
    begin
    Edit_Desdobramento_2.Text := '0';
    end
  Else If Trim(Edit_Desdobramento_3.Text) = '' Then
    begin
    Edit_Desdobramento_3.Text := '0';
    end
  Else
    begin
    Altera := 'OK';
  end;
end;

procedure TAlteracaoNotasFiscaisSaidas00.BT_AlterarClick(Sender: TObject);

var
  transportadora, representante, Banco: string;

begin
  Valida_Dados();

  if Trim(Altera) = 'OK' Then
    Begin
    transportadora := Obtem_Nro_Antes_Traco(CMB_Transportadora.Text);
    representante  := Obtem_Nro_Antes_Traco(CMB_Representante.Text);
    Banco          := Obtem_Nro_Antes_Traco(CMB_Banco.Text);

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_notas_fiscais set fb_nota_fiscal_transporta=' + transportadora + ', ' + 'fb_nota_fiscal_vendedor=' + representante + ', fb_nota_fiscal_banco=' + Banco + ', ' + 'fb_nota_fiscal_volume=' +Edit_Volume.Text+ ', ' + 'fb_nota_fiscal_valor_pedido=' +Virgula_Ponto(Edit_Valor_Pedido.Text) + ', ' + 'fb_nota_fiscal_valor_desc=' +Virgula_Ponto(Edit_Valor_Desconto.Text) + ', ' + 'fb_nota_fiscal_valor_total=' +Virgula_Ponto(Edit_Valor_Total.Text)+ ', ' + 'fb_nota_fiscal_dup_vlr_1=' +Virgula_Ponto(Edit_Desdobramento_1.Text)+ ', ' + 'fb_nota_fiscal_dup_vlr_2=' +Virgula_Ponto(Edit_Desdobramento_2.Text)+ ', ' + 'fb_nota_fiscal_dup_vlr_3=' +Virgula_Ponto(Edit_Desdobramento_3.Text) +', ' + 'fb_nota_fiscal_natureza_oper=' +#39+ Trim(Natureza_Operacao.Text) +#39+ ' Where fb_nota_fiscal_numero = ' + Edit_nro_nota_fiscal.Text);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Alteração Efetuada com sucesso...');

    CMB_Transportadora.ItemIndex  := 0;
    CMB_Representante.ItemIndex   := 0;
    CMB_Banco.ItemIndex           := 0;
    Natureza_Operacao.ItemIndex   := 0; 

    Edit_Volume.Text              := '';
    Edit_Valor_Pedido.Text        := '';
    Edit_Valor_Desconto.Text      := '';
    Edit_Valor_Total.Text         := '';
    Edit_Desdobramento_1.Text     := '';
    Edit_Desdobramento_2.Text     := '';
    Edit_Desdobramento_3.Text     := '';

    CMB_Transportadora.Enabled    := False;
    CMB_Representante.Enabled     := False;
    CMB_Banco.Enabled             := False;
    Natureza_Operacao.Enabled     := False;

    Edit_Volume.Enabled           := False;
    Edit_Valor_Pedido.Enabled     := False;
    Edit_Valor_Desconto.Enabled   := False;
    Edit_Valor_Total.Enabled      := False;
    Edit_Desdobramento_1.Enabled  := False;
    Edit_Desdobramento_2.Enabled  := False;
    Edit_Desdobramento_3.Enabled  := False;
    BT_Alterar.Enabled            := False;

    Edit_nro_nota_fiscal.SetFocus;
  End;
end;

end.

