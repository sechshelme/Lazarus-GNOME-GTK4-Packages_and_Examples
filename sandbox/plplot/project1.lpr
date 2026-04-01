program project1;

uses
  //plConfig,
  plplot,
  //disptab,
  //pdf,
  //plstrm,
  //
  //
  //csa,
  //drivers,
  //nn,
  //plevent,
  //plplotP,
  //qsastime,


  fp_plplot;

  procedure PrintBuffer;
  const
    x: array [0..3] of TPLFLT = (0.0, 1.0, 2.0, 3.0);
    y: array [0..3] of TPLFLT = (0.0, 1.0, 4.0, 9.0);
  var
    width, height: TPLINT;
    buffer: array of uint8 = nil;
    i: integer;
  begin
    width := 120;
    height := 50;

    SetLength(buffer, width * height*2);

    c_plsdev('mem');
    c_plsmem(width, height, TPLPointer(buffer));
    c_plinit();

    c_plenv(0, 10, 0, 10, 0, 0);
    c_plline(4, @x, @y);

    c_plend();
    for i := 0 to Length(buffer) - 1 do begin
      if buffer[i] > 0 then begin
        Write('x');
      end else begin
        Write(' ');
      end;
      if (i + 1) mod (width div 1)  = 0 then WriteLn;
    end;
  end;

  procedure main;
  const
    x: array [0..3] of TPLFLT = (0.0, 1.0, 2.0, 3.0);
    y: array [0..3] of TPLFLT = (0.0, 1.0, 4.0, 9.0);
  begin
    c_plsdev('pngqt');
    c_plsfnam('mein_plot.png');

    c_plspage(0, 0, 160, 60, 0, 0);
    c_plinit;

    c_plenv(0.0, 3.0, 0.0, 9.0, 0, 1);
    c_pllab('X-Achse', 'Y-Achse', 'Mein PLplot-Diagramm');

    c_plline(4, x, y);

    c_plend;
  end;

begin
  PrintBuffer;
  main;
end.
