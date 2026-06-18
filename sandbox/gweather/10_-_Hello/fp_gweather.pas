unit fp_gweather;

interface

const
  {$IFDEF Linux}
  libgweather = 'gweather-4';
  {$ENDIF}

  {$IFDEF Windows}
  libgweather = 'libgweather-4-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}
implementation

end.

