program project1;
uses
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
  a, b, result: Tmpfi;
begin
//  mpfi_t a, b, result;
     mpfi_init(@a);
     mpfi_init(@b);
     mpfi_init(@result);

     // Setze Intervall a auf [1.0, 2.0]
     mpfi_set_d(@a, 1.0);
     mpfi_set_ui(@b, 2);
     mpfi_intersect(@a, @a, @b);

     // Setze Intervall b auf [2.0, 3.0]
     mpfi_set_d(@b, 2.0);
     mpfi_set_d(@result, 3.0);
     mpfi_intersect(@b, @b, @result);

     // Ergebnis berechnen: c = a + b
     mpfi_add(@result, @a, @b);

     // Ausgabe des Ergebnisses
     WriteLn('Intervall a: ');
     mpfi_out_str(stdout, 10, 0, @a);
     putchar(10);

     WriteLn('Intervall b: ');
     mpfi_out_str(stdout, 10, 0, @b);
     putchar(10);

     WriteLn('Summe a + b: ');
     mpfi_out_str(stdout, 10, 0, @result);
     putchar(10);

     // Speicher freigeben
     mpfi_clear(@a);
     mpfi_clear(@b);
     mpfi_clear(@result);
end;

begin
  main;
end.

