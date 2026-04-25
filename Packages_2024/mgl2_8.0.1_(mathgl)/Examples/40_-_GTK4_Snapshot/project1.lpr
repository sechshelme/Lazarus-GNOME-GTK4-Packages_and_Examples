program project1;

uses
  MyWidget,
  fp_mgl2,
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
  anyDataKey = 'anyKey';

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  function sample(gr: THMGL; p: pointer): longint; cdecl;
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
    //    mgl_box_str(gr, '{xFFFFFF}', 1);
    mgl_box_str(gr, 'w', 1);

    mgl_delete_data(y0);
    mgl_delete_data(y1);
    mgl_delete_data(y2);
    mgl_delete_data(y3);

    Result := 0;
  end;


  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    appData: PAppData;
    gr: THMGL;
    pixels: pbyte;
    mgl_surface: Pcairo_surface_t;
    x1, y1, x2, y2, span: double;
  begin
    appData := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    gr := mgl_create_graph(width, height);

    mgl_clf(gr);
    mgl_fill_background(gr, 0.3, 0.3, 0.3, 1.0);



    span := 1.0 / appData^.Mouse.zoom;

    x1 := -(appData^.Mouse.x / Width);
    x2 := x1 + span;

    y1 := 1.0 + (appData^.Mouse.y / Height) - span;
    y2 := y1 + span;

    mgl_zoom(gr, x1, y1, x2, y2);



    mgl_set_def_sch(gr, 'w');
    mgl_rotate(gr, 60, 40, 0);

    sample(gr, nil);

    pixels := mgl_get_rgba(gr);
    mgl_surface := cairo_image_surface_create_for_data(pixels, CAIRO_FORMAT_ARGB32, width, height, width * 4);

    with appData^.Mouse do begin
      //      cairo_translate(cr, x, y);
      //    cairo_scale(cr, zoom, zoom);
    end;

    cairo_set_source_surface(cr, mgl_surface, 0, 0);
    cairo_paint(cr);

    cairo_set_source_rgb(cr, 1, 0, 0);
    cairo_set_line_width(cr, 3);
    cairo_arc(cr, 50, 50, 20, 0, 2 * PI);
    cairo_stroke(cr);

    cairo_surface_destroy(mgl_surface);
    mgl_delete_graph(gr);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    appData: PAppData;
  begin
    appData := g_object_get_data(G_OBJECT(widget), anyDataKey);
    with appData^ do begin
      //      engine.NextScene;
      //      BodyIds := engine.SceneBodyIds;
    end;
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure startup_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
  begin
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
  begin
    with appData^ do begin
      //    engine.Free;
    end;
  end;


  procedure AppData_free_cp(Data: Tgpointer); cdecl;
  var
    anyData: PAppData absolute Data;
  begin
    g_free(anyData);
  end;

  // ======

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

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    window, box, button, drawing_area, area: PGtkWidget;
    motion_ctrl, scroll_ctrl: PGtkEventController;
    drag_gest: PGtkGesture;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Box2d demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);

    area:=my_widget_new;
    gtk_widget_set_vexpand(area, True);
    gtk_widget_set_hexpand(area, True);
    gtk_widget_add_tick_callback(area, @on_tick, nil, nil);


    appData := g_malloc(SizeOf(TAppData));
    with appData^ do begin
      Mouse.x := 0.0;
      Mouse.y := 0.0;
      Mouse.mx := 0.0;
      Mouse.my := 0.0;
      Mouse.sx := 0.0;
      Mouse.sy := 0.0;
      Mouse.zoom := 1.0;
    end;
    g_object_set_data_full(G_OBJECT(drawing_area), anyDataKey, appData, @AppData_free_cp);

    // 1. Motion Controller (für Mausposition)
    motion_ctrl := gtk_event_controller_motion_new;
    g_signal_connect(motion_ctrl, 'motion', G_CALLBACK(@on_motion), appData);
    gtk_widget_add_controller(drawing_area, motion_ctrl);

    // 2. Scroll Controller (für Zoom)
    scroll_ctrl := gtk_event_controller_scroll_new(GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES or GTK_EVENT_CONTROLLER_SCROLL_DISCRETE);
    g_signal_connect(scroll_ctrl, 'scroll', G_CALLBACK(@on_scroll), appData);
    gtk_widget_add_controller(drawing_area, scroll_ctrl);

    // 3. Drag Gesture (für Panning)
    drag_gest := gtk_gesture_drag_new;
    g_signal_connect(drag_gest, 'drag-begin', G_CALLBACK(@on_drag_begin), appData);
    g_signal_connect(drag_gest, 'drag-update', G_CALLBACK(@on_drag_update), appData);
    gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(drag_gest));



    gtk_box_append(GTK_BOX(box), drawing_area);
    gtk_box_append(GTK_BOX(box), area);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
    appData: TAppData;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup_cp), @appData);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate_cp), @appData);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown_cp), @appData);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
