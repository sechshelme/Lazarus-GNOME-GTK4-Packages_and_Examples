program project1;

uses
  fp_gmp,
  fp_mpfr,
  fp_mpfi;

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
  var
    a, b, result: Tmpfi;
  begin
    mpfi_init(@a);
    mpfi_init(@b);
    mpfi_init(@result);

    mpfi_set_d(@a, 1.0);
    mpfi_set_ui(@b, 2);
    mpfi_intersect(@a, @a, @b);

    mpfi_set_d(@b, 2.0);
    mpfi_set_d(@result, 3.0);
    mpfi_intersect(@b, @b, @result);

    mpfi_add(@result, @a, @b);

    mpfr_fprintf(stdout, 'Intervall a:'#10);
    mpfi_out_str(stdout, 10, 0, @a);
    mpfr_fprintf(stdout, #10);

    mpfr_fprintf(stdout, 'Intervall b:'#10);
    mpfi_out_str(stdout, 10, 0, @b);
    mpfr_fprintf(stdout, #10);

    mpfr_fprintf(stdout, 'Summe a + b:'#10);
    mpfi_out_str(stdout, 10, 0, @result);
    mpfr_fprintf(stdout, #10);

    mpfi_clear(@a);
    mpfi_clear(@b);
    mpfi_clear(@result);
  end;

begin
  main;
end.
