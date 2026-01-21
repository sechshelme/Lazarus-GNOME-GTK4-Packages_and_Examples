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
 procedure   drawPoly  (pts:PPpoint_t;len:SizeInt);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function r(f: double): integer;
begin
  Result := Trunc(f * 30) + 10;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Color := $110033;
end;

procedure TForm1.drawPoly(pts: PPpoint_t; len: SizeInt);
var
  i: Integer;
begin
    Canvas.MoveTo(r(pts[0].x), r(pts[0].y));
    for i := 1 to len - 1 do begin
      Canvas.LineTo(r(pts[i].x), r(pts[i].y));
    end;
    Canvas.LineTo(r(pts[0].x), r(pts[0].y));
end;

procedure TForm1.FormPaint(Sender: TObject);
const
  pts: array[0..23] of TPpoint_t = (
  (x: 0.0; y: 0.0),
  (x: 1.0; y: 0.0),
  (x: 1.0; y: 4.0),
  (x: 2.0; y: 4.0),
  (x: 2.0; y: 0.0),
  (x: 5.0; y: 0.0),
  (x: 5.0; y: 5.0),
  (x: 6.0; y: 5.0),
  (x: 6.0; y: 0.0),
  (x: 9.0; y: 0.0),
  (x: 9.0; y: 6.0),
  (x: 10.0; y: 6.0),
  (x: 10.0; y: 0.0),
  (x: 13.0; y: 0.0),
  (x: 13.0; y: 7.0),
  (x: 8.0; y: 7.0),
  (x: 8.0; y: 1.0),
  (x: 7.0; y: 1.0),
  (x: 7.0; y: 6.0),
  (x: 4.0; y: 6.0),
  (x: 4.0; y: 1.0),
  (x: 3.0; y: 1.0),
  (x: 3.0; y: 5.0),
  (x: 0.0; y: 5.0));

  island_pts: array[0..3] of TPpoint_t = (
  (x: 11.0; y: 3.0),
  (x: 12.0; y: 3.0),
  (x: 12.0; y: 4.0),
  (x: 11.0; y: 4.0));




  area: TPpoly_t = (ps: @ pts; pn: length(pts));

  ep: array[0..1] of TPpoint_t = (
    (x: 0.5; y: 0.5),
    (x: 12.5; y: 0.5));

var
  i: integer;
  o: TPpolyline_t;

begin
  // outhers
  Canvas.Pen.Color := clGreen;

  drawPoly(@pts, Length(pts));
  drawPoly(@island_pts, Length(island_pts));

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
