program project1;
uses
fp_mpfr;
// mpfi ???

const
  libc='c';
var
  stdin: PFILE; cvar;external libc;
  stdout: PFILE; cvar;external libc;
  stderr: PFILE; cvar;external libc;

  function putchar(__c: longint): longint; cdecl; external libc;



procedure main;
var
  i: Integer;
  t, s, u: Tmpfr;
begin

  // Variablen mit 200-Bit Genauigkeit initialisieren
  mpfr_init2(@t, 200);
  mpfr_set_d(@t, 1.0, MPFR_RNDD); // t = 1
  mpfr_init2(@s, 200);
  mpfr_set_d(@s, 1.0, MPFR_RNDD); // s = 1 (Summe)
  mpfr_init2(@u, 200);


  // Summe berechnen: s = 1 + 1/1! + 1/2! + ... + 1/100!
  for i := 1 to 99 do begin
      mpfr_mul_ui(@t, @t, i, MPFR_RNDU); // t = t * i (Fakultät-Wert)
      mpfr_set_d(@u, 1.0, MPFR_RNDD);  // u = 1.0
      mpfr_div(@u, @u, @t, MPFR_RNDD);   // u = 1 / t
      mpfr_add(@s, @s, @u, MPFR_RNDD);   // s = s + u
  end;

  // Ergebnis ausgeben
  WriteLn('Summe ist:');
      mpfr_out_str(stdout, 10, 0, @s, MPFR_RNDD);
      putchar(10);

  //    mpfr_out_str(stdout, 10, 0, @s, MPFR_RNDD);
//   mpfr_get_sj(nil,0);
//  mpfr_fprintf(stdout, 'blabla');
  WriteLn;

  // Speicher freigeben
  mpfr_clear(@s);
  mpfr_clear(@t);
  mpfr_clear(@u);
  mpfr_free_cache;
end;

begin
  main;
end.

