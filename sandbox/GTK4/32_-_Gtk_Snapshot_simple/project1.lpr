program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  ColorWidget,
  MyWidget;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure color_click_cp(widget: PGtkWidget; col: PGdkRGBA; user_data: Tgpointer); cdecl;
  begin
    my_widget_set_color(user_data, col);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, mySnapShot, header_bar, colorBox: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Snapshot Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    mySnapShot := GTK_WIDGET(my_widget_new);
    gtk_widget_set_vexpand(mySnapShot, True);
    gtk_widget_set_hexpand(mySnapShot, True);
    gtk_box_append(GTK_BOX(box), mySnapShot);

    // Header Bar
    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);
    colorBox := color_widget_new;
    g_signal_connect(colorBox, 'color-set', G_CALLBACK(@color_click_cp), mySnapShot);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), colorBox);

    // Quit Button
    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    // Windows
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
