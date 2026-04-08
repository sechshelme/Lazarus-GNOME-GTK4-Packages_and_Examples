program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4, MyWidget;

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

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    anyData: PAniData;
  begin
    anyData := g_object_get_data(G_OBJECT(widget), anyDataKey);

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
    window, box, button: PGtkWidget;
    anyData: PAniData;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

 //   box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
   box := GTK_WIDGET( my_widget_new);

    anyData := g_malloc(SizeOf(TAniData));
    anyData^.x1 := 0.0;
    anyData^.y1 := 0.0;
    anyData^.x2 := 0.0;
    anyData^.y2 := 0.0;
//    g_object_set_data_full(G_OBJECT(drawing_area), anyDataKey, anyData, @anyData_free_cp);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
