program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  MyWidget;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure Received(button_id: pchar; user_data: Tgpointer); cdecl;
  var
    signal_id: Tguint;
    detail: TGQuark;
    signal_name: Pgchar;
  begin
    if g_signal_parse_name('action-triggered', mp_button_box_get_type, @signal_id, @detail, True) then  begin
      signal_name := g_signal_name(signal_id);
      g_print('Signal [%s] empfangen - ID: %s'#10, signal_name, button_id);
    end;
  end;

  // ====

  procedure on_box_action_received(box: PMButtonBox; button_id: pchar; user_data: Tgpointer); cdecl;
  begin
    Received(button_id, user_data);
  end;

  // === menu

  function create_window_menu(items: PButtonBoxData; count: Tgint): PGtkWidget;
  var
    menu: PGMenu;
    item: PGMenuItem;
    menu_button: PGtkWidget;
    i: integer;
    detailed_action: pchar;
  begin
    menu := g_menu_new();

    for i := 0 to count - 1 do begin
      item := g_menu_item_new(items[i].lab, nil);

      detailed_action := g_strdup_printf('win.click(''%s'')', items[i].id);

      g_menu_item_set_detailed_action(item, detailed_action);
      g_menu_append_item(menu, item);

      g_free(detailed_action);
      g_object_unref(item);
    end;

    menu_button := gtk_menu_button_new();
    gtk_menu_button_set_icon_name(PGtkMenuButton(menu_button), 'open-menu-symbolic');
    gtk_menu_button_set_menu_model(PGtkMenuButton(menu_button), PGMenuModel(menu));

    g_object_unref(menu);
    Result := menu_button;
  end;

  procedure on_menu_action_activated(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  begin
    Received(g_variant_get_string(parameter, nil), user_data);
  end;

  // === main

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, mainbox, button, playbox, header_bar, btnbox,
    main_menu: PGtkWidget;
    menu_action: PGSimpleAction;

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
    menu_action := g_simple_action_new_stateful('click', G_VARIANT_TYPE_STRING, nil);
    g_signal_connect(menu_action, 'activate', G_CALLBACK(@on_menu_action_activated), nil);
    g_action_map_add_action(G_ACTION_MAP(window), G_ACTION(menu_action));

    main_menu := create_window_menu(app_setup, Length(app_setup));
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), main_menu);

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
