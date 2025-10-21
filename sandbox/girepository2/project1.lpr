program Project1;

uses
  fp_glib2,
  fp_girepository_2;

  procedure main;
  var
    repo: PGIRepository;
    err: PGError = nil;
    n_infos, n_methods: Tgint;
    i, m: integer;
    info: PGIBaseInfo;
    name: Pgchar;
    obj_info: PGIObjectInfo;
    method: PGIFunctionInfo;
  begin
    repo := gi_repository_new;

    if gi_repository_require(repo, 'Gtk', '4.0', 0, @err) = nil then begin
      g_printf('Fehler beim Laden von Gtk-4.0: %s'#10, err^.message);
      g_error_free(err);
      Exit;;
    end;

    n_infos := gi_repository_get_n_infos(repo, 'Gtk');
    for i := 0 to n_infos - 1 do begin
      info := gi_repository_get_info(repo, 'Gtk', i);
      if GI_IS_OBJECT_INFO(info) then begin
        name := gi_base_info_get_name(info);
        g_printf('Klasse: %s'#10, name);

        obj_info := PGIObjectInfo(info);
        n_methods := gi_object_info_get_n_methods(obj_info);
        g_printf('  Anzahl Methoden: %d'#10, n_methods);

        for  m := 0 to n_methods - 1 do begin
          method := gi_object_info_get_method(obj_info, m);
          g_printf('    Methode: %s'#10, gi_base_info_get_name(PGIBaseInfo(method)));

        end;
      end;
      gi_base_info_unref(info);
    end;
    g_object_unref(repo);
  end;

begin
  main;
end.
