program project1;

uses
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_box2d,
  EngineCalc;

type
  TAniData = record
    BoxCoords: TCoords;
    BallStaticCoords: Tb2Vec2s;
    BallCoords: Tb2Vec2s;
    engine: TEngine;
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
    anyData: PAniData;
    i, j: integer;
    sc: double;
  begin
    anyData := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    with anyData^ do begin
      cairo_set_source_rgb(cr, 0.3, 0.3, 0.3);
      cairo_paint(cr);

      if Width < Height then begin
        sc := Width / 250;
      end else begin
        sc := Height / 250;
      end;

      cairo_scale(cr, sc, -sc);
      cairo_translate(cr, 70, -50);
      cairo_set_line_width(cr, 0.50);

      cairo_set_source_rgb(cr, 0.5, 0.5, 1.0);
      for i := 0 to Length(BoxCoords) - 1 do begin
        cairo_move_to(cr, BoxCoords[i, 0].X, BoxCoords[i, 0].Y);
        for j := 1 to Length(BoxCoords[i]) - 1 do begin
          cairo_line_to(cr, BoxCoords[i, j].X, BoxCoords[i, j].Y);
        end;
        cairo_close_path(cr);
      end;
      cairo_fill(cr);

      cairo_set_source_rgb(cr, 0.5, 1.0, 0.5);
      for i := 0 to Length(BallStaticCoords) - 1 do begin;
        cairo_new_path(cr);
        cairo_arc(cr, BallStaticCoords[i].x, BallStaticCoords[i].y, STATIC_BALL_RADIUS, 0, 2 * pi);
        cairo_fill(cr);
      end;

      cairo_set_source_rgb(cr, 1.0, 0.3, 0.2);
      for i := 0 to Length(BallCoords) - 1 do begin;
        cairo_new_path(cr);
        cairo_arc(cr, BallCoords[i].x, BallCoords[i].y, BALL_RADIUS, 0, 2 * pi);
        cairo_fill(cr);
      end;

      cairo_stroke(cr);
    end;
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    anyData: PAniData;
    i: integer;
  begin
    anyData := g_object_get_data(G_OBJECT(widget), anyDataKey);
    with anyData^ do begin
      BoxCoords := engine.BoxCoords;
      BallCoords := engine.BallCoord;
      BallStaticCoords := engine.BallStaticCoord;

      for i := 0 to Length(BallCoords) - 1 do begin
        if BallCoords[i].y < -250 then begin
          engine.Goto0(i);
        end;
      end;
    end;
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure startup_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
  begin
    with anyData^ do begin
      engine := TEngine.Create;
    end;
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
  begin
    with anyData^ do begin
      engine.Free;
    end;
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
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
    gtk_box_append(GTK_BOX(box), drawing_area);

    g_object_set_data_full(G_OBJECT(drawing_area), anyDataKey, anyData, nil);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
    anyData: TAniData;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup_cp), @anyData);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate_cp), @anyData);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown_cp), @anyData);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
