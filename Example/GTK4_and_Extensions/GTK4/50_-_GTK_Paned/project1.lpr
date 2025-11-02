program project1;

uses
  Math,
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GLIBTools,
  fp_GTK4;


procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
var
  color: TGdkRGBA;
begin
  // Grüner Hintergrund
  gdk_rgba_parse(@color, 'green');
  gdk_cairo_set_source_rgba(cr, @color);
  cairo_paint(cr);
  // Roter Kreis
  cairo_arc(cr, width/2.0, height/2.0, MIN(width, height)/4.0, 0, 2 * G_PI);
  gdk_rgba_parse(@color, 'red');
  gdk_cairo_set_source_rgba(cr, @color);
  cairo_fill(cr);
end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, panedBox, draw_area, paned: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    panedBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 100);
    gtk_widget_set_margin_start(panedBox, 10);
    gtk_widget_set_margin_end(panedBox, 10);
    gtk_widget_set_margin_top(panedBox, 10);
    gtk_widget_set_margin_bottom(panedBox, 10);

    // Paned

    paned := gtk_paned_new(GTK_ORIENTATION_VERTICAL);
    gtk_paned_set_wide_handle(GTK_PANED(paned), True);
    gtk_box_append(GTK_BOX(panedBox), paned);


    draw_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(draw_area, True);
    gtk_widget_set_hexpand(draw_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(draw_area), @draw_func, nil, nil);
    gtk_paned_set_start_child(GTK_PANED(paned), draw_area);

    draw_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(draw_area, True);
    gtk_widget_set_hexpand(draw_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(draw_area), @draw_func, nil, nil);
    gtk_paned_set_end_child(GTK_PANED(paned), draw_area);

    gtk_window_set_child(GTK_WINDOW(window), panedBox);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    GSignalShow(G_TYPE_OBJECT);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
