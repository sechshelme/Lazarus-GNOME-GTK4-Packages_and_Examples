unit fp_hpdf;

interface

const
  {$IFDEF Linux}
  libhpdf = 'hpdf';
  {$ENDIF}

  {$IFDEF Windows}
  libhpdf = 'libhpdf.dll';
  {$ENDIF}

type
  {$IFDEF Linux}
  Tclong = int64;
  Tculong = uint64;
  {$ENDIF}

  {$IFDEF Windows}
  Tclong = int32;
  Tculong = uint32;
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

implementation

end.

