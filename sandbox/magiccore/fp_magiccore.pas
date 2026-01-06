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
  Tssize_t = SizeInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


implementation

end.
