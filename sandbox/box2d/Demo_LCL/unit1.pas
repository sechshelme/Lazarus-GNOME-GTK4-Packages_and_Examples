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
  Scale = 5;
var
  x, y, h, r, i, j: integer;
  coord: TCoords;
begin
  coord := engine.Coords;

  h := ClientHeight - 600;
  for i := 0 to Length(coord) - 1 do begin
    Canvas.MoveTo(coord[i, 0].X * Scale, h - coord[i, 0].Y * Scale);
    for j := 1 to Length(coord[i]) - 1 do begin
      Canvas.LineTo(coord[i, j].X * Scale, h - coord[i, j].Y * Scale);
    end;
    Canvas.LineTo(coord[i, 0].X * Scale, h - coord[i, 0].Y * Scale);
  end;

  r := Trunc(BALL_RADIUS * Scale);
  x := Trunc(ballPos.x * Scale);
  y := h - Trunc(ballPos.y * Scale);

  Canvas.Arc(x - r, y - r, x + r, y + r, 0, 5760);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ballPos := engine.GetPos;
  Repaint;
end;

end.
