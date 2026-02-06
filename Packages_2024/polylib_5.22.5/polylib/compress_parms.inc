{$IFDEF read_interface}


procedure Equalities_integerSolution(Eqs: PMatrix; sol: PPMatrix); cdecl; external libpolylib;
procedure Equalities_validityLattice(Eqs: PMatrix; a: longint; vl: PPMatrix); cdecl; external libpolylib;
procedure Equalities_intModBasis(B: PMatrix; C: PMatrix; d: PMatrix; imb: PPMatrix); cdecl; external libpolylib;
procedure Constraints_fullDimensionize(M: PPMatrix; C: PPMatrix; VL: PPMatrix; Eqs: PPMatrix; ParmEqs: PPMatrix;
  elimVars: PPdword; elimParms: PPdword; maxRays: longint); cdecl; external libpolylib;

function Constraints_Remove_parm_eqs(M: PPMatrix; Ctxt: PPMatrix; renderSpace: longint; elimParms: PPdword): PMatrix; cdecl; external libpolylib;
procedure Constraints_removeElimCols(M: PMatrix; nbVars: dword; elimParms: Pdword; newM: PPMatrix); cdecl; external libpolylib;
procedure Lattice_extractSubLattice(lat: PMatrix; k: dword; subLat: PPMatrix); cdecl; external libpolylib;
function Polyhedron_Remove_parm_eqs(P: PPPolyhedron; C: PPPolyhedron; renderSpace: longint; elimParms: PPdword; maxRays: longint): PPolyhedron; cdecl; external libpolylib;

function int_ker(M: PMatrix): PMatrix; cdecl; external libpolylib;
function full_dimensionize(M: PMatrix; nb_parms: longint; Validity_Lattice: PPMatrix): PMatrix; cdecl; external libpolylib;
function affine_periods(M: PMatrix; d: PMatrix): PMatrix; cdecl; external libpolylib;
function int_mod_basis(Bp: PMatrix; Cp: PMatrix; d: PMatrix): PMatrix; cdecl; external libpolylib;
function compress_parms(E: PMatrix; nb_parms: longint): PMatrix; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
