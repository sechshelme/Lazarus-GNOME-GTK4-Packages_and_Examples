program project1;

//{$include "lv2/core/lv2.h"}
//{$include "lv2/urid/urid.h"}

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
      WriteLn('Beispiel Plugins installieren mit: "sudo apt install lsp-plugins"');
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
    i: PLilvIter;
    plugin: PLilvPlugin;
  begin
    world := lilv_world_new;
    lilv_world_set_option(world, LILV_OPTION_FILTER_LANG, nil);
    lilv_world_load_all(world);

    plugins := lilv_world_get_all_plugins(world);

//    i := lilv_plugins_begin(plugins);
//    plugin:=lilv_plugins_get(plugins, i);
//    lilv_instance_run(
//  WriteLn(PtrUInt(plugin));

    list_plugins(plugins);

    lilv_world_free(world);
  end;

begin
  main;
end.
