program project1;
uses
csa,
disptab,
drivers,
nn,
pdf,
plConfig,
plevent,
plplot,
plplotP,
plstrm,
qsastime, fp_plplot;

procedure main;
begin
  PLFLT x[] = {0.0, 1.0, 2.0, 3.0};
  PLFLT y[] = {0.0, 1.0, 4.0, 9.0};

  // 1. Initialisierung
  plinit();

  // 2. Fenster und Achsen definieren (kryptische Syntax)
  // env=1 (Standard-Box), xy=-1 (Standard-Labels)
  plenv(0.0, 3.0, 0.0, 9.0, 0, 1);
  pllab("X-Achse", "Y-Achse", "Mein PLplot-Diagramm");

  // 3. Die Linie zeichnen
  plline(4, x, y);

  // 4. Beenden
  plend();
  return 0;

end;

begin
    main;
end.

