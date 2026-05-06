program project1;

uses
  fp_glib2,
  fp_GTK4,
  fp_shumate;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, map, box, button: PGtkWidget;
    registry: PShumateMapSourceRegistry;
    source: PShumateMapSource;
    viewport: PShumateViewport;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Map View');
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    map := GTK_WIDGET(shumate_simple_map_new);
    registry := shumate_map_source_registry_new;
    shumate_map_source_registry_populate_defaults(registry);
    source := shumate_map_source_registry_get_by_id(registry, SHUMATE_MAP_SOURCE_OSM_MAPNIK);
    if source <> nil then  begin
      shumate_simple_map_set_map_source(SHUMATE_SIMPLE_MAP(map), source);
    end;
    viewport := shumate_simple_map_get_viewport(SHUMATE_SIMPLE_MAP(map));
    shumate_location_set_location(SHUMATE_LOCATION(viewport), 47.3727, 8.5417);
    shumate_viewport_set_zoom_level(viewport, 12);

    gtk_widget_set_vexpand(map, True);
    gtk_widget_set_hexpand(map, True);
    gtk_box_append(GTK_BOX(box), map);

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
