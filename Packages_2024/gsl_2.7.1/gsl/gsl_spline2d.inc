{$IFDEF read_interface}


type
  Tgsl_spline2d = record
    interp_object: Tgsl_interp2d;
    xarr: Pdouble;
    yarr: Pdouble;
    zarr: Pdouble;
  end;
  Pgsl_spline2d = ^Tgsl_spline2d;

function gsl_spline2d_alloc(T: Pgsl_interp2d_type; xsize: Tsize_t; ysize: Tsize_t): Pgsl_spline2d; cdecl; external libgsl;
function gsl_spline2d_init(interp: Pgsl_spline2d; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t;
  ysize: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_spline2d_free(interp: Pgsl_spline2d); cdecl; external libgsl;
function gsl_spline2d_eval(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline2d_eval_e(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel;
  z: Pdouble): longint; cdecl; external libgsl;
function gsl_spline2d_eval_extrap(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline2d_eval_extrap_e(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel;
  z: Pdouble): longint; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_x(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_x_e(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel;
  z: Pdouble): longint; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_y(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_y_e(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel;
  z: Pdouble): longint; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_xx(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_xx_e(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel;
  z: Pdouble): longint; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_yy(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_yy_e(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel;
  z: Pdouble): longint; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_xy(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_spline2d_eval_deriv_xy_e(interp: Pgsl_spline2d; x: double; y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel;
  z: Pdouble): longint; cdecl; external libgsl;
function gsl_spline2d_min_size(interp: Pgsl_spline2d): Tsize_t; cdecl; external libgsl;
function gsl_spline2d_name(interp: Pgsl_spline2d): pchar; cdecl; external libgsl;
function gsl_spline2d_set(interp: Pgsl_spline2d; zarr: Pdouble; i: Tsize_t; j: Tsize_t; z: double): longint; cdecl; external libgsl;
function gsl_spline2d_get(interp: Pgsl_spline2d; zarr: Pdouble; i: Tsize_t; j: Tsize_t): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
