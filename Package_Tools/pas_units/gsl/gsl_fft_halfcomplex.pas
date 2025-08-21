unit gsl_fft_halfcomplex;

interface

uses
  fp_gsl, gsl_complex, gsl_fft_real;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_fft_halfcomplex_radix2_backward(data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_radix2_inverse(data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_radix2_transform(data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

type
  Tgsl_fft_halfcomplex_wavetable = record
    n: Tsize_t;
    nf: Tsize_t;
    factor: array[0..63] of Tsize_t;
    twiddle: array[0..63] of Pgsl_complex;
    trig: Pgsl_complex;
  end;
  Pgsl_fft_halfcomplex_wavetable = ^Tgsl_fft_halfcomplex_wavetable;

function gsl_fft_halfcomplex_wavetable_alloc(n: Tsize_t): Pgsl_fft_halfcomplex_wavetable; cdecl; external libgsl;
procedure gsl_fft_halfcomplex_wavetable_free(wavetable: Pgsl_fft_halfcomplex_wavetable); cdecl; external libgsl;
function gsl_fft_halfcomplex_backward(data: Pdouble; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_halfcomplex_wavetable; work: Pgsl_fft_real_workspace): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_inverse(data: Pdouble; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_halfcomplex_wavetable; work: Pgsl_fft_real_workspace): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_transform(data: Pdouble; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_halfcomplex_wavetable; work: Pgsl_fft_real_workspace): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_unpack(halfcomplex_coefficient: Pdouble; complex_coefficient: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_radix2_unpack(halfcomplex_coefficient: Pdouble; complex_coefficient: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 17:15:02 ===


implementation



end.
