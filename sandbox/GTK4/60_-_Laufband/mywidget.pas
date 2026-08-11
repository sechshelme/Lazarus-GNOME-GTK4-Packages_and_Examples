unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    custom_color: TGdkRGBA;
    sprites: record
      background: PGskRenderNode;
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

procedure SetBrown(c: PGdkRGBA);
begin
  with c^ do begin
    red := g_random_double_range(0.3, 0.9);
    green := red * g_random_double_range(0.45, 0.65);
    blue := red * g_random_double_range(0.05, 0.20);
  end;
end;

procedure SetPos(r: Pgraphene_rect_t);
var
  x, y, w, h: single;
  const
    SIZE=0.1;
begin
  x := g_random_double_range(0, 1.0);
  y := g_random_double_range(0, 1.0);
  w := g_random_double_range(SIZE/4, SIZE);
  h := g_random_double_range(SIZE/4, SIZE);

  graphene_rect_init(r, x, y, w, h);
end;

function create_second_hand_node: PGskRenderNode;
var
  snapshot: PGtkSnapshot;
  color: TGdkRGBA;
  r: Tgraphene_rect_t;
  i: integer;
begin
  snapshot := gtk_snapshot_new();

  graphene_rect_init(@r, 0.0, 0.0, 1.0, 1.0);
  gtk_snapshot_push_clip(snapshot, @r);

  graphene_rect_init(@r, -0.1, -0.1, 1.2, 1.2);
//  color.SetItems(0.9, 0.9, 0.1, 1.0);
  color.SetItems(0.4, 0.2, 0.1, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);

  for i := 0 to 150 do begin
    SetBrown(@color);
    SetPos(@r);
    gtk_snapshot_append_color(snapshot, @color, @r);
    graphene_rect_offset_r(@r, 0, -1.0, @r);
    gtk_snapshot_append_color(snapshot, @color, @r);
  end;

  gtk_snapshot_pop(snapshot);
  Result := gtk_snapshot_free_to_node(snapshot);
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  radius_size: Tgraphene_size_t;
  r, child_bounds, repeat_bounds: Tgraphene_rect_t;
  width, height: single;
  p: Tgraphene_point_t;
  quad_size: single;
  Speed, radius: single;
  rr: TGskRoundedRect;
  repeat_node: PGskRenderNode;
  color: TGdkRGBA;
const
  y_offset: single = 0.0;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);
  Speed := height / 150;
  quad_size := height;

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  y_offset := y_offset + Speed;
  if y_offset >= quad_size then  begin
    y_offset := 0.0;
  end;

  gtk_snapshot_save(snapshot);
  graphene_point_init(@p, width / 2.0 - (quad_size / 2.0), Trunc(y_offset));
  gtk_snapshot_translate(snapshot, @p);
  gtk_snapshot_scale(snapshot, quad_size, quad_size);

  graphene_rect_init(@child_bounds, 0.0, 0.0, 1.0, 1.0);
  graphene_rect_init(@repeat_bounds, 0.0, -1.0, 1.0, 2.0);

  repeat_node := gsk_repeat_node_new(@repeat_bounds, PMyWidget(widget)^.sprites.background, @child_bounds);
  gtk_snapshot_append_node(snapshot, repeat_node);
  gsk_render_node_unref(repeat_node);
  gtk_snapshot_restore(snapshot);


  // Point
  color.SetItems(1.0, 0.8, 0.8, 1.0);

  radius := height / 40.0;
  graphene_rect_init(@r, -radius, -radius, radius * 2, radius * 2);
  graphene_size_init(@radius_size, radius, radius);

  gsk_rounded_rect_init(@rr, @r, @radius_size, @radius_size, @radius_size, @radius_size);

  graphene_point_init(@p, width / 2.0, height / 2);
  gtk_snapshot_translate(snapshot, @p);

  gtk_snapshot_push_rounded_clip(snapshot, @rr);
  gtk_snapshot_append_color(snapshot, @color, @r);
  gtk_snapshot_pop(snapshot);

  gtk_snapshot_pop(snapshot);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
    if sprites.background <> nil then begin
      gsk_render_node_unref(sprites.background);
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
  self^.sprites.background := create_second_hand_node;
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
