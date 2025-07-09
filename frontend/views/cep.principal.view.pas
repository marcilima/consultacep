unit cep.principal.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  cep.model, Vcl.ExtCtrls, DUnitX.TestFramework;

type
  TfrmPrincipal = class(TForm)
    btnBuscarCep: TButton;
    edtCep: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    edtLogradouro: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtBairro: TEdit;
    edtCidade: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtUF: TEdit;
    Label7: TLabel;
    edtEstado: TEdit;
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmPrincipal.edtCepKeyPress(Sender: TObject; var Key: Char);
begin

  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;

end;

end.
