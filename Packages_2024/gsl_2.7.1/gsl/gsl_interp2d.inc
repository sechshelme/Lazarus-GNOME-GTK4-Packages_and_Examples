{$IFDEF read_interface}


type
  Tgsl_interp2d_type = record
    name: pchar;
    min_size: dword;
    alloc: function(xsize: Tsize_t; ysize: Tsize_t): pointer; cdecl;
    init: function(para1: pointer; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t; ysize: Tsize_t): longint; cdecl;
    eval: function(para1: pointer; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t; ysize: Tsize_t; x: double; y: double; para9: Pgsl_interp_accel; para10: Pgsl_interp_accel; z: Pdouble): longint; cdecl;
    eval_deriv_x: function(para1: pointer; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t; ysize: Tsize_t; x: double; y: double; para9: Pgsl_interp_accel; para10: Pgsl_interp_accel; z_p: Pdouble): longint; cdecl;
    eval_deriv_y: function(para1: pointer; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t; ysize: Tsize_t; x: double; y: double; para9: Pgsl_interp_accel; para10: Pgsl_interp_accel; z_p: Pdouble): longint; cdecl;
    eval_deriv_xx: function(para1: pointer; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t; ysize: Tsize_t; x: double; y: double; para9: Pgsl_interp_accel; para10: Pgsl_interp_accel; z_pp: Pdouble): longint; cdecl;
    eval_deriv_xy: function(para1: pointer; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t; ysize: Tsize_t; x: double; y: double; para9: Pgsl_interp_accel; para10: Pgsl_interp_accel; z_pp: Pdouble): longint; cdecl;
    eval_deriv_yy: function(para1: pointer; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t; ysize: Tsize_t; x: double; y: double; para9: Pgsl_interp_accel; para10: Pgsl_interp_accel; z_pp: Pdouble): longint; cdecl;
    free: procedure(para1: pointer); cdecl;
  end;
  Pgsl_interp2d_type = ^Tgsl_interp2d_type;

  Tgsl_interp2d = record
    _type: Pgsl_interp2d_type;
    xmin: double;
    xmax: double;
    ymin: double;
    ymax: double;
    xsize: Tsize_t;
    ysize: Tsize_t;
    state: pointer;
  end;
  Pgsl_interp2d = ^Tgsl_interp2d;

var
  gsl_interp2d_bilinear: Pgsl_interp2d_type; cvar;external libgsl;
  gsl_interp2d_bicubic: Pgsl_interp2d_type; cvar;external libgsl;

function gsl_interp2d_alloc(T: Pgsl_interp2d_type; xsize: Tsize_t; ysize: Tsize_t): Pgsl_interp2d; cdecl; external libgsl;
function gsl_interp2d_name(interp: Pgsl_interp2d): pchar; cdecl; external libgsl;
function gsl_interp2d_min_size(interp: Pgsl_interp2d): Tsize_t; cdecl; external libgsl;
function gsl_interp2d_type_min_size(T: Pgsl_interp2d_type): Tsize_t; cdecl; external libgsl;
function gsl_interp2d_set(interp: Pgsl_interp2d; zarr: Pdouble; i: Tsize_t; j: Tsize_t; z: double): longint; cdecl; external libgsl;
function gsl_interp2d_get(interp: Pgsl_interp2d; zarr: Pdouble; i: Tsize_t; j: Tsize_t): double; cdecl; external libgsl;
function gsl_interp2d_idx(interp: Pgsl_interp2d; i: Tsize_t; j: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_interp2d_init(interp: Pgsl_interp2d; xa: Pdouble; ya: Pdouble; za: Pdouble; xsize: Tsize_t;
  ysize: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_interp2d_free(interp: Pgsl_interp2d); cdecl; external libgsl;
function gsl_interp2d_eval(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_interp2d_eval_extrap(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_interp2d_eval_e(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl;

function gsl_interp2d_eval_e_extrap(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl; deprecated;

function gsl_interp2d_eval_extrap_e(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_x(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_x_e(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_y(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_y_e(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_xx(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_xx_e(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_yy(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_yy_e(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_xy(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): double; cdecl; external libgsl;
function gsl_interp2d_eval_deriv_xy_e(interp: Pgsl_interp2d; xarr: Pdouble; yarr: Pdouble; zarr: Pdouble; x: double;
  y: double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:10:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
