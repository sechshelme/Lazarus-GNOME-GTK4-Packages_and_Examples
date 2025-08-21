unit gsl_fft_complex_float;

interface

uses
  fp_gsl, gsl_complex, gsl_fft;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_fft_complex_float_radix2_forward(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_float_radix2_backward(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_float_radix2_inverse(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_float_radix2_transform(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t; sign: Tgsl_fft_direction): longint; cdecl; external libgsl;
function gsl_fft_complex_float_radix2_dif_forward(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_float_radix2_dif_backward(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_float_radix2_dif_inverse(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_complex_float_radix2_dif_transform(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t; sign: Tgsl_fft_direction): longint; cdecl; external libgsl;

type
  Tgsl_fft_complex_wavetable_float = record
    n: Tsize_t;
    nf: Tsize_t;
    factor: array[0..63] of Tsize_t;
    twiddle: array[0..63] of Pgsl_complex_float;
    trig: Pgsl_complex_float;
  end;
  Pgsl_fft_complex_wavetable_float = ^Tgsl_fft_complex_wavetable_float;

  Tgsl_fft_complex_workspace_float = record
    n: Tsize_t;
    scratch: Psingle;
  end;
  Pgsl_fft_complex_workspace_float = ^Tgsl_fft_complex_workspace_float;

function gsl_fft_complex_wavetable_float_alloc(n: Tsize_t): Pgsl_fft_complex_wavetable_float; cdecl; external libgsl;
procedure gsl_fft_complex_wavetable_float_free(wavetable: Pgsl_fft_complex_wavetable_float); cdecl; external libgsl;
function gsl_fft_complex_workspace_float_alloc(n: Tsize_t): Pgsl_fft_complex_workspace_float; cdecl; external libgsl;
procedure gsl_fft_complex_workspace_float_free(workspace: Pgsl_fft_complex_workspace_float); cdecl; external libgsl;
function gsl_fft_complex_float_memcpy(dest: Pgsl_fft_complex_wavetable_float; src: Pgsl_fft_complex_wavetable_float): longint; cdecl; external libgsl;
function gsl_fft_complex_float_forward(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float): longint; cdecl; external libgsl;
function gsl_fft_complex_float_backward(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float): longint; cdecl; external libgsl;
function gsl_fft_complex_float_inverse(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float): longint; cdecl; external libgsl;
function gsl_fft_complex_float_transform(data: Tgsl_complex_packed_array_float; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float;
  sign: Tgsl_fft_direction): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 17:15:00 ===


implementation



end.
