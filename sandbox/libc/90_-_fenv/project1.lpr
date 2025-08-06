program project1;

uses
  clib,
  fp_stdio,
  fp_math,
  fp_fenv;

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

//function c_cos(d: Double): Double; cdecl; external libm name 'cos';
//function c_sin(d: Double): Double; cdecl; external libm name 'sin';
//function c_sinf(d: Single): Single; cdecl; external libm name 'sinf';

  procedure main;
  var
    env: Tfenv_t;
  begin
    WriteLn(system.cos(pi):4:2);
    WriteLn(system.sin(pi):4:2);
    WriteLn();

    WriteLn(cos(pi):4:2);
    WriteLn(sin(pi):4:2);
    WriteLn();

//    WriteLn(c_cos(pi):4:2);
//    WriteLn(c_sin(pi):4:2);
    WriteLn();


//    WriteLn(c_sinf(pi):4:2);

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
