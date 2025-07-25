program project1;

uses
  ctypes,

  ibus,                   // io.
  ibusshare,              // io.
  ibusxml,                // io.
  ibusobject,             // io.
  ibusproxy,              // io. -> ibusobject
  ibusconfig,             // io. -> ibusproxy
  ibusserializable,       // io. -> ibusobject
  ibusxevent,             // io. -> ibusserializable
  ibusattribute,          // io. -> ibusserializable
  ibusattrlist,           // io. -> ibusserializable, ibusattribute
  ibustext,               // io. -> ibusserializable, ibusattrlist
  ibusenginedesc,         // io. -> ibusserializable, ibusxml
  ibuscomponent,          // io. -> ibusserializable, ibusxml, ibusenginedesc
  ibusinputcontext,       // io. -> ibusproxy, ibusenginedesc, ibustext
  ibusbus,                // io. -> ibusobject, ibusinputcontext, ibuscomponent, ibusenginedesc, ibusconfig, ibusxevent



  fp_glib2;


  function main(argc: cint; argv: PPChar): cint;
  var
    bus: PIBusBus;
    loop: PGMainLoop;
  begin

    ibus_init;

    bus := ibus_bus_new();

    if not ibus_bus_is_connected(bus) then begin
      g_printerr('IBus Daemon läuft nicht oder ist nicht erreichbar.'#10);
      g_printerr('Stelle sicher, dass du das Programm in einer grafischen Session startest und IBus läuft.'#10);
      g_printerr('Starte ggf. ''ibus-daemon -drx'' in einem Terminal.'#10);
      g_object_unref(bus);
      Exit(1);
    end else begin
      g_print('IBus Daemon ist verbunden.'#10);
    end;

    loop := g_main_loop_new(nil, False);
    g_main_loop_run(loop);

    g_object_unref(bus);
    g_main_loop_unref(loop);
  end;

begin
  main(argc, argv);
end.
