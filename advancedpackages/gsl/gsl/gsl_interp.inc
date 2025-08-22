{$IFDEF read_interface}


type
  Tgsl_interp_accel = record
    cache: Tsize_t;
    miss_count: Tsize_t;
    hit_count: Tsize_t;
  end;
  Pgsl_interp_accel = ^Tgsl_interp_accel;

  Tgsl_interp_type = record
    name: pchar;
    min_size: dword;
    alloc: function(size: Tsize_t): pointer; cdecl;
    init: function(para1: pointer; xa: Pdouble; ya: Pdouble; size: Tsize_t): longint; cdecl;
    eval: function(para1: pointer; xa: Pdouble; ya: Pdouble; size: Tsize_t; x: Tdouble;
      para6: Pgsl_interp_accel; y: Pdouble): longint; cdecl;
    eval_deriv: function(para1: pointer; xa: Pdouble; ya: Pdouble; size: Tsize_t; x: Tdouble;
      para6: Pgsl_interp_accel; y_p: Pdouble): longint; cdecl;
    eval_deriv2: function(para1: pointer; xa: Pdouble; ya: Pdouble; size: Tsize_t; x: Tdouble;
      para6: Pgsl_interp_accel; y_pp: Pdouble): longint; cdecl;
    eval_integ: function(para1: pointer; xa: Pdouble; ya: Pdouble; size: Tsize_t; para5: Pgsl_interp_accel;
      a: Tdouble; b: Tdouble; result: Pdouble): longint; cdecl;
    free: procedure(para1: pointer); cdecl;
  end;
  Pgsl_interp_type = ^Tgsl_interp_type;

  Tgsl_interp = record
    _type: Pgsl_interp_type;
    xmin: Tdouble;
    xmax: Tdouble;
    size: Tsize_t;
    state: pointer;
  end;
  Pgsl_interp = ^Tgsl_interp;

var
  gsl_interp_linear: Pgsl_interp_type; cvar;external libgsl;
  gsl_interp_polynomial: Pgsl_interp_type; cvar;external libgsl;
  gsl_interp_cspline: Pgsl_interp_type; cvar;external libgsl;
  gsl_interp_cspline_periodic: Pgsl_interp_type; cvar;external libgsl;
  gsl_interp_akima: Pgsl_interp_type; cvar;external libgsl;
  gsl_interp_akima_periodic: Pgsl_interp_type; cvar;external libgsl;
  gsl_interp_steffen: Pgsl_interp_type; cvar;external libgsl;

function gsl_interp_accel_alloc: Pgsl_interp_accel; cdecl; external libgsl;
function gsl_interp_accel_reset(a: Pgsl_interp_accel): longint; cdecl; external libgsl;
procedure gsl_interp_accel_free(a: Pgsl_interp_accel); cdecl; external libgsl;
function gsl_interp_alloc(T: Pgsl_interp_type; n: Tsize_t): Pgsl_interp; cdecl; external libgsl;
function gsl_interp_init(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; size: Tsize_t): longint; cdecl; external libgsl;
function gsl_interp_name(interp: Pgsl_interp): pchar; cdecl; external libgsl;
function gsl_interp_min_size(interp: Pgsl_interp): dword; cdecl; external libgsl;
function gsl_interp_type_min_size(T: Pgsl_interp_type): dword; cdecl; external libgsl;
function gsl_interp_eval_e(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; x: Tdouble; a: Pgsl_interp_accel;
  y: Pdouble): longint; cdecl; external libgsl;
function gsl_interp_eval(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; x: Tdouble; a: Pgsl_interp_accel): Tdouble; cdecl; external libgsl;
function gsl_interp_eval_deriv_e(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; x: Tdouble; a: Pgsl_interp_accel;
  d: Pdouble): longint; cdecl; external libgsl;
function gsl_interp_eval_deriv(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; x: Tdouble; a: Pgsl_interp_accel): Tdouble; cdecl; external libgsl;
function gsl_interp_eval_deriv2_e(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; x: Tdouble; a: Pgsl_interp_accel;
  d2: Pdouble): longint; cdecl; external libgsl;
function gsl_interp_eval_deriv2(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; x: Tdouble; a: Pgsl_interp_accel): Tdouble; cdecl; external libgsl;
function gsl_interp_eval_integ_e(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; a: Tdouble; b: Tdouble;
  acc: Pgsl_interp_accel; result: Pdouble): longint; cdecl; external libgsl;
function gsl_interp_eval_integ(obj: Pgsl_interp; xa: Pdouble; ya: Pdouble; a: Tdouble; b: Tdouble;
  acc: Pgsl_interp_accel): Tdouble; cdecl; external libgsl;
procedure gsl_interp_free(interp: Pgsl_interp); cdecl; external libgsl;
function gsl_interp_bsearch(x_array: Pdouble; x: Tdouble; index_lo: Tsize_t; index_hi: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_interp_accel_find(a: Pgsl_interp_accel; x_array: Pdouble; size: Tsize_t; x: Tdouble): Tsize_t; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:10:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
