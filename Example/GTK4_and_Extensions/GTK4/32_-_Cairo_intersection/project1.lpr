program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

type
  TAniData = record
    LINE_X1: double;
    LINE_Y1: double;
    LINE_X2: double;
    LINE_Y2: double;
    CIRCLE_X: double;
    CIRCLE_Y: double;
    CIRCLE_R: double;
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
    m, b, A, B2, C, dx, diskriminante, y: double;

    x_schnitte: array[0..1] of double;
    i: integer;
    x: double;

  begin
    anyData := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    with anyData^ do begin
      cairo_set_source_rgb(cr, 1, 1, 1);
      cairo_paint(cr);

      // Skalierung für bessere Sichtbarkeit
      cairo_scale(cr, 30, 30);
      cairo_set_line_width(cr, 0.05);

      // 1. KREIS ZEICHNEN
      cairo_set_source_rgb(cr, 0, 0, 1); // Blau
      cairo_arc(cr, CIRCLE_X, CIRCLE_Y, CIRCLE_R, 0, 2 * PI);
      cairo_stroke(cr);

      // 2. LINIE ZEICHNEN
      cairo_set_source_rgb(cr, 1, 0, 0); // Rot
      cairo_move_to(cr, LINE_X1, LINE_Y1);
      cairo_line_to(cr, LINE_X2, LINE_Y2);
      cairo_stroke(cr);

      // 3. MATHEMATISCHE BERECHNUNG DER SCHNITTPUNKTE
      // Linie: y = mx + b
      dx := LINE_X2 - LINE_X1;
      if Abs(dx) < 0.000001 then begin
        dx := 0.000001;
      end; // Verhindert Division durch Null
      m := (LINE_Y2 - LINE_Y1) / dx;
      b := LINE_Y1 - m * LINE_X1;

      // Einsetzen in Kreisgleichung ergibt: Ax^2 + Bx + C = 0
      A := 1 + m * m;
      B2 := 2 * (m * b - m * CIRCLE_Y - CIRCLE_X);
      //    C := pow(CIRCLE_X, 2) + pow(b - CIRCLE_Y, 2) - pow(CIRCLE_R, 2);
      C := (CIRCLE_X * CIRCLE_X) + ((b - CIRCLE_Y) * (b - CIRCLE_Y)) - (CIRCLE_R * CIRCLE_R);

      diskriminante := B2 * B2 - 4 * A * C;

      if diskriminante >= 0 then begin
        cairo_set_source_rgb(cr, 0, 0, 0); // Schwarz für Schnittpunkte

        x_schnitte[0] := (-B2 + sqrt(diskriminante)) / (2 * A);
        x_schnitte[1] := (-B2 - sqrt(diskriminante)) / (2 * A);

        for  i := 0 to 1 do begin
          x := x_schnitte[i];
          y := m * x + b; // y-Wert passend zur Linie berechnen

          // Zeichne den Schnittpunkt exakt an (x, y)
          cairo_arc(cr, x, y, 0.1, 0, 2 * PI);
          cairo_fill(cr);

          g_printf('Schnittpunkt gefunden bei: x=%.2f, y=%.2f'#10, x, y);
        end;

      end else begin
        g_printf('Die Linie berührt den Kreis nicht.'#10);
      end;
    end;
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    anyData: PAniData;
    ct: double;
  begin
    anyData := g_object_get_data(G_OBJECT(widget), anyDataKey);
    ct := gdk_frame_clock_get_frame_time(frame_clock) / 1000000.0;

    //    anyData^.ang := anyData^.ang + ct;
    with anyData^ do begin
      LINE_X1 := cos(ct) * 4 + 5;
      LINE_Y1 := sin(ct) * 4 + 5;
      LINE_X2 := cos(ct * 1.83) * 4 + 5;
      LINE_Y2 := sin(ct * 1.83) * 4 + 5;
      CIRCLE_X := 4.0;
      CIRCLE_Y := 5.0;
      CIRCLE_R := 2.0;
    end;


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
    with anyData^ do begin
      //    LINE_X1 :=4.5;
      //    LINE_Y1 :=2.5;
      //    LINE_X2 :=8.0;
      //    LINE_Y2 :=9.0;
      CIRCLE_X := 4.0;
      CIRCLE_Y := 5.0;
      CIRCLE_R := 2.0;
    end;

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
