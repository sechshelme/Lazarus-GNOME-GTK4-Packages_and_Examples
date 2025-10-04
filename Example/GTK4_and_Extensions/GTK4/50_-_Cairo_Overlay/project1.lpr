program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GTK4;


  procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  begin
  end;

var
  current_time: Tgint64;

  procedure draw_function(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    gradient, radial: Pcairo_pattern_t;
    x, y: integer;
    px, py: Tgfloat;
  begin

    // Fügen Sie Farbstopps zum Gradienten hinzu
    gradient := cairo_pattern_create_linear(0, 0, Width / 2, Height);
    cairo_pattern_add_color_stop_rgb(gradient, 0.0, 1.0, 0.0, 0.0);
    cairo_pattern_add_color_stop_rgb(gradient, 0.5, 0.0, 1.0, 0.0);
    cairo_pattern_add_color_stop_rgb(gradient, 1.0, 0.0, 0.0, 1.0);

    // Setzen Sie den Gradienten als Quelle
    cairo_set_source(cr, gradient);

    // Zeichnen Sie das Rechteck
    cairo_rectangle(cr, 0, 0, Width, Height);
    cairo_fill(cr);

    // Aufräumen
    cairo_pattern_destroy(gradient);

    px := (sin(current_time / 620000) * 50) - 25;
    py := (cos(current_time / 500000) * 50) - 25;

    // Kreise zeichnen
    for  x := 0 to Width div 50 + 2 do begin
      for  y := 0 to Height div 50 + 2 do begin
        radial := cairo_pattern_create_radial(x * 50 + px, y * 50 + py, 0, x * 50 + px, y * 50 + py, 20);
        cairo_pattern_add_color_stop_rgb(radial, 0, 0.9, 0.9, 0.9);  // Helleres Grau im Zentrum
        cairo_pattern_add_color_stop_rgb(radial, 1, 0.5, 0.5, 0.5);  // Dunkleres Grau am Rand
        cairo_set_source(cr, radial);
        cairo_arc(cr, x * 50 + px, y * 50 + py, 20, 0, 2 * G_PI);
        cairo_fill(cr);
        cairo_pattern_destroy(radial);
      end;
    end;
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    current_time := gdk_frame_clock_get_frame_time(frame_clock);

    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, button, button_box, drawing_area, overlay: PGtkWidget;
  begin
    // Hauptfenster erstellen
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Cairo and Overlay');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    // Overlay für Hintergrund und Buttons
    overlay := gtk_overlay_new;
    gtk_window_set_child(GTK_WINDOW(window), overlay);

    // DrawingArea für den Hintergrund
    drawing_area := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_function, nil, nil);
    gtk_overlay_set_child(GTK_OVERLAY(overlay), drawing_area);

    // Box für die Buttons
    button_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_halign(button_box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(button_box, GTK_ALIGN_CENTER);
    gtk_overlay_add_overlay(GTK_OVERLAY(overlay), button_box);

    button := gtk_button_new_with_label('red');
    gtk_widget_set_name(GTK_WIDGET(button), 'red');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(button_box), button);

    button := gtk_button_new_with_label('blue');
    gtk_widget_set_name(GTK_WIDGET(button), 'blue');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(button_box), button);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(button_box), button);

    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
