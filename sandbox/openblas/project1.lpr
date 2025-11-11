program project1;
uses
  fp_openblas64;

  procedure main;
  var
    A: array[0..8] of single = (
      0.11, 0.21, 0.12,
      0.15, 0.13, 0.17,
      0.22, 0.13, 0.23);

    B: array[0..8] of single = (
      1011, 1021, 1018,
      1031, 1012, 1021,
      1022, 1032, 1015);

    C: array[0..8] of single = (
      0, 0, 0,
      0, 0, 0,
      0, 0, 0);

    var
    i, j: integer;
  begin
    cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, 3, 3, 3, 1.0, A, 3, B, 3, 0.0, C, 3);

    for i := 0 to 2 do begin
      Write('[ ');
      for j := 0 to 2 do begin
        Write(C[i * 3 + j]: 4: 2, ' ');
      end;
      WriteLn(']');
    end;
  end;

begin
  main;
end.
