program project1;

uses
  peas_plugin_info,
  peas_engine,
  peas_extension_base,
  peas_extension_set,
  peas_object_module,
  peas_version,


  fp_glib2,
  ctypes,
  fp_peas2;

type
  TTestFixture = record
    engine: PPeasEngine;
  end;
  PTestFixture = ^TTestFixture;

  procedure test_setup(fixture: Tgpointer; user_data: Tgconstpointer); cdecl;
  var
    fix: PTestFixture absolute fixture;
  begin
    //    fix^.engine := testing_engine_new ;
  end;

  procedure test_runner(fixture: Tgpointer; user_data: Tgconstpointer); cdecl;
  begin

  end;

  procedure test_teardown(fixture: Tgpointer; user_data: Tgconstpointer); cdecl;
  begin

  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    engine: PPeasEngine;
    n: Tguint;
    info: PPeasPluginInfo;
    i: integer;
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
      g_printf(' - %s'#10, peas_plugin_info_get_name(info));


//      g_print("Gefundenes Plugin: %s\n", peas_plugin_info_get_name(plugin_instance));
//
//  g_print("Name: %s\n", peas_plugin_info_get_name(plugin_instance));
//  g_print("Beschreibung: %s\n", peas_plugin_info_get_description(plugin_instance));
//  g_print("Version: %s\n", peas_plugin_info_get_version(plugin_instance));
//
//const char *const *authors = peas_plugin_info_get_authors(plugin_instance);
//
//if (authors != NULL) {
//  for (int j = 0; authors[j] != NULL; j++) {
//      g_print("  Autor: %s\n", authors[j]);
//  }
//}
      g_printf(#10);
      g_printf(#10);



      g_object_unref(info);
    end;

    g_object_unref(engine);



    //g_test_add('/plugin-info/verify-full-info', SizeOf(TTestFixture),
    //  @test_plugin_info_verify_full_info,
    //  @test_setup, @test_runner, @test_teardown);

    //g_test_add('/plugin-info/verify-min-info', SizeOf(TTestFixture),
    //  @test_plugin_info_verify_min_info,
    //  @test_setup, @test_runner, @test_teardown);
    //
    //g_test_add('/plugin-info/has-dep', SizeOf(TTestFixture),
    //  @test_plugin_info_has_dep,
    //  @test_setup, @test_runner, @test_teardown);
    //
    //g_test_add('/plugin-info/missing-module', SizeOf(TTestFixture),
    //  @test_plugin_info_missing_module,
    //  @test_setup, @test_runner, @test_teardown);
    //
    //g_test_add('/plugin-info/missing-name', SizeOf(TTestFixture),
    //  @test_plugin_info_missing_name,
    //  @test_setup, @test_runner, @test_teardown);
    //
    //g_test_add('/plugin-info/os-dependant-help', SizeOf(TTestFixture),
    //  @test_plugin_info_os_dependant_help,
    //  @test_setup, @test_runner, @test_teardown);
  end;

begin
  main(argc, argv);
end.
