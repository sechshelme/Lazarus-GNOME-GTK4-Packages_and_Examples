program project1;

uses
  fp_lilv;

  procedure list_plugins(list: PLilvPlugins);
  var
    i: PLilvIter;
    p: PLilvPlugin;
    n: PLilvNode;
  begin
    i := lilv_plugins_begin(list);
    if i = nil then begin
      WriteLn('Keine Plugins gefunden !');
      WriteLn('Beispiel Plugins installieren mit: '#27'[93msudo apt install lsp-plugins'#27'[0m');
    end else begin
      while not lilv_plugins_is_end(list, i) do begin
        p := lilv_plugins_get(list, i);
        n := lilv_plugin_get_name(p);
        WriteLn(lilv_node_as_string(n));
        lilv_node_free(n);
        WriteLn(lilv_node_as_uri(lilv_plugin_get_uri(p)));
        WriteLn();
        i := lilv_plugins_next(list, i);
      end;
    end;
  end;

  procedure main;
  var
    world: PLilvWorld;
    plugins: PLilvPlugins;
  begin
    world := lilv_world_new;
    lilv_world_set_option(world, LILV_OPTION_FILTER_LANG, nil);
    lilv_world_load_all(world);

    plugins := lilv_world_get_all_plugins(world);
    list_plugins(plugins);

    lilv_world_free(world);
  end;

begin
  main;
end.
