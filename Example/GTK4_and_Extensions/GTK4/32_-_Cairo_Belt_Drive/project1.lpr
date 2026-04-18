program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  MyWidget;

type
  TAppData = record
    //    x1, y1, x2, y2: double;
  end;
  PAppData = ^TAppData;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    x1, y1, r1: double;
    x2, y2, r2: double;
    dx, dy, dist, angle, alpha: double;
  var
    self: PMyWidget absolute drawing_area;
  begin
    x1 := self^.x1 + 150;
    y1 := self^.y1 + 180;
    r1 := 100;
    x2 := self^.x2 + 550;
    y2 := self^.y2 + 180;
    r2 := 15;
    dx := x2 - x1;
    dy := y2 - y1;
    dist := Sqrt(dx * dx + dy * dy);
    angle := ArcTan2(dy, dx);
    alpha := ArcCos((r1 - r2) / dist);

    cairo_set_source_rgb(cr, 0.3, 0.3, 0.3);
    cairo_paint(cr);

    // Kreise zeichnen
    cairo_set_source_rgb(cr, 1.0, 0.5, 0.5);
    cairo_arc(cr, x1, y1, r1, 0, 2 * Pi);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, 0.5, 0.5, 1.0);
    cairo_arc(cr, x2, y2, r2, 0, 2 * Pi);
    cairo_fill(cr);

    // Riemen zeichnen
    cairo_set_source_rgb(cr, 0.7, 0.7, 0.2);
    cairo_set_line_width(cr, 5);

    cairo_arc(cr, x1, y1, r1, angle + alpha, angle - alpha);
    cairo_stroke(cr);
    cairo_arc(cr, x2, y2, r2, angle - alpha, angle + alpha);
    cairo_stroke(cr);

    cairo_move_to(cr, x1 + r1 * Cos(angle + alpha), y1 + r1 * Sin(angle + alpha));
    cairo_line_to(cr, x2 + r2 * Cos(angle + alpha), y2 + r2 * Sin(angle + alpha));
    cairo_stroke(cr);

    cairo_move_to(cr, x1 + r1 * Cos(angle - alpha), y1 + r1 * Sin(angle - alpha));
    cairo_line_to(cr, x2 + r2 * Cos(angle - alpha), y2 + r2 * Sin(angle - alpha));
    cairo_stroke(cr);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    self: PMyWidget absolute widget;
    x1, y1, x2, y2, current_time: double;
  begin
    current_time := gdk_frame_clock_get_frame_time(frame_clock) / 500000.0;

    my_widget_get_coords(self, @x1, @y1, @x2, @y2);

    y1 := sin(current_time) * 50.0;
    y2 := sin(current_time * 1.13) * 80.0;

    my_widget_set_coords(self, x1, y1, x2, y2);

    gtk_widget_queue_draw(widget);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure startup_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
  begin
    with appData^ do begin
    end;
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
  begin
    with appData^ do begin
    end;
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    window, box, button, drawing_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := my_widget_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    my_widget_set_coords(PMyWidget(drawing_area), 0.0, 0.0, 0.0, 0.0);

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
