{$IFDEF read_interface}


function constraintsView(P: PPolyhedron): PMatrix; cdecl; external libpolylib;
procedure constraintsView_Free(M: PMatrix); cdecl; external libpolylib;
procedure split_constraints(M: PMatrix; Eqs: PPMatrix; Ineqs: PPMatrix); cdecl; external libpolylib;
function Identity_Matrix(dim: dword): PMatrix; cdecl; external libpolylib;
procedure Matrix_identity(dim: dword; I: PPMatrix); cdecl; external libpolylib;
procedure mtransformation_inverse(transf: PMatrix; inv: PPMatrix; g: PValue); cdecl; external libpolylib;
procedure mpolyhedron_simplify(polyh: PMatrix); cdecl; external libpolylib;
procedure mpolyhedron_inflate(polyh: PMatrix; nb_parms: dword); cdecl; external libpolylib;
procedure mpolyhedron_deflate(polyh: PMatrix; nb_parms: dword); cdecl; external libpolylib;
procedure eliminate_var_with_constr(Eliminator: PMatrix; eliminator_row: dword; Victim: PMatrix; victim_row: dword; var_to_elim: dword); cdecl; external libpolylib;
procedure mpolyhedron_compress_last_vars(M: PMatrix; compression: PMatrix); cdecl; external libpolylib;

procedure Constraints_compressLastVars(a: PMatrix; b: PMatrix);
function Constraints_eliminateFirstVars(a: PMatrix; b: PMatrix): DWord;

function mpolyhedron_eliminate_first_variables(Eqs: PMatrix; Ineqs: PMatrix): dword; cdecl; external libpolylib;
procedure Matrix_subMatrix(M: PMatrix; sr: dword; sc: dword; nbR: dword; nbC: dword; sub: PPMatrix); cdecl; external libpolylib;
procedure Matrix_clone(M: PMatrix; Cl: PPMatrix); cdecl; external libpolylib;
procedure Matrix_copySubMatrix(M1: PMatrix; sr1: dword; sc1: dword; nbR: dword; nbC: dword; M2: PMatrix; sr2: dword; sc2: dword); cdecl; external libpolylib;
procedure Matrix_oppose(M: PMatrix); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


procedure Constraints_compressLastVars(a: PMatrix; b: PMatrix);
begin
  mpolyhedron_compress_last_vars(a, b);
end;

function Constraints_eliminateFirstVars(a: PMatrix; b: PMatrix): DWord;
begin
  Constraints_eliminateFirstVars := mpolyhedron_eliminate_first_variables(a, b);
end;


{$ENDIF read_implementation}
