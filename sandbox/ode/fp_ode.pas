unit fp_ode;

interface

const
  {$IFDEF Linux}
  libodes = 'ode';
  {$ENDIF}

  {$IFDEF msWindows}
  libode = 'libode-double.dll';
  {$ENDIF}

implementation

end.

