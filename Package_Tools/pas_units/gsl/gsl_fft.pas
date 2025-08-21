unit gsl_fft;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgsl_fft_direction = ^Tgsl_fft_direction;
  Tgsl_fft_direction = longint;

const
  gsl_fft_forward = -(1);
  gsl_fft_backward = +(1);

  // === Konventiert am: 21-8-25 17:14:54 ===


implementation



end.
