{$IFDEF read_interface}



function gsl_dft_complex_forward(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble): longint; cdecl; external libgsl;
function gsl_dft_complex_backward(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble): longint; cdecl; external libgsl;
function gsl_dft_complex_inverse(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble): longint; cdecl; external libgsl;
function gsl_dft_complex_transform(data: Pdouble; stride: Tsize_t; n: Tsize_t; result: Pdouble; sign: Tgsl_fft_direction): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:52:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
