program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  MPButtonBox,
  myMenu;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure on_box_action_received(widget: PGtkWidget; button_id: Pgchar; user_data: Tgpointer); cdecl;
  begin
    g_print('Klick empfangen von: %s - ID: %s'#10, g_type_name(G_TYPE_FROM_INSTANCE(widget)), button_id);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, mainbox, button, playbox, header_bar, btnbox,
    menubox: PGtkWidget;

  const
    media_setup: array[0..2] of TButtonBoxData = (
      (lab: 'Aufnahme'; id: 'record'; icon_name: 'media-record-symbolic'),
      (lab: 'Play'; id: 'play'; icon_name: 'media-playback-start-symbolic'),
      (lab: 'Stop'; id: 'stop'; icon_name: 'media-playback-stop-symbolic'));

  const
    app_setup: array[0..3] of TButtonBoxData = (
      (lab: 'Info'; id: 'info'; icon_name: nil),
      (lab: 'Play'; id: 'play'; icon_name: nil),
      (lab: 'Hilfe'; id: 'help'; icon_name: nil),
      (lab: 'Beenden'; id: 'quit'; icon_name: nil));

  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Grid Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    // === headerbar
    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);

    // === menu
    menubox := mp_menu_button_new(app_setup, Length(app_setup));
    g_signal_connect(menubox, 'action-triggered', G_CALLBACK(@on_box_action_received), nil);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), menubox);

    // ==== mainbox
    mainbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    playbox := mp_button_box_new(media_setup, Length(media_setup));
    gtk_box_set_spacing(GTK_BOX(playbox), 10);
    g_signal_connect(playbox, 'action-triggered', G_CALLBACK(@on_box_action_received), nil);
    gtk_box_append(GTK_BOX(mainbox), playbox);

    btnbox := mp_button_box_new(app_setup, Length(app_setup));
    g_signal_connect(btnbox, 'action-triggered', G_CALLBACK(@on_box_action_received), nil);
    gtk_widget_set_hexpand(btnbox, True);
    gtk_box_set_homogeneous(GTK_BOX(btnbox), True);
    gtk_box_append(GTK_BOX(mainbox), btnbox);

    // === quit
    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(mainbox), button);

    gtk_window_set_child(GTK_WINDOW(window), mainbox);
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
