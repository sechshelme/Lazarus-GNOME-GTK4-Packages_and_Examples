program project1;

uses
  fp_glib2,
  fp_ibus;

  procedure main;
  var
    bus: PIBusBus;
    engines, l: PGList;
    desc: PIBusEngineDesc;
    name, longname, lang: Pgchar;
  begin
    ibus_init;
    bus := ibus_bus_new;

    if ibus_bus_is_connected(bus) then begin
      g_printf('Verbunden. Liste aller installierten Engines:'#10#10);

      g_printf('LANG    | ID / NAME                           | FULL NAME'#10);
      g_printf('---------------------------------------------------------------------------'#10);

      engines := ibus_bus_list_engines(bus);

      l := engines;

      while l <> nil do begin
        desc := IBUS_ENGINE_DESC(l^.Data);

        name := ibus_engine_desc_get_name(desc);
        longname := ibus_engine_desc_get_longname(desc);
        lang := ibus_engine_desc_get_language(desc);

        g_printf('%-7s | %-35s | %s'#10, lang, name, longname);
        l := l^.Next;
      end;

      if engines <> nil then  begin
        g_list_free(engines);
      end;
    end else begin
      g_printf('Konnte keine Verbindung zum IBus-Daemon herstellen.');
    end;

    g_object_unref(bus);
  end;

begin
  main;
end.
