program project1;

uses
  fp_gtop2,
  fp_glib2;

  function mb(n: Tguint64): Tguint64;
  begin
    Result := n shr 20;;
  end;

  procedure main;
  var
    mem: Tglibtop_mem;
    swap: Tglibtop_swap;
  begin
    glibtop_init;

    glibtop_get_mem(@mem);
    glibtop_get_swap(@swap);

    g_printf('Speicherauslastung (MB):'#10);
    g_printf('  Gesamt: %lu'#10, mb(mem.total));
    g_printf('  Verwendet: %lu'#10, mb(mem.used));
    g_printf('  Frei: %lu'#10, mb(mem.free));
    g_printf('  Pufferspeicher: %lu'#10, mb(mem.buffer));
    g_printf('  Cache: %lu'#10, mb(mem.cached));
    g_printf(#10'Swap-Auslastung (MB):'#10);
    g_printf('  Gesamt: %lu'#10, mb(swap.total));
    g_printf('  Verwendet: %lu'#10, mb(swap.used));
    g_printf('  Frei: %lu'#10, mb(swap.free));

    glibtop_close();
  end;

begin
  main;
end.
