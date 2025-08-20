program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GTK4;


type
  TCairoColor = record
    r, g, b: double;
  end;

  TAniData = record
    titel: Pgchar;
    last_frame_time: Tguint64;
    speed: double;
    stepSin: double;
    x, y: double;
    dotColor, bgColor: TCairoColor
  end;
  PAniData = ^TAniData;

const
  anyDataKey = 'anyKey';

  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    aniDate: PAniData;
    radius: double;
  begin
    radius := Width / 10;
    aniDate := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    cairo_set_source_rgb(cr, aniDate^.bgColor.r, aniDate^.bgColor.g, aniDate^.bgColor.b);
    cairo_paint(cr);

    cairo_move_to(cr, 5, 15);
    cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
    cairo_show_text(cr, aniDate^.titel);

    cairo_set_source_rgb(cr, aniDate^.dotColor.r, aniDate^.dotColor.g, aniDate^.dotColor.b);
    cairo_arc(cr, Width / 2 + aniDate^.x, Height / 2 + aniDate^.y, radius, 0, 2 * Pi);
    cairo_fill(cr);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    current_time: Tgint64;
    d: double;
    aniDate: PAniData;
    w, h: Tgint;
  begin
    w := gtk_widget_get_width(widget);
    h := gtk_widget_get_height(widget);

    aniDate := g_object_get_data(G_OBJECT(widget), anyDataKey);
    current_time := gdk_frame_clock_get_frame_time(frame_clock);

    d := current_time / 100000000 * aniDate^.speed;
    aniDate^.x := Sin(d * aniDate^.stepSin) * (w / 3);
    aniDate^.y := Cos(d) * (h / 3);

    aniDate^.dotColor.r := Sin(d / 2.53) / 2 + 0.5;
    aniDate^.dotColor.g := Sin(d / 2.23) / 2 + 0.5;
    aniDate^.dotColor.b := Sin(d / 2.73) / 2 + 0.5;

    aniDate^.bgColor.r := Sin(d / 10.53) / 2 + 0.5;
    aniDate^.bgColor.g := Sin(d / 10.23) / 2 + 0.5;
    aniDate^.bgColor.b := Sin(d / 10.73) / 2 + 0.5;

    aniDate^.last_frame_time := current_time;
    gtk_widget_queue_draw(widget);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure destroy_anyData_cp(Data: Tgpointer); cdecl;
  var
    aniDate: PAniData absolute Data;
  begin
    g_free(aniDate^.titel);
    g_free(aniDate);
  end;

  function CreateDrawingArea(boxNr: Tgint): PGtkWidget;
  var
    aniDate: PAniData;
    buffer: array[0..15] of Tgchar;
  begin
    Result := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(Result), @draw_func, nil, nil);
    gtk_widget_set_vexpand(Result, True);
    gtk_widget_set_hexpand(Result, True);

    aniDate := g_malloc(SizeOf(TAniData));

    g_snprintf(buffer, SizeOf(buffer), 'Cell: %d', boxNr);
    aniDate^.titel := g_strdup(buffer);
    aniDate^.last_frame_time := 0;
    aniDate^.speed := Random(100) + 50.0;
    aniDate^.dotColor.r := Random;
    aniDate^.dotColor.g := Random;
    aniDate^.dotColor.b := Random;
    aniDate^.bgColor.r := Random;
    aniDate^.bgColor.g := Random;
    aniDate^.bgColor.b := Random;
    aniDate^.stepSin := Random + 0.5;

    g_object_set_data_full(G_OBJECT(Result), anyDataKey, aniDate, @destroy_anyData_cp);
    gtk_widget_add_tick_callback(Result, @on_tick, nil, nil);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area, grid: PGtkWidget;
    i: integer;
  const
    GRID_COUNT = 4;
    GRID_SPACING = 20;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    grid := gtk_grid_new;
    gtk_grid_set_column_spacing(GTK_GRID(grid), GRID_SPACING);
    gtk_grid_set_row_spacing(GTK_GRID(grid), GRID_SPACING);
    gtk_widget_set_margin_top(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_start(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_end(GTK_WIDGET(grid), GRID_SPACING);
    gtk_widget_set_margin_bottom(GTK_WIDGET(grid), GRID_SPACING);

    gtk_box_append(GTK_BOX(box), grid);
    for i := 0 to GRID_COUNT * GRID_COUNT - 1 do begin
      drawing_area := CreateDrawingArea(i);
      gtk_grid_attach(GTK_GRID(grid), drawing_area, i mod GRID_COUNT, i div GRID_COUNT, 1, 1);
    end;

    button := gtk_button_new_with_label('Close');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), window);

    gtk_box_append(GTK_BOX(box), button);

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
  Randomize;
  main(argc, argv);
end.
