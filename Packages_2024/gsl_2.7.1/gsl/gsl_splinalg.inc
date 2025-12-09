{$IFDEF read_interface}


type
  Tgsl_splinalg_itersolve_type = record
    name: pchar;
    alloc: function(n: Tsize_t; m: Tsize_t): pointer; cdecl;
    iterate: function(A: Pgsl_spmatrix; b: Pgsl_vector; tol: double; x: Pgsl_vector; para5: pointer): longint; cdecl;
    normr: function(para1: pointer): double; cdecl;
    free: procedure(para1: pointer); cdecl;
  end;
  Pgsl_splinalg_itersolve_type = ^Tgsl_splinalg_itersolve_type;

  Tgsl_splinalg_itersolve = record
    _type: Pgsl_splinalg_itersolve_type;
    normr: double;
    state: pointer;
  end;
  Pgsl_splinalg_itersolve = ^Tgsl_splinalg_itersolve;

var
  gsl_splinalg_itersolve_gmres: Pgsl_splinalg_itersolve_type; cvar;external libgsl;

function gsl_splinalg_itersolve_alloc(T: Pgsl_splinalg_itersolve_type; n: Tsize_t; m: Tsize_t): Pgsl_splinalg_itersolve; cdecl; external libgsl;
procedure gsl_splinalg_itersolve_free(w: Pgsl_splinalg_itersolve); cdecl; external libgsl;
function gsl_splinalg_itersolve_name(w: Pgsl_splinalg_itersolve): pchar; cdecl; external libgsl;
function gsl_splinalg_itersolve_iterate(A: Pgsl_spmatrix; b: Pgsl_vector; tol: double; x: Pgsl_vector; w: Pgsl_splinalg_itersolve): longint; cdecl; external libgsl;
function gsl_splinalg_itersolve_normr(w: Pgsl_splinalg_itersolve): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
