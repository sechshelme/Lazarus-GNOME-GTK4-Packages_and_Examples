program project1;

uses
  fp_glib2,
  fp_GTK4,
  MainWindow;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    mainWindow: PGtkWidget;
  begin
    mainWindow := main_window_new;
    gtk_window_set_application(GTK_WINDOW(mainWindow), app);
    gtk_window_present(GTK_WINDOW(mainWindow));
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
