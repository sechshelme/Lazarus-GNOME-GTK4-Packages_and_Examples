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
    area: PGtkWidget;
    Mouse: record
      zoom_factor: double;
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
    with appData^ do begin
      //Mouse.x := 0.0;
      //Mouse.y := 0.0;
      //Mouse.mx := 0.0;
      //Mouse.my := 0.0;
      //Mouse.sx := 0.0;
      //Mouse.sy := 0.0;
      Mouse.zoom_factor := 1.0;
    end;

  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
  begin
    with appData^ do begin
      //    engine.Free;
    end;
  end;


  // ======

  procedure on_motion(controller: PGtkEventControllerMotion; x: double; y: double; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
  begin
    data := PAppData(user_data);
    //    data^.Mouse.mx := x;
    //    data^.Mouse.my := y;
  end;

  function on_scroll(controller: PGtkEventControllerScroll; dx: double; dy: double; user_data: Tgpointer): Tgboolean; cdecl;
  var
    Appdata: PAppData absolute user_data;
    old_zoom, zoom_factor: double;
    x1, y1, x2, y2: double;
  begin

    //    old_zoom := Appdata^.Mouse.zoom;

    if dy < 0 then begin
      zoom_factor := 1.1;
    end else begin
      zoom_factor := 1.0 / 1.1;
    end;

    Appdata^.Mouse.zoom_factor := Appdata^.Mouse.zoom_factor * zoom_factor;
    if Appdata^.Mouse.zoom_factor < 0.05 then begin
      Appdata^.Mouse.zoom_factor := 0.05;
    end;
    if Appdata^.Mouse.zoom_factor > 20.0 then begin
      Appdata^.Mouse.zoom_factor := 20.0;
    end;

    my_widget_get_zoom(PMyWidget(Appdata^.area), @x1, @y1, @x2, @y2);
    WriteLn(Appdata^.Mouse.zoom_factor: 4: 2);

    x1 *= Appdata^.Mouse.zoom_factor;
    y1 *= Appdata^.Mouse.zoom_factor;
    x2 *= Appdata^.Mouse.zoom_factor;
    y2 *= Appdata^.Mouse.zoom_factor;

//    my_widget_set_zoom(PMyWidget(Appdata^.area), x1, y1, x2, y2);


    //    Appdata^.Mouse.x := Appdata^.Mouse.mx - (Appdata^.Mouse.mx - Appdata^.Mouse.x) * (Appdata^.Mouse.zoom / old_zoom);
    //    Appdata^.Mouse.y := Appdata^.Mouse.my - (Appdata^.Mouse.my - Appdata^.Mouse.y) * (Appdata^.Mouse.zoom / old_zoom);

    Result := True;
  end;

  procedure on_drag_begin(gesture: PGtkGestureDrag; x: double; y: double; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
  begin
    //    data^.Mouse.sx := data^.Mouse.x;
    //    data^.Mouse.sy := data^.Mouse.y;
  end;

  procedure on_drag_update(gesture: PGtkGestureDrag; offset_x: double; offset_y: double; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
    widget: PGtkWidget;
  begin
    //    data^.Mouse.x := data^.Mouse.sx + offset_x;
    //    data^.Mouse.y := data^.Mouse.sy + offset_y;

    widget := gtk_event_controller_get_widget(PGtkEventController(gesture));
    gtk_widget_queue_draw(widget);
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    window, box, button: PGtkWidget;
    motion_ctrl, scroll_ctrl: PGtkEventController;
    drag_gest: PGtkGesture;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Box2d demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    with appData^ do begin
      area := my_widget_new;
      gtk_widget_set_vexpand(area, True);
      gtk_widget_set_hexpand(area, True);
      gtk_widget_add_tick_callback(area, @on_tick, nil, nil);


      // 1. Motion Controller (für Mausposition)
      motion_ctrl := gtk_event_controller_motion_new;
      g_signal_connect(motion_ctrl, 'motion', G_CALLBACK(@on_motion), appData);
      gtk_widget_add_controller(area, motion_ctrl);

      // 2. Scroll Controller (für Zoom)
      scroll_ctrl := gtk_event_controller_scroll_new(GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES or GTK_EVENT_CONTROLLER_SCROLL_DISCRETE);
      g_signal_connect(scroll_ctrl, 'scroll', G_CALLBACK(@on_scroll), appData);
      gtk_widget_add_controller(area, scroll_ctrl);

      // 3. Drag Gesture (für Panning)
      drag_gest := gtk_gesture_drag_new;
      g_signal_connect(drag_gest, 'drag-begin', G_CALLBACK(@on_drag_begin), appData);
      g_signal_connect(drag_gest, 'drag-update', G_CALLBACK(@on_drag_update), appData);
      gtk_widget_add_controller(area, GTK_EVENT_CONTROLLER(drag_gest));

      gtk_box_append(GTK_BOX(box), area);
    end;

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
