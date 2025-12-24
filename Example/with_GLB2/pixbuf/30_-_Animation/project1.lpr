program project1;

uses
  fp_cairo,
  fp_glib2,
  fp_GTK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools, CairoWindow, TexturWindow, ImageWindow;


  procedure on_activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  begin
    CreateCairoWindow(app);
    CreateTexturWindow(app);
    CreateImageWindow(app);
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.example.PixbufExample', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@on_activate), nil);

    g_application_run(G_APPLICATION(app), 0, nil);
    g_object_unref(app);
  end;

begin
  main;
end.
