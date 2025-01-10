program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_adwaita;

  procedure quit_clicked_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    app: PGtkApplication absolute Data;
  begin
    g_application_quit(G_APPLICATION(app));
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, toolbar_view, header_bar, label_, box, button: PGtkWidget;
  begin
    //    window := gtk_application_window_new(app);
    window := adw_application_window_new(app);
    toolbar_view := adw_toolbar_view_new;
    header_bar := adw_header_bar_new;

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);

    label_ := gtk_label_new('Hello World');
    gtk_box_append(GTK_BOX(box), label_);

    button := gtk_button_new_with_label('Quit');
    gtk_box_append(GTK_BOX(box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), app);

    adw_toolbar_view_add_top_bar(ADW_TOOLBAR_VIEW(toolbar_view), header_bar);
    adw_toolbar_view_set_content(ADW_TOOLBAR_VIEW(toolbar_view), box);

    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    adw_application_window_set_content(ADW_APPLICATION_WINDOW(window), toolbar_view);
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    status: longint;
    app: PAdwApplication;
  begin
    app := adw_application_new('org.example.Hello', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
