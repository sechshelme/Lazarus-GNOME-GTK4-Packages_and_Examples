unit fp_magiccore;

interface

const
  {$IFDEF Linux}
  libmagiccore = 'MagickCore-6.Q16 ';
  libmagicwand = 'MagickWand-6.Q16';
  {$ENDIF}

  {$IFDEF Windows}
  // ??????
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t=^Tsize_t;
  Tssize_t = SizeInt;
  Pssize_t=^Tssize_t;

  PFILE=type Pointer;

  Tva_list=Pointer; // ?????

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


implementation

end.
