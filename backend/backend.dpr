program backend;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  System.SysUtils,
  cep.service in 'services\cep.service.pas',
  cep.model in 'model\cep.model.pas';

var
  app: THorse;

begin
  ReportMemoryLeaksOnShutdown := True;

  app := THorse.Create;

  app.Get('/cep/:cep',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      var cep := Req.Params.Items['cep'];
      var cepService:= TCepService.Create;
      var dadosCep: String := '';
      try
        dadosCep:= cepService.ConsultarCep(cep);
      finally
        FreeAndNil(cepService);
      end;
      res.ContentType('application/json');
      if dadosCep = '' then
        Res.Status(THTTPStatus.NoContent)
      else
        Res.Send(dadosCep);
    end);

  Writeln('Servidor iniciado na porta: 9000');
  app.Listen(9000);


end.
