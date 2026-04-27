program project1;

uses
  MyWidget,
  fp_mgl2,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

type
  TAppData = record
    Mouse: record
      zoom_factor: double;
      x1, y1, x2, y2: double;
      end;
  end;
  PAppData = ^TAppData;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  // ======

  function on_scroll(controller: PGtkEventControllerScroll; dx: double; dy: double; user_data: Tgpointer): Tgboolean; cdecl;
  var
    zoom_factor: double;
    width, height, x1, y1, x2, y2, cx, cy: double;
    widget: PGtkWidget;
  begin
    if dy < 0 then begin
      zoom_factor := 1.1;
    end else begin
      zoom_factor := 1.0 / 1.1;
    end;

    widget := gtk_event_controller_get_widget(PGtkEventController(controller));
    my_widget_get_zoom(PMyWidget(widget), @x1, @y1, @x2, @y2);

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

    my_widget_set_zoom(PMyWidget(widget), x1, y1, x2, y2);

    Result := True;
  end;

  procedure on_drag_begin(gesture: PGtkGestureDrag; x: double; y: double; user_data: Tgpointer); cdecl;
  var
    AppData: PAppData absolute user_data;
    widget: PGtkWidget;
  begin
    widget := gtk_event_controller_get_widget(PGtkEventController(gesture));
    with AppData^.Mouse do begin
      my_widget_get_zoom(PMyWidget(widget), @x1, @y1, @x2, @y2);
    end;
  end;

  procedure on_drag_update(gesture: PGtkGestureDrag; offset_x: double; offset_y: double; user_data: Tgpointer); cdecl;
  var
    AppData: PAppData absolute user_data;
    widget: PGtkWidget;
    width, height: integer;
    dx, dy: double;
  begin
    widget := gtk_event_controller_get_widget(PGtkEventController(gesture));
    width := gtk_widget_get_width(widget);
    height := gtk_widget_get_height(widget);

    with AppData^.Mouse do begin
      if (width > 0) and (height > 0) then begin
        dx := (offset_x / width) * (x2 - x1);
        dy := (offset_y / height) * (y2 - y1);
        my_widget_set_zoom(PMyWidget(widget), x1 - dx, y1 + dy, x2 - dx, y2 + dy);
      end;
    end;
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    window, box, button, area: PGtkWidget;
    scroll_ctrl: PGtkEventController;
    drag_gest: PGtkGesture;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Box2d demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    area := my_widget_new;
    gtk_widget_set_vexpand(area, True);
    gtk_widget_set_hexpand(area, True);
    gtk_widget_add_tick_callback(area, @on_tick, nil, nil);

    scroll_ctrl := gtk_event_controller_scroll_new(GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES or GTK_EVENT_CONTROLLER_SCROLL_DISCRETE);
    g_signal_connect(scroll_ctrl, 'scroll', G_CALLBACK(@on_scroll), appData);
    gtk_widget_add_controller(area, scroll_ctrl);

    drag_gest := gtk_gesture_drag_new;
    g_signal_connect(drag_gest, 'drag-begin', G_CALLBACK(@on_drag_begin), appData);
    g_signal_connect(drag_gest, 'drag-update', G_CALLBACK(@on_drag_update), appData);
    gtk_widget_add_controller(area, GTK_EVENT_CONTROLLER(drag_gest));

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
    g_signal_connect(app, 'activate', G_CALLBACK(@activate_cp), @appData);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
