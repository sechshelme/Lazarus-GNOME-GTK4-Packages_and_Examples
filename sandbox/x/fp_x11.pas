unit fp_x11;

interface

const
  {$IFDEF Linux}
  libx = 'X11';
  {$ENDIF}

  {$IFDEF windows}
  // no suported
  {$ENDIF}

type
  Twchar_t = DWord;
  Pwchar_t = ^Twchar_t;


implementation

end.
