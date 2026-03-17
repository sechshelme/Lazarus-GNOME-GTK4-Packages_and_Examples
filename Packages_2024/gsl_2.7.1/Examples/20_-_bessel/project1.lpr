program project1;

uses
  fp_gsl;

  procedure main;
  var
    x, y: double;
  begin
    x := 0.1;
    while x < 200.0 do begin
      y := gsl_sf_bessel_J0(x);
      WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2);
      x += 0.1;
    end;
  end;

begin
  main;
end.
