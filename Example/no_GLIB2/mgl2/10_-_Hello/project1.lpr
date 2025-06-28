program project1;

uses
  fp_mgl2;

  function sample(gr: THMGL; p: pointer): longint;
  var
    y0, y1, y2, y3: THMDT;
    n: longint = 30;
  begin
    y0 := mgl_create_data_size(n, 1, 1);
    mgl_data_modify(y0, '0.4*sin(2*pi*x)+0.3*cos(3*pi*x)-0.4*sin(4*pi*x)+0.2*rnd', 0);

    y1 := mgl_create_data_size(n, 1, 1);
    mgl_data_set(y1, y0);

    y2 := mgl_create_data_size(n, 1, 1);
    mgl_data_set(y2, y0);

    y3 := mgl_create_data_size(n, 1, 1);
    mgl_data_set(y3, y0);

    mgl_data_smooth(y1, 'line3', 0);
    mgl_data_smooth(y2, 'line5', 0);
    mgl_data_smooth(y3, 'quad5', 0);

    mgl_plot(gr, y0, 'k', '');
    mgl_add_legend(gr, 'NONE', 'k');
    mgl_plot(gr, y1, 'r', '');
    mgl_add_legend(gr, 'LINE_3', 'r');
    mgl_plot(gr, y2, 'g', '');
    mgl_add_legend(gr, 'LINE_5', 'g');
    mgl_plot(gr, y3, 'b', '');
    mgl_add_legend(gr, 'QUAD_5', 'b');
    mgl_legend(gr, 1, '', '');
    mgl_box(gr);

    mgl_delete_data(y0);
    mgl_delete_data(y1);
    mgl_delete_data(y2);
    mgl_delete_data(y3);

    Result := 0;
  end;

  procedure main;
  var
    gr: THMGL;
  begin
    gr := mgl_create_graph_qt(@sample, 'MathGL Example', nil, nil);

    if gr = nil then begin
      WriteLn('Fehler');
    end;
    mgl_qt_run();
    mgl_delete_graph(gr);
  end;

begin
  main;
end.
