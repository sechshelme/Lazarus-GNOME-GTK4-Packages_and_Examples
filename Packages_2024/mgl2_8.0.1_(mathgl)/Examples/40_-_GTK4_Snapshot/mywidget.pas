unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_mgl2, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    CurrentRange: record
      x1, y1, x2, y2: double;
      end;
    StoredRange: record
      zoom_factor: double;
      x1, y1, x2, y2: double;
      end;
    gr: THMGL;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;

implementation

// ==== private

var
  parent_class: PMyWidgetClass = nil;

function sample(gr: THMGL): longint; cdecl;
var
  y0, y1, y2, y3: THMDT;
  n: longint = 30;
begin
  y0 := mgl_create_data_size(n, 1, 1);
  mgl_data_modify(y0, '0.4*sin(2*pi*x)+0.3*cos(3*pi*x)-0.4*sin(4*pi*x)+0.2*rnd', 0);

  y1 := mgl_create_data_size(n, 1, 1);
  mgl_data_set(y1, y0);

  y2 := mgl_create_data_size(n, 1, 1);
  mgl_data_set(y2, y0);

  y3 := mgl_create_data_size(n, 1, 1);
  mgl_data_set(y3, y0);

  mgl_data_smooth(y1, 'line3', 0);
  mgl_data_smooth(y2, 'line5', 0);
  mgl_data_smooth(y3, 'quad5', 0);

  mgl_plot(gr, y0, 'k', '');
  mgl_add_legend(gr, 'NONE', 'k');
  mgl_plot(gr, y1, 'r', '');
  mgl_add_legend(gr, 'LINE_3', 'r');
  mgl_plot(gr, y2, 'g', '');
  mgl_add_legend(gr, 'LINE_5', 'g');
  mgl_plot(gr, y3, 'b', '');
  mgl_add_legend(gr, 'QUAD_5', 'b');
  mgl_legend(gr, 1, '', '');
  mgl_box_str(gr, 'w', 1);

  mgl_delete_data(y0);
  mgl_delete_data(y1);
  mgl_delete_data(y2);
  mgl_delete_data(y3);

  Result := 0;
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
  r: Tgraphene_rect_t;
  width, height: integer;
  texture: PGdkTexture;
  bytes: PGBytes;
  stride: longint;

begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  if (width > 0) and (height > 0) then  begin
    with self^ do begin
      if (gr = nil) or (mgl_get_width(gr) <> width) or (mgl_get_height(gr) <> height) then begin
        mgl_delete_graph(gr);
        gr := mgl_create_graph(width, height);
        mgl_set_def_sch(gr, 'w');
        mgl_rotate(gr, 60, 40, 0);
      end;

      mgl_clf(gr);
      mgl_fill_background(gr, 0.3, 0.3, 0.3, 1.0);

      with CurrentRange do begin
        mgl_zoom(gr, x1, y1, x2, y2);
      end;

      sample(gr);

      stride := width * 4;
      bytes := g_bytes_new(mgl_get_rgba(gr), height * stride);
      texture := gdk_memory_texture_new(width, height, GDK_MEMORY_R8G8B8A8, bytes, stride);

      graphene_rect_init(@r, 0, 0, width, height);
      gtk_snapshot_append_texture(snapshot, texture, @r);

      g_object_unref(texture);
      g_bytes_unref(bytes);
    end;
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
    if gr <> nil then  begin
      mgl_delete_graph(gr);
    end;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

function scroll_cp(controller: PGtkEventControllerScroll; dx: double; dy: double; user_data: Tgpointer): Tgboolean; cdecl;
var
  zoom_factor: double;
  width, height, cx, cy: double;
  widget: PMyWidget;
begin
  if dy < 0 then begin
    zoom_factor := 1.1;
  end else begin
    zoom_factor := 1.0 / 1.1;
  end;

  widget := PMyWidget(gtk_event_controller_get_widget(PGtkEventController(controller)));
  with widget^.CurrentRange do begin
    width := x2 - x1;
    height := y2 - y1;
    cx := x1 + width / 2;
    cy := y1 + height / 2;

    width := width / zoom_factor / 2;
    height := height / zoom_factor / 2;

    x1 := cx - width;
    x2 := cx + width;
    y1 := cy - height;
    y2 := cy + height;
  end;

  Result := True;
end;

procedure drag_begin_cp(gesture: PGtkGestureDrag; x: double; y: double; user_data: Tgpointer); cdecl;
var
  widget: PMyWidget;
begin
  widget := PMyWidget(gtk_event_controller_get_widget(PGtkEventController(gesture)));
  with widget^ do begin
    StoredRange.x1 := CurrentRange.x1;
    StoredRange.y1 := CurrentRange.y1;
    StoredRange.x2 := CurrentRange.x2;
    StoredRange.y2 := CurrentRange.y2;
  end;
end;

procedure drag_update_cp(gesture: PGtkGestureDrag; offset_x: double; offset_y: double; user_data: Tgpointer); cdecl;
var
  widget: PMyWidget;
  width, height: integer;
  dx, dy: double;
begin
  widget := PMyWidget(gtk_event_controller_get_widget(PGtkEventController(gesture)));
  width := gtk_widget_get_width(GTK_WIDGET(widget));
  height := gtk_widget_get_height(GTK_WIDGET(widget));

  with widget^ do begin
    if (width > 0) and (height > 0) then begin
      dx := (offset_x / width) * (StoredRange.x2 - StoredRange.x1);
      dy := (offset_y / height) * (StoredRange.y2 - StoredRange.y1);

      CurrentRange.x1 := StoredRange.x1 - dx;
      CurrentRange.y1 := StoredRange.y1 + dy;
      CurrentRange.x2 := StoredRange.x2 - dx;
      CurrentRange.y2 := StoredRange.y2 + dy;
    end;
  end;
end;

function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_widget_queue_draw(widget);
  Result := G_SOURCE_CONTINUE;
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
  scroll_ctrl: PGtkEventController;
  drag_gest: PGtkGesture;
begin
  with self^ do begin
    gr := nil;
    with CurrentRange do begin
      x1 := 0.0;
      y1 := 0.0;
      x2 := 1.0;
      y2 := 1.0;
    end;
    with StoredRange do begin
      x1 := 0.0;
      y1 := 0.0;
      x2 := 9.0;
      y2 := 9.0;
    end;
  end;
  gtk_widget_add_tick_callback(GTK_WIDGET(self), @on_tick, nil, nil);

  scroll_ctrl := gtk_event_controller_scroll_new(GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES or GTK_EVENT_CONTROLLER_SCROLL_DISCRETE);
  g_signal_connect(scroll_ctrl, 'scroll', G_CALLBACK(@scroll_cp), nil);
  gtk_widget_add_controller(GTK_WIDGET(self), scroll_ctrl);

  drag_gest := gtk_gesture_drag_new;
  g_signal_connect(drag_gest, 'drag-begin', G_CALLBACK(@drag_begin_cp), nil);
  g_signal_connect(drag_gest, 'drag-update', G_CALLBACK(@drag_update_cp), nil);
  gtk_widget_add_controller(GTK_WIDGET(self), GTK_EVENT_CONTROLLER(drag_gest));
end;


// ==== public

function my_widget_get_type: TGType;
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

function my_widget_new: PGTKWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

end.
