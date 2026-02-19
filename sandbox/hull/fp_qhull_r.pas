unit fp_qhull_r;

interface

const
  {$ifdef linux}
  libqhull_r = 'qhull_r';
  {$endif}

  {$ifdef windows}
  libqhull_r = 'libqhull_r.dll';
  {$endif}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  type
    PFILE=type Pointer;


implementation

end.

