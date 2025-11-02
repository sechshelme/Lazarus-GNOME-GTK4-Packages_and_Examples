program project1;

uses
  Math,
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

type
  TAniData = record
    x1, y1, x2, y2: double;
  end;
  PAniData = ^TAniData;
const
  anyDataKey = 'anyKey';

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
    anyData: PAniData;
  begin
    anyData := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);
    x1 := anyData^.x1 + 150;
    y1 := anyData^.y1 + 180;
    r1 := 100;
    x2 := anyData^.x2 + 550;
    y2 := anyData^.y2 + 180;
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
    anyData: PAniData;
    current_time: double;
  begin
    anyData := g_object_get_data(G_OBJECT(widget), anyDataKey);
    current_time := gdk_frame_clock_get_frame_time(frame_clock) / 500000;

    anyData^.y1 := sin(current_time) * 50;
    anyData^.y2 := sin(current_time * 1.13) * 80;

    gtk_widget_queue_draw(widget);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure anyData_free_cp(Data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute Data;
  begin
    g_free(anyData);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area: PGtkWidget;
    anyData: PAniData;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);
    anyData := g_malloc(SizeOf(TAniData));
    anyData^.x1 := 0.0;
    anyData^.y1 := 0.0;
    anyData^.x2 := 0.0;
    anyData^.y2 := 0.0;
    g_object_set_data_full(G_OBJECT(drawing_area), anyDataKey, anyData, @anyData_free_cp);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
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
