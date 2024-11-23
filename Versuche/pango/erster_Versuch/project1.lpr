program project1;

uses
  ctypes,

  pango_attributes,



  fp_glib2,
  fp_GTK4;

  // https://www.perplexity.ai/search/was-ist-gi-scanner-JsyzTafESNujenggA8EGLw

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, label1: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    label1 := gtk_label_new(nil);
    gtk_label_set_markup(GTK_LABEL(label1), '<span foreground="blue" size="x-large">Hallo, <i>Pango</i> und <b>GTK4</b>!</span>');




    gtk_window_set_child(GTK_WINDOW(window), label1);
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
