program project1;

uses
  fp_lilv;

const
  plugin_uri_str = 'http://lsp-plug.in/plugins/lv2/compressor_mono';

  procedure main;
  const
    SIZE = 512;
  var
    world: PLilvWorld;
    plugins: PLilvPlugins;
    plugin_uri: PLilvNode;
    plugin: PLilvPlugin;
    instance: PLilvInstance;
    input, output: array[0..SIZE - 1] of single;
    phase: double = 0.0;
    i, j: integer;

  const
    bypass: single = 0.0;
    thr: single = -18.0;
    rat: single = 8.0;
    atk: single = 5.0;
    rel: single = 150.0;
    knee: single = 6.0;
    g_in: single = 12.0;
    g_out: single = 12.0;

  begin
    world := lilv_world_new;
    lilv_world_load_all(world);

    plugins := lilv_world_get_all_plugins(world);
    plugin_uri := lilv_new_uri(world, plugin_uri_str);
    plugin := lilv_plugins_get_by_uri(plugins, plugin_uri);
    lilv_node_free(plugin_uri);

    if plugin = nil then begin
      WriteLn('LSP Compressor nicht gefunden. Installiere: '#27'[93msudo apt install lsp-plugins-lv2'#27'[0m');
      lilv_world_free(world);
      Exit;
    end;

    WriteLn('LSP Compressor geladen: ', lilv_node_as_string(lilv_plugin_get_uri(plugin)));

    instance := lilv_plugin_instantiate(plugin, 48000.0, nil);
    if instance = nil then begin
      WriteLn('Instanziierung fehlgeschlagen.');
      lilv_world_free(world);
      Exit;
    end;

    lilv_instance_connect_port(instance, 0, @input);
    lilv_instance_connect_port(instance, 1, @output);
    lilv_instance_connect_port(instance, 2, @bypass);
    lilv_instance_connect_port(instance, 3, @thr);
    lilv_instance_connect_port(instance, 4, @rat);
    lilv_instance_connect_port(instance, 5, @atk);
    lilv_instance_connect_port(instance, 6, @rel);
    lilv_instance_connect_port(instance, 7, @knee);
    lilv_instance_connect_port(instance, 9, @g_in);
    lilv_instance_connect_port(instance, 10, @g_out);

    lilv_instance_activate(instance);
    WriteLn('Compressor läuft...');

    for j := 0 to 7 do begin
      for  i := 0 to SIZE - 1 do begin
        input[i] := sin(phase + i * 0.01) * 0.8;
        phase += 0.1;
      end;
      lilv_instance_run(instance, SIZE);

      Write('In[0-9] : ');
      for i := 0 to 15 do begin
        Write(' ', input[i]: 4: 2);
      end;
      WriteLn();
      Write('Out[0-9]: ');
      for i := 0 to 15 do begin
        Write(' ', output[i]: 4: 2);
      end;
      WriteLn();
    end;

    lilv_instance_deactivate(instance);
    lilv_instance_free(instance);

    lilv_world_free(world);
  end;

begin
  main;
end.
