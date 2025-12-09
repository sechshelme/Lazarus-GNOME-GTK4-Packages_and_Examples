unit fp_x11;

interface

const
  {$IFDEF Linux}
  libx = 'X';
  {$ENDIF}

  {$IFDEF windows}
  // no suported
  {$ENDIF}

type
  Pwchar_t=Pointer;


implementation

end.
