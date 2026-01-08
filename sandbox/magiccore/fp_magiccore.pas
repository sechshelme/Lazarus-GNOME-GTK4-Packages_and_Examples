unit fp_magiccore;

interface

const
  {$IFDEF Linux}
  libmagickcore = 'MagickCore-6.Q16 ';
  libmagickwand = 'MagickWand-6.Q16';
  {$ENDIF}

  {$IFDEF Windows}
  // ??????
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;
  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  PFILE = type Pointer;

  Tva_list = Pointer; // ?????

  Ttime_t = uint64;
  Ptime_t = ^Ttime_t;

  Toff_t = SizeInt;
  Poff_t = ^Toff_t;


const
  ENOMEM = 12;
  MAGICKCORE_QUANTUM_DEPTH = 16;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


implementation

end.
