unit Ordem_Despacho_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImpMat;

type
  TOrdemDespacho00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_Cliente: TEdit;
    Edit_Codigo: TEdit;
    Edit_Valor_Nota: TEdit;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    Ordem_Despacho: TRadioButton;
    Etiqueta_Sedex: TRadioButton;
    BT_Imprimir: TBitBtn;
    Imprimir: TImpMat;
    Label49: TLabel;
    Edit_Transportadora: TComboBox;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    Opc_Nota_Fiscal: TRadioButton;
    Opc_Orcamento: TRadioButton;
    Label1: TLabel;
    Edit_nro_nota_fiscal: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Linha_Avulsa_5: TEdit;
    Linha_Avulsa_4: TEdit;
    Linha_Avulsa_3: TEdit;
    Linha_Avulsa_2: TEdit;
    Linha_Avulsa_1: TEdit;
    Label12: TLabel;
    Nro_Docto: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Edit_nro_nota_fiscalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    Procedure Obtem_Pedido(var Nro: String);
    procedure Carrega_Transportadoras();

  public
    { Public declarations }
  end;

var
  OrdemDespacho00: TOrdemDespacho00;
  Nro_Nota, Nro_Pedido : String;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TOrdemDespacho00.BT_SairClick(Sender: TObject);
begin
     OrdemDespacho00.Close;
end;

procedure TOrdemDespacho00.BT_ProcurarClick(Sender: TObject);
begin
  Nro_Nota := Edit_nro_nota_fiscal.Text;
  Obtem_Pedido(Nro_Nota);
end;

Procedure TOrdemDespacho00.Obtem_Pedido(var Nro: String);
Begin
  Ampulheta();

  Edit_Codigo.Text      :='';
  Edit_Cliente.Text     :='';
  Edit_Valor_Nota.Text  :='';

  Nro_Docto.Text      := '';
  Linha_Avulsa_1.Text := '';
  Linha_Avulsa_2.Text := '';
  Linha_Avulsa_3.Text := '';
  Linha_Avulsa_4.Text := '';
  Linha_Avulsa_5.Text := '';

  // Verifica se o número da nota foi digitado

  If Trim(Nro) = '' Then
     Begin
     MSG_Erro('Preencha o Campo ' + #39 + 'Nro. Docto' + #39 + ' Antes de Prosseguir...');
     End
  Else
     Begin

     // Verifica se o número da nota existe

     If Opc_Nota_Fiscal.Checked Then
        Begin

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * From fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Nro);
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount <= 0 Then
           Begin
           MSG_Erro('Não Encontrada...');
           End
        Else
           Begin

           // Procura o número do pedido

           Nro_Pedido := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nro_pedido.Text;

           If Trim(Nro_Pedido) = '' Then
              Begin
              Nro_pedido := '0';
           End;

           If StrToInt(Trim(Nro_Pedido)) <= 0 Then
              Begin
              ConexaoBD.SQL_FB_Movto_Estoque.Close;
              ConexaoBD.SQL_FB_Movto_Estoque.SQL.Clear;
              ConexaoBD.SQL_FB_Movto_Estoque.SQL.Add('Select * From fb_movto_estoque Where (fb_movto_estoque_cod_registro = 51) And (fb_movto_estoque_nota = ' + Trim(Nro) + ')');
              ConexaoBD.SQL_FB_Movto_Estoque.Open;

              If ConexaoBD.SQL_FB_Movto_Estoque.RecordCount > 0 Then
                 Begin
                 Nro_Pedido := ConexaoBD.SQL_FB_Movto_Estoquefb_movto_estoque_pedido.Text;
                 End
              Else
                 Begin
                 Nro_Pedido := '0';
              End;
           End;

           Edit_Cliente.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;
           Edit_Codigo.Text              := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
           Edit_Valor_Nota.Text          := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
           Edit_Transportadora.ItemIndex := Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text);

           ConexaoBD.SQL_Clientes.Close;
           ConexaoBD.SQL_Clientes.SQL.Clear;
           ConexaoBD.SQL_Clientes.SQL.Add('Select * From fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Edit_Codigo.Text) +#39 );
           ConexaoBD.SQL_Clientes.Open;

           Nro_Docto.Text      := Nro;
           Linha_Avulsa_1.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;
           Linha_Avulsa_2.Text := ConexaoBD.SQL_Clientesfb_cliente_endereco_entrega.Text;
           Linha_Avulsa_3.Text := ConexaoBD.SQL_Clientesfb_cliente_bairro_entrega.Text;
           Linha_Avulsa_4.Text := Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_entrega.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_entrega.Text);
           Linha_Avulsa_5.Text := 'CEP: ' + ConexaoBD.SQL_Clientesfb_cliente_cep.Text;
        End;

        End
     Else
        Begin

        ConexaoBD.SQL_FB_Papeletas.Close;
        ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
        ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * From fb_papeletas Where fb_papeleta_numero = ' + Nro);
        ConexaoBD.SQL_FB_Papeletas.Open;

        If ConexaoBD.SQL_FB_Papeletas.RecordCount <= 0 Then
           Begin
           MSG_Erro('Não Encontrada...');
           End
        Else
           Begin

           // Procura o número do pedido

           Nro_Pedido := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nro_pedido.Text;

           If Trim(Nro_Pedido) = '' Then
              Begin
              Nro_pedido := '0';
           End;

           Edit_Cliente.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text;
           Edit_Codigo.Text              := ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text;
           Edit_Valor_Nota.Text          := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
           Edit_Transportadora.ItemIndex := Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text);

           ConexaoBD.SQL_Clientes.Close;
           ConexaoBD.SQL_Clientes.SQL.Clear;
           ConexaoBD.SQL_Clientes.SQL.Add('Select * From fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Edit_Codigo.Text) +#39 );
           ConexaoBD.SQL_Clientes.Open;

           Nro_Docto.Text      := Nro;
           Linha_Avulsa_1.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;
           Linha_Avulsa_2.Text := ConexaoBD.SQL_Clientesfb_cliente_endereco_entrega.Text;
           Linha_Avulsa_3.Text := ConexaoBD.SQL_Clientesfb_cliente_bairro_entrega.Text;
           Linha_Avulsa_4.Text := Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_entrega.Text) + ' - ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_entrega.Text);
           Linha_Avulsa_5.Text := 'CEP: ' + ConexaoBD.SQL_Clientesfb_cliente_cep.Text;
        End;
     End;

  End;

  Seta();
End;

procedure TOrdemDespacho00.BT_ImprimirClick(Sender: TObject);

var
   Linha: Integer;

begin
     If Trim(Nro_Docto.Text) <> '' Then
        Begin

        If Opc_Nota_Fiscal.Checked Then
           Begin
           Linha := 1;
           Imprimir.PoeStr(Linha,001, #14 + 'DESTINATARIO:');

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, #14 + '-------------');

           //*** Linha 1 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_1.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_1.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_1.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_1.Text);
           End;

           //*** Linha 2 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_2.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_2.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_2.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_2.Text);
           End;

           //*** Linha 3 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_3.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_3.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_3.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_3.Text);
           End;

           //*** Linha 4 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_4.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_4.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_4.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_4.Text);
           End;

           //*** Linha 5 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_5.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_5.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_5.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_5.Text);
           End;

           Linha := Linha + 1;

           If Ordem_Despacho.Checked Then
              Begin
              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001,  #14 + 'TRANSPORTADORA:');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001,  #14 + '---------------');

              //*** Início - Seleciona a Transportadora ***

              ConexaoBD.SQL_Transportadoras.Close;
              ConexaoBD.SQL_Transportadoras.SQL.Clear;
              ConexaoBD.SQL_Transportadoras.SQL.Add('Select * From fb_transportadoras Where fb_transportadora_numero = ' + Obtem_Nro_Antes_Traco(Edit_Transportadora.Text) );
              ConexaoBD.SQL_Transportadoras.Open;

              //*** Fim - Seleciona a Transportadora ***

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_nome.Text));

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'NOTA FISCAL: ' + Trim(Nro_Docto.Text));
           End;

           If Etiqueta_Sedex.Checked Then
              Begin
              Linha := Linha + 3;
              Imprimir.PoeStr(Linha,001, #14 + 'REMETENTE:');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + '----------');

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'IBRASMAK - IND. BRASILEIRA DE MÁQUINAS LTDA.');

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'RUA BARRETOS, 138 - SAO PAULO - SP');

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'CEP: 03184-080');
           End;

           Imprimir.ImprimeJob;
           Imprimir.LimpaBuffer;

           End
        Else
           Begin

           Linha := 1;
           Imprimir.PoeStr(Linha,001, #14 + 'DESTINATARIO:');

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, #14 + '-------------');

           //*** Linha 1 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_1.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_1.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_1.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_1.Text);
           End;

           //*** Linha 2 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_2.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_2.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_2.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_2.Text);
           End;

           //*** Linha 3 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_3.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_3.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_3.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_3.Text);
           End;

           //*** Linha 4 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_4.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_4.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_4.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_4.Text);
           End;

           //*** Linha 5 ***

           Linha := Linha + 2;
           If (Length(Trim(Linha_Avulsa_5.Text)) > 40) Then
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_5.Text,1,40));

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_5.Text,41,40));
              End
           Else
              Begin
              Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_5.Text);
           End;

           Linha := Linha + 1;

           If Ordem_Despacho.Checked Then
              Begin
              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'TRANSPORTADORA:');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + '---------------');


              //*** Início - Seleciona a Transportadora ***

              ConexaoBD.SQL_Transportadoras.Close;
              ConexaoBD.SQL_Transportadoras.SQL.Clear;
              ConexaoBD.SQL_Transportadoras.SQL.Add('Select * From fb_transportadoras Where fb_transportadora_numero = ' + Obtem_Nro_Antes_Traco(Edit_Transportadora.Text) );
              ConexaoBD.SQL_Transportadoras.Open;

              //*** Fim - Seleciona a Transportadora ***

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_nome.Text));

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'ORÇAMENTO: ' + Trim(Nro_Docto.Text));
           End;

           If Etiqueta_Sedex.Checked Then
              Begin
              Linha := Linha + 3;
              Imprimir.PoeStr(Linha,001, #14 + 'REMETENTE:');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, #14 + '----------');
                    
              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'IBRASMAK - IND. BRASILEIRA DE MÁQUINAS LTDA.');

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'RUA BARRETOS, 138 - SAO PAULO - SP');

              Linha := Linha + 2;
              Imprimir.PoeStr(Linha,001, #14 + 'CEP: 03184-080');
           End;

           Imprimir.ImprimeJob;
           Imprimir.LimpaBuffer;

        End;

        End
     Else
        Begin
        MSG_Erro('Nro. do Docto não informado...');
     End;
end;

procedure TOrdemDespacho00.Edit_nro_nota_fiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 Then
    Begin
    Nro_Nota := Edit_nro_nota_fiscal.Text;
    Obtem_Pedido(Nro_Nota);
  End;
  If Not(key in ['0'..'9',#8]) Then
    Begin
    key := #0;
  End;
end;

procedure TOrdemDespacho00.Carrega_Transportadoras();
begin
     // Obtem as Transportadoras

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;
     ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Order By fb_transportadora_nome');
     ConexaoBD.SQL_Transportadoras.Open;

     Edit_Transportadora.Items.Clear;

     If conexaoBD.SQL_Transportadoras.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Transportadoras.First;

        While Not conexaoBD.SQL_Transportadoras.Eof Do
              begin
              Edit_Transportadora.Items.Add(IntToStr(conexaoBD.SQL_Transportadorasfb_transportadora_numero.AsInteger)+' - '+conexaoBD.SQL_Transportadorasfb_transportadora_nome.AsString);
              conexaoBD.SQL_Transportadoras.Next;
        End;
     end;

     ConexaoBD.SQL_Transportadoras.Close;

     Edit_Transportadora.ItemIndex := 0;
end;

procedure TOrdemDespacho00.FormShow(Sender: TObject);
begin
     Carrega_Transportadoras();
end;

end.
