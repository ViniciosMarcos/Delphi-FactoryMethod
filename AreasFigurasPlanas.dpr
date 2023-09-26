program AreasFigurasPlanas;

uses
  Vcl.Forms,
  View.Calculo in 'View.Calculo.pas' {F_ViewCalculo},
  Model.Interfaces in 'Model.Interfaces.pas',
  Model.Tringulo in 'Model.Tringulo.pas',
  Model.Quadrado in 'Model.Quadrado.pas',
  Model.Circulo in 'Model.Circulo.pas',
  Model.Retangulo in 'Model.Retangulo.pas',
  Model.Trapezio in 'Model.Trapezio.pas',
  Model.Factory in 'Model.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_ViewCalculo, F_ViewCalculo);
  Application.Run;
end.
