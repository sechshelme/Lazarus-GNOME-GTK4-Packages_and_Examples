program project1;

uses
  fp_gr,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

const
  GRID_SIZE = 500;     // Auflösung der Grafik (Pixel-Gitter)
  N_POINTS = 100;      // Anzahl der Zufalls-Messpunkte (Qualität der Daten)
  N_LEVELS = 20;       // Anzahl der Kontur-Ringe (Optik)

type
  TAppData = record
    PlotData: record
      xd: array[0..N_POINTS - 1] of double;
      yd: array[0..N_POINTS - 1] of double;
      zd: array[0..N_POINTS - 1] of double;

      x: array[0..GRID_SIZE - 1] of double;
      y: array[0..GRID_SIZE - 1] of double;

      z: array[0..(GRID_SIZE * GRID_SIZE) - 1] of double;

      h: array[0..N_LEVELS - 1] of double;
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

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    appData: PAppData;
    target: Pgchar;
    mem_surface: Pcairo_surface_t;
    mem_cr: Pcairo_t;
    pixels: pbyte;
  begin
    appData := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    mem_surface := cairo_image_surface_create(CAIRO_FORMAT_ARGB32, width, height);
    mem_cr := cairo_create(mem_surface);

    cairo_set_source_rgb(mem_cr, 1, 1, 1);
    cairo_paint(mem_cr);
    cairo_destroy(mem_cr);

    pixels := cairo_image_surface_get_data(mem_surface);

    target := g_strdup_printf('!%dx%d@%p.mem', width, height, pixels);
    gr_beginprint(target);

    gr_setviewport(0.1, 0.9, 0.1, 0.9);
    gr_setwindow(-2, 2, -2, 2);

    //    gr_setspace(-0.5, 0.5, 0, 90);
    gr_setspace(-0.5, 0.5, 30, 40);

    gr_setmarkersize(1.0);
    gr_setmarkertype(1);
    gr_setcharheight(0.024);

    with appData^.PlotData do begin
      //    gr_surface(GRID_SIZE, GRID_SIZE, x, y, z, 5);
      gr_surface(GRID_SIZE, GRID_SIZE, x, y, z, 4);

      gr_contour(GRID_SIZE, GRID_SIZE, N_LEVELS, x, y, h, z, 0);
      gr_polymarker(N_POINTS, xd, yd);
    end;
    gr_axes(0.25, 0.25, -2, -2, 2, 2, 0.01);

    gr_endprint();

    cairo_set_source_surface(cr, mem_surface, 0, 0);
    cairo_paint(cr);

    cairo_surface_destroy(mem_surface);
    g_free(target);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    appData: PAppData;
  begin
    appData := g_object_get_data(G_OBJECT(widget), anyDataKey);
    with appData^ do begin
    end;
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure startup_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    i: integer;
  begin
    Randomize;

    with appData^.PlotData do begin
      for i := 0 to N_POINTS - 1 do begin
        xd[i] := -2 + 4.0 * Random;
        yd[i] := -2 + 4.0 * Random;
        zd[i] := xd[i] * exp(-xd[i] * xd[i] - yd[i] * yd[i]);
        //pd.zd[i] = sin(pd.xd[i] * pd.xd[i] + pd.yd[i] * pd.yd[i]);

      end;
      gr_gridit(N_POINTS, xd, yd, zd, GRID_SIZE, GRID_SIZE, x, y, z);
      for i := 0 to N_LEVELS - 1 do begin
        h[i] := -0.5 + i / (N_LEVELS - 1);
      end;
    end;
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
  begin
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    window, box, button, drawing_area: PGtkWidget;
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

    //    appData := g_malloc(SizeOf(TAppData));
    with appData^ do begin
    end;
    g_object_set_data_full(G_OBJECT(drawing_area), anyDataKey, appData, nil);

    gtk_box_append(GTK_BOX(box), drawing_area);

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
