unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

function my_widget_get_type: TGType;
function my_widget_new: PGtkWidget;

implementation

function Min(a, b: single): single;
begin
  if a > b then begin
    Result := b;
  end else begin
    Result := a;
  end;
end;

// ==== private

procedure DrawArc(snapshot: PGtkSnapshot; r, a1, a2: single);
var
  builder: PGskPathBuilder;
  x1, y1, x2, y2: single;
  path: PGskPath;
  color, border: TGdkRGBA;
  stroke: PGskStroke;
begin
  x1 := r * cos(a1);
  y1 := r * sin(a1);

  x2 := r * cos(a2);
  y2 := r * sin(a2);

  builder := gsk_path_builder_new;
  gsk_path_builder_move_to(builder, 0, 0);
  gsk_path_builder_line_to(builder, x1, y1);
  gsk_path_builder_svg_arc_to(builder, r, r, 0, False, True, x2, y2);
  gsk_path_builder_close(builder);

  path := gsk_path_builder_free_to_path(builder);

  color.SetItems(1.0, 0.8, 0.0, 1.0);
  gtk_snapshot_append_fill(snapshot, path, GSK_FILL_RULE_WINDING, @color);

  border.SetItems(0.8, 0.8, 0.8, 1.0);
  stroke := gsk_stroke_new(2.0);
  gtk_snapshot_append_stroke(snapshot, path, stroke, @border);

  gsk_stroke_free(stroke);
  gsk_path_unref(path);
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  width, height: double;
  p: Tgraphene_point_t;
  builder: PGskPathBuilder;
  path: PGskPath;
  color, border: TGdkRGBA;
  stroke: PGskStroke;
  i: integer;
  angle, rad, s, c: double;
  x1, y1, x2, y2, x3, y3: double;
const
  Count = 3;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_point_init(@p, width / 2.0, height / 2.0);
  gtk_snapshot_save(snapshot);
  gtk_snapshot_translate(snapshot, @p);

  builder := gsk_path_builder_new;

  graphene_point_init(@p, 0, 0);
  gsk_path_builder_add_circle(builder, @p, 100);

  gsk_path_builder_add_circle(builder, @p, 10);


  for i := 0 to Count - 1 do begin
    angle := i * 360 / Count;
    rad := angle * (Pi / 180.0);
    s := Sin(rad);
    c := Cos(rad);

    x1 := 30 * c - 0 * s;
    y1 := 30 * s + 0 * c;
    x2 := 80 * c - 30 * s;
    y2 := 80 * s + 30 * c;
    x3 := 80 * c - (-30) * s;
    y3 := 80 * s + (-30) * c;

    gsk_path_builder_move_to(builder, x1, y1);
    gsk_path_builder_line_to(builder, x2, y2);
    gsk_path_builder_svg_arc_to(builder, 90, 90, angle, False, False, x3, y3);
    gsk_path_builder_close(builder);
  end;

  path := gsk_path_builder_free_to_path(builder);

  color.SetItems(1.0, 0.8, 0.0, 1.0);
  gtk_snapshot_append_fill(snapshot, path, GSK_FILL_RULE_EVEN_ODD, @color);

  border.SetItems(0.0, 0.0, 0.0, 1.0);
  stroke := gsk_stroke_new(2.0);
  gtk_snapshot_append_stroke(snapshot, path, stroke, @border);

  gsk_stroke_free(stroke);
  gsk_path_unref(path);
  gtk_snapshot_restore(snapshot);
end;

procedure my_widget_class_init(g_class: Tgpointer; {%H-}class_data: Tgpointer); cdecl;
begin
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TGtkWidgetClass), @my_widget_class_init, SizeOf(TGtkWidget), nil, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGtkWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

end.
