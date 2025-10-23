{$IFDEF read_interface}



function gsl_fft_halfcomplex_float_radix2_backward(data: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_float_radix2_inverse(data: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_float_radix2_transform(data: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

type
  Tgsl_fft_halfcomplex_wavetable_float = record
    n: Tsize_t;
    nf: Tsize_t;
    factor: array[0..63] of Tsize_t;
    twiddle: array[0..63] of Pgsl_complex_float;
    trig: Pgsl_complex_float;
  end;
  Pgsl_fft_halfcomplex_wavetable_float = ^Tgsl_fft_halfcomplex_wavetable_float;

function gsl_fft_halfcomplex_wavetable_float_alloc(n: Tsize_t): Pgsl_fft_halfcomplex_wavetable_float; cdecl; external libgsl;
procedure gsl_fft_halfcomplex_wavetable_float_free(wavetable: Pgsl_fft_halfcomplex_wavetable_float); cdecl; external libgsl;
function gsl_fft_halfcomplex_float_backward(data: Psingle; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_halfcomplex_wavetable_float; work: Pgsl_fft_real_workspace_float): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_float_inverse(data: Psingle; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_halfcomplex_wavetable_float; work: Pgsl_fft_real_workspace_float): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_float_transform(data: Psingle; stride: Tsize_t; n: Tsize_t; wavetable: Pgsl_fft_halfcomplex_wavetable_float; work: Pgsl_fft_real_workspace_float): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_float_unpack(halfcomplex_coefficient: Psingle; complex_coefficient: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_fft_halfcomplex_float_radix2_unpack(halfcomplex_coefficient: Psingle; complex_coefficient: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 17:15:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
