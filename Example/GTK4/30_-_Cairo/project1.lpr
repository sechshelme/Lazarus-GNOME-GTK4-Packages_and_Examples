program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GDK4,
  fp_GTK4;


type
  TAniData = record
    last_frame_time: Tguint64;
    positionx, positiony: double;
    speed: double;
    x, y: double;
    color: record
      r, g, b: double;
      end;
  end;
  PAniData = ^TAniData;
const
  anyDataKey = 'anyKey';


  procedure quit_clicked_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    app: PGtkApplication absolute Data;
  begin
    g_application_quit(G_APPLICATION(app));
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  const
    i: Tgint64 = 0;
  var
    aniDate: PAniData;
    radius: double;
  begin
    radius := Width / 10;
    aniDate := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    cairo_set_source_rgb(cr, aniDate^.color.r, aniDate^.color.g, aniDate^.color.b);

    //cairo_arc(cr, Width / 2 + 50 * sin(i * 0.1), Height / 2, 20, 0, 2 * PI);
    //cairo_fill(cr);
    //cairo_arc(cr, aniDate^.positionx, aniDate^.positiony, 20, 0, 2 * Pi);
    //cairo_fill(cr);
    cairo_arc(cr, Width / 2 + aniDate^.x, Height / 2 + aniDate^.y, radius, 0, 2 * Pi);
    cairo_fill(cr);

    Inc(i);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    current_time: Tgint64;
    delta, d: double;
    aniDate: PAniData;
    w, h: Tgint;
  begin
    w := gtk_widget_get_allocated_width(widget);
    h := gtk_widget_get_allocated_height(widget);

    aniDate := g_object_get_data(G_OBJECT(widget), anyDataKey);
    current_time := gdk_frame_clock_get_frame_time(frame_clock);

    if aniDate^.last_frame_time <> 0 then begin
      delta := (current_time - aniDate^.last_frame_time) / 1000000.0;

      aniDate^.positionx += aniDate^.speed * delta * 0.93;
      if aniDate^.positionx > gtk_widget_get_width(widget) then begin
        aniDate^.positionx := -40.0;
      end;

      aniDate^.positiony += aniDate^.speed * delta;
      if aniDate^.positiony > gtk_widget_get_width(widget) then begin
        aniDate^.positiony := -40.0;
      end;
    end;

    d := current_time / 100000000 * aniDate^.speed;
    aniDate^.x := Sin(d) * (w / 3);
    aniDate^.y := Cos(d) * (h / 3);

    aniDate^.last_frame_time := current_time;
    gtk_widget_queue_draw(widget);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure destroy_anyData_cp(Data: Tgpointer); cdecl;
  var
    aniDate: PAniData absolute Data;
  begin
    g_free(aniDate);
  end;

  function CreateDrawingArea: PGtkWidget;
  var
    aniDate: PAniData;
  begin
    Result := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(Result), @draw_func, nil, nil);
    gtk_widget_set_vexpand(Result, True);
    gtk_widget_set_hexpand(Result, True);

    aniDate := g_malloc(SizeOf(TAniData));
    aniDate^.last_frame_time := 0;
    aniDate^.positionx := 0.0;
    aniDate^.speed := Random(100) + 50.0;
    aniDate^.color.r := Random;
    aniDate^.color.g := Random;
    aniDate^.color.b := Random;
    g_object_set_data_full(G_OBJECT(Result), anyDataKey, aniDate, @destroy_anyData_cp);
    gtk_widget_add_tick_callback(Result, @on_tick, nil, nil);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area, grid: PGtkWidget;
    i: integer;
  const
    GRID_COUNT = 4;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    grid := gtk_grid_new;
    gtk_box_append(GTK_BOX(box), grid);
    for i := 0 to GRID_COUNT * GRID_COUNT - 1 do begin
      drawing_area := CreateDrawingArea;
      gtk_grid_attach(GTK_GRID(grid), drawing_area, i mod GRID_COUNT, i div GRID_COUNT, 1, 1);
    end;

    button := gtk_button_new_with_label('Close');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), app);

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
