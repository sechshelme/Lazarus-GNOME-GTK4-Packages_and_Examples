program project1;


uses
  fp_cglm;

  procedure printMatrix(const m: Tmat4);
  var
    x, y: integer;
  begin
    for x := 0 to 3 do begin
      for y := 0 to 3 do begin
        Write('[',m[x,y]:4:2,'] ');
      end;
      WriteLn();
    end;
    WriteLn();
  end;

  procedure main;
  var
    m: Tmat4 = ((1, 0, 0, 0), (0, 1, 0, 0), (0, 0, 1, 0), (0, 0, 0, 1));
  begin
    printMatrix(m);
//    glmc_mat4_scale(m, 2);
    glmc_scale_uni(m,2);
    printMatrix(m);
  end;

begin
  main;
end.
