program project1;

uses
  Math,
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

type
  TAppData = record
    //    x1, y1, x2, y2: double;
    Mouse: record
      x, y, zoom, mx, my, sx, sy: double;
      end;
  end;
  PAppData = ^TAppData;

const
  AppDataKey = 'anyKey';

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    data: PAppData;
  begin
    data := g_object_get_data(G_OBJECT(drawing_area), AppDataKey);
    cairo_set_source_rgb(cr, 0.95, 0.95, 0.95);
    cairo_paint(cr);

    with data^.Mouse do begin
      cairo_translate(cr, x, y);
      cairo_scale(cr, zoom, zoom);
    end;

    cairo_set_source_rgb(cr, 0.1, 0.4, 0.7);
    cairo_rectangle(cr, 50, 50, 100, 100);
    cairo_fill(cr);

    cairo_set_source_rgb(cr, 0.8, 0.2, 0.2);
    cairo_arc(cr, 200, 200, 40, 0, 2 * pi);
    cairo_fill(cr);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    anyData: PAppData;
    current_time: double;
  begin
    anyData := g_object_get_data(G_OBJECT(widget), AppDataKey);
    current_time := gdk_frame_clock_get_frame_time(frame_clock) / 500000.0;

    gtk_widget_queue_draw(widget);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure AppData_free_cp(Data: Tgpointer); cdecl;
  var
    anyData: PAppData absolute Data;
  begin
    g_free(anyData);
  end;


  procedure on_motion(controller: PGtkEventControllerMotion; x: double; y: double; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
  begin
    data := PAppData(user_data);
    data^.Mouse.mx := x;
    data^.Mouse.my := y;
  end;

  function on_scroll(controller: PGtkEventControllerScroll; dx: double; dy: double; user_data: Tgpointer): Tgboolean; cdecl;
  var
    data: PAppData absolute user_data;
    old_zoom, zoom_factor: double;
  begin
    old_zoom := data^.Mouse.zoom;

    if dy < 0 then begin
      zoom_factor := 1.1;
    end else begin
      zoom_factor := 1.0 / 1.1;
    end;

    data^.Mouse.zoom := data^.Mouse.zoom * zoom_factor;
    if data^.Mouse.zoom < 0.05 then begin
      data^.Mouse.zoom := 0.05;
    end;
    if data^.Mouse.zoom > 20.0 then begin
      data^.Mouse.zoom := 20.0;
    end;

    data^.Mouse.x := data^.Mouse.mx - (data^.Mouse.mx - data^.Mouse.x) * (data^.Mouse.zoom / old_zoom);
    data^.Mouse.y := data^.Mouse.my - (data^.Mouse.my - data^.Mouse.y) * (data^.Mouse.zoom / old_zoom);

    Result := True;
  end;

  procedure on_drag_begin(gesture: PGtkGestureDrag; x: double; y: double; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
  begin
    data^.Mouse.sx := data^.Mouse.x;
    data^.Mouse.sy := data^.Mouse.y;
  end;

  procedure on_drag_update(gesture: PGtkGestureDrag; offset_x: double; offset_y: double; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
    widget: PGtkWidget;
  begin
    data^.Mouse.x := data^.Mouse.sx + offset_x;
    data^.Mouse.y := data^.Mouse.sy + offset_y;

    widget := gtk_event_controller_get_widget(PGtkEventController(gesture));
    gtk_widget_queue_draw(widget);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
    window, box, button, drawing_area: PGtkWidget;
    scroll_ctrl, motion_ctrl: PGtkEventController;
    drag_gest: PGtkGesture;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Mouse To Zoom Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

//    data := g_malloc(SizeOf(TAppData));
    data^.Mouse.x := 0.0;
    data^.Mouse.y := 0.0;
    data^.Mouse.mx := 0.0;
    data^.Mouse.my := 0.0;
    data^.Mouse.sx := 0.0;
    data^.Mouse.sy := 0.0;
    data^.Mouse.zoom := 1.0;
//    g_object_set_data_full(G_OBJECT(drawing_area), AppDataKey, data, @AppData_free_cp);
    g_object_set_data_full(G_OBJECT(drawing_area), AppDataKey, data, nil);

    // 1. Motion Controller (für Mausposition)
    motion_ctrl := gtk_event_controller_motion_new;
    g_signal_connect(motion_ctrl, 'motion', G_CALLBACK(@on_motion), data);
    gtk_widget_add_controller(drawing_area, motion_ctrl);

    // 2. Scroll Controller (für Zoom)
    scroll_ctrl := gtk_event_controller_scroll_new(GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES or GTK_EVENT_CONTROLLER_SCROLL_DISCRETE);
    g_signal_connect(scroll_ctrl, 'scroll', G_CALLBACK(@on_scroll), data);
    gtk_widget_add_controller(drawing_area, scroll_ctrl);

    // 3. Drag Gesture (für Panning)
    drag_gest := gtk_gesture_drag_new;
    g_signal_connect(drag_gest, 'drag-begin', G_CALLBACK(@on_drag_begin), data);
    g_signal_connect(drag_gest, 'drag-update', G_CALLBACK(@on_drag_update), data);
    gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(drag_gest));


    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    data:TAppData;
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup_cp), @appData);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @data);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
