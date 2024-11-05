program project1;

uses
  ctypes,
  Math,
  glib280;

  function timerFunc(user_data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute user_data;
  const
    Count: cint = 0;
  begin
    g_print('Hello Timer'#10);
    Inc(Count);
    if Count > 10 then begin
      g_main_loop_quit(loop);
      Result := G_SOURCE_REMOVE_;
    end else begin
      Result := G_SOURCE_CONTINUE;
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    loop: PGMainLoop;
  begin
    loop := g_main_loop_new(nil, False);
    g_timeout_add(100, @timerFunc, loop);
    g_main_loop_run(loop);

    g_main_loop_unref(loop);
    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
