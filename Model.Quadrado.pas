unit Model.Quadrado;

interface

uses
  Model.Interfaces;

type

  TQuadrado = class(TInterfacedObject, ICalculoArea)
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICalculoArea;
    function CalcularArea(ValorA, ValorB, ValorC: Extended):Extended;
  end;


implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TQuadrado }

function TQuadrado.CalcularArea(ValorA, ValorB, ValorC: Extended): Extended;
begin
  if(ValorA < 0) then
  begin
    MessageDlg('Não existem medidas negativas. Verifique!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    Abort;
  end;
  Result := ValorA * ValorA;
end;

constructor TQuadrado.Create;
begin

end;

destructor TQuadrado.Destroy;
begin
  inherited;
end;

class function TQuadrado.New: ICalculoArea;
begin
  Result := Self.Create;
end;

end.
