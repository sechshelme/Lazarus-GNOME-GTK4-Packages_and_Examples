unit gsl_nan;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GSL_NEGZERO = -(0.0);
  GSL_POSZERO = +(0.0);

  // === Konventiert am: 22-8-25 13:19:19 ===


implementation



end.
