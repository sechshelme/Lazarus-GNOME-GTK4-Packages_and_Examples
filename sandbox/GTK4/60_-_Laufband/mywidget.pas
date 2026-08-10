unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    custom_color: TGdkRGBA;
    sprites: record
      second: PGskRenderNode;
      end;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType; cdecl;
function my_widget_new: PGTKWidget; cdecl;
procedure my_widget_set_color(self: PMyWidget; r, g, b: single); cdecl;

implementation

var
  parent_class: PMyWidgetClass = nil;

function create_second_hand_node: PGskRenderNode;
var
  snapshot: PGtkSnapshot;
  color: TGdkRGBA;
  r: Tgraphene_rect_t;
  i, width_px, height_px: integer;
  x, y, w, h: integer;
begin
  snapshot := gtk_snapshot_new();
  width_px := 600;
  height_px := 600;

  graphene_rect_init(@r, 0.0, 0.0, 1.0, 1.0);
  gtk_snapshot_push_clip(snapshot, @r);

  color.SetItems(0.9, 0.9, 0.1, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);

  for i := 0 to 150 do begin
    x := g_random_int_range(0, trunc(width_px * 0.7));
    y := g_random_int_range(0, height_px);
    w := g_random_int_range(60, trunc(width_px * 0.5));
    h := g_random_int_range(120, trunc(height_px * 0.8));

    color.SetItems(g_random_double, g_random_double, g_random_double, 1.0);

    graphene_rect_init(@r, x / width_px, y / height_px, w / width_px, h / height_px);
    gtk_snapshot_append_color(snapshot, @color, @r);

    if (y + h > height_px) then  begin
      graphene_rect_init(@r, x / width_px, (y - height_px) / height_px, w / width_px, h / height_px);
      gtk_snapshot_append_color(snapshot, @color, @r);
    end;

    if (y < 0) then  begin
      graphene_rect_init(@r, x / width_px, (y + height_px) / height_px, w / width_px, h / height_px);
      gtk_snapshot_append_color(snapshot, @color, @r);
    end;
  end;

  gtk_snapshot_pop(snapshot);
  Result := gtk_snapshot_free_to_node(snapshot);
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  r: Tgraphene_rect_t;
  child_bounds, repeat_bounds: Tgraphene_rect_t;
  width, height: single;
  p: Tgraphene_point_t;
  quadrat_groesse: single;
  Speed: single;
  repeat_node: PGskRenderNode;
const
  y_offset: single = 0.0;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);
  Speed := height / 150;
  quadrat_groesse := height;

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  y_offset := y_offset + Speed;
  if y_offset >= quadrat_groesse then  begin
    y_offset := 0.0;
  end;

  gtk_snapshot_save(snapshot);

  graphene_point_init(@p, (width / 2.0) - (quadrat_groesse / 2.0), y_offset);
  gtk_snapshot_translate(snapshot, @p);
  gtk_snapshot_scale(snapshot, quadrat_groesse, quadrat_groesse);

  graphene_rect_init(@child_bounds, 0.0, 0.0, 1.0, 1.0);
  graphene_rect_init(@repeat_bounds, 0.0, -1.0, 1.0, 2.0);

  repeat_node := gsk_repeat_node_new(@repeat_bounds, PMyWidget(widget)^.sprites.second, @child_bounds);

  gtk_snapshot_append_node(snapshot, repeat_node);
  gsk_render_node_unref(repeat_node);

  gtk_snapshot_restore(snapshot);
  gtk_snapshot_pop(snapshot);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
    if sprites.second <> nil then begin
      gsk_render_node_unref(sprites.second);
    end;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

function tick_cp(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_widget_queue_draw(widget);
  Result := G_SOURCE_CONTINUE;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  self^.custom_color.SetItems(0.0, 0.2, 0.0, 1.0);
  self^.sprites.second := create_second_hand_node;
  gtk_widget_add_tick_callback(GTK_WIDGET(self), @tick_cp, nil, nil);
end;

function my_widget_get_type: TGType; cdecl;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then  begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @class_init, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGTKWidget; cdecl;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

procedure my_widget_set_color(self: PMyWidget; r, g, b: single); cdecl;
begin
  self^.custom_color.SetItems(r, g, b, 1.0);
  gtk_widget_queue_draw(GTK_WIDGET(self));
end;

end.
