unit gsl_dft_complex_float;

interface

uses
  fp_gsl, gsl_fft;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_dft_complex_float_forward(data: Psingle; stride: Tsize_t; n: Tsize_t; result: Psingle): longint; cdecl; external libgsl;
function gsl_dft_complex_float_backward(data: Psingle; stride: Tsize_t; n: Tsize_t; result: Psingle): longint; cdecl; external libgsl;
function gsl_dft_complex_float_inverse(data: Psingle; stride: Tsize_t; n: Tsize_t; result: Psingle): longint; cdecl; external libgsl;
function gsl_dft_complex_float_transform(data: Psingle; stride: Tsize_t; n: Tsize_t; result: Psingle; sign: Tgsl_fft_direction): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:52:04 ===


implementation



end.
