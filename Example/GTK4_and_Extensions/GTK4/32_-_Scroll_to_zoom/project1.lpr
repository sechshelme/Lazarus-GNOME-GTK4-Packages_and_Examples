program project1;

uses
  Math,
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  drawarea_zoom;

type
  TAppData = record
    BKcol: record
      r, g, b: double;
      end;
    DrawAreaZoom: PDrawAreaMove;
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
    draw_area_move_cairo_transform(data^.DrawAreaZoom, cr);

    with data^.BKcol do begin
      cairo_set_source_rgb(cr, r, g, b);
    end;
    cairo_paint(cr);

    cairo_set_source_rgb(cr, 0.1, 0.4, 0.7);
    cairo_rectangle(cr, 50, 50, 100, 100);
    cairo_fill(cr);

    cairo_set_source_rgb(cr, 0.8, 0.2, 0.2);
    cairo_arc(cr, 200, 200, 40, 0, 2 * pi);
    cairo_fill(cr);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    data: PAppData;
  const
    counter: double = 0.0;
  begin
    data := g_object_get_data(G_OBJECT(widget), AppDataKey);
    counter += 0.01;
    with data^.BKcol do begin
      r := sin(counter * 1.0) / 2 + 0.5;
      g := sin(counter * 1.1) / 2 + 0.5;
      b := sin(counter * 1.2) / 2 + 0.5;
    end;
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    data: PAppData absolute user_data;
    window, box, button, drawing_area: PGtkWidget;
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

    g_object_set_data_full(G_OBJECT(drawing_area), AppDataKey, data, nil);

    data^.DrawAreaZoom := draw_area_move_new(drawing_area);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    data: TAppData;
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @data);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    draw_area_move_unref(data.DrawAreaZoom);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
