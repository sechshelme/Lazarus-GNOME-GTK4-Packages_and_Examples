unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    custom_color: TGdkRGBA;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PMyWidget;
procedure my_widget_set_color(self: PMyWidget; r, g, b: single);

implementation

// ==== private

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  r: Tgraphene_rect_t;
  color: TGdkRGBA;
  width, height, angele: single;
  p: Tgraphene_point_t;
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

  gtk_snapshot_save(snapshot);
  graphene_rect_init(@r, -(width / 100), 0.0, width / 50, height / 5);
  color.SetItems(0.1, 0.1, 0.9, 1.0);
  angele := g_get_monotonic_time / 10000;
  gtk_snapshot_rotate(snapshot, angele);
  gtk_snapshot_append_color(snapshot, @color, @r);
  gtk_snapshot_restore(snapshot);

  gtk_snapshot_pop(snapshot);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
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
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @class_init, SizeOf(TMyWidget), nil, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PMyWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
  Result^.custom_color.SetItems(0.0, 0.2, 0.0, 1.0);
end;

procedure my_widget_set_color(self: PMyWidget; r, g, b: single);
begin
  self^.custom_color.SetItems(r, g, b, 1.0);
  gtk_widget_queue_draw(GTK_WIDGET(self));
end;

end.
