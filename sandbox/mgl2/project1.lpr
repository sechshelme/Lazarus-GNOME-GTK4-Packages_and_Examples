program project1;

// mglDataA = Pointer ?????     canvas_cg.h
// mglNum = Pointer ????        canvas_cg.h,

uses
  mgl_command,
  define,             // io.
  abstract,           // io.
  plot,               // io.
  canvas_cf,          // io.
  cont,               // io.
  data_cf,            // io.
  datac_cf,           // io.
  prim,               // io.
  vect,               // io.

  addon,
  base_cf,
  config,
  fit,
  mgl_cf,
  other,
  pde,
  surf,
  volume,

  wnd_cf,
  mpi,
  fltk,
  glut,
  qt,                 // io.




  math;

  function sample(gr: THMGL; p: pointer): longint;
  var
    y0: THMDT;
  begin
    mgl_data_modify(y0, '0.4*sin(2*pi*x)+0.3*cos(3*pi*x)-0.4*sin(4*pi*x)+0.2*rnd',0);




    mgl_new_frame(gr);
    mgl_rotate(gr, 60, 40, 0);
    mgl_box(gr);
    mgl_end_frame(gr);
    mgl_new_frame(gr);
    mgl_box(gr);
    mgl_axis(gr,'xy',nil,nil);

    mgl_end_frame(gr);

//    mgl_fplot(gr, 'sin(pi*x)', 'r', '');
//    mgl_fsurf(gr, 'sin(5*sqrt(x^2+y^2))', 'r', '');

//    mgl_fsurf(gr, 'sin(8*sqrt(x^2+y^2))', 'r', ''); // Wellenmuster
//    mgl_axis(gr, 'xyz', nil, nil); // Achsen anzeigen

//    mgl_rotate(gr, 60, 40, 0);
//    mgl_box_str(gr, 'r', 10);
    Result:=1;
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
  mgl_glut_next_frame(nil);
  mgl_fltk_run;
  mgl_mpi_send(nil,0);
  mgl_set_click_func(nil,nil);
  mgl_wnd_prev_frame(nil);
  mgl_wnd_window(nil);
  main;
end.

