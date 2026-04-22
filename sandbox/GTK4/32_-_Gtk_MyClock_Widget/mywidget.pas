unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    custom_color: TGdkRGBA;
    dial_node: PGskRenderNode;
    hand: record
      second, minute, hour: PGskRenderNode;
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

// ==== private

var
  parent_class: PMyWidgetClass = nil;

function create_dial_node: PGskRenderNode;
var
  snapshot: PGtkSnapshot;
  color: TGdkRGBA;
  r: Tgraphene_rect_t;
  i: integer;
  tw, th: single;
begin
  snapshot := gtk_snapshot_new();
  color.SetItems(0.7, 0.7, 0.7, 1.0);

  for i := 0 to 59 do begin
    gtk_snapshot_save(snapshot);
    gtk_snapshot_rotate(snapshot, i * 6);

    if (i mod 5 = 0) then begin
      tw := 0.04;
      th := 0.10;
    end else begin
      tw := 0.02;
      th := 0.05;
    end;

    graphene_rect_init(@r, -(tw / 2), -1.0, tw, th);
    gtk_snapshot_append_color(snapshot, @color, @r);
    gtk_snapshot_restore(snapshot);
  end;
  Result := gtk_snapshot_free_to_node(snapshot);
end;

function create_second_hand_node: PGskRenderNode;
var
  snapshot: PGtkSnapshot;
  color: TGdkRGBA;
  r: Tgraphene_rect_t;
begin
  snapshot := gtk_snapshot_new();
  graphene_rect_init(@r, -1.0, 0.0, 2.0, -100.0);
  color.SetItems(0.9, 0.9, 0.1, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);

  Result := gtk_snapshot_free_to_node(snapshot);
end;

function create_minute_hand_node: PGskRenderNode;
var
  snapshot: PGtkSnapshot;
  color: TGdkRGBA;
  r: Tgraphene_rect_t;
begin
  snapshot := gtk_snapshot_new();
  graphene_rect_init(@r, -4.0, 0.0, 8.0, -100.0);
  color.SetItems(0.1, 0.9, 0.1, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);

  Result := gtk_snapshot_free_to_node(snapshot);
end;

function create_hour_hand_node: PGskRenderNode;
var
  snapshot: PGtkSnapshot;
  color: TGdkRGBA;
  r: Tgraphene_rect_t;
begin
  snapshot := gtk_snapshot_new();
  graphene_rect_init(@r, -4.0, 0.0, 8.0, -70.0);
  color.SetItems(0.9, 0.1, 0.1, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);

  Result := gtk_snapshot_free_to_node(snapshot);
end;


procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  r: Tgraphene_rect_t;
  width, height: single;
  p: Tgraphene_point_t;
  radius_size: Tgraphene_size_t;
  color: TGdkRGBA;
  rounded_rect: TGskRoundedRect;
  ang_sec, ang_min, ang_hour, f_sec, f_min, f_hour: single;
  radius: single;
  now: PGDateTime;

begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  graphene_rect_init(@r, -(width / 2), -(height / 2), width, height);
  graphene_point_init(@p, width / 2, height / 2);
  gtk_snapshot_translate(snapshot, @p);

  color.SetItems(0.2, 0.0, 0.0, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);

  gtk_snapshot_save(snapshot);
  gtk_snapshot_scale(snapshot, 0.9, 0.9);
  color := PMyWidget(widget)^.custom_color;
  gtk_snapshot_append_color(snapshot, @color, @r);
  gtk_snapshot_restore(snapshot);

  // deal
  gtk_snapshot_save(snapshot);
  gtk_snapshot_scale(snapshot, height / 3, height / 3);
  gtk_snapshot_append_node(snapshot, PMyWidget(widget)^.dial_node);
  gtk_snapshot_restore(snapshot);

  // pointer
  now := g_date_time_new_now_local;

  f_sec := g_date_time_get_second(now) + (g_date_time_get_microsecond(now) / 1000000);
  ang_sec := f_sec * 6;
  f_min := g_date_time_get_minute(now) + (f_sec / 60);
  ang_min := f_min * 6;
  f_hour := (g_date_time_get_hour(now) mod 12) + (f_min / 60);
  ang_hour := f_hour * 30;

  // hour
  gtk_snapshot_save(snapshot);
  gtk_snapshot_scale(snapshot, height / 300, height / 300);
  gtk_snapshot_rotate(snapshot, ang_hour);
  gtk_snapshot_append_node(snapshot, PMyWidget(widget)^.hand.hour);
  gtk_snapshot_restore(snapshot);

  // minute
  gtk_snapshot_save(snapshot);
  gtk_snapshot_scale(snapshot, height / 300, height / 300);
  gtk_snapshot_rotate(snapshot, ang_min);
  gtk_snapshot_append_node(snapshot, PMyWidget(widget)^.hand.minute);
  gtk_snapshot_restore(snapshot);

  // second
  gtk_snapshot_save(snapshot);
  gtk_snapshot_scale(snapshot, height / 300, height / 300);
  gtk_snapshot_rotate(snapshot, ang_sec);
  gtk_snapshot_append_node(snapshot, PMyWidget(widget)^.hand.second);
  gtk_snapshot_restore(snapshot);

  g_date_time_unref(now);

  // hub
  color.SetItems(1.0, 0.8, 0.8, 1.0);

  radius := height / 50.0;
  graphene_rect_init(@r, -radius, -radius, radius * 2, radius * 2);

  graphene_size_init(@radius_size, radius, radius);
  gsk_rounded_rect_init(@rounded_rect, @r, @radius_size, @radius_size, @radius_size, @radius_size);
  gtk_snapshot_push_rounded_clip(snapshot, @rounded_rect);
  gtk_snapshot_append_color(snapshot, @color, @r);
  gtk_snapshot_pop(snapshot);

  gtk_snapshot_pop(snapshot);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
    if dial_node <> nil then  begin
      gsk_render_node_unref(dial_node);
    end;
    if hand.second <> nil then  begin
      gsk_render_node_unref(hand.second);
    end;
    if hand.minute <> nil then  begin
      gsk_render_node_unref(hand.minute);
    end;
    if hand.hour <> nil then  begin
      gsk_render_node_unref(hand.hour);
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

  self^.dial_node := create_dial_node;
  self^.hand.second := create_second_hand_node;
  self^.hand.minute := create_minute_hand_node;
  self^.hand.hour := create_hour_hand_node;

  gtk_widget_add_tick_callback(GTK_WIDGET(self), @tick_cp, nil, nil);
end;


// ==== public

function my_widget_get_type: TGType; cdecl;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
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
