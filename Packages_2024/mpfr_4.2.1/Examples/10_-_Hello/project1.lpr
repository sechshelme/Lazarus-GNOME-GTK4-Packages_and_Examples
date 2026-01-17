program project1;

uses
  fp_gmp,
  fp_mpfr;

const
  {$IFDEF Linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

var
  stdout: PFILE; cvar;external libc;

  procedure main;
  const
    Digits = 40;
  var
    i: integer;
    t, s, u: Tmpfr;
  begin
    mpfr_init2(@t, Digits);
    mpfr_set_d(@t, 1.0, MPFR_RNDD);
    mpfr_init2(@s, Digits);
    mpfr_set_d(@s, 1.0, MPFR_RNDD);
    mpfr_init2(@u, Digits);

    for i := 1 to 99 do begin
      mpfr_mul_ui(@t, @t, i, MPFR_RNDU);
      mpfr_set_d(@u, 1.0, MPFR_RNDD);
      mpfr_div(@u, @u, @t, MPFR_RNDD);
      mpfr_add(@s, @s, @u, MPFR_RNDD);
    end;

    mpfr_fprintf(stdout, 'Summe ist:'#10);
    mpfr_out_str(stdout, 10, Digits, @s, MPFR_RNDD);
    mpfr_fprintf(stdout, #10);

    mpfr_fprintf(stdout, 'Berechnung ist fertig !');
    mpfr_fprintf(stdout, #10);

    mpfr_clear(@s);
    mpfr_clear(@t);
    mpfr_clear(@u);
    mpfr_free_cache;
  end;

begin
  main;
end.
