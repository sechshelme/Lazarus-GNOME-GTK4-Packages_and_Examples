program project1;

uses
  libgtopconfig,
  glibtop_machine,
  glibtop_server,
  glibtop,
  glibtop_suid,

  sysdeps,

  fp_glib2,
  fp_libgtop2;

function mb(n:Tguint64):Tguint64;
begin
    Result:=n shr 20;;
end;

procedure main;
begin
//glibtop_mem mem;
 //   glibtop_swap swap;

    // libgtop initialisieren
    glibtop_init;

    // RAM- und Swap-Werte abrufen
    glibtop_get_mem(&mem);
    glibtop_get_swap(&swap);

    printf("Speicherauslastung (MB):\n");
    printf("  Gesamt: %lu\n", mb(mem.total));
    printf("  Verwendet: %lu\n", mb(mem.used));
    printf("  Frei: %lu\n", mb(mem.free));
    printf("  Pufferspeicher: %lu\n", mb(mem.buffer));
    printf("  Cache: %lu\n", mb(mem.cached));

    printf("\nSwap-Auslastung (MB):\n");
    printf("  Gesamt: %lu\n", mb(swap.total));
    printf("  Verwendet: %lu\n", mb(swap.used));
    printf("  Frei: %lu\n", mb(swap.free));

    glibtop_close();
end;
begin
    main;
end.
