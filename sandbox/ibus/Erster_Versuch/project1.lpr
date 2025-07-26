program project1;

uses
  ctypes,
  fp_glib_unix,
  fp_glib2,
  fp_ibus;

  function signal_cp(user_data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute user_data;
  begin
    if loop <> nil then begin
      g_print('Programm wird jetzt sauber beendet (SIGINT)'#10);
      g_main_loop_quit(loop);
    end;
    Exit(G_SOURCE_REMOVE_);
  end;

  procedure on_bus_connected(bus: PIBusBus; user_data: Tgpointer);
  begin
    g_print('IBus-Bus wurde verbunden.'#10);
  end;

  procedure on_bus_disconnected(bus: PIBusBus; user_data: Tgpointer);
  var
    loop: PGMainLoop absolute user_data;
  begin
    g_print('IBus-Bus wurde getrennt.'#10);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    bus: PIBusBus;
    loop: PGMainLoop = nil;
  begin
    ibus_init;
    bus := ibus_bus_new();

    if not ibus_bus_is_connected(bus) then begin
      g_printerr('IBus Daemon läuft nicht oder ist nicht erreichbar.'#10);
      g_printerr('Stelle sicher, dass du das Programm in einer grafischen Session startest und IBus läuft.'#10);
      g_printerr('Starte ggf. ''ibus-daemon -drx'' in einem Terminal.'#10);
      g_object_unref(bus);
      Exit(1);
    end;

    g_print('IBus Daemon ist verbunden.'#10);

    loop := g_main_loop_new(nil, False);

    g_signal_connect(bus, 'connected', G_CALLBACK(@on_bus_connected), loop);
    g_signal_connect(bus, 'disconnected', G_CALLBACK(@on_bus_disconnected), loop);

    g_unix_signal_add(SIGINT, @signal_cp, loop);

    g_main_loop_run(loop);

    g_object_unref(bus);
    g_main_loop_unref(loop);
  end;

begin
  main(argc, argv);

  ReadLn;
end.
