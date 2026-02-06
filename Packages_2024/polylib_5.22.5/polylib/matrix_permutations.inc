{$IFDEF read_interface}


function nb_bits(x: qword): dword; cdecl; external libpolylib;
function permutation_inverse(perm: Pdword; nb_elems: dword): Pdword; cdecl; external libpolylib;
function mtransformation_permute(transf: PMatrix; permutation: Pdword): PMatrix; cdecl; external libpolylib;
function mpolyhedron_permute(polyh: PMatrix; permutation: Pdword): PMatrix; cdecl; external libpolylib;
procedure Constraints_permute(C: PMatrix; perm: Pdword; Cp: PPMatrix); cdecl; external libpolylib;
function eliminable_vars(Eqs: PMatrix; start: dword; end_: dword): qword; cdecl; external libpolylib;
function find_a_permutation(Eqs: PMatrix; nb_parms: dword): Pdword; cdecl; external libpolylib;
function permutation_for_full_dim2(vars_to_keep: Pdword; nb_keep: dword; nb_vars_parms: dword; nb_parms: dword): Pdword; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
