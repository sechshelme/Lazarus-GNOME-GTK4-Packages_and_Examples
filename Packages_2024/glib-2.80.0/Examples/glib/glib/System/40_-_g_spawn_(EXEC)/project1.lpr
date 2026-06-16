program project1;

uses
  fp_glib2;

  procedure child_setup(Data: Tgpointer); cdecl;
  begin
    g_print('child setup'#10);
  end;

  procedure main;
  var
    commands: array of Pgchar = ('/usr/bin/xed', nil);
    flags: TGSpawnFlags = G_SPAWN_DEFAULT;
    pid: TGPid;
    err: PGError = nil;
    success: Tgboolean;
    s: Pgchar;
  begin
    success := g_spawn_async(nil, PPgchar(commands), nil, flags, @child_setup, nil, @pid, @err);
    if not success then begin
      g_printerr('Fehler beim starten %s'#10, err^.message);
      g_error_free(err);
      Halt(1);
    end else begin
      g_printf('Process: %d'#10, pid);
    end;

    g_printf('pid: %d'#10, pid);

    g_printf('start'#10);
    g_usleep(5000000);
    g_printf('ende'#10);

    if pid > 0 then begin
      s := g_strdup_printf('kill %d', pid);
      g_spawn_command_line_sync(s, nil, nil, nil, nil);
      g_free(s);
      g_spawn_close_pid(pid);
      g_print('PID-Handle in GLib geschlossen.'#10);
    end;
  end;

begin
  main;
end.
