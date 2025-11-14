program project1;
uses
fp_gmp,
fp_mpfr,
fp_mpc;

const
  libc='c';
var
  stdin: PFILE; cvar;external libc;
  stdout: PFILE; cvar;external libc;
  stderr: PFILE; cvar;external libc;

  function putchar(__c: longint): longint; cdecl; external libc;



procedure main;
var
  a: Tmpc;
begin
  // Komplexe Zahl anlegen (Standardpräzision: 128 bit)
//  mpc_t a;
  mpc_init2(@a, 128);

  // Wert setzen: z = 1.5 + 2.3i
  mpc_set_d_d(@a, 1.5, 2.3, MPC_RNDNN);

  // z zum Quadrat berechnen: a = a^2
  mpc_pow_ui(@a, @a, 2, MPC_RNDNN);

  // Ausgabe
  mpc_out_str(stdout, 10, 0, @a, MPC_RNDNN);
  putchar(10);

  mpc_clear(@a);
end;

begin
  main;
end.

