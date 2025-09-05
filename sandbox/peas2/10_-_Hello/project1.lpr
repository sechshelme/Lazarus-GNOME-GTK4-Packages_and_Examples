program project1;

uses
  fp_glib2,
  fp_peas2,
  ctypes;

  function main(argc: cint; argv: PPChar): cint;
  var
    engine: PPeasEngine;
    n: Tguint;
    info: PPeasPluginInfo;
    i, j: integer;
    authors: PPChar;
  begin
    engine := peas_engine_get_default;

    if engine <> nil then  begin
      g_printf('Standard Peas Engine erfolgreich geladen.'#10);
    end else begin
      g_printf('Fehler beim Laden der Standard Peas Engine.'#10);
    end;

    peas_engine_add_search_path(engine, '/usr/lib/x86_64-linux-gnu/gedit/plugins', nil);
    peas_engine_rescan_plugins(engine);

    n := g_list_model_get_n_items(G_LIST_MODEL(engine));
    g_printf('Gefundene Plugins: %d'#10, n);

    for i := 0 to n - 1 do begin
      info := g_list_model_get_item(G_LIST_MODEL(engine), i);

      g_print('Gefundenes Plugin: %s'#10, peas_plugin_info_get_name(info));
      g_print('Name: %s'#10, peas_plugin_info_get_name(info));
      g_print('Beschreibung: %s'#10, peas_plugin_info_get_description(info));
      g_print('Version: %s'#10, peas_plugin_info_get_version(info));
      g_print('Daten Pfad: %s'#10, peas_plugin_info_get_data_dir(info));
      g_print('URI: %s'#10, peas_plugin_info_get_help_uri(info));
      g_print('Icon Name: %s'#10, peas_plugin_info_get_icon_name(info));
      g_print('Webseite: %s'#10, peas_plugin_info_get_website(info));

      authors := peas_plugin_info_get_authors(info);
      if authors <> nil then begin
        g_print('Autor:'#10);
        j := 0;
        while authors[j] <> nil do begin
          g_print('%3d. %s'#10, j, authors[j]);
          inc(j);
        end;
        g_printf(#10);
        g_printf(#10);
      end;
      g_object_unref(info);
    end;

    g_object_unref(engine);
  end;

begin
  main(argc, argv);
end.
