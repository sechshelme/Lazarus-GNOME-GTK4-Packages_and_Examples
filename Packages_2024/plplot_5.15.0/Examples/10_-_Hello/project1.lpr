program project1;

// sudo apt install libplplot-dev

// sudo apt install plplot-driver-cairo

// In dem Auswahldialog kann "w" gedrückt werden für eine Anzeige


uses
  fp_plplot;

  procedure main;
  const
    x: array [0..3] of TPLFLT = (0.0, 1.0, 2.0, 3.0);
    y: array [0..3] of TPLFLT = (0.0, 1.0, 4.0, 9.0);
  begin
    WriteLn(#10'"W" drücken für grafische Ausgabe !'#10);
    c_plspage(0, 0, 800, 600, 0, 0);
    c_plinit;

    c_plenv(0.0, 3.0, 0.0, 9.0, 0, 1);

    c_pllab('X-Achse', 'Y-Achse', 'Mein PLplot-Diagramm');

    c_plline(4, x, y);

    c_plend;
  end;

begin
  main;
  WriteLn('--- ende ---');
end.
