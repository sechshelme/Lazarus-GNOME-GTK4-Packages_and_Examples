program project1;

uses
  shumate_version,
  shumate_enum_types,
  shumate_data_source_request,
  shumate_data_source,
  shumate_tile,
  shumate_tile_downloader,
  shumate_map_source,
  shumate_map_source_registry,
  shumate_viewport,
  shumate_layer,
  shumate_map,
  shumate_map_layer,
  shumate_compass,
  shumate_coordinate,
  shumate_file_cache,
  shumate_license,
  shumate_location,
  shumate_marker,
  shumate_marker_layer,
  shumate_marshal,
  shumate_path_layer,
  shumate_point,
  shumate_raster_renderer,
  shumate_scale,
  shumate_simple_map,
  shumate_symbol_event,
  shumate_user_agent,
  shumate_vector_reader_iter,
  shumate_vector_reader,
  shumate_vector_sprite,
  shumate_vector_sprite_sheet,
  shumate_vector_renderer,


  fp_glib2,
  fp_GTK4,
  fp_shumate;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  begin
    g_print('Hello World'#10);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window: PGtkWidget;
    map: PShumateSimpleMap;
    registry: PShumateMapSourceRegistry;
    source: PShumateMapSource;
    viewport: PShumateViewport;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Libshumate Karte');
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    map := shumate_simple_map_new;

    registry := shumate_map_source_registry_new;
    shumate_map_source_registry_populate_defaults(registry);

    source := shumate_map_source_registry_get_by_id(registry, SHUMATE_MAP_SOURCE_OSM_MAPNIK);

    if source <> nil then  begin
      shumate_simple_map_set_map_source(SHUMATE_SIMPLE_MAP(map), source);
    end;

    viewport := shumate_simple_map_get_viewport(SHUMATE_SIMPLE_MAP(map));
    shumate_location_set_location(SHUMATE_LOCATION(viewport), 52.52, 13.40);
    shumate_viewport_set_zoom_level(viewport, 12);

    gtk_window_set_child(GTK_WINDOW(window), map);
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
