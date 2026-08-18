program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_pango,
  fp_GTK4,
  MyWidget;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure on_entry_changed(editable: PGtkEditable; user_data: Tgpointer); cdecl;
  var
    mywidget: PMyWidget absolute user_data;
    text: pchar;
  begin
    text := gtk_editable_get_text(editable);
    my_widget_set_text(mywidget, text);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, mwidget, entry: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'FreeType Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    entry := gtk_entry_new;
    gtk_editable_set_text(GTK_EDITABLE(entry), 'Hello öäü');
    gtk_box_append(GTK_BOX(box), entry);

    mwidget := my_widget_new;
    my_widget_set_text(PMyWidget(mwidget), gtk_editable_get_text(GTK_EDITABLE(entry)));
    gtk_widget_set_vexpand(mwidget, True);
    gtk_widget_set_hexpand(mwidget, True);
    gtk_box_append(GTK_BOX(box), mwidget);

    g_signal_connect(entry, 'changed', G_CALLBACK(@on_entry_changed), mwidget);

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
