program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GDK4,
  fp_GTK4;


  procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  begin
  end;

var
  current_time: Tgfloat;

  procedure draw_function(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    ofs: Tgfloat;
  begin
    ofs := Width / 2 + Sin(current_time) * (Width / 2);

    cairo_set_source_rgb(cr, 1, 0, 0);
    cairo_rectangle(cr, 0, 0, ofs, Height);
    cairo_fill(cr);
    cairo_set_source_rgb(cr, 1, 1, 0);
    cairo_rectangle(cr, ofs, 0, Width - ofs, Height);
    cairo_fill(cr);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    current_time := gdk_frame_clock_get_frame_time(frame_clock) / 500000;

    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, button, vbox, hbox, label1, button_box,
    drawing_area: PGtkWidget;
  begin
    // Hauptfenster erstellen
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Buttons und rechts streckbare DrawingArea');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 200);

    // Vertikale Hauptbox erstellen
    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), vbox);

    // Horizontale Box für Inhalt erstellen
    hbox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_margin_start(hbox, 10);
    gtk_widget_set_margin_end(hbox, 10);
    gtk_widget_set_margin_top(hbox, 10);
    gtk_widget_set_margin_bottom(hbox, 10);
    gtk_box_append(GTK_BOX(vbox), hbox);
    gtk_widget_set_valign(hbox, GTK_ALIGN_START);

    // Box für Buttons erstellen
    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 6);
    gtk_box_append(GTK_BOX(hbox), button_box);

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

    label1 := gtk_label_new('box1');
    gtk_box_append(GTK_BOX(hbox), label1);

    // DrawingArea erstellen
    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_widget_set_size_request(drawing_area, -1, 50);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_function, nil, nil);
    gtk_box_append(GTK_BOX(hbox), drawing_area);

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
