program project1;

uses
  gnuplot_i;

  procedure main;
  var
    h: Pgnuplot_ctrl;
    phase: double = 0.1;
  begin
    h := gnuplot_init;

    while phase < 10 do begin
      gnuplot_resetplot(h);
      gnuplot_cmd(h, 'plot sin(x+%g)', phase);
      phase += 0.1;
    end;

    phase := 10.0;
    while phase >= 0.1 do begin
      gnuplot_resetplot(h);
      gnuplot_cmd(h, 'plot sin(x+%g)', phase);
      phase -= 0.1;
    end;

//    ReadLn;

    gnuplot_close(h);
  end;


begin
  main;

end.
