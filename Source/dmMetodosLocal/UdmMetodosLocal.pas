unit UdmMetodosLocal;

interface

uses
  System.SysUtils, System.Classes, System.Json,
  vcl.Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  System.Json.writers,System.JSON.Types, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef,System.IniFiles, FireDAC.FMXUI.Wait,FMX.Dialogs,
  FireDAC.Phys.IBBase,IdSSLOpenSSL,IdSMTP,IdMessage,IdText,IdExplicitTLSClientServerBase,
  IdAttachmentFile, FireDAC.Comp.BatchMove,System.Variants, FireDAC.Comp.BatchMove.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.HttpClient,FMX.Types,System.Net.URLClient,
  System.Net.HttpClientComponent, FireDAC.ConsoleUI.Wait,FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script,IdHashMessageDigest;

type
  TdmLocal = class(TDataModule)
    TStartDiario: TFDQuery;
    TStartDiarioid: TIntegerField;
    TStartDiariostatus: TIntegerField;
    TStartDiariodatareg: TSQLTimeStampField;
    TStartDiarioidusuario: TIntegerField;
    TStartDiariodataalteracao: TSQLTimeStampField;
    TStartDiarioidusuarioalteracao: TIntegerField;
    TStartDiarioidlocalestoque: TIntegerField;
    TStartDiarioidcentrocusto: TIntegerField;
    TStartDiariocombustivel: TIntegerField;
    TStartDiariodataastart: TDateField;
    TStartDiariohorastart: TTimeField;
    TStartDiariodataaend: TDateField;
    TStartDiariohoraend: TTimeField;
    TStartDiariosyncaws: TIntegerField;
    TStartDiariovolumelitrosini: TBCDField;
    TStartDiarioobs: TWideStringField;
    TStartDiarioimgstart: TWideMemoField;
    TStartDiarioimgend: TWideMemoField;
    TStartDiariovolumelitrosfim: TBCDField;
    TAbastecimento: TFDQuery;
    vQryAux: TFDQuery;
    TUsuario: TFDQuery;
    TUsuarioid: TIntegerField;
    TUsuariostatus: TIntegerField;
    TUsuariodatareg: TSQLTimeStampField;
    TUsuarioidusuario: TIntegerField;
    TUsuariodataalteracao: TSQLTimeStampField;
    TUsuarioidusuarioalteracao: TIntegerField;
    TUsuarionome: TWideStringField;
    TUsuarioemail: TWideStringField;
    TUsuariocelular: TWideStringField;
    TUsuariousuario: TWideStringField;
    TUsuariosenha: TWideStringField;
    TUsuariotipo: TIntegerField;
    TUsuariosyncaws: TIntegerField;
    Toperadormaquinas: TFDQuery;
    Toperadormaquinasid: TIntegerField;
    Toperadormaquinasstatus: TIntegerField;
    Toperadormaquinasdatareg: TSQLTimeStampField;
    Toperadormaquinasidusuario: TIntegerField;
    Toperadormaquinasdataalteracao: TSQLTimeStampField;
    Toperadormaquinasidusuarioalteracao: TIntegerField;
    Toperadormaquinasnome: TWideStringField;
    Toperadormaquinasrg: TWideStringField;
    Toperadormaquinascpf: TWideStringField;
    Toperadormaquinascnh: TWideStringField;
    Toperadormaquinascelular: TWideStringField;
    Toperadormaquinassyncaws: TIntegerField;
    Toperadormaquinassyncfaz: TIntegerField;
    TAuxAtividadesAbastecimento: TFDQuery;
    TAuxAtividadesAbastecimentoid: TIntegerField;
    TAuxAtividadesAbastecimentostatus: TIntegerField;
    TAuxAtividadesAbastecimentodatareg: TSQLTimeStampField;
    TAuxAtividadesAbastecimentoidusuario: TIntegerField;
    TAuxAtividadesAbastecimentodataalteracao: TSQLTimeStampField;
    TAuxAtividadesAbastecimentoidusuarioalteracao: TIntegerField;
    TAuxAtividadesAbastecimentonome: TWideStringField;
    TAuxAtividadesAbastecimentosyncaws: TIntegerField;
    TCentroCusto: TFDQuery;
    TCentroCustoid: TIntegerField;
    TCentroCustostatus: TIntegerField;
    TCentroCustodatareg: TSQLTimeStampField;
    TCentroCustoidusuario: TIntegerField;
    TCentroCustodataalteracao: TSQLTimeStampField;
    TCentroCustoidusuarioalteracao: TIntegerField;
    TCentroCustonome: TWideStringField;
    TCentroCustosyncaws: TIntegerField;
    TLocalEstoque: TFDQuery;
    TLocalEstoqueid: TIntegerField;
    TLocalEstoquestatus: TIntegerField;
    TLocalEstoquedatareg: TSQLTimeStampField;
    TLocalEstoqueidusuario: TIntegerField;
    TLocalEstoquedataalteracao: TSQLTimeStampField;
    TLocalEstoqueidusuarioalteracao: TIntegerField;
    TLocalEstoquenome: TWideStringField;
    TLocalEstoquecapacidade: TBCDField;
    TLocalEstoquesyncaws: TIntegerField;
    TLocalEstoqueidcentrocusto: TIntegerField;
    TProdutos: TFDQuery;
    TProdutosid: TIntegerField;
    TProdutosstatus: TIntegerField;
    TProdutosdatareg: TSQLTimeStampField;
    TProdutosidusuario: TIntegerField;
    TProdutosdataalteracao: TSQLTimeStampField;
    TProdutosidusuarioalteracao: TIntegerField;
    TProdutosnome: TWideStringField;
    TProdutostipo: TIntegerField;
    TProdutosunidademedida: TWideStringField;
    TProdutosestoqueminimo: TBCDField;
    TProdutoscodigobarras: TWideStringField;
    TProdutosidmarca: TIntegerField;
    TProdutoscodigofabricante: TWideStringField;
    TProdutossyncaws: TIntegerField;
    TProdutoscustomedio: TBCDField;
    TProdutossaldoatual: TBCDField;
    TMaquinas: TFDQuery;
    TLocalEstoqueidcombustivel: TIntegerField;
    TMaquinasid: TIntegerField;
    TMaquinasstatus: TIntegerField;
    TMaquinasdatareg: TSQLTimeStampField;
    TMaquinasidusuario: TIntegerField;
    TMaquinasdataalteracao: TSQLTimeStampField;
    TMaquinasidusuarioalteracao: TIntegerField;
    TMaquinasidmarca: TIntegerField;
    TMaquinasmodelo: TWideStringField;
    TMaquinasplaca: TWideStringField;
    TMaquinasano: TIntegerField;
    TMaquinaschassi: TWideStringField;
    TMaquinasidcombustivel: TIntegerField;
    TMaquinasimg: TBlobField;
    TMaquinasprefixo: TWideStringField;
    TMaquinassyncaws: TIntegerField;
    TMaquinassyncfaz: TIntegerField;
    TMaquinasultimoabastecimento: TDateField;
    TMaquinashorimetroultimarev: TBCDField;
    TMaquinashorimetroatual: TBCDField;
    TMaquinasqrcode: TWideStringField;
    TMaquinasidsubgrupo: TIntegerField;
    TMaquinasidgrupo: TIntegerField;
    TMaquinastipomedicao: TIntegerField;
    TMaquinaskmatual: TBCDField;
    TAbastecimentoid: TIntegerField;
    TAbastecimentostatus: TIntegerField;
    TAbastecimentodatareg: TSQLTimeStampField;
    TAbastecimentoidusuario: TIntegerField;
    TAbastecimentodataalteracao: TSQLTimeStampField;
    TAbastecimentoidusuarioalteracao: TIntegerField;
    TAbastecimentoidlocalestoque: TIntegerField;
    TAbastecimentoidmaquina: TIntegerField;
    TAbastecimentovolumelt: TBCDField;
    TAbastecimentocombustivel: TIntegerField;
    TAbastecimentodataabastecimento: TDateField;
    TAbastecimentohora: TTimeField;
    TAbastecimentosyncaws: TIntegerField;
    TAbastecimentohorimetro: TBCDField;
    TAbastecimentoobs: TWideStringField;
    TAbastecimentoimg: TBlobField;
    TAbastecimentoimg2: TBlobField;
    TAbastecimentoimg3: TBlobField;
    TAbastecimentoimg4: TBlobField;
    TAbastecimentoimg5: TBlobField;
    TAbastecimentovalorlitro: TBCDField;
    TAbastecimentoexterno: TIntegerField;
    TAbastecimentoidcentrocusto: TIntegerField;
    TAbastecimentokmatual: TBCDField;
    TAbastecimentolatitude: TFMTBCDField;
    TAbastecimentolongitude: TFMTBCDField;
    TMovLocalEstoque: TFDQuery;
    TAbastecimentoalerta: TIntegerField;
    TAbastecimentodescricaoalerta: TWideMemoField;
    TMaquinasiderp: TIntegerField;
    TMaquinasvolumetanque: TBCDField;
    TLubrificacaoprodutos: TFDQuery;
    TLubrificacao: TFDQuery;
    TLubrificacaoid: TIntegerField;
    TLubrificacaostatus: TIntegerField;
    TLubrificacaodatareg: TSQLTimeStampField;
    TLubrificacaoidusuario: TIntegerField;
    TLubrificacaodataalteracao: TSQLTimeStampField;
    TLubrificacaoidusuarioalteracao: TIntegerField;
    TLubrificacaoidmaquina: TIntegerField;
    TLubrificacaodatatroca: TDateField;
    TLubrificacaotipo: TIntegerField;
    TLubrificacaosyncaws: TIntegerField;
    TLubrificacaosyncfaz: TIntegerField;
    TLubrificacaohorimetro: TBCDField;
    TLubrificacaokm: TBCDField;
    TLubrificacaoidcentrocusto: TIntegerField;
    TLubrificacaoprodutosid: TIntegerField;
    TLubrificacaoprodutosstatus: TIntegerField;
    TLubrificacaoprodutosdatareg: TSQLTimeStampField;
    TLubrificacaoprodutosidusuario: TIntegerField;
    TLubrificacaoprodutosdataalteracao: TSQLTimeStampField;
    TLubrificacaoprodutosidusuarioalteracao: TIntegerField;
    TLubrificacaoprodutosidlubrificacao: TIntegerField;
    TLubrificacaoprodutosidproduto: TIntegerField;
    TLubrificacaoprodutosqtd: TBCDField;
    TLubrificacaoprodutossyncaws: TIntegerField;
    TLubrificacaoprodutossyncfaz: TIntegerField;
    TLubrificacaoalerta: TIntegerField;
    TLubrificacaodescricaoalerta: TWideMemoField;
    procedure TStartDiarioReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TAbastecimentooutrosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TMovLocalEstoqueReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private
    function RetornaIdCentroCustoPatrimonio(vPatrimonio:string):string;
    function RetornaMaxId(Atabela:string):string;
    procedure InsereSaidaAbastecimento(dataSaida, idcentrocusto,
     idlocalestoque, idproduto, qtditens, idresponsavel,idabastecimento: string);
    function AbreStartBomba(vIdlocal,vData:string):Boolean;
    procedure AbreCentroCusto(vId:string);
    procedure AbreLocalEstoque(vId:string);
  public
    function GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
    function GetTestaServidor            : TJSONObject;

    function GetUsuario: TJSONObject;
    function GetOperadorMaquinas: TJSONObject;
    function GetAtividadesAbastecimento: TJSONObject;
    function GetLocalEstoque(obj: TJSONObject): TJSONObject;
    function GetProdutos: TJSONObject;
    function GetMaquinas: TJSONObject;
    function AcceptAutenticaPatrimonio(obj: TJSONObject): TJSONObject;
    function AcceptAbastecimento(obj: TJSONObject): TJSONObject;
    function AcceptStartDiario(obj: TJSONObject): TJSONObject;
    function AcceptTransferencia(obj: TJSONObject): TJSONObject;
    function AcceptCentroCusto(obj: TJSONObject): TJSONObject;

    function AcceptLubrificacao(obj: TJSONObject): TJSONObject;
    function AcceptLubrificacaoProdutos(obj: TJSONObject): TJSONObject;
  end;

var
  dmLocal: TdmLocal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UPrincipal;

{$R *.dfm}

{ TdmLocal }

procedure TdmLocal.AbreCentroCusto(vId: string);
begin
 with TCentroCusto,TCentroCusto.SQL do
 begin
   Clear;
   Add('select * from centrocusto');
   Add('where id='+vId);
   Open;
 end;
end;

procedure TdmLocal.AbreLocalEstoque(vId: string);
begin
 with TLocalEstoque,TLocalEstoque.SQL do
 begin
   Clear;
   Add('select * from localestoque');
   Add('where idcentrocusto='+vId);
   Open;
 end;
end;

function TdmLocal.AbreStartBomba(vIdlocal, vData: string): Boolean;
begin
 with TStartDiario,TStartDiario.SQL do
 begin
   Clear;
   Add('select * from startbomba');
   Add('where status=1 and idlocalestoque='+vIdlocal);
   Add('and dataastart='+vData);
   Open;
   Result := TStartDiario.IsEmpty;
 end;
end;

function TdmLocal.AcceptAbastecimento(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FDConPG;
  TAbastecimento.Connection := frmPrincipal.FDConPG;
  TAbastecimento.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TAbastecimento.Filtered := false;
    TAbastecimento.Close;
    TAbastecimento.Open;
    TAbastecimento.Insert;
    for x := 0 to TAbastecimento.Fields.Count -1 do
    begin
     vField  := StringReplace(TAbastecimento.Fields[x].Name,
      'TAbastecimento','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') and (vQry.FindField(vField) <> nil)
     and (TAbastecimento.FindField(vField) <> nil) then
      TAbastecimento.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      TAbastecimento.ApplyUpdates(-1);
      vIdResult := RetornaMaxId('abastecimento');
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

procedure TdmLocal.InsereSaidaAbastecimento(dataSaida, idcentrocusto,
  idlocalestoque, idproduto, qtditens, idresponsavel,idabastecimento: string);
var
 vValorCustoMedio:string;
begin
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select * from produtos');
   Add('where id='+idproduto);
   Open;
   vValorCustoMedio := FieldByName('customedio').AsString;
   if vValorCustoMedio.Length=0 then
    vValorCustoMedio:='0';

   Clear;
   Add('insert into estoquesaida(datasaidaestoque,idcentrocusto,idlocalestoque,idproduto,qtditens,idresponsavel,valorsaida,idabastecimento)');
   Add('values(');
   Add(dataSaida.QuotedString+',');
   Add(idcentrocusto+',');
   Add(idlocalestoque+',');
   Add(idproduto+',');
   Add(qtditens+',');
   Add(idresponsavel+',');
   Add(StringReplace(vValorCustoMedio,',','.',[rfReplaceAll])+',');
   Add(idabastecimento);
   Add(')');
   ExecSQL;
 end;
end;

function TdmLocal.AcceptAutenticaPatrimonio(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vJsonString,vAcept:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vPatrimonio,vIdCentro :string;
  vJoItem,vJoItem1   : TJSONArray;
  vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
begin
  vJsonString    := obj.ToString;
  vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
  vJoItem        := vJoInsert.GetValue('Patrimonio') as TJSONArray;
  vJoItemO       := vJoItem.Items[0] as TJSONObject;
  vPatrimonio    := vJoItemO.GetValue('numero').value;
  vIdCentro := dmLocal.RetornaIdCentroCustoPatrimonio(vPatrimonio);
  if vIdCentro='-1' then
  begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Patrimonio nao cadastrado');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  end;
  if vIdCentro='0' then
  begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Patrimonio nao vinculado a nenhum centro de custo');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  end;
  if(vIdCentro<>'-1')and (vIdCentro<>'0') then
  begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('OK');
    txtJson.WriteValue(vIdCentro);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  end;
end;

function TdmLocal.AcceptCentroCusto(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vJsonString,vAcept:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdCentroCusto:string;
  vJoItem,vJoItem1   : TJSONArray;
  vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
begin
  vJsonString    := obj.ToString;
  vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
  vJoItem        := vJoInsert.GetValue('CentroCusto') as TJSONArray;
  vJoItemO       := vJoItem.Items[0] as TJSONObject;
  vIdCentroCusto := vJoItemO.GetValue('id').value;
  AbreCentroCusto(vIdCentroCusto);
  Result := GetDataSetAsJSON(TCentroCusto);
end;

function TdmLocal.AcceptLubrificacao(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FDConPG;
  TLubrificacao.Connection := frmPrincipal.FDConPG;
  TLubrificacao.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TLubrificacao.Filtered := false;
    TLubrificacao.Close;
    TLubrificacao.Open;
    TLubrificacao.Insert;
    for x := 0 to TLubrificacao.Fields.Count -1 do
    begin
     vField  := StringReplace(TLubrificacao.Fields[x].Name,
      'TLubrificacao','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') and (vQry.FindField(vField) <> nil)
     and (TLubrificacao.FindField(vField) <> nil) then
      TLubrificacao.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      TLubrificacao.ApplyUpdates(-1);
      vIdResult := RetornaMaxId('lubrificacao');
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Lubrificacao:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmLocal.AcceptLubrificacaoProdutos(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FDConPG;
  TLubrificacaoprodutos.Connection := frmPrincipal.FDConPG;
  TLubrificacaoprodutos.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    TLubrificacaoprodutos.Filtered := false;
    TLubrificacaoprodutos.Close;
    TLubrificacaoprodutos.Open;
    TLubrificacaoprodutos.Insert;
    for x := 0 to TLubrificacaoprodutos.Fields.Count -1 do
    begin
     vField  := StringReplace(TLubrificacaoprodutos.Fields[x].Name,
      'TLubrificacaoprodutos','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') and (vQry.FindField(vField) <> nil)
     and (TLubrificacaoprodutos.FindField(vField) <> nil) then
      TLubrificacaoprodutos.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      TLubrificacaoprodutos.ApplyUpdates(-1);
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Lubrificacao:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmLocal.AcceptStartDiario(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FDConPG;
  TStartDiario.Connection := frmPrincipal.FDConPG;
  TStartDiario.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    if AbreStartBomba(vQry.FieldByName('idlocalestoque').AsString,
    FormatDateTime('yyyy-mm-dd',vQry.FieldByName('dataastart').AsDateTime).QuotedString)then
     TStartDiario.Insert
    else
     TStartDiario.Edit;
    for x := 0 to TStartDiario.Fields.Count -1 do
    begin
     vField  := StringReplace(TStartDiario.Fields[x].Name,
      'TStartDiario','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') and (vQry.FindField(vField) <> nil)
      and (TStartDiario.FindField(vField) <> nil) then
     if (vField='dataalteracao') then
      TStartDiario.FieldByName(vField).AsDateTime     := now
     else
      TStartDiario.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      TStartDiario.ApplyUpdates(-1);
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmLocal.AcceptTransferencia(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry,vQryInsert       : TFDQuery;
  vIdResult  :string;
begin
  vQry                  := TFDQuery.Create(nil);
  vQry.Connection       := frmPrincipal.FDConPG;
  vQryInsert            := TFDQuery.Create(nil);
  vQryInsert.Connection := frmPrincipal.FDConPG;
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  if not vQry.IsEmpty then
  begin
    with vQryInsert,vQryInsert.SQL do
    begin
      Clear;
      Add('INSERT INTO public.tranferencialocalestoque(');
      Add('idusuario,');
      Add('idlocalestoqueorigem,');
      Add('idlocalestoquedetino,');
      Add('idproduto,');
      Add('qtde,');
      Add('datamov,');
      Add('hora)');
      Add('values(');
      Add(vQry.FieldByName('idusuario').AsString+',');
      Add(vQry.FieldByName('idlocalestoqueorigem').AsString+',');
      Add(vQry.FieldByName('idlocalestoquedetino').AsString+',');
      Add(vQry.FieldByName('idproduto').AsString+',');
      Add(vQry.FieldByName('qtde').AsString+',');
      Add(FormatDateTime('yyyy-mm-dd',vQry.FieldByName('datamov').AsDateTime).QuotedString+',');
      Add(vQry.FieldByName('hora').AsString.QuotedString);
      Add(')');
      try
       vQryInsert.ExecSQL;
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('OK');
       txtJson.WriteValue(vIdResult);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
      except
       on E: Exception do
       begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Transferencia:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
      end;
    end;
  end;
  vQryInsert.Free;
  vQry.Free;
end;

function TdmLocal.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
var
  f: TField;
  o: TJSOnObject;
  a: TJSONArray;
begin
  a := TJSONArray.Create;
  DataSet.Active := True;
  DataSet.First;
  while not DataSet.EOF do begin
    o := TJSOnObject.Create;
    for f in DataSet.Fields do
      o.AddPair(f.FieldName, VarToStr(f.Value));
    a.AddElement(o);
    DataSet.Next;
  end;
  DataSet.Active := False;
  Result := TJSONObject.Create;
  Result.AddPair(DataSet.Name, a);
end;

function TdmLocal.GetTestaServidor: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue('OK');
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmLocal.GetUsuario: TJSONObject;
begin
 TUsuario.Close;
 TUsuario.Open;
 Result := GetDataSetAsJSON(TUsuario);
end;

function TdmLocal.GetOperadorMaquinas: TJSONObject;
begin
 Toperadormaquinas.Close;
 Toperadormaquinas.Open;
 Result := GetDataSetAsJSON(Toperadormaquinas);
end;

function TdmLocal.GetAtividadesAbastecimento: TJSONObject;
begin
 TAuxAtividadesAbastecimento.Close;
 TAuxAtividadesAbastecimento.Open;
 Result := GetDataSetAsJSON(TAuxAtividadesAbastecimento);
end;



function TdmLocal.GetLocalEstoque(obj: TJSONObject): TJSONObject;
var
  JsonToSend :TStringStream;
  vJsonString:string;
  vIdResult,vIdCentroCusto:string;
  vJoItem,vJoItem1   : TJSONArray;
  vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
begin
 vJsonString    := obj.ToString;
 vJoInsert      := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem        := vJoInsert.GetValue('CentroCusto') as TJSONArray;
 vJoItemO       := vJoItem.Items[0] as TJSONObject;
 vIdCentroCusto := vJoItemO.GetValue('id').value;
 AbreLocalEstoque(vIdCentroCusto);
 TLocalEstoque.Close;
 TLocalEstoque.Open;
 Result := GetDataSetAsJSON(TLocalEstoque);
end;

function TdmLocal.GetProdutos: TJSONObject;
begin
 TProdutos.Close;
 TProdutos.Open;
 Result := GetDataSetAsJSON(TProdutos);
end;

function TdmLocal.GetMaquinas: TJSONObject;
begin
 TMaquinas.Close;
 TMaquinas.Open;
 Result := GetDataSetAsJSON(TMaquinas);
end;

function TdmLocal.RetornaIdCentroCustoPatrimonio(vPatrimonio: string): string;
begin
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select *  from devices where status=1 and patrimonio ='+vPatrimonio);
   Open;
   if vQryAux.IsEmpty then
    Result:='-1'
   else
   begin
     if vQryAux.FieldByName('idcentrocusto').AsString.Length=0 then
       Result:='0'
     else
       Result:= vQryAux.FieldByName('idcentrocusto').AsString;
   end;
 end;
end;

function TdmLocal.RetornaMaxId(Atabela: string): string;
begin
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select max(id) max_id from '+Atabela);
   Open;
   Result := FieldByName('max_id').AsString;
 end;
end;
procedure TdmLocal.TAbastecimentooutrosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.mlog.Lines.Add(e.Message);
end;

procedure TdmLocal.TAbastecimentoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.mlog.Lines.Add(e.Message);
end;

procedure TdmLocal.TMovLocalEstoqueReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  frmPrincipal.mlog.Lines.Add(e.Message);
end;

procedure TdmLocal.TStartDiarioReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  frmPrincipal.mlog.Lines.Add(e.Message);
end;

end.

