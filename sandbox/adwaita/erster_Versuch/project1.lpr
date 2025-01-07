program project1;

uses
  ctypes,

  adw_length_unit,                // io.
  adw_breakpoint,                 // io. -> adw_length_unit
  adw_dialog,                     // io. -> adw_breakpoint
  adw_application_window,         // io. -> adw_breakpoint, adw_dialog

  fp_glib2,
  fp_GTK4;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window: PGtkWidget;
  begin
//    window := gtk_application_window_new(app);
    window := adw_application_window_new (app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);


    toolbar_view := adw_toolbar_view_new ();
    header_bar := adw_header_bar_new ();

    adw_application_window_set_content (ADW_APPLICATION_WINDOW (window), toolbar_view);


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
