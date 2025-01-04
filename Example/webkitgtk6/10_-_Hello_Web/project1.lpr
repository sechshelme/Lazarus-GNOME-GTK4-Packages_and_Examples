program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_webkitgtk6;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer);
  var
    window, webView, box: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 webkit Browser');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    webView := webkit_web_view_new;
    gtk_widget_set_vexpand(webView, True);
    gtk_widget_set_hexpand(webView, True);
    webkit_web_view_load_uri(WEBKIT_WEB_VIEW(webView), 'https://www.lazarusforum.de');
    gtk_box_append(GTK_BOX(box), webView);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
