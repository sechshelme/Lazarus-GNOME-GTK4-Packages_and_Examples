program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  MyWidget;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    r, g, b, radius, x, y: double;
    i: integer;
  var
    start_time, end_time, delta: Tgint64;
  begin
    start_time := g_get_monotonic_time;

    cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
    cairo_paint(cr);

    for i := 0 to COUNT - 1 do begin
      x := Random * width;
      y := Random * Height;
      radius := Random * 50.0;

      r := Random;
      g := Random;
      b := Random;

      cairo_set_source_rgba(cr, r, g, b, 0.5);

      cairo_arc(cr, x, y, radius, 0, 2 * pi);
      cairo_fill(cr);
    end;

    end_time := g_get_monotonic_time;
    delta := end_time - start_time;
    g_printf('Cairo:  Frame Zeit: %lld us (%.2f ms)'#10, delta, delta / 1000.0);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area, snapshot_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    //drawing_area := gtk_drawing_area_new;
    //gtk_widget_set_vexpand(drawing_area, True);
    //gtk_widget_set_hexpand(drawing_area, True);
    //gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    //gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);
    //gtk_box_append(GTK_BOX(box), drawing_area);

    snapshot_area := my_widget_new;
    gtk_widget_set_vexpand(snapshot_area, True);
    gtk_widget_set_hexpand(snapshot_area, True);
    gtk_widget_add_tick_callback(snapshot_area, @on_tick, nil, nil);
    gtk_box_append(GTK_BOX(box), snapshot_area);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
