program project1;

uses
  fp_suitesparse;

  procedure main;
  const
    SIZE: integer = 3;

    Ap: array[0..3] of integer = (0, 2, 4, 5);
    Ai: array[0..4] of integer = (0, 1, 0, 2, 2);
    Ax: array[0..4] of double = (1.0, 2.0, 3.0, 4.0, 5.0);
    b: array[0..2] of double = (5.0, 6.0, 7.0);
  var
    x: array[0..2] of double;
  var
    C: Tklu_common;
    S: Pklu_symbolic;
    N: Pklu_numeric;
    i: integer;
    status: longint;
  begin
    klu_defaults(@C);

    S := klu_analyze(SIZE, Ap, Ai, @C);
    if S = nil then  begin
      WriteLn('KLU Analyse fehlgeschlagen');
      Exit;
    end;

    N := klu_factor(Ap, Ai, Ax, S, @C);
    if N = nil then begin
      WriteLn('KLU Faktorisierung fehlgeschlagen');
      klu_free_symbolic(@S, @C);
      Exit;
    end;

    for  i := 0 to SIZE - 1 do begin
      x[i] := b[i];
    end;

    status := klu_solve(S, N, SIZE, 1, x, @C);
    if status <> 1 then begin
      WriteLn('KLU Lösung fehlgeschlagen');
      klu_free_numeric(@N, @C);
      klu_free_symbolic(@S, @C);
      Exit;;
    end;

    WriteLn('Lösung x:');
    for  i := 0 to SIZE - 1 do begin
      WriteLn('x[', i, '] = ', x[i]: 4: 2);
    end;

    klu_free_numeric(@N, @C);
    klu_free_symbolic(@S, @C);
  end;

begin
  main;
end.
