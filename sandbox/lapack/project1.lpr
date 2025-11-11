program project1;

uses
  fp_lapacke;

  procedure main;
  const
    arrSize = 3;
  var
    i: integer;
    info: Tlapack_int;
    n: Tlapack_int = arrSize;
    lda: Tlapack_int = arrSize;
    ldb: Tlapack_int = arrSize;
    nrhs: Tlapack_int = 1;
    A: array[0..arrSize * arrSize - 1] of double = (
      1.0, 2.0, 3.0,
      0.0, 1.0, 4.0,
      5.0, 6.0, 0.0);
    ipiv: array[0..arrSize - 1] of Tlapack_int;
    b: array[0..arrSize - 1] of double = (14.0, 13.0, 23.0);
  begin
    info := LAPACKE_dgesv(LAPACK_COL_MAJOR, n, nrhs, A, lda, ipiv, b, ldb);
    if info = 0 then begin
      Write('Lösung für x:'#10'  [ ');
    end;
    for i := 0 to arrSize - 1 do begin
      Write(b[i]: 4: 2, '  ');
    end;
    WriteLn(' ]');
  end;

begin
  main;
end.
