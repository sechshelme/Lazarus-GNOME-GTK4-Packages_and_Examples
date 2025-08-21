unit gsl_dft_complex;

interface

uses
  fp_gsl, gsl_fft;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_dft_complex_forward(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble): longint; cdecl; external libgsl;
function gsl_dft_complex_backward(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble): longint; cdecl; external libgsl;
function gsl_dft_complex_inverse(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble): longint; cdecl; external libgsl;
function gsl_dft_complex_transform(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble; sign: Tgsl_fft_direction): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:52:02 ===


implementation



end.
