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


procedure main;
var
  t, s, u: Tmpfr_t;
  i: Integer;
//  t, s, u: Tmpfr_ptr;
begin
  WriteLn('sizeof Pointer: ',SizeOf(Pointer));
  WriteLn('sizeof Tmpfr_ptr: ',SizeOf(Tmpfr_ptr));
//  unsigned int i;
//  mpfr_t s, t, u;

  // Variablen mit 200-Bit Genauigkeit initialisieren
  WriteLn(111111111);
  mpfr_init2(t, 200);
  WriteLn(111111111);
  mpfr_set_d(t, 1.0, MPFR_RNDD); // t = 1
  mpfr_init2(s, 200);
  mpfr_set_d(s, 1.0, MPFR_RNDD); // s = 1 (Summe)
  mpfr_init2(u, 200);


  // Summe berechnen: s = 1 + 1/1! + 1/2! + ... + 1/100!
  for i := 1 to 99 do begin
      WriteLn(111111111);
      mpfr_mul_ui(t, t, i, MPFR_RNDU); // t = t * i (Fakultät-Wert)
      mpfr_set_d(u, 1.0, MPFR_RNDD);  // u = 1.0
      WriteLn(111111111);
      mpfr_div(u, u, t, MPFR_RNDD);   // u = 1 / t
      WriteLn(111111111);
      mpfr_add(s, s, u, MPFR_RNDD);   // s = s + u
  end;

  // Ergebnis ausgeben
  WriteLn('Summe ist:');
//  mpfr_out_str(stdout, 10, 0, s, MPFR_RNDD);
  WriteLn;

  // Speicher freigeben
  mpfr_clear(s);
  mpfr_clear(t);
  mpfr_clear(u);
  mpfr_free_cache();
end;

begin
  main;
end.

