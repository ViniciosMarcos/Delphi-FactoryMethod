unit Model.Tringulo;

interface

uses
  Model.Interfaces;

type

  TTriangulo = class(TInterfacedObject, ICalculoArea)
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICalculoArea;
    function CalcularArea(ValorA, ValorB, ValorC: Extended):Extended;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TTringulo }

function TTriangulo.CalcularArea(ValorA, ValorB, ValorC: Extended): Extended;
begin
  //Verifico se as medidas n�o s�o negativas.
  if (ValorA < 0) or (ValorB < 0) then
  begin
    MessageDlg('N�o existem medidas negativas. Verifique!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    Abort;
  end;
  Result := (ValorA * ValorB) / 2;
end;

constructor TTriangulo.Create;
begin

end;

destructor TTriangulo.Destroy;
begin
  inherited;
end;

class function TTriangulo.New: ICalculoArea;
begin
  Result := Self.Create;
end;

end.
