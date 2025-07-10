unit cep.service;

interface

uses REST.Client, REST.HttpClient, cep.model;

type
  TServConsultaCep = (scsVIA_CEP, scsAPI_CEP, scsAWESOME_API);

  TServConsultaCepHelper = record helper for TServConsultaCep
    function GetLinkServer: string;

  end;

  TCepService = class
  private
    FCepModel : TCepModel;
    function ExtrairNumerosCep(ACep: String): String;
  public
    constructor create;
    destructor Destroy; override;
    function ConsultarCep(ACep: String): String;
  end;

implementation

uses
  System.SysUtils, System.Rtti, System.JSON;

const
  cSeverLinks : array [TServConsultaCep] of string  = ('http://viacep.com.br/ws/%s/json',
                                                       'https://cdn.apicep.com/file/apicep/%s.json',
                                                       'https://cep.awesomeapi.com.br/json/%s');

{ TCepService }

function TCepService.ConsultarCep(ACep: String): String;
var
  LUrlParaConsulta, resposta: String;
  LServer: TServConsultaCep;
begin

  ACep := extrairNumerosCep(ACep);

  for LServer := Low(TServConsultaCep) to High(TServConsultaCep) do
  begin
    if LServer = scsAPI_CEP then
      LUrlParaConsulta := Format(LServer.GetLinkServer, [Copy(ACep,1, 5) + '-' + Copy(ACep,6, 3)])
    else
      LUrlParaConsulta := Format(LServer.GetLinkServer, [ACep]);

    resposta := FCepModel.ConsultarCep(LUrlParaConsulta);

    if resposta <> '' then
    begin
      Result := FCepModel.formatarJsonVIACEP(resposta);
      Break;
    end;
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

function TCepService.ExtrairNumerosCep(ACep: String): String;
var
  I : Integer;
begin
   Result := '';

   for I := 1 to Length(ACep) do
    if ACep [I] in ['0'..'9'] then
      Result := Result + ACep [I];
end;

{ TServConsultaCepHelper }

function TServConsultaCepHelper.GetLinkServer: string;
begin
  Result := cSeverLinks[Self];
end;

end.
