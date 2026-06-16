program project1;

uses
  fp_glib2;

  function timerFunc(user_data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute user_data;
  const
    Count: Integer = 10;
  begin
    g_print('Hello Timer (%d)'#10, Count);
    if Count <= 0 then begin
      g_main_loop_quit(loop);
      Result := G_SOURCE_REMOVE_;
    end else begin
      Result := G_SOURCE_CONTINUE;
    end;
    Dec(Count);
  end;

  procedure main;
  var
    loop: PGMainLoop;
  begin
    loop := g_main_loop_new(nil, False);
    g_timeout_add(100, @timerFunc, loop);
    g_main_loop_run(loop);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.
