{$IFDEF read_interface}


type
  Pgsl_fft_direction = ^Tgsl_fft_direction;
  Tgsl_fft_direction = longint;

const
  gsl_fft_forward = -(1);
  gsl_fft_backward = +(1);

  // === Konventiert am: 21-8-25 17:14:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
