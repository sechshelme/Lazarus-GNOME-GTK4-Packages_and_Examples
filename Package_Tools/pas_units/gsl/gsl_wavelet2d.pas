unit gsl_wavelet2d;

interface

uses
  fp_gsl, gsl_wavelet, gsl_matrix_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_wavelet2d_transform(w: Pgsl_wavelet; data: Pdouble; tda: Tsize_t; size1: Tsize_t; size2: Tsize_t;
  dir: Tgsl_wavelet_direction; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_transform_forward(w: Pgsl_wavelet; data: Pdouble; tda: Tsize_t; size1: Tsize_t; size2: Tsize_t;
  work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_transform_inverse(w: Pgsl_wavelet; data: Pdouble; tda: Tsize_t; size1: Tsize_t; size2: Tsize_t;
  work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_nstransform(w: Pgsl_wavelet; data: Pdouble; tda: Tsize_t; size1: Tsize_t; size2: Tsize_t;
  dir: Tgsl_wavelet_direction; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_nstransform_forward(w: Pgsl_wavelet; data: Pdouble; tda: Tsize_t; size1: Tsize_t; size2: Tsize_t;
  work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_nstransform_inverse(w: Pgsl_wavelet; data: Pdouble; tda: Tsize_t; size1: Tsize_t; size2: Tsize_t;
  work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_transform_matrix(w: Pgsl_wavelet; a: Pgsl_matrix; dir: Tgsl_wavelet_direction; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_transform_matrix_forward(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_transform_matrix_inverse(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_nstransform_matrix(w: Pgsl_wavelet; a: Pgsl_matrix; dir: Tgsl_wavelet_direction; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_nstransform_matrix_forward(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;
function gsl_wavelet2d_nstransform_matrix_inverse(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:51 ===


implementation



end.
