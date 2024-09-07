unit cep.model;

interface

uses
  cep.model.dados, cep.model.entities,REST.Json;

type
  TCepModel = class
  private
    FDmDados: TdmDados;
  public
    DadosCep: TDadosCepDTO;
    constructor Create;
    destructor Destroy; override;

    procedure ObterDadosCep(const aCep: String);
  end;

implementation

uses
  Vcl.Forms;

{ TCepModel }

constructor TCepModel.Create;
begin
  FDmDados := TdmDados.Create(nil);
end;

destructor TCepModel.Destroy;
begin
  FDmDados.Free;
  inherited;
end;

procedure TCepModel.ObterDadosCep(const aCep: String);
begin
  FDmDados.restRequest.Params[0].Value := aCep;
  FDmDados.restRequest.Execute;
  DadosCep := TJson.JsonToObject<TDadosCepDTO>(FDmDados.restResponse.Content);

end;

end.
