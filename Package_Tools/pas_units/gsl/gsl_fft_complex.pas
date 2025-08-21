unit gsl_fft_complex;

interface

uses
  fp_gsl, gsl_complex, gsl_fft;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_fft_complex_radix2_forward(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_radix2_backward(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_radix2_inverse(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_radix2_transform(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t; sign: Tgsl_fft_direction): longint; cdecl; external libgsl;
function gsl_fft_complex_radix2_dif_forward(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_radix2_dif_backward(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_radix2_dif_inverse(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_radix2_dif_transform(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t; sign: Tgsl_fft_direction): longint; cdecl; external libgsl;

type
  Tgsl_fft_complex_wavetable = record
    n: Tsize_t;
    nf: Tsize_t;
    factor: array[0..63] of Tsize_t;
    twiddle: array[0..63] of Pgsl_complex;
    trig: Pgsl_complex;
  end;
  Pgsl_fft_complex_wavetable = ^Tgsl_fft_complex_wavetable;

  Tgsl_fft_complex_workspace = record
    n: Tsize_t;
    scratch: Pdouble;
  end;
  Pgsl_fft_complex_workspace = ^Tgsl_fft_complex_workspace;

function gsl_fft_complex_wavetable_alloc(n: Tsize_t): Pgsl_fft_complex_wavetable; cdecl; external libgsl;
procedure gsl_fft_complex_wavetable_free(wavetable: Pgsl_fft_complex_wavetable); cdecl; external libgsl;
function gsl_fft_complex_workspace_alloc(n: Tsize_t): Pgsl_fft_complex_workspace; cdecl; external libgsl;
procedure gsl_fft_complex_workspace_free(workspace: Pgsl_fft_complex_workspace); cdecl; external libgsl;
function gsl_fft_complex_memcpy(dest: Pgsl_fft_complex_wavetable; src: Pgsl_fft_complex_wavetable): longint; cdecl; external libgsl;
function gsl_fft_complex_forward(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace): longint; cdecl; external libgsl;
function gsl_fft_complex_backward(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace): longint; cdecl; external libgsl;
function gsl_fft_complex_inverse(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace): longint; cdecl; external libgsl;
function gsl_fft_complex_transform(data: Tgsl_complex_packed_array; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace;
  sign: Tgsl_fft_direction): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 17:14:57 ===


implementation



end.
