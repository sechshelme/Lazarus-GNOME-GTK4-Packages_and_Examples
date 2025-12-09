{$IFDEF read_interface}


type
  Tgsl_spline = record
    interp: Pgsl_interp;
    x: Pdouble;
    y: Pdouble;
    size: Tsize_t;
  end;
  Pgsl_spline = ^Tgsl_spline;

function gsl_spline_alloc(T: Pgsl_interp_type; size: Tsize_t): Pgsl_spline; cdecl; external libgsl;
function gsl_spline_init(spline: Pgsl_spline; xa: Pdouble; ya: Pdouble; size: Tsize_t): longint; cdecl; external libgsl;
function gsl_spline_name(spline: Pgsl_spline): pchar; cdecl; external libgsl;
function gsl_spline_min_size(spline: Pgsl_spline): dword; cdecl; external libgsl;
function gsl_spline_eval_e(spline: Pgsl_spline; x: double; a: Pgsl_interp_accel; y: Pdouble): longint; cdecl; external libgsl;
function gsl_spline_eval(spline: Pgsl_spline; x: double; a: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline_eval_deriv_e(spline: Pgsl_spline; x: double; a: Pgsl_interp_accel; y: Pdouble): longint; cdecl; external libgsl;
function gsl_spline_eval_deriv(spline: Pgsl_spline; x: double; a: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline_eval_deriv2_e(spline: Pgsl_spline; x: double; a: Pgsl_interp_accel; y: Pdouble): longint; cdecl; external libgsl;
function gsl_spline_eval_deriv2(spline: Pgsl_spline; x: double; a: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline_eval_integ_e(spline: Pgsl_spline; a: double; b: double; acc: Pgsl_interp_accel; y: Pdouble): longint; cdecl; external libgsl;
function gsl_spline_eval_integ(spline: Pgsl_spline; a: double; b: double; acc: Pgsl_interp_accel): double; cdecl; external libgsl;
procedure gsl_spline_free(spline: Pgsl_spline); cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
