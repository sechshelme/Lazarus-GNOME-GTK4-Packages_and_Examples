unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene, fp_pango;

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
function my_widget_new: PMyWidget;

function MY_TYPE_WIDGET: TGType;
function MY_WIDGET(obj: Pointer): PMyWidget;
function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
function MY_IS_WIDGET(obj: Pointer): Tgboolean;
function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;

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
  color: TGdkRGBA;
  width, height, angele: single;
  p: Tgraphene_point_t;
  layout: PPangoLayout;
  text_w, text_h: longint;
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
  color.SetItems(0.0, 0.2, 0.0, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);
  gtk_snapshot_restore(snapshot);

  gtk_snapshot_save(snapshot);
  layout := pango_layout_new(gtk_widget_get_pango_context(widget));
  pango_layout_set_text(layout, 'Mein Uhr', -1);
  pango_layout_get_pixel_size(layout, @text_w, @text_h);
  gtk_snapshot_scale(snapshot, 10.0, 10.0);
  graphene_point_init(@p,  - (text_w / 2),  - (text_h / 2));
  gtk_snapshot_translate(snapshot, @p);
  gdk_rgba_parse(@color, 'white');
  gtk_snapshot_append_layout(snapshot, layout, @color);
  g_object_unref(layout);
  gtk_snapshot_restore(snapshot);

  gtk_snapshot_save(snapshot);
  graphene_rect_init(@r, -(width / 100), 0.0, width / 50, height / 5);
  color.SetItems(0.1, 0.1, 0.9, 1.0);
  angele := g_get_monotonic_time / 10000;
  gtk_snapshot_rotate(snapshot, angele);
  gtk_snapshot_append_color(snapshot, @color, @r);
  gtk_snapshot_restore(snapshot);

  gtk_snapshot_pop(snapshot);
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

function my_widget_new: PMyWidget;
begin
  Result := g_object_new(MY_TYPE_WIDGET, nil);
end;

// ====

function MY_TYPE_WIDGET: TGType;
begin
  Result := my_widget_get_type;
end;

function MY_WIDGET(obj: Pointer): PMyWidget;
begin
  Result := PMyWidget(g_type_check_instance_cast(obj, MY_TYPE_WIDGET));
end;

function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(g_type_check_class_cast(klass, MY_TYPE_WIDGET));
end;

function MY_IS_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, MY_TYPE_WIDGET);
end;

function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, MY_TYPE_WIDGET);
end;

function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(PGTypeInstance(obj)^.g_class);
end;


end.
