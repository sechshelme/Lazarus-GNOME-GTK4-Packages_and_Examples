program project1;

uses
  fp_glib2;


var
  timer: PGTimer;
  us: Tgulong;
  time: Tgdouble;
begin
  WriteLn('Version: ', glib_major_version, '.', glib_minor_version, '.', glib_micro_version);


  WriteLn(g_ascii_isalnum('1'));
  WriteLn(g_ascii_isalnum('a'));
  WriteLn(g_ascii_isalnum(#10));

  //  g_signal_connect(nil, nil, nil, nil);


  timer := g_timer_new;
  g_timer_start(timer);
  ReadLn;


  g_timer_stop(timer);


  time := g_timer_elapsed(timer, @us);




  WriteLn(time: 4: 2, ' - ', us);

end.
