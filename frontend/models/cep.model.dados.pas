unit cep.model.dados;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TdmDados = class(TDataModule)
    restClient: TRESTClient;
    restRequest: TRESTRequest;
    restResponse: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
