program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  ColorButtonBox,
  SnapshotWidget;

  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure color_set_cp(widget: PGtkWidget; col: PGdkRGBA; user_data: Tgpointer); cdecl;
  begin
    snapshot_widget_set_color(user_data, col);
  end;

  procedure add_color_buttton_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    w: PButtonBox absolute user_data;
  begin
    color_button_box_add_button(w, 'cyan');
  end;

  procedure insert_color_buttton_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    w: PButtonBox absolute user_data;
  begin
    if not color_button_box_insert_button(w, 'magenta', 1 )then begin
      g_printf('Konnte Button nicht einfügen, ungültiger Index !'#10);
    end;
  end;

  procedure remove_color_buttton_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    w: PButtonBox absolute user_data;
  begin
    if not color_button_box_remove(w, 1) then begin
      g_printf('Konnte Button nicht löschen !'#10);
    end;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  const
    cols: array of pchar = ('red', 'green', 'blue', 'yellow');
  var
    window, box, button, mySnapShot, header_bar, colorBox,
    buttonBox: PGtkWidget;
    i: integer;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    // Windows
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Snapshot Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    // Snapshot
    mySnapShot := GTK_WIDGET(snapshot_widget_new);
    gtk_widget_set_vexpand(mySnapShot, True);
    gtk_widget_set_hexpand(mySnapShot, True);
    gtk_box_append(GTK_BOX(box), mySnapShot);

    // Header Bar
    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);
    colorBox := color_button_box_new;
    for i := 0 to Length(cols) - 1 do begin
      color_button_box_add_button(PButtonBox(colorBox), cols[i]);
    end;
    g_signal_connect(colorBox, 'color-set', G_CALLBACK(@color_set_cp), mySnapShot);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), colorBox);

    // Bottom Button Box
    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_box_append(GTK_BOX(box), buttonBox);
    gtk_widget_set_halign(buttonBox, GTK_ALIGN_END);
    gtk_widget_set_margin_end(buttonBox, 10);
    gtk_widget_set_margin_bottom(buttonBox, 10);

    button := gtk_button_new_with_label('add');
    g_signal_connect(button, 'clicked', G_CALLBACK(@add_color_buttton_cp), colorBox);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := gtk_button_new_with_label('insert');
    g_signal_connect(button, 'clicked', G_CALLBACK(@insert_color_buttton_cp), colorBox);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := gtk_button_new_with_label('remove');
    g_signal_connect(button, 'clicked', G_CALLBACK(@remove_color_buttton_cp), colorBox);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), window);
    gtk_box_append(GTK_BOX(buttonBox), button);

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
