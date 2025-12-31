unit fp_fribidi;

interface

const
  {$IFDEF Linux}
  libfribidi = 'fribidi';
  {$ENDIF}

  {$IFDEF Windows}
  libfribidi = 'libfribidi-0.dll';
  {$ENDIF}

type
    Tuint8_t=UInt8;
    Tuint32_t=UInt32;



implementation

end.

