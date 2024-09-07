unit cep.model;

interface

uses
  System.JSON;
type
  TCepModel = class
  private
    
  public
    function ConsultarCep(const aUrl:String): String;
    
    function formatarJsonVIACEP(json: String): String;
    function formatarJsonAPICEP(json: String): String;
    function formatarJsonAWESOME_API(json: String): String; 
  end;

implementation

uses
  System.SysUtils, REST.Client;

{ TCepModel }

function TCepModel.ConsultarCep(const aUrl: String): String;
var
  restClient: TRESTClient;
  request: TRESTRequest;
  response: TRESTResponse;
  ResponseJson: TJsonObject;
begin

  Result := '';
  try
    response := TRESTResponse.Create(nil);
    response.ContentType := 'application/json';

    restClient := TRESTClient.create(aUrl);

    request := TRESTRequest.Create(restClient);
    request.Response := response;

    request.Execute;

    if (response.StatusCode = 200) and (not response.Content.Contains('erro')) then
      Result := response.Content;
  finally
    FreeAndNil(request);
    FreeAndNil(restClient);
    FreeAndNil(response);
  end;
end;

function TCepModel.formatarJsonAPICEP(json: String): String;
var
  jsonApiCep: TJsonObject;
  outputJson: TJsonObject;
begin
  jsonApiCep := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;
  try
    outputJson := TJsonObject.Create;
    outputJson.AddPair('cep', jsonApiCep.GetValue<String>('code'));
    outputJson.AddPair('logradouro', jsonApiCep.GetValue<String>('address'));
    outputJson.AddPair('complemento', '');
    outputJson.AddPair('bairro', jsonApiCep.GetValue<String>('district'));
    outputJson.AddPair('cidade', jsonApiCep.GetValue<String>('city'));
    outputJson.AddPair('uf', jsonApiCep.GetValue<String>('state'));
    outputJson.AddPair('ibge', '');
    outputJson.AddPair('estado', '');
    Result := outputJson.ToJSON;
  finally
    FreeAndNil(jsonApiCep);
    FreeAndNil(outputJson);
  end;
  
end;

function TCepModel.formatarJsonAWESOME_API(json: String): String;
var
  jsonAWESOME_API: TJsonObject;
  outputJson: TJsonObject; 
begin
  jsonAWESOME_API := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;
  try
    outputJson := TJsonObject.Create;
    outputJson.AddPair('cep', jsonAWESOME_API.GetValue<String>('cep'));
    outputJson.AddPair('logradouro', jsonAWESOME_API.GetValue<String>('address'));
    outputJson.AddPair('complemento', '');
    outputJson.AddPair('bairro', jsonAWESOME_API.GetValue<String>('district'));
    outputJson.AddPair('cidade', jsonAWESOME_API.GetValue<String>('city'));
    outputJson.AddPair('uf', jsonAWESOME_API.GetValue<String>('state'));
    outputJson.AddPair('ibge', jsonAWESOME_API.GetValue<String>('city_ibge'));
    outputJson.AddPair('estado', '');

    Result := outputJson.ToJSON;
  finally
    FreeAndNil(jsonAWESOME_API);
    FreeAndNil(outputJson);
  end;

end;

function TCepModel.formatarJsonVIACEP(json: String): String;
var
  jsonViaCep: TJsonObject;
  outputJson: TJsonObject;
begin
  jsonViaCep := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;
  try
    outputJson := TJsonObject.Create;
    outputJson.AddPair('cep', jsonViaCep.GetValue<String>('cep'));
    outputJson.AddPair('logradouro', jsonViaCep.GetValue<String>('logradouro'));
    outputJson.AddPair('complemento', jsonViaCep.GetValue<String>('complemento'));
    outputJson.AddPair('bairro', jsonViaCep.GetValue<String>('bairro'));
    outputJson.AddPair('cidade', jsonViaCep.GetValue<String>('localidade'));
    outputJson.AddPair('uf', jsonViaCep.GetValue<String>('uf'));
    outputJson.AddPair('ibge', jsonViaCep.GetValue<String>('ibge'));
    outputJson.AddPair('estado', jsonViaCep.GetValue<String>('estado'));
    Result := outputJson.ToJSON;
  finally
    FreeAndNil(jsonViaCep);
    FreeAndNil(outputJson);
  end;
end;

end.
