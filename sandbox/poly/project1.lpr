program project1;

uses
  types,
  arithmetique,
  alpha,
  arithmetic_errors,
  compress_parms,
  ehrhart,
  errormsg,
  eval_ehrhart,
  ext_ehrhart,
  homogenization,
  Lattice,
  Matop,
  matrix,
  matrix_addon,
  matrix_permutations,
  NormalForms,
  param,
  polyhedron,
  polyparam,
  ranking,
  SolveDio,
  vector,
  Zpolyhedron,

  fp_polylib64;


  procedure main;
  var
    A_mat: Pmatrix;
  begin
      A_mat := Matrix_Alloc(6, 5); // 6 Zeilen, 5 Spalten (0/1, x, y, z, konst)

  end;

begin
  main;
end.
