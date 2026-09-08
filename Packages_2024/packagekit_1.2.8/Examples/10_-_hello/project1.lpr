program project1;

uses
  fp_packagekit,
  fp_glib2;

  procedure search_finished_cb(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
  var
    client: PPkClient;
    results: PPkResults;
    err: PGError=nil;
    package_list: PGPtrArray;
    pkg: Tgpointer;
    package_id, summary, status_str: Pgchar;
    info: TPkInfoEnum;
    loop: PGMainLoop absolute Data;
    i: integer;
  begin
    client := PK_CLIENT(source_object);

    results := pk_client_generic_finish(client, res, @err);
    if err <> nil then begin
      g_printf('Fehler bei der Suche: %s', err^.message);
      g_error_free(err);
      g_main_loop_quit(loop);
      Exit;;
    end;

    package_list := pk_results_get_package_array(results);
    g_printf(#10'--- Suchergebnisse (%d Pakete gefunden) ---', package_list^.len);

    for  i := 0 to package_list^.len - 1 do begin
      pkg := g_ptr_array_index(package_list, i);

      package_id := pk_package_get_id(pkg);
      summary := pk_package_get_summary(pkg);
      info := pk_package_get_info(pkg);
      status_str := pk_info_enum_to_string(info);

      g_printf('[%s] ID: %s'#10, status_str, package_id);
      g_printf('      Beschreibung: %s'#10#10, summary);
    end;

    g_printf('-----------------------------------------'#10);

    g_object_unref(results);
    g_main_loop_quit(loop);
  end;

  procedure main;
  var
    i: integer;
    group_name: Pgchar;
    loop: PGMainLoop;
    client: PPkClient;
    filters: TPkBitfield;
    search_terms: array of Pgchar = ('vlc', 'gtk4', nil);
  begin
    g_printf('--- Verfügbare PackageKit-Kategorien (Gruppen) ---'#10);

    for i := 0 to PK_GROUP_ENUM_LAST - 1 do begin
      if i = PK_GROUP_ENUM_UNKNOWN then begin
        continue;
      end;

      group_name := pk_group_enum_to_string(i);
      g_printf(' * %s'#10, group_name);
    end;
    g_printf('--------------------------------------------------'#10);


    loop := g_main_loop_new(nil, False);

    client := pk_client_new;

    filters := pk_bitfield_value(PK_FILTER_ENUM_NONE);

    pk_client_search_names_async(client, filters, PPgchar(search_terms), nil, nil, nil, @search_finished_cb, loop);
    g_main_loop_run(loop);

    g_object_unref(client);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.
