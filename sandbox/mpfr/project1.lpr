program project1;
uses
fp_mpfr;

procedure main;
begin
  unsigned int i;
  mpfr_t s, t, u;

  // Variablen mit 200-Bit Genauigkeit initialisieren
  mpfr_init2(t, 200);
  mpfr_set_d(t, 1.0, MPFR_RNDD); // t = 1
  mpfr_init2(s, 200);
  mpfr_set_d(s, 1.0, MPFR_RNDD); // s = 1 (Summe)
  mpfr_init2(u, 200);

  // Summe berechnen: s = 1 + 1/1! + 1/2! + ... + 1/100!
  for (i = 1; i <= 100; i++) {
      mpfr_mul_ui(t, t, i, MPFR_RNDU); // t = t * i (Fakultät-Wert)
      mpfr_set_d(u, 1.0, MPFR_RNDD);  // u = 1.0
      mpfr_div(u, u, t, MPFR_RNDD);   // u = 1 / t
      mpfr_add(s, s, u, MPFR_RNDD);   // s = s + u
  }

  // Ergebnis ausgeben
  printf("Summe ist ");
  mpfr_out_str(stdout, 10, 0, s, MPFR_RNDD);
  putchar('\n');

  // Speicher freigeben
  mpfr_clear(s);
  mpfr_clear(t);
  mpfr_clear(u);
  mpfr_free_cache();
end;

begin
  main;
end.

