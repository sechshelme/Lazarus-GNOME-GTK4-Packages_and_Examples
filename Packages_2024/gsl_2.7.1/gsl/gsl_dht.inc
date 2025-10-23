{$IFDEF read_interface}


type
  Tgsl_dht_struct = record
    size: Tsize_t;
    nu: Tdouble;
    xmax: Tdouble;
    kmax: Tdouble;
    j: Pdouble;
    Jjj: Pdouble;
    J2: Pdouble;
  end;
  Pgsl_dht_struct = ^Tgsl_dht_struct;

  Tgsl_dht = Tgsl_dht_struct;
  Pgsl_dht = ^Tgsl_dht;

function gsl_dht_alloc(size: Tsize_t): Pgsl_dht; cdecl; external libgsl;
function gsl_dht_new(size: Tsize_t; nu: Tdouble; xmax: Tdouble): Pgsl_dht; cdecl; external libgsl;
function gsl_dht_init(t: Pgsl_dht; nu: Tdouble; xmax: Tdouble): longint; cdecl; external libgsl;
function gsl_dht_x_sample(t: Pgsl_dht; n: longint): Tdouble; cdecl; external libgsl;
function gsl_dht_k_sample(t: Pgsl_dht; n: longint): Tdouble; cdecl; external libgsl;
procedure gsl_dht_free(t: Pgsl_dht); cdecl; external libgsl;
function gsl_dht_apply(t: Pgsl_dht; f_in: Pdouble; f_out: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:52:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
