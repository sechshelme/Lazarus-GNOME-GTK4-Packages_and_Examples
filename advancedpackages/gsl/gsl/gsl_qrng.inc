{$IFDEF read_interface}


type
  Tgsl_qrng_type = record
    name: pchar;
    max_dimension: dword;
    state_size: function(dimension: dword): Tsize_t; cdecl;
    init_state: function(state: pointer; dimension: dword): longint; cdecl;
    get: function(state: pointer; dimension: dword; x: Pdouble): longint; cdecl;
  end;
  Pgsl_qrng_type = ^Tgsl_qrng_type;

  Tgsl_qrng = record
    _type: Pgsl_qrng_type;
    dimension: dword;
    state_size: Tsize_t;
    state: pointer;
  end;
  Pgsl_qrng = ^Tgsl_qrng;

var
  gsl_qrng_niederreiter_2: Pgsl_qrng_type; cvar;external libgsl;
  gsl_qrng_sobol: Pgsl_qrng_type; cvar;external libgsl;
  gsl_qrng_halton: Pgsl_qrng_type; cvar;external libgsl;
  gsl_qrng_reversehalton: Pgsl_qrng_type; cvar;external libgsl;

function gsl_qrng_alloc(T: Pgsl_qrng_type; dimension: dword): Pgsl_qrng; cdecl; external libgsl;
function gsl_qrng_memcpy(dest: Pgsl_qrng; src: Pgsl_qrng): longint; cdecl; external libgsl;
function gsl_qrng_clone(q: Pgsl_qrng): Pgsl_qrng; cdecl; external libgsl;
procedure gsl_qrng_free(q: Pgsl_qrng); cdecl; external libgsl;
procedure gsl_qrng_init(q: Pgsl_qrng); cdecl; external libgsl;
function gsl_qrng_name(q: Pgsl_qrng): pchar; cdecl; external libgsl;
function gsl_qrng_size(q: Pgsl_qrng): Tsize_t; cdecl; external libgsl;
function gsl_qrng_state(q: Pgsl_qrng): pointer; cdecl; external libgsl;
function gsl_qrng_get(q: Pgsl_qrng; x: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
