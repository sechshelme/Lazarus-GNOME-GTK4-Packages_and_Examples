program project1;

uses
  ctypes,

  ibus,
  ibusshare,
  ibusinputcontext,
  ibusobject,
  ibusbus,



  fp_glib2;


  function main(argc: cint; argv: PPChar): cint;
  begin
//    IBusBus *bus;
//    GMainLoop *loop;

    ibus_init;

    bus: = ibus_bus_new();

    if (!ibus_bus_is_connected(bus)) {
        g_printerr("IBus Daemon läuft nicht oder ist nicht erreichbar.\n");
        g_printerr("Stelle sicher, dass du das Programm in einer grafischen Session startest und IBus läuft.\n");
        g_printerr("Starte ggf. 'ibus-daemon -drx' in einem Terminal.\n");
        g_object_unref(bus);
        return 1;
    } else {
        g_print("IBus Daemon ist verbunden.\n");
    }

    loop = g_main_loop_new(NULL, FALSE);
    g_main_loop_run(loop);

    g_object_unref(bus);
    g_main_loop_unref(loop);

  end;

begin
  main(argc, argv);
end.
