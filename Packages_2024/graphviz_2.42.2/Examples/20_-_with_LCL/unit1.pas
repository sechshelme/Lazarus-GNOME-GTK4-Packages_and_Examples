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
    procedure FormResize(Sender: TObject);
  private
    scale: integer;
    procedure drawPoly(path: TPpolyline_t; closeP: boolean);
    procedure drawSmoothPath(path: TPpolyline_t);
    function r(f: double): integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function TForm1.r(f: double): integer;
begin
  Result := Trunc(f * scale) + scale div 3;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Color := $110033;
end;

procedure TForm1.drawPoly(path: TPpolyline_t; closeP: boolean);
var
  i: integer;
begin
  Canvas.MoveTo(r(path.ps[0].x), r(path.ps[0].y));
  for i := 1 to path.pn - 1 do begin
    Canvas.LineTo(r(path.ps[i].x), r(path.ps[i].y));
  end;
  if closeP then begin
    Canvas.LineTo(r(path.ps[0].x), r(path.ps[0].y));
  end;
end;

procedure TForm1.drawSmoothPath(path: TPpolyline_t);
var
  i: integer;
  bezierPoints: array of Classes.TPoint=nil;
begin
  SetLength(bezierPoints, path.pn);
  for i := 0 to path.pn - 1 do begin
    bezierPoints[i].x := r(path.ps[i].x);
    bezierPoints[i].y := r(path.ps[i].y);
  end;

  Canvas.PolyBezier(bezierPoints);
end;

procedure TForm1.FormPaint(Sender: TObject);
const
  pts: array[0..23] of TPpoint_t = (
    (x: 0.0; y: 0.0),
    (x: 1.0; y: 0.0),
    (x: 1.0; y: 5.0),
    (x: 2.0; y: 5.0),
    (x: 2.0; y: 0.0),
    (x: 5.0; y: 0.0),
    (x: 5.0; y: 6.0),
    (x: 6.0; y: 6.0),
    (x: 6.0; y: 0.0),
    (x: 9.0; y: 0.0),
    (x: 9.0; y: 7.0),
    (x: 10.0; y: 7.0),
    (x: 10.0; y: 0.0),
    (x: 13.0; y: 0.0),
    (x: 13.0; y: 8.0),
    (x: 8.0; y: 8.0),
    (x: 8.0; y: 1.0),
    (x: 7.0; y: 1.0),
    (x: 7.0; y: 7.0),
    (x: 4.0; y: 7.0),
    (x: 4.0; y: 1.0),
    (x: 3.0; y: 1.0),
    (x: 3.0; y: 6.0),
    (x: 0.0; y: 6.0));

  area: TPpoly_t = (ps: @pts; pn: length(pts));

  ep: array[0..1] of TPpoint_t = (
    (x: 0.5; y: 0.5),
    (x: 12.5; y: 0.5));

var
  o, smooth_path: TPpolyline_t;

  barriers: PPedge_t = nil;
  n_barriers: longint = 0;
  poly_ptr: PPpoly_t;
  slopes: array[0..1] of TPvector_t;

begin
  Canvas.Pen.Color := clGreen;
  drawPoly(area, True);

  if Pshortestpath(@area, @ep, @o) = 0 then begin
    WriteLn('Pfad Count: ', o.pn);

    Canvas.Pen.Color := clSkyBlue;
    drawPoly(o, False);

    poly_ptr := @area;
    Ppolybarriers(@poly_ptr, 1, @barriers, @n_barriers);
    WriteLn('n_barriers: ', n_barriers);

    if Proutespline(barriers, n_barriers, o, @slopes, @smooth_path) = 0 then begin
      WriteLn('Smoth Pfad Count: ', smooth_path.pn);
      Canvas.Pen.Color := clYellow;
      drawSmoothPath(smooth_path);
    end;

  end else begin
    WriteLn('Fehler: Punkt ausserhalb oder Polygon ungültig.');
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  scale := ClientWidth div 15;
end;

end.
