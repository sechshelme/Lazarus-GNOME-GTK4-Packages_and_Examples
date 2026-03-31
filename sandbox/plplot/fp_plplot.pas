unit fp_plplot;

interface

const
  {$ifdef linux}
  libplplot = 'plplot';
  {$endif}

  {$ifdef windows}
  libplplot = 'libplplot.dll';
  {$endif}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

implementation

end.

