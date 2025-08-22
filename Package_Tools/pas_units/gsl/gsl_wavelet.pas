unit gsl_wavelet;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgsl_wavelet_direction = ^Tgsl_wavelet_direction;
  Tgsl_wavelet_direction = longint;

const
  gsl_wavelet_forward = 1;
  gsl_wavelet_backward = -(1);

type
  Tgsl_wavelet_type = record
    name: pchar;
    init: function(h1: PPdouble; g1: PPdouble; h2: PPdouble; g2: PPdouble; nc: Psize_t;
      offset: Psize_t; member: Tsize_t): longint; cdecl;
  end;
  Pgsl_wavelet_type = ^Tgsl_wavelet_type;

  Tgsl_wavelet = record
    _type: Pgsl_wavelet_type;
    h1: Pdouble;
    g1: Pdouble;
    h2: Pdouble;
    g2: Pdouble;
    nc: Tsize_t;
    offset: Tsize_t;
  end;
  Pgsl_wavelet = ^Tgsl_wavelet;

  Tgsl_wavelet_workspace = record
    scratch: Pdouble;
    n: Tsize_t;
  end;
  Pgsl_wavelet_workspace = ^Tgsl_wavelet_workspace;

var
  gsl_wavelet_daubechies: Pgsl_wavelet_type; cvar;external libgsl;
  gsl_wavelet_daubechies_centered: Pgsl_wavelet_type; cvar;external libgsl;
  gsl_wavelet_haar: Pgsl_wavelet_type; cvar;external libgsl;
  gsl_wavelet_haar_centered: Pgsl_wavelet_type; cvar;external libgsl;
  gsl_wavelet_bspline: Pgsl_wavelet_type; cvar;external libgsl;
  gsl_wavelet_bspline_centered: Pgsl_wavelet_type; cvar;external libgsl;

function gsl_wavelet_alloc(T: Pgsl_wavelet_type; k: Tsize_t): Pgsl_wavelet; cdecl; external libgsl;
procedure gsl_wavelet_free(w: Pgsl_wavelet); cdecl; external libgsl;
function gsl_wavelet_name(w: Pgsl_wavelet): pchar; cdecl; external libgsl;
function gsl_wavelet_workspace_alloc(n: Tsize_t): Pgsl_wavelet_workspace; cdecl; external libgsl;
procedure gsl_wavelet_workspace_free(work: Pgsl_wavelet_workspace); cdecl; external libgsl;
function gsl_wavelet_transform(w: Pgsl_wavelet; data: Pdouble; stride: Tsize_t; n: Tsize_t; dir: Tgsl_wavelet_direction;
  work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet_transform_forward(w: Pgsl_wavelet; data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet_transform_inverse(w: Pgsl_wavelet; data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:48 ===


implementation



end.
