unit fp_qhull;

interface

const
  {$ifdef linux}
  libqhull = 'qhull';
  {$endif}

  {$ifdef windows}
  libqhull = 'libqhull.dll';
  {$endif}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


implementation

end.

