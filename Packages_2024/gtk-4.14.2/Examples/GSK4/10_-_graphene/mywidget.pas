unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;

implementation

// ==== private

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  bound: Tgraphene_rect_t;
  end_point: Tgraphene_point_t;
  gradient_node: PGskRenderNode;
  width, height: longint;
const
  start_point: Tgraphene_point_t = (x: 0.0; y: 0.0);
  color_stops: array [0..2] of TGskColorStop = (
    (offset: 0.0; color: (red: 1.0; green: 0.0; blue: 0.0; alpha: 1.0)),
    (offset: 0.5; color: (red: 0.0; green: 1.0; blue: 0.0; alpha: 1.0)),
    (offset: 1.0; color: (red: 0.0; green: 0.0; blue: 1.0; alpha: 1.0)));
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_rect_init(@bound, 0, 0, Width, Height);
  end_point.SetItems(Width, Height);

  gradient_node := gsk_linear_gradient_node_new(@bound, @start_point, @end_point, color_stops, Length(color_stops));

  if gradient_node <> nil then begin
    gtk_snapshot_append_node(snapshot, gradient_node);
    gsk_render_node_unref(gradient_node);
  end;
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
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TGtkWidgetClass), @class_init, SizeOf(TGtkWidget), nil, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGTKWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

end.
