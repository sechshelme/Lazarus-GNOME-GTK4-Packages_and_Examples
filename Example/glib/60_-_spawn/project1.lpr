program project1;

uses
  ctypes,
  fp_glib2;

const
  SIGTERM = 15;

  function kill(pid: integer; sig: integer): integer; cdecl; external 'c';

  procedure child_setup(Data: Tgpointer); cdecl;
  begin
     g_print('child setup'#10);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    commands: array of Pgchar = ('/usr/bin/xed');
    flags: TGSpawnFlags = G_SPAWN_DEFAULT;
    pid: TGPid;
    err: PGError = nil;
    success: Tgboolean;
    status: Integer;
  begin
    success := g_spawn_async(nil, PPgchar(commands), nil, flags, @child_setup, nil, @pid, @err);
    if not success then begin
      g_printerr('Fehler beim starten %s'#10, err^.message);
      g_error_free(err);
      Halt(1);
    end else g_print('Process: %d'#10, pid);

    g_print('pid: %d'#10,pid);

    g_print('start'#10);
    g_usleep(5000000);
    g_print('ende'#10);


    if pid > 0 then begin
//     status:= kill(pid, SIGTERM);
//     if status=-1 then g_print('Fehler bim beenden!');
    end;

  end;

begin
  main(argc, argv);
end.
