unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
  private
    procedure drawSmoothPath(path: Int64);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.drawSmoothPath(path: Int64);
var
  bezierPoints: array of TPoint;
begin
  Canvas.PolyBezier( bezierPoints);
end;

end.
