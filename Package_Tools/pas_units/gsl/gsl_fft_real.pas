unit gsl_fft_real;

interface

uses
  fp_gsl, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_fft_real_radix2_transform(data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

type
  Tgsl_fft_real_wavetable = record
    n: Tsize_t;
    nf: Tsize_t;
    factor: array[0..63] of Tsize_t;
    twiddle: array[0..63] of Pgsl_complex;
    trig: Pgsl_complex;
  end;
  Pgsl_fft_real_wavetable = ^Tgsl_fft_real_wavetable;

  Tgsl_fft_real_workspace = record
    n: Tsize_t;
    scratch: Pdouble;
  end;
  Pgsl_fft_real_workspace = ^Tgsl_fft_real_workspace;

function gsl_fft_real_wavetable_alloc(n: Tsize_t): Pgsl_fft_real_wavetable; cdecl; external libgsl;
procedure gsl_fft_real_wavetable_free(wavetable: Pgsl_fft_real_wavetable); cdecl; external libgsl;
function gsl_fft_real_workspace_alloc(n: Tsize_t): Pgsl_fft_real_workspace; cdecl; external libgsl;
procedure gsl_fft_real_workspace_free(workspace: Pgsl_fft_real_workspace); cdecl; external libgsl;
function gsl_fft_real_transform(data: Pdouble; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_real_wavetable; work: Pgsl_fft_real_workspace): longint; cdecl; external libgsl;
function gsl_fft_real_unpack(real_coefficient: Pdouble; complex_coefficient: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 17:15:08 ===


implementation



end.
