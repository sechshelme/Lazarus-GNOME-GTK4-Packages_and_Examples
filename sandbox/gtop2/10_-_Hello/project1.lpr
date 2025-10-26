program project1;

uses
  libgtopconfig,
  glibtop_machine,
  glibtop_server,
  glibtop,
  glibtop_suid,

  sysdeps,

close,
cpu,
disk,
fsusage,
loadavg,
mem,
mountlist,
msg_limits,
netlist,
netload,
ppp,
procaffinity,
procargs,
procio,
prockernel,
proclist,
procmap,
procmem,
procopenfiles,
procsegment,
procsignal,
procstate,
proctime,           // cpu
procuid,
procwd,
sem_limits,
shm_limits,
swap,
uptime,

  union,              // cpu, disk, ...
  command,            // union

  global,
  //gnuserv,
//open,
//parameter,
  //signal,
  //sysdeps,
  //sysinfo,

  fp_glib2,
  fp_libgtop2;

function mb(n:Tguint64):Tguint64;
begin
    Result:=n shr 20;;
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
