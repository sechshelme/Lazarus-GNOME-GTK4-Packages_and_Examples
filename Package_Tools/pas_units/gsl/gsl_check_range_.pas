unit gsl_check_range_;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  gsl_check_range: longint; cvar;external libgsl;

const
  GSL_RANGE_CHECK = 0;

  // === Konventiert am: 21-8-25 16:51:54 ===


implementation



end.
