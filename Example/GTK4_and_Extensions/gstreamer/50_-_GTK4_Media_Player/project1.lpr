program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_gst,

  Common,
  LoadTitle,
  MenuBar,
  XML_Tools,
  LoadSaveSongs,

  MPStreamer,
  MPVUMeterWidget,
  MPColumnViewBox,
  MPSongItem,
  MPDurationBox,
  MPButtonBox,
  MPMenuButton,
  MPPlayerButtonBox,
  MPColumnViewControl,
  MPMainWindow;


  procedure app_activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    sharedWidgets: PSharedWidget;
  begin
    sharedWidgets := g_malloc0(SizeOf(TSharedWidget));
    sharedWidgets^.scale_changed_id := 0;
    sharedWidgets^.IsChange := False;

    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    // ==== Main Window
    sharedWidgets^.main_window := mp_main_window_new(sharedWidgets);
    gtk_window_set_application(GTK_WINDOW(sharedWidgets^.main_window), app);



  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    gst_init(@argc, @argv);
    app := gtk_application_new('org.gtk.mediaplayer', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@app_activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
