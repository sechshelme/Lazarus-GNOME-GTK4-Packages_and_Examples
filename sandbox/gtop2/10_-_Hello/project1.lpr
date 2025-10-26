program project1;

// https://gitlab.gnome.org/GNOME/libgtop/-/tree/master/examples

uses
  fp_gtop2,
  fp_glib2;

  function mb(n: Tguint64): Tguint64;
  begin
    Result := n shr 20;;
  end;

  procedure printMountList;
  var
    mount_entries: Pglibtop_mountentry;
    mount_list: Tglibtop_mountlist;
    i: Integer;
    mountDir:Pchar;
    fsusage: Tglibtop_fsusage;
  begin
    mount_entries := glibtop_get_mountlist(@mount_list, 1);
    if mount_entries <> nil then begin
      WriteLn('Mount Count: ', mount_list.number);
      for i := 0 to mount_list.number - 1 do begin
        mountDir:=mount_entries [i].mountdir;
        g_printf ('  Entry: %-30s %-10s %-20s'#10,
        			mountDir,
        			mount_entries [i]._type,
        			mount_entries [i].devname);
        glibtop_get_fsusage(@fsusage, mountDir);
        g_printf ('%-16s %9'+ G_GUINT64_FORMAT +' %9'+ G_GUINT64_FORMAT +' %9' +G_GUINT64_FORMAT +' %9'+ G_GUINT64_FORMAT +' %9' + G_GUINT64_FORMAT +' %9d'#10,
        			mount_entries [i].mountdir,
        			fsusage.blocks, fsusage.bfree,
        			fsusage.bavail, fsusage.files,
        			fsusage.ffree, fsusage.block_size);

      end;
    end;
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

    printMountList;
  end;

begin
  main;
end.
