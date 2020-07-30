unit Alteracao_Papeletas_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAlteracaoPapeletasSaidas00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit_nro_nota_fiscal: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CMB_Transportadora: TComboBox;
    CMB_Representante: TComboBox;
    Edit_Volume: TEdit;
    Edit_Valor_Pedido: TEdit;
    Edit_Valor_Desconto: TEdit;
    Edit_Valor_Total: TEdit;
    Edit_Desdobramento_1: TEdit;
    Edit_Desdobramento_2: TEdit;
    Edit_Desdobramento_3: TEdit;
    Panel2: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    Label12: TLabel;
    Natureza_Operacao: TComboBox;
    Nro_Natureza_Operacao: TEdit;
    procedure CMB_TransportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Valor_PedidoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Valor_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Valor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Desdobramento_1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Desdobramento_2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Desdobramento_3KeyPress(Sender: TObject; var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Edit_nro_nota_fiscalKeyPress(Sender: TObject; var Key: Char);
  private
    Procedure Obtem_Dados_Papeleta(var Nro: String);
    Procedure Valida_Dados();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlteracaoPapeletasSaidas00: TAlteracaoPapeletasSaidas00;
  Nro_Papeleta, Altera: String;
  tranporte_index, vendedor_index: Integer;
implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TAlteracaoPapeletasSaidas00.CMB_TransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 Then
    Begin
    key := #9;
  End;
end;

procedure TAlteracaoPapeletasSaidas00.BT_SairClick(Sender: TObject);
begin
  AlteracaoPapeletasSaidas00.Close;
end;

procedure TAlteracaoPapeletasSaidas00.BT_ProcurarClick(Sender: TObject);
begin
  Nro_Papeleta := Edit_nro_nota_fiscal.Text;
  Obtem_Dados_Papeleta(Nro_Papeleta);
end;

Procedure TAlteracaoPapeletasSaidas00.Obtem_Dados_Papeleta(var Nro: String);
Begin
    Ampulheta();
    CMB_Transportadora.ItemIndex  := 0;
    CMB_Representante.ItemIndex   := 0;
    Natureza_Operacao.ItemIndex   := 0;
    
    Edit_Volume.Text              := '';
    Edit_Valor_Pedido.Text        := '';
    Edit_Valor_Desconto.Text      := '';
    Edit_Valor_Total.Text         := '';
    Edit_Desdobramento_1.Text     := '';
    Edit_Desdobramento_2.Text     := '';
    Edit_Desdobramento_3.Text     := '';
    Nro_Natureza_Operacao.Text    := '';

    // Verifica se o número da nota foi digitado
    If Trim(Nro) = '' Then
      Begin
      MSG_Erro('Preencha o Campo ' + #39 + 'Nro Nota Fiscal' + #39 + ' Antes de Prosseguir...');
      End
    // Procura a nota
    Else
      Begin
    // Verifica se o número da nota existe
      ConexaoBD.SQL_FB_Papeletas.Close;
      ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
      ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where fb_papeleta_numero = ' + Nro);
      ConexaoBD.SQL_FB_Papeletas.Open;

      If (ConexaoBD.SQL_FB_Papeletas.Eof=True) And (ConexaoBD.SQL_FB_Papeletas.Bof=True) Then
        Begin
        CMB_Transportadora.Enabled    := False;
        CMB_Representante.Enabled     := False;
        Edit_Volume.Enabled           := False;
        Edit_Valor_Pedido.Enabled     := False;
        Edit_Valor_Desconto.Enabled   := False;
        Edit_Valor_Total.Enabled      := False;
        Edit_Desdobramento_1.Enabled  := False;
        Edit_Desdobramento_2.Enabled  := False;
        Edit_Desdobramento_3.Enabled  := False;
        BT_Alterar.Enabled            := False;
        Natureza_Operacao.Enabled     := False;

        MSG_Erro('Papeleta Não Encontrada...');
        Edit_nro_nota_fiscal.SetFocus;
        End
      Else
        Begin
        If ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_fatura.Text <> 'Papeleta' Then
          begin
          MSG_Erro('Não é Possível alterar esse item, pois não se trata de uma papeleta...');
          end
        Else
          begin
          CMB_Transportadora.ItemIndex  := Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text);
          CMB_Representante.ItemIndex   := Obtem_Nro_Representante(ConexaoBD.SQL_FB_Papeletasfb_papeleta_vendedor.Text);
          Edit_Volume.Text              := ConexaoBD.SQL_FB_Papeletasfb_papeleta_volume.Text;
          Edit_Valor_Pedido.Text        := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_pedido.Text;
          Edit_Valor_Desconto.Text      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_desc.Text;
          Edit_Valor_Total.Text         := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
          Edit_Desdobramento_1.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_1.Text;
          Edit_Desdobramento_2.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_2.Text;
          Edit_Desdobramento_3.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_3.Text;

          Nro_Natureza_Operacao.Text    := IntToStr(Obtem_Nro_Natureza_Operacao(ConexaoBD.SQL_FB_Papeletasfb_papeleta_natureza_oper.Text,ConexaoBD.SQL_FB_Papeletasfb_papeleta_cfop.Text));
          Natureza_Operacao.ItemIndex   := StrToInt(Nro_Natureza_Operacao.Text);

          CMB_Transportadora.Enabled    := True;
          CMB_Representante.Enabled     := True;
          Edit_Volume.Enabled           := True;
          Edit_Valor_Pedido.Enabled     := True;
          Edit_Valor_Desconto.Enabled   := True;
          Edit_Valor_Total.Enabled      := True;
          BT_Alterar.Enabled            := True;
          Natureza_Operacao.Enabled     := True;

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

procedure TAlteracaoPapeletasSaidas00.FormShow(Sender: TObject);
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

    If Trim(Ibrasmak00.Tipo_Acesso.Text) = 'L' Then BT_Alterar.Enabled := False;

    Seta();
end;

procedure TAlteracaoPapeletasSaidas00.Edit_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
  So_Numero(Sender,Key);
end;

procedure TAlteracaoPapeletasSaidas00.Edit_Valor_PedidoKeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoPapeletasSaidas00.Edit_Valor_DescontoKeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoPapeletasSaidas00.Edit_Valor_TotalKeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoPapeletasSaidas00.Edit_Desdobramento_1KeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoPapeletasSaidas00.Edit_Desdobramento_2KeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoPapeletasSaidas00.Edit_Desdobramento_3KeyPress(
  Sender: TObject; var Key: Char);
begin
  So_Valor(Sender,Key);
end;

procedure TAlteracaoPapeletasSaidas00.Valida_Dados();
begin
  Altera := '';
  If Trim(Edit_nro_nota_fiscal.Text) = '' Then
    begin
    MSG_Erro('Antes de prosseguir selecione uma papeleta...');
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

procedure TAlteracaoPapeletasSaidas00.BT_AlterarClick(Sender: TObject);
var
  transportadora, representante: string;
begin
  Valida_Dados();

  if Trim(Altera) = 'OK' Then
    Begin
    transportadora := Obtem_Nro_Antes_Traco(CMB_Transportadora.Text);
    representante  := Obtem_Nro_Antes_Traco(CMB_Representante.Text);

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_papeletas set fb_papeleta_transporta=' + transportadora + ', ' + 'fb_papeleta_vendedor=' + representante + ', ' + 'fb_papeleta_volume=' +Edit_Volume.Text+ ', ' + 'fb_papeleta_valor_pedido=' +Virgula_Ponto(Edit_Valor_Pedido.Text) + ', ' + 'fb_papeleta_valor_desc=' +Virgula_Ponto(Edit_Valor_Desconto.Text) + ', ' + 'fb_papeleta_valor_total=' +Virgula_Ponto(Edit_Valor_Total.Text)+ ', ' + 'fb_papeleta_dup_vlr_1=' +Virgula_Ponto(Edit_Desdobramento_1.Text)+ ', ' + 'fb_papeleta_dup_vlr_2=' +Virgula_Ponto(Edit_Desdobramento_2.Text)+ ', ' + 'fb_papeleta_dup_vlr_3=' +Virgula_Ponto(Edit_Desdobramento_3.Text) +', ' + 'fb_papeleta_natureza_oper=' +#39+ Trim(Natureza_Operacao.Text) +#39+ ' Where fb_papeleta_numero = ' + Edit_nro_nota_fiscal.Text);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Alteração Efetuada com sucesso...');

    CMB_Transportadora.ItemIndex  := 0;
    CMB_Representante.ItemIndex   := 0;
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

procedure TAlteracaoPapeletasSaidas00.Edit_nro_nota_fiscalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 Then
    Begin
    Nro_Papeleta := Edit_nro_nota_fiscal.Text;
    Obtem_Dados_Papeleta(Nro_Papeleta);
  End;
  So_Numero(Sender,Key);
end;

end.
