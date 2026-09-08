program project1;

uses
  xraylib_lines,
  xraylib_error,
  xraylib_defs,
  xraylib,
  xraylib_auger,
  xraylib_aux,
  xraylib_crystal_diffraction,
  xraylib_deprecated,
  xraylib_nist_compounds,
  xraylib_parser,
  xraylib_radionuclides,
  xraylib_shells,

  fp_xrl;

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
