unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  fp_box2d, EngineCalc;

type

  { TForm1 }

  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    engine: TEngine;
    ballPos: Tb2Vec2;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  engine := TEngine.Create;
  Timer1.Enabled := True;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  engine.Free;
end;

procedure TForm1.FormPaint(Sender: TObject);
const
  r = 15;
var
  x, y, h: integer;
begin
  h := ClientHeight - 400;
  Canvas.Line(0, h, Trunc(GROUND_HALF_WIDTH * 10), h );
  x := Trunc(ballPos.x * 10);
  y := h - Trunc(ballPos.y * 10);

  Canvas.Arc(x - r, y-2*r, x + r, y-4*r, 0, 5760);
//  WriteLn('x: ', x: 4, '  y: ', y: 4);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ballPos := engine.GetPos;
  Repaint;
end;

end.
