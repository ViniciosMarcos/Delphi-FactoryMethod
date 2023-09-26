unit Model.Retangulo;

interface

uses
  Model.Interfaces;

type

  TRetangulo = class(TInterfacedObject, ICalculoArea)
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICalculoArea;
    function CalcularArea(ValorA, ValorB, ValorC: Extended):Extended;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TRetangulo }


function TRetangulo.CalcularArea(ValorA, ValorB, ValorC: Extended): Extended;
begin
  if(ValorA < 0) or (ValorB < 0) then
  begin
    MessageDlg('N�o existe medidas negativas.Verifique!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    Abort;
  end;
  Result := ValorA * ValorB;
end;

constructor TRetangulo.Create;
begin

end;

destructor TRetangulo.Destroy;
begin
  inherited;
end;

class function TRetangulo.New: ICalculoArea;
begin
  Result := Self.Create;
end;


end.
