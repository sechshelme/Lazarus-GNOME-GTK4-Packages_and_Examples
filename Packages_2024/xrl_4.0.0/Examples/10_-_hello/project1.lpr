program project1;

uses
  fp_xraylib;

  procedure main;
  const
    energy = 10.0;
    Z = 26;
  var
    atomic_weight, total: double;
  begin
    atomic_weight := AtomicWeight(Z, nil);
    WriteLn('Eisen (Z=,', Z, ') hat ein Atomgewicht von: ', atomic_weight: 4: 2, ' g/mol');
    total := CS_Total(Z, energy, nil);
    WriteLn('Totaler Wirkungsquerschnitt bei ', energy:4:2, ' keV: ', total:4:2, ' cm^2/g');
  end;

begin
  main;
end.
