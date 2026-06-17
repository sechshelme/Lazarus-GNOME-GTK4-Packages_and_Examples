unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

const
  COUNT = 100000;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGtkWidget;

implementation

// ==== private

var
  parent_class: PMyWidgetClass = nil;

procedure finalize_cp(obj: PGObject); cdecl;
begin
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
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
  gtk_widget_add_tick_callback(GTK_WIDGET(self), @tick_cp, nil, nil);
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  r: Tgraphene_rect_t;
  rounded_rect: TGskRoundedRect;
  radius_size: Tgraphene_size_t;
  color: TGdkRGBA;
  width, height: single;
  i: integer;
  radius, x, y: single;
var
  start_time, end_time, delta: Tgint64;
begin
  start_time := g_get_monotonic_time;

  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  for i := 0 to COUNT - 1 do begin
    radius := 5.0 + Random * 45.0;
    x := Random * width;
    y := Random * height;

    graphene_rect_init(@r, x - radius, y - radius, radius * 2, radius * 2);

    graphene_size_init(@radius_size, radius, radius);
    gsk_rounded_rect_init(@rounded_rect, @r, @radius_size, @radius_size, @radius_size, @radius_size);

    color.SetItems(Random, Random, Random, 0.5);

    gtk_snapshot_push_rounded_clip(snapshot, @rounded_rect);
    gtk_snapshot_append_color(snapshot, @color, @r);
    gtk_snapshot_pop(snapshot);
  end;

  gtk_snapshot_pop(snapshot);
  end_time := g_get_monotonic_time;
  delta := end_time - start_time;
  g_printf('SnapShot:  Frame Zeit: %lld us (%.2f ms)'#10, delta, delta / 1000.0);
end;

procedure my_widget_class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);

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
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @my_widget_class_init, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGtkWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

end.
