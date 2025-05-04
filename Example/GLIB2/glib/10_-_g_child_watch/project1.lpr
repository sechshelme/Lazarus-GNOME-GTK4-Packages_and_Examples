program project1;

uses
  ctypes,
  fp_glib2;

  procedure child_watch_callback(pid: TGPid; wait_status: Tgint; user_data: Tgpointer); cdecl;
  var
    loop: PGMainLoop absolute user_data;
  begin
    g_print('Child process %d beendet mit Status %d'#10, pid, wait_status);
    g_spawn_close_pid(pid);
    g_main_loop_quit(loop);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    loop: PGMainLoop;
    child_pid: TGPid;
    err: PGError = nil;
  const
    arg: array of Pgchar = ('/bin/ls', '-l', '--color=always', nil);
  begin
    if not g_spawn_async(nil, PPgchar(arg), nil, G_SPAWN_DO_NOT_REAP_CHILD, nil, nil, @child_pid, @err) then  begin
      g_printerr('Fehler beim Starten des Prozesses: %s'#10, err^.message);
      g_error_free(err);
    end;

    loop := g_main_loop_new(nil, False);
    g_child_watch_add(child_pid, @child_watch_callback, loop);
    g_main_loop_run(loop);

    g_main_loop_unref(loop);
    Result := 0;
  end;

begin
  main(argc, argv);
end.
