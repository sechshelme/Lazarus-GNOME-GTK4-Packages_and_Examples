program project1;

uses
  fp_glib_unix,
  fp_glib2;

const
  SIGINT = 2;

  function on_sigint(user_data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute user_data;
  begin
    g_main_loop_quit(loop);
    Result := gFalse;
  end;

  function main(argc: integer; argv: PPChar): integer;
  var
    loop: PGMainLoop;
  begin
    g_print('Programm mit <Ctrl+C> beenden.'#10);

    loop := g_main_loop_new(nil, gFalse);
    g_unix_signal_add(SIGINT, @on_sigint, loop);

    g_main_loop_run(loop);
    g_printf('Programm wurde mit <Ctrl+C> abgewürgt !'#10);

    Result := 0;
  end;


begin
  main(argc, argv);
end.
