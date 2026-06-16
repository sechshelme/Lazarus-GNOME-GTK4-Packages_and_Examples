unit drawarea_zoom;

interface

uses
  fp_cairo, fp_glib2, fp_GTK4;

type
  PDrawAreaMove = type Pointer;

function draw_area_move_new(drawing_area: PGtkWidget): PDrawAreaMove; cdecl;
procedure draw_area_move_cairo_transform(self: PDrawAreaMove; cr: Pcairo_t); cdecl;
procedure draw_area_move_Zero(self: PDrawAreaMove); cdecl;
procedure draw_area_move_unref(self: PDrawAreaMove); cdecl;

implementation

type
  TDrawAreaMovePrivate = record
    x, y, zoom, mx, my, sx, sy: double;
  end;
  PDrawAreaMovePrivate = ^TDrawAreaMovePrivate;

procedure on_motion(controller: PGtkEventControllerMotion; x: double; y: double; user_data: Tgpointer); cdecl;
var
  data: PDrawAreaMovePrivate absolute user_data;
begin
  with data^ do begin
    mx := x;
    my := y;
  end;
end;

function on_scroll(controller: PGtkEventControllerScroll; dx: double; dy: double; user_data: Tgpointer): Tgboolean; cdecl;
var
  data: PDrawAreaMovePrivate absolute user_data;
  old_zoom, zoom_factor: double;
begin
  old_zoom := data^.zoom;

  if dy < 0 then begin
    zoom_factor := 1.1;
  end else begin
    zoom_factor := 1.0 / 1.1;
  end;

  with data^ do begin
    zoom := zoom * zoom_factor;
    if zoom < 0.05 then begin
      zoom := 0.05;
    end;
    if zoom > 20.0 then begin
      zoom := 20.0;
    end;

    x := mx - (mx - x) * (zoom / old_zoom);
    y := my - (my - y) * (zoom / old_zoom);
  end;

  Result := True;
end;

procedure on_drag_begin(gesture: PGtkGestureDrag; x: double; y: double; user_data: Tgpointer); cdecl;
var
  data: PDrawAreaMovePrivate absolute user_data;
begin
  with data^ do begin
    sx := x;
    sy := y;
  end;
end;

procedure on_drag_update(gesture: PGtkGestureDrag; offset_x: double; offset_y: double; user_data: Tgpointer); cdecl;
var
  data: PDrawAreaMovePrivate absolute user_data;
  widget: PGtkWidget;
begin
  with data^ do begin
    x := sx + offset_x;
    y := sy + offset_y;
  end;

  widget := gtk_event_controller_get_widget(GTK_EVENT_CONTROLLER(gesture));
  gtk_widget_queue_draw(widget);
end;

procedure on_click_pressed(gesture: PGtkGestureClick; n_press: Tgint; x: Tgdouble; y: Tgdouble; user_data: Tgpointer); cdecl;
var
  data: PDrawAreaMovePrivate absolute user_data;
begin
  WriteLn('n_press:' ,n_press);
  if n_press = 2 then begin
    draw_area_move_Zero(PDrawAreaMove(data));
    gtk_widget_queue_draw(gtk_event_controller_get_widget(GTK_EVENT_CONTROLLER(gesture)));
  end;
end;

function draw_area_move_new(drawing_area: PGtkWidget): PDrawAreaMove; cdecl;
var
  data: PDrawAreaMovePrivate absolute Result;
  motion_ctrl, scroll_ctrl: PGtkEventController;
  drag_gest, click_gest: PGtkGesture;
begin
  data := g_malloc(SizeOf(TDrawAreaMovePrivate));
  draw_area_move_Zero(data);

  motion_ctrl := gtk_event_controller_motion_new;
  g_signal_connect(motion_ctrl, 'motion', G_CALLBACK(@on_motion), data);
  gtk_widget_add_controller(drawing_area, motion_ctrl);

  scroll_ctrl := gtk_event_controller_scroll_new(GTK_EVENT_CONTROLLER_SCROLL_VERTICAL or GTK_EVENT_CONTROLLER_SCROLL_DISCRETE);
  g_signal_connect(scroll_ctrl, 'scroll', G_CALLBACK(@on_scroll), data);
  gtk_widget_add_controller(drawing_area, scroll_ctrl);

  drag_gest := gtk_gesture_drag_new;
  g_signal_connect(drag_gest, 'drag-begin', G_CALLBACK(@on_drag_begin), data);
  g_signal_connect(drag_gest, 'drag-update', G_CALLBACK(@on_drag_update), data);
  gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(drag_gest));

  click_gest := gtk_gesture_click_new;
  gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(click_gest), GDK_BUTTON_PRIMARY);
  g_signal_connect(click_gest, 'pressed', G_CALLBACK(@on_click_pressed), data);
  gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(click_gest));
end;

procedure draw_area_move_cairo_transform(self: PDrawAreaMove; cr: Pcairo_t); cdecl;
var
  data: PDrawAreaMovePrivate absolute self;
begin
  with data^ do begin
    cairo_translate(cr, x, y);
    cairo_scale(cr, zoom, zoom);
  end;
end;

procedure draw_area_move_Zero(self: PDrawAreaMove); cdecl;
var
  data: PDrawAreaMovePrivate absolute self;
begin
  with data^ do begin
    x := 0.0;
    y := 0.0;
    mx := 0.0;
    my := 0.0;
    sx := 0.0;
    sy := 0.0;
    zoom := 1.0;
  end;
end;

procedure draw_area_move_unref(self: PDrawAreaMove); cdecl;
var
  data: PDrawAreaMovePrivate absolute self;
begin
  g_free(data);
end;

end.
