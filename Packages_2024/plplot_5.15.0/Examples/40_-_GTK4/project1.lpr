program project1;

uses
  fp_plplot,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

type
  TAppData = record
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

type
  TBeam = record
    Data: TPLFLT;
    Lab: pchar;
  end;
  TBeams = array of TBeam;

const
  Beams: TBeams = (
    (Data: 45.0; Lab: 'Q1'),
    (Data: 78.0; Lab: 'Q2'),
    (Data: 32.0; Lab: 'Q3'),
    (Data: 91.0; Lab: 'Q4'));


  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    appData: PAppData;
  var
    i: integer;
    px, py: array[0..3] of TPLFLT; // Eckpunkte eines Balkens
    pos: TPLFLT;
  begin
    c_plsdev('extcairo');
    c_plspage(0, 0, Width, Height, 0, 0);
    c_plinit();
    pl_cmd(PLESC_DEVINIT, cr);

    c_pladv(0);
    c_plvpor(0.15, 0.9, 0.15, 0.9);
    c_plwind(0.0, 5.0, 0.0, 100.0);

    c_plcol0(3);
    c_plbox('bc', 1.0, 0, 'bcnstv', 10.0, 0);

    for i := 0 to Length(Beams) - 1 do begin
      pos := i + 1.0;

      px[0] := pos - 0.4;
      py[0] := 0.0;
      px[1] := pos - 0.4;
      py[1] := Beams[i].Data;
      px[2] := pos + 0.4;
      py[2] := Beams[i].Data;
      px[3] := pos + 0.4;
      py[3] := 0.0;

      c_plcol0(i mod 15 + 1);
      c_plfill(4, @px, @py);

      c_plcol0(3);
      c_plline(4, @px, @py);

      c_plmtex('b', 1.5, (pos / 5.0), 0.5, Beams[i].Lab);
    end;

    c_pllab('Quartale', 'Umsatz (kCHF)', 'Jahresbericht 2024');
    c_plend();
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
  begin
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    appData: PAppData absolute user_data;
  begin
  end;


  procedure AppData_free_cp(Data: Tgpointer); cdecl;
  var
    anyData: PAppData absolute Data;
  begin
    g_free(anyData);
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


    appData := g_malloc(SizeOf(TAppData));
    with appData^ do begin
    end;
    g_object_set_data_full(G_OBJECT(drawing_area), anyDataKey, appData, @AppData_free_cp);

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
