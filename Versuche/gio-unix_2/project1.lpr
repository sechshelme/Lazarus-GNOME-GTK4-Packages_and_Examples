program project1;

uses
  ctypes,
  fp_glib2,

  gdesktopappinfo,
  gfiledescriptorbased,
  gunixfdmessage,
  gunixinputstream,
  gunixmounts,
  gunixoutputstream;

  // https://www.ibm.com/docs/en/zos/2.4.0?topic=functions-kill-send-signal-process

const
  SIGTERM = 15;

  function kill(pid: integer; sig: integer): integer; cdecl; external 'c';




  function main(argc: cint; argv: PPChar): cint;
  var
    commands: array of Pgchar = ('/usr/bin/xed');
    flags: TGSpawnFlags = G_SPAWN_DEFAULT;
    pid: TGPid;
    err: PGError = nil;
    success: Tgboolean;
    status: Integer;
  begin
    success := g_spawn_async(nil, PPgchar(commands), nil, flags, nil, nil, @pid, @err);
    if not success then begin
      g_printerr('Fehler beim starten %s'#10, err^.message);
      g_error_free(err);
      Halt(1);
    end;

    g_print('pid: %d'#10,pid);

    g_print('start'#10);
    g_usleep(5000000);
    g_print('ende'#10);


    if pid > 0 then begin
     status:= kill(pid, SIGTERM);
     if status=-1 then g_print('Fehler bim beenden!');
    end;

  end;

begin
  main(argc, argv);
end.
