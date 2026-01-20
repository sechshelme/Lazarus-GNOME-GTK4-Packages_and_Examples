unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  fp_graphviz;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function r(f: double): integer;
begin
  Result := Trunc(f * 10) + 100;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Color := clBlack;
end;

procedure TForm1.FormPaint(Sender: TObject);
const
  pts: array[0..7] of TPpoint_t = (
    (x: 0.0; y: 0.0),
    (x: 20.0; y: 0.0),
    (x: 20.0; y: 20.0),
    (x: 15.0; y: 20.0),
    (x: 15.0; y: 5.0),
    (x: 5.0; y: 5.0),
    (x: 5.0; y: 20.0),
    (x: 0.0; y: 20.0));

  area: TPpoly_t = (ps: @pts; pn: length(pts));

  ep: array[0..1] of TPpoint_t = (
    (x: 18.0; y: 18.0),
    (x: 2.0; y: 18.0));

var
  i: integer;
  o: TPpolyline_t;

begin
  Canvas.Pen.Color := clGreen;
  Canvas.MoveTo(r(pts[0].x), r(pts[0].y));
  for i := 1 to Length(pts) - 1 do begin
    Canvas.LineTo(r(pts[i].x), r(pts[i].y));
  end;
  Canvas.LineTo(r(pts[0].x), r(pts[0].y));

  if Pshortestpath(@area, @ep, @o) = 0 then begin
    WriteLn('Pfad Count: ', o.pn);
    Canvas.Pen.Color := clYellow;

    Canvas.MoveTo(r(o.ps[0].x), r(o.ps[0].y));
    for i := 1 to o.pn - 1 do begin
      Canvas.LineTo(r(o.ps[i].x), r(o.ps[i].y));
    end;
  end else begin
    WriteLn('Fehler: Punkt ausserhalb oder Polygon ungültig.');
  end;

end;

end.
