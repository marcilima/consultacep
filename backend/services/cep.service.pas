unit cep.service;

interface

uses REST.Client, REST.HttpClient, cep.model;

type
  TCepService = class
  private
    FCepModel : TCepModel;
    function extrairNumerosCep(ACep: String): String;
  public
    constructor create;
    destructor Destroy; override;
    function ConsultarCep(ACep: String): String;
  end;
implementation

uses
  System.SysUtils, System.Rtti, System.JSON;

const
  VIA_CEP = 'http://viacep.com.br/ws/%s/json';
  API_CEP = 'https://cdn.apicep.com/file/apicep/%s.json';
  AWESOME_API = 'https://cep.awesomeapi.com.br/json/%s';

{ TCepService }

function TCepService.ConsultarCep(ACep: String): String;
var
  urlParaConsulta, resposta: String;
begin

  ACep := extrairNumerosCep(ACep);

  urlParaConsulta:= Format(VIA_CEP, [ACep]);
  resposta := FCepModel.ConsultarCep(urlParaConsulta);

  if resposta <> '' then
  begin
    Result := FCepModel.formatarJsonVIACEP(resposta);
    Exit;
  end;

  urlParaConsulta := Format(API_CEP, [Copy(ACep,1, 5) + '-' + Copy(ACep,6, 3)]);
  resposta := FCepModel.ConsultarCep(urlParaConsulta);

  if resposta <> '' then
  begin
    Result := FCepModel.formatarJsonAPICEP(resposta);
    Exit;
  end;

  urlParaConsulta := Format(AWESOME_API, [ACep]);
  resposta := FCepModel.ConsultarCep(urlParaConsulta);

  if resposta <> '' then
  begin
    Result := FCepModel.formatarJsonAWESOME_API(resposta);
    Exit
  end;

end;

constructor TCepService.create;
begin
  FCepModel := TCepModel.Create;
end;

destructor TCepService.Destroy;
begin
  FreeAndNil(FCepModel);
  inherited;
end;

function TCepService.extrairNumerosCep(ACep: String): String;
var
  I : Integer;
begin
   Result := '';
   for I := 1 To Length(ACep) do
     if ACep [I] In ['0'..'9'] Then
          Result := Result + ACep [I];
end;

end.
