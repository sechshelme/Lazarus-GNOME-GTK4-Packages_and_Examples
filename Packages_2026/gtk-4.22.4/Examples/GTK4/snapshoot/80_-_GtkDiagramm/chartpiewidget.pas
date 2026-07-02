unit ChartPieWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  PChartPieWidget = type Pointer;
  PChartPieWidgetClass = type Pointer;

function chart_pie_widget_get_type: TGType;
function chart_pie_widget_new: PGTKWidget;
procedure chart_pie_widget_add_pie(w: PChartpieWidget; a: Tgfloat; l: Pgchar);
procedure chart_pie_widget_change_pie(w: PChartpieWidget; index: Tgint; a: Tgfloat);


implementation

// ==== private

type
  Tbar = record
    a: Tgfloat;
    lab: Pgchar;
  end;
  Pbar = ^Tbar;

type
  TInstPriv = record
    pie: PGArray;
    angTotal: Tgfloat;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
  instance_size: integer = 0;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

function Min(a, b: single): single;
begin
  if a > b then begin
    Result := b;
  end else begin
    Result := a;
  end;
end;

function GetRGBACol(i: SizeInt): TGdkRGBA;
begin
  result.SetItems((((i mod 6) + 1) and 4) shr 2 * 0.8, (((i mod 6) + 1) and 2) shr 1 * 0.8, (((i mod 6) + 1) and 1) * 0.8, 1.0);
end;

// ======

procedure DrawArc(snapshot: PGtkSnapshot; r, a1, a2: single; col: PGdkRGBA);
var
  builder: PGskPathBuilder;
  x1, y1, x2, y2, x3, y3, x4, y4, r_in: single;
  path: PGskPath;
  border: TGdkRGBA;
  large_arc: boolean;
  stroke: PGskStroke;
begin
  r_in := r * 0.6;
  large_arc := abs(a2 - a1) > pi;

  x1 := r * cos(a1);
  y1 := r * sin(a1);
  x2 := r * cos(a2);
  y2 := r * sin(a2);

  x3 := r_in * cos(a2);
  y3 := r_in * sin(a2);
  x4 := r_in * cos(a1);
  y4 := r_in * sin(a1);

  builder := gsk_path_builder_new;

  gsk_path_builder_move_to(builder, x1, y1);
  gsk_path_builder_svg_arc_to(builder, r, r, 0, large_arc, True, x2, y2);
  gsk_path_builder_line_to(builder, x3, y3);
  gsk_path_builder_svg_arc_to(builder, r_in, r_in, 0, large_arc, False, x4, y4);
  gsk_path_builder_close(builder);

  path := gsk_path_builder_free_to_path(builder);
  gtk_snapshot_append_fill(snapshot, path, GSK_FILL_RULE_WINDING, col);

  border.SetItems(0.2, 0.0, 0.1, 1.0);
  stroke := gsk_stroke_new(r / 10.0);
  gtk_snapshot_append_stroke(snapshot, path, stroke, @border);

  gsk_stroke_free(stroke);


  gsk_path_unref(path);
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  priv: PInstPriv;
  width, height: longint;
  r: Tgraphene_rect_t;
  p: Tgraphene_point_t;
  ofs, a1, a2: Tgfloat;
  i: integer;
  item: Pbar;
  col: TGdkRGBA;
begin
  priv := GetPriv(widget);
  with priv^ do begin
    width := gtk_widget_get_width(widget);
    height := gtk_widget_get_height(widget);

    graphene_rect_init(@r, 0, 0, width, height);
    col.SetItems(0.2, 0.0, 0.1, 1.0);
    gtk_snapshot_append_color(snapshot, @col, @r);

    gtk_snapshot_push_clip(snapshot, @r);

    graphene_point_init(@p, width / 2.0, height / 2.0);
    gtk_snapshot_translate(snapshot, @p);


    ofs := 0.0;
    for i := 0 to pie^.len - 1 do begin
      item := Pbar(pie^.data) + i;
      a1 := (pi * 2) / angTotal * ofs;
      ofs += item^.a;
      a2 := (pi * 2) / angTotal *ofs;

      col := GetRGBACol(i);
      DrawArc(snapshot, Min(width, height) / 2.0 * 0.9, a1, a2, @col);
    end;

    gtk_snapshot_pop(snapshot);
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
    g_array_free(pie, True);
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure array_clear_func(Data: Tgpointer); cdecl;
var
  bar: Pbar absolute Data;
begin
  if bar^.lab <> nil then begin
    g_free(bar^.lab);
  end;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    pie := g_array_new(False, False, SizeOf(Tbar));
    g_array_set_clear_func(pie, @array_clear_func);
    angTotal := 0.0;
  end;
end;


// ==== public

function chart_pie_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_WIDGET, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'ChartPieWidget',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function chart_pie_widget_new: PGTKWidget;
var
  priv: PInstPriv;
begin
  Result := g_object_new(chart_pie_widget_get_type, nil);
  priv := GetPriv(Result);
end;

procedure chart_pie_widget_add_pie(w: PChartpieWidget; a: Tgfloat; l: Pgchar);
var
  priv: PInstPriv;
  bar: Tbar;
begin
  priv := GetPriv(w);
  with priv^ do begin
    bar.a := a;
    bar.lab := g_strdup(l);
    g_array_append_val(pie, bar);
    angTotal += a;
  end;
  gtk_widget_queue_draw(GTK_WIDGET(w));
end;

procedure chart_pie_widget_change_pie(w: PChartpieWidget; index: Tgint; a: Tgfloat);
var
  priv: PInstPriv;
  i: integer;
  item: Pbar;
begin
  priv := GetPriv(w);
  with priv^ do begin
    item := Pbar(pie^.data) + index;
    item^.a := a;
    angTotal := 0.0;
    for i := 0 to pie^.len - 1 do begin
      item := Pbar(pie^.data) + i;
      angTotal += item^.a;
    end;
  end;
end;

end.
