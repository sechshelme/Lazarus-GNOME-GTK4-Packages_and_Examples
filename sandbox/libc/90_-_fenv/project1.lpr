program project1;

uses
  clib,
  fp_stdio,
  fp_math,
  fp_fenv,
  fp_complex;

var
  f1, f2: single;

  procedure OutRound;
  begin
    WriteLn('Round Test');
    WriteLn(Round(1.5));
    WriteLn(Round(2.5));
    WriteLn(Round(3.5));
    WriteLn(Round(4.5));
    WriteLn();

  end;

  procedure printCos;
  var
    x: double = 0.0;
    y: double = 0.0;
  begin
    WriteLn(system.cos(pi): 4: 2);
    WriteLn(system.sin(pi): 4: 2);
    WriteLn();

    WriteLn(cos(pi): 4: 2);
    WriteLn(sin(pi): 4: 2);
    WriteLn();

    sincos(pi, @x, @y);
    WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2);
    sincos(pi / 2, @x, @y);
    WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2);
  end;

  procedure printComplex;
  var
    res, z: TComplexDouble;
  begin
    z := CMPLX(3, 2);
    res := cacos(z);

    printf('cacos(%f + %fi) = %f + %fi'#10, creal(z), cimag(z), creal(res), cimag(res));

  end;

  procedure main;
  var
    env: Tfenv_t;
  begin
    printComplex;
    printCos;
    WriteLn();

    OutRound;

    fegetenv(@env);

    fesetround(FE_TOWARDZERO);

    OutRound;

    //    feraiseexcept(FE_DIVBYZERO);
    ReadLn(f1);
    ReadLn(f2);
    WriteLn(f1 / f2);


    if fetestexcept(FE_DIVBYZERO) <> 0 then begin
      printf('Division durch Null Ausnahme wurde ausgelöst.'#10);
    end;

    fesetenv(@env);

    if fetestexcept(FE_DIVBYZERO) = 0 then begin
      printf('Ursprüngliche Umgebung wiederhergestellt, Ausnahme gelöscht.'#10);
    end;
    if fegetround <> FE_TOWARDZERO then begin
      printf('Rundungsmodus wieder zurückgesetzt.'#10);
    end;
  end;

begin
  main;
end.
