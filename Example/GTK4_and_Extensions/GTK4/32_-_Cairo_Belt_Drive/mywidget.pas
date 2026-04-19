unit MyWidget;

interface

uses
//  Math,
  fp_glib2, fp_GTK4, fp_cairo, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    rotang, r1, r2, x1, y1, x2, y2: double;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;
procedure my_widget_set_coords(self: PMyWidget; ang, r1, x1, y1, r2, x2, y2: double);

implementation

const
  {$IFDEF linux}
  libm = 'm';
  {$ENDIF}

  {$IFDEF windows}
  libm = 'msvcrt.dll';
  {$ENDIF}

  function atan2f(y, x: single): single; cdecl; external libm;
  function acosf(x: single): single; cdecl; external libm;

// ==== private

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  with self^ do begin
    r1 := 10.0;
    r2 := 10.0;
    x1 := 10.0;
    y1 := 10.0;
    x2 := 100.0;
    y2 := 100.0;
  end;
end;


procedure DrawWheel(cr: Pcairo_t; x, y, r, currentAngle: double);
begin
  cairo_set_source_rgb(cr, 1.0, 0.2, 0.2);
  cairo_move_to(cr, x, y);
  cairo_arc(cr, x, y, r, currentAngle, currentAngle + Pi / 2);
  cairo_fill(cr);

  cairo_set_source_rgb(cr, 0.2, 0.8, 0.2);
  cairo_move_to(cr, x, y);
  cairo_arc(cr, x, y, r, currentAngle + Pi / 2, currentAngle + Pi);
  cairo_fill(cr);

  cairo_set_source_rgb(cr, 0.2, 0.2, 1.0);
  cairo_move_to(cr, x, y);
  cairo_arc(cr, x, y, r, currentAngle + Pi, currentAngle + 3 * Pi / 2);
  cairo_fill(cr);

  cairo_set_source_rgb(cr, 1.0, 1.0, 0.2);
  cairo_move_to(cr, x, y);
  cairo_arc(cr, x, y, r, currentAngle + 3 * Pi / 2, currentAngle + 2 * Pi);
  cairo_fill(cr);
end;


procedure snapshot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
  cr: Pcairo_t;
  r: Tgraphene_rect_t;
  width, height: longint;

  dx, dy, dist, angle, alpha: Single;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  graphene_rect_init(@r, 0.0, 0.0, width, height);
  cr := gtk_snapshot_append_cairo(snapshot, @r);

  with self^ do begin
    dx := x2 - x1;
    dy := y2 - y1;
    dist := Sqrt(dx * dx + dy * dy);
    angle := atan2f(dy, dx);
    alpha := acosf((r1 - r2) / dist);

    cairo_set_source_rgb(cr, 0.3, 0.3, 0.3);
    cairo_paint(cr);

    // Kreise zeichnen
    DrawWheel(cr, x1, y1, r1, rotang);
    DrawWheel(cr, x2, y2, r2, rotang * (r1 / r2));

    // Riemen zeichnen
    cairo_set_source_rgb(cr, 0.7, 0.7, 0.2);
    cairo_set_line_width(cr, 5);

    cairo_arc(cr, x1, y1, r1, angle + alpha, angle - alpha);
    cairo_stroke(cr);
    cairo_arc(cr, x2, y2, r2, angle - alpha, angle + alpha);
    cairo_stroke(cr);

    cairo_move_to(cr, x1 + r1 * Cos(angle + alpha), y1 + r1 * Sin(angle + alpha));
    cairo_line_to(cr, x2 + r2 * Cos(angle + alpha), y2 + r2 * Sin(angle + alpha));
    cairo_stroke(cr);

    cairo_move_to(cr, x1 + r1 * Cos(angle - alpha), y1 + r1 * Sin(angle - alpha));
    cairo_line_to(cr, x2 + r2 * Cos(angle - alpha), y2 + r2 * Sin(angle - alpha));
    cairo_stroke(cr);
  end;

  cairo_destroy(cr);

  gtk_snapshot_pop(snapshot);
end;

procedure init_class_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshot_cp;
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @init_class_cp, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGTKWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

procedure my_widget_set_coords(self: PMyWidget; ang, r1, x1, y1, r2, x2, y2: double);
begin
  self^.rotang := ang;
  self^.r1 := r1;
  self^.x1 := x1;
  self^.y1 := y1;
  self^.r2 := r2;
  self^.x2 := x2;
  self^.y2 := y2;
  gtk_widget_queue_draw(GTK_WIDGET(self));
end;

end.
