program project1;

uses
  fp_gmp,
  fp_mpfr,
  fp_mpc;

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
    a: Tmpc;
  begin
    mpc_init2(@a, 128);

    mpc_set_d_d(@a, 1.5, 2.3, MPC_RNDNN);
    mpc_pow_ui(@a, @a, 2, MPC_RNDNN);

    mpc_out_str(stdout, 10, 0, @a, MPC_RNDNN);
    mpfr_fprintf(stdout, #10);

    mpc_clear(@a);
  end;

begin
  main;
end.
