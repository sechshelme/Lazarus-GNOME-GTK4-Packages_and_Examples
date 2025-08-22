{$IFDEF read_interface}



function gsl_fft_real_float_radix2_transform(data: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

type
  Tgsl_fft_real_wavetable_float = record
    n: Tsize_t;
    nf: Tsize_t;
    factor: array[0..63] of Tsize_t;
    twiddle: array[0..63] of Pgsl_complex_float;
    trig: Pgsl_complex_float;
  end;
  Pgsl_fft_real_wavetable_float = ^Tgsl_fft_real_wavetable_float;

  Tgsl_fft_real_workspace_float = record
    n: Tsize_t;
    scratch: Psingle;
  end;
  Pgsl_fft_real_workspace_float = ^Tgsl_fft_real_workspace_float;

function gsl_fft_real_wavetable_float_alloc(n: Tsize_t): Pgsl_fft_real_wavetable_float; cdecl; external libgsl;
procedure gsl_fft_real_wavetable_float_free(wavetable: Pgsl_fft_real_wavetable_float); cdecl; external libgsl;
function gsl_fft_real_workspace_float_alloc(n: Tsize_t): Pgsl_fft_real_workspace_float; cdecl; external libgsl;
procedure gsl_fft_real_workspace_float_free(workspace: Pgsl_fft_real_workspace_float); cdecl; external libgsl;
function gsl_fft_real_float_transform(data: Psingle; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_real_wavetable_float; work: Pgsl_fft_real_workspace_float): longint; cdecl; external libgsl;
function gsl_fft_real_float_unpack(real_float_coefficient: Psingle; complex_coefficient: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 17:15:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
