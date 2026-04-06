program project1;

uses
  fp_plplot,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

type
  TAppData = record
    Beams: array of record
      Data: TPLFLT;
      Caption: pchar;
      end;
    maxSize: TPLFLT;
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
  var
    i: integer;
    px, py: array[0..3] of TPLFLT;
    p: TPLFLT;
  begin
    appData := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    with appData^ do begin
      c_plsdev('extcairo');
      c_plspage(0, 0, Width, Height, 0, 0);
      c_plinit();
      pl_cmd(PLESC_DEVINIT, cr);

      c_pladv(0);
      c_plvpor(0.15, 0.9, 0.15, 0.9);
      c_plwind(0.0, Length(Beams) + 1.0, 0.0, maxSize*1.1);

      c_plcol0(3);
      c_plsyax(0, 0); // Erzwingt, dass kein Skalierungsfaktor (wie x10^4) angezeigt wird

      c_plbox('bc', 1.0, 0, 'bcnstv', 0.0, 0);

      for i := 0 to Length(Beams) - 1 do begin
        p := i + 1.0;

        px[0] := p - 0.4;
        py[0] := 0.0;
        px[1] := p - 0.4;
        py[1] := Beams[i].Data;
        px[2] := p + 0.4;
        py[2] := Beams[i].Data;
        px[3] := p + 0.4;
        py[3] := 0.0;

        c_plcol0(i mod 15 + 1);
        c_plfill(4, @px, @py);

        c_plcol0(3);
        c_plline(4, @px, @py);

        WriteLn('- ' ,Beams[i].Caption);
        c_plmtex('b', 1.5, (p / (Length(Beams) + 1)), 0.5, Beams[i].Caption);
      end;

      c_pllab('Jahre', 'Umsatz (sFr)', 'Bericht der letzen Jahre');
      c_plend();
    end;
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
    l: Pgchar;
    h: TPLFLT;
  begin
    Randomize;
    with appData^ do begin
      maxSize := 0.0;
      SetLength(Beams, Random(24) + 1);
      for i := 0 to Length(Beams) - 1 do begin
        h := Random * 20000.0;
        Beams[i].Data := h;
        if h > maxSize then begin
          maxSize := h;
        end;
        l := g_strdup_printf('%02d', i+1);
        Beams[i].Caption := l;
      end;
    end;
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
    i: integer;
  begin
    with appData^ do begin
      for i := 0 to Length(Beams) - 1 do begin
        g_free(Beams[i].Caption);
      end;
    end;
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
